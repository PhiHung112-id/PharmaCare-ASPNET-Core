using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using PharmaCare.Models;
using System.Text.Json;
using Microsoft.EntityFrameworkCore;

namespace PharmaCare.Controllers
{
    public class PurchaseOrderController : Controller
    {
        // 1. TRANG DANH SÁCH (JSON)
        [HttpGet]
        [Route("/phieu-nhap-hang", Name = "PurchaseOrderPage")]
        public IActionResult Index()
        {
            using var db = new DBContext();

            var orders = db.PurchaseOrders
                .OrderByDescending(x => x.NgayNhap)
                .Select(o => new {
                    maPN = o.MaPn,
                    ngayNhap = o.NgayNhap.HasValue ? o.NgayNhap.Value.ToString("dd/MM/yyyy HH:mm") : "",
                    nhaCungCap = o.MaNccNavigation!.TenNcc ?? "Không xác định",
                    tongTien = o.TongTienNhap ?? 0,
                    trangThai = "Đã nhập kho" 
                }).ToList();

            var now = DateTime.Now;
            ViewBag.TotalAmountThisMonth = db.PurchaseOrders
                .Where(o => o.NgayNhap.HasValue && o.NgayNhap.Value.Month == now.Month && o.NgayNhap.Value.Year == now.Year)
                .Sum(o => o.TongTienNhap ?? 0);
            ViewBag.TotalOrders = db.PurchaseOrders.Count();
            ViewBag.TotalSuppliers = db.Suppliers.Count();

            ViewBag.OrdersJson = JsonSerializer.Serialize(orders);
            return View();
        }

        // 2. TRANG LƯU (Create, Edit, Detail)
        [HttpGet]
        [Route("/phieu-nhap-hang/thong-tin/{id?}", Name = "PurchaseOrderSavePage")]
        public IActionResult Save(string id, string mode = "Create")
        {
            using var db = new DBContext();
            ViewBag.Suppliers = db.Suppliers.ToList();
            ViewBag.Drugs = db.Drugs.Where(d => d.IsDeleted == false || d.IsDeleted == null).ToList();
            ViewBag.Mode = mode; 

            if (string.IsNullOrEmpty(id) || mode == "Create")
            {
                return View("Save", new PurchaseOrder());
            }

            var order = db.PurchaseOrders.FirstOrDefault(x => x.MaPn == id);
            if (order == null) return RedirectToRoute("PurchaseOrderPage");

            ViewBag.Details = db.PurchaseOrderDetails.Where(d => d.MaPn == id).ToList();

            return View("Save", order);
        }

        // XỬ LÝ LƯU (POST) - Xử lý cả Thêm và Sửa
        [HttpPost]
        [Route("/phieu-nhap-hang/luu", Name = "PurchaseOrderSubmit")]
        public IActionResult Submit(PurchaseOrder model, string Mode, string[] DrugIds, string[] BatchNumbers,
                                    DateTime[] ExpiryDates, int[] Quantities, decimal[] Prices)
        {
            using var db = new DBContext();
            using var transaction = db.Database.BeginTransaction();

            try
            {
                string maPN = model.MaPn;

                if (Mode == "Create")
                {
                    string prefix = "PN" + DateTime.Now.ToString("yyMM");
                    var last = db.PurchaseOrders.Where(x => x.MaPn.StartsWith(prefix)).OrderByDescending(x => x.MaPn).FirstOrDefault();
                    int nextId = last == null ? 1 : int.Parse(last.MaPn.Substring(6)) + 1;
                    maPN = prefix + nextId.ToString("D3");

                    model.MaPn = maPN;
                    model.MaNv = "NV001";
                    db.PurchaseOrders.Add(model);
                }
                else 
                {
                    var exist = db.PurchaseOrders.Find(model.MaPn);
                    if (exist == null) return NotFound();

                    var oldDetails = db.PurchaseOrderDetails.Where(d => d.MaPn == model.MaPn).ToList();
                    foreach (var od in oldDetails)
                    {
                        var drug = db.Drugs.Find(od.MaThuoc);
                        if (drug != null) drug.TonKho -= od.SoLuongNhap;

                        var batch = db.Batches.FirstOrDefault(b => b.MaLo == od.MaLo && b.MaThuoc == od.MaThuoc);
                        if (batch != null) batch.SoLuongTon -= od.SoLuongNhap;
                    }
                    db.PurchaseOrderDetails.RemoveRange(oldDetails);

                    exist.MaNcc = model.MaNcc;
                    exist.NgayNhap = model.NgayNhap;
                    exist.GhiChu = model.GhiChu;
                    exist.TongTienNhap = model.TongTienNhap;
                }

                for (int i = 0; i < DrugIds.Length; i++)
                {
                    if (string.IsNullOrEmpty(DrugIds[i])) continue;

                    db.PurchaseOrderDetails.Add(new PurchaseOrderDetail
                    {
                        MaPn = maPN,
                        MaThuoc = DrugIds[i],
                        MaLo = BatchNumbers[i],
                        SoLuongNhap = Quantities[i],
                        DonGiaNhap = Prices[i],
                        ThanhTien = Quantities[i] * Prices[i]
                    });

                    var batch = db.Batches.FirstOrDefault(b => b.MaLo == BatchNumbers[i] && b.MaThuoc == DrugIds[i]);
                    if (batch == null)
                    {
                        db.Batches.Add(new Batch
                        {
                            MaLo = BatchNumbers[i],
                            MaThuoc = DrugIds[i],
                            HanSuDung = DateOnly.FromDateTime(ExpiryDates[i]),
                            SoLuongTon = Quantities[i]
                        });
                    }
                    else
                    {
                        batch.SoLuongTon += Quantities[i];
                    }

                    var d = db.Drugs.Find(DrugIds[i]);
                    if (d != null) d.TonKho = (d.TonKho ?? 0) + Quantities[i];
                }

                db.SaveChanges();
                transaction.Commit();
                return RedirectToRoute("PurchaseOrderPage");
            }
            catch (Exception)
            {
                transaction.Rollback();
                return Redirect("/phieu-nhap-hang/thong-tin?mode=" + Mode);
            }
        }

        // 4. XÓA (HỦY PHIẾU)
        [HttpPost]
        [Route("/phieu-nhap-hang/xoa")]
        public IActionResult Delete(string id)
        {
            using var db = new DBContext();
            var order = db.PurchaseOrders.Find(id);
            if (order != null)
            {
                var details = db.PurchaseOrderDetails.Where(d => d.MaPn == id).ToList();
                foreach (var d in details)
                {
                    var drug = db.Drugs.Find(d.MaThuoc);
                    if (drug != null) drug.TonKho -= d.SoLuongNhap;

                    var batch = db.Batches.FirstOrDefault(b => b.MaLo == d.MaLo && b.MaThuoc == d.MaThuoc);
                    if (batch != null) batch.SoLuongTon -= d.SoLuongNhap;
                }
                db.PurchaseOrderDetails.RemoveRange(details);
                db.PurchaseOrders.Remove(order);
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }
    }
}