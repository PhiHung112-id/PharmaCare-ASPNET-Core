using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using PharmaCare.Models;
using System.Text.Json;
using Microsoft.AspNetCore.Http;
using System.IO;

namespace PharmaCare.Controllers
{
    public class DrugController : Controller
    {
        // 1. TRANG DANH SÁCH 
        [HttpGet]
        [Route("/danh-muc", Name = "DrugPage")]
        public IActionResult Index()
        {
            using var db = new DBContext();

            var drugsList = db.Drugs
                .Where(x => x.IsDeleted == false || x.IsDeleted == null)
                .Select(d => new
                {
                    id = d.MaThuoc,
                    name = d.TenThuoc,
                    ingredient = "Đang cập nhật",
                    category = db.Categories.Where(c => c.MaNhom == d.MaNhom).Select(c => c.TenNhom).FirstOrDefault() ?? "Chưa phân nhóm",
                    unit = d.DonVi,
                    price = d.GiaBan ?? 0,
                    stock = d.TonKho ?? 0,
                    expiryDate = db.Batches.Where(b => b.MaThuoc == d.MaThuoc).Min(b => (DateOnly?)b.HanSuDung)
                                 ?? DateOnly.FromDateTime(DateTime.Now.AddYears(1)),
                    image = string.IsNullOrEmpty(d.HinhAnh) ? "https://placehold.co/50x50?text=Thuốc" : d.HinhAnh
                })
                .ToList();

            ViewBag.DrugsJson = JsonSerializer.Serialize(drugsList);
            return View();
        }

        // 2. TRANG CHI TIẾT
        [HttpGet]
        [Route("/danh-muc/chi-tiet/{id}", Name = "DrugDetailPage")]
        public IActionResult Detail(string id)
        {
            using var db = new DBContext();
            var drug = db.Drugs.Find(id);
            if (drug == null) return RedirectToRoute("DrugPage");

            ViewBag.CategoryName = db.Categories.Find(drug.MaNhom)?.TenNhom;
            return View(drug);
        }

        // 3. TRANG THÊM THUỐC 
        [HttpGet]
        [Route("/danh-muc/them-thuoc", Name = "DrugCreatePage")]
        public IActionResult Create()
        {
            using var db = new DBContext();
            ViewBag.Categories = db.Categories.ToList();
            ViewBag.Units = db.Units.Where(u => u.Status == true && u.IsDeleted == false).ToList();

            return View("Save", new Drug());
        }

        [HttpPost]
        [Route("/danh-muc/them-thuoc", Name = "DrugCreatePage")]
        public IActionResult Create(Drug item, int BaseUnitId, decimal BasePrice, List<DrugUnit> Conversions, IFormFile HinhAnhUpload)
        {
            using var db = new DBContext();

            var lastDrug = db.Drugs.OrderByDescending(x => x.MaThuoc).FirstOrDefault();
            item.MaThuoc = lastDrug == null ? "T001" : "T" + (int.Parse(lastDrug.MaThuoc.Replace("T", "")) + 1).ToString("D3");
            item.IsDeleted = false;

            var baseUnit = db.Units.Find(BaseUnitId);
            item.DonVi = baseUnit != null ? baseUnit.Name : "";
            item.GiaBan = BasePrice;

            if (HinhAnhUpload != null && HinhAnhUpload.Length > 0)
            {
                string fileName = Guid.NewGuid().ToString() + Path.GetExtension(HinhAnhUpload.FileName);
                string folderPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "drugs");
                if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                string filePath = Path.Combine(folderPath, fileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    HinhAnhUpload.CopyTo(stream);
                }
                item.HinhAnh = "/uploads/drugs/" + fileName;
            }

            db.Drugs.Add(item);

            var newBaseUnit = new DrugUnit
            {
                MaThuoc = item.MaThuoc,
                UnitId = BaseUnitId,
                IsBaseUnit = true,
                ConversionRate = 1,
                Price = BasePrice
            };
            db.DrugUnits.Add(newBaseUnit);

            if (Conversions != null && Conversions.Any())
            {
                foreach (var conv in Conversions)
                {
                    if (conv.UnitId > 0 && conv.ConversionRate > 1)
                    {
                        conv.MaThuoc = item.MaThuoc;
                        conv.IsBaseUnit = false;
                        db.DrugUnits.Add(conv);
                    }
                }
            }

            db.SaveChanges();
            return RedirectToRoute("DrugPage");
        }

        // 4. TRANG SỬA THUỐC
        [HttpGet]
        [Route("/danh-muc/sua-thuoc/{id}", Name = "DrugEditPage")]
        public IActionResult Edit(string id)
        {
            using var db = new DBContext();
            var drug = db.Drugs.Find(id);
            if (drug == null) return RedirectToRoute("DrugPage");

            ViewBag.Categories = db.Categories.ToList();
            ViewBag.Units = db.Units.Where(u => u.Status == true && u.IsDeleted == false).ToList();
            ViewBag.DrugUnits = db.DrugUnits.Where(du => du.MaThuoc == id).ToList();

            return View("Save", drug);
        }

        [HttpPost]
        [Route("/danh-muc/sua-thuoc/{id}", Name = "DrugEditPage")]
        public IActionResult Edit(string id, Drug item, int BaseUnitId, decimal BasePrice, List<DrugUnit> Conversions, IFormFile HinhAnhUpload)
        {
            using var db = new DBContext();
            var existItem = db.Drugs.Find(id);
            if (existItem != null)
            {
                existItem.TenThuoc = item.TenThuoc;
                existItem.MaNhom = item.MaNhom;
                existItem.TonKho = item.TonKho;

                var baseUnit = db.Units.Find(BaseUnitId);
                existItem.DonVi = baseUnit != null ? baseUnit.Name : existItem.DonVi;
                existItem.GiaBan = BasePrice;

                if (HinhAnhUpload != null && HinhAnhUpload.Length > 0)
                {
                    string fileName = Guid.NewGuid().ToString() + Path.GetExtension(HinhAnhUpload.FileName);
                    string folderPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "drugs");
                    if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                    string filePath = Path.Combine(folderPath, fileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        HinhAnhUpload.CopyTo(stream);
                    }
                    existItem.HinhAnh = "/uploads/drugs/" + fileName;
                }

                var oldUnits = db.DrugUnits.Where(du => du.MaThuoc == id).ToList();
                db.DrugUnits.RemoveRange(oldUnits);

                var newBaseUnit = new DrugUnit { MaThuoc = id, UnitId = BaseUnitId, IsBaseUnit = true, ConversionRate = 1, Price = BasePrice };
                db.DrugUnits.Add(newBaseUnit);

                if (Conversions != null && Conversions.Any())
                {
                    foreach (var conv in Conversions)
                    {
                        if (conv.UnitId > 0 && conv.ConversionRate > 1)
                        {
                            conv.MaThuoc = id;
                            conv.IsBaseUnit = false;
                            db.DrugUnits.Add(conv);
                        }
                    }
                }

                db.SaveChanges();
            }
            return RedirectToRoute("DrugPage");
        }

        // 5. XÓA MỀM THUỐC 
        [HttpPost]
        [Route("/danh-muc/xoa-thuoc", Name = "DrugSoftDelete")]
        public IActionResult SoftDelete(string id)
        {
            using var db = new DBContext();
            var exist = db.Drugs.Find(id);
            if (exist != null)
            {
                exist.IsDeleted = true;
                db.SaveChanges();
            }
            return RedirectToRoute("DrugPage");
        }

        // 6. CHỈNH SỬA NHANH
        [HttpPost]
        [Route("/danh-muc/quick-update")]
        public IActionResult QuickUpdate(string id, decimal price, int stock)
        {
            using var db = new DBContext();
            var drug = db.Drugs.Find(id);
            if (drug != null)
            {
                drug.GiaBan = price;
                drug.TonKho = stock;

                var baseUnit = db.DrugUnits.FirstOrDefault(du => du.MaThuoc == id && du.IsBaseUnit == true);
                if (baseUnit != null) baseUnit.Price = price;

                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }

        // 7. TRANG THÙNG RÁC THUỐC
        [HttpGet]
        [Route("/danh-muc/thung-rac", Name = "DrugTrashPage")]
        public IActionResult Trash()
        {
            using var db = new DBContext();
            var trashData = db.Drugs.Where(x => x.IsDeleted == true).ToList();
            ViewBag.Categories = db.Categories.ToList();
            return View(trashData);
        }

        // 8. KHÔI PHỤC THUỐC TỪ THÙNG RÁC
        [HttpPost]
        [Route("/danh-muc/khoi-phuc-thuoc", Name = "DrugRestore")]
        public IActionResult Restore(string id)
        {
            using var db = new DBContext();
            var exist = db.Drugs.Find(id);
            if (exist != null)
            {
                exist.IsDeleted = false;
                db.SaveChanges();
            }
            return RedirectToRoute("DrugTrashPage");
        }

        // 9. XÓA VĨNH VIỄN THUỐC
        [HttpPost]
        [Route("/danh-muc/xoa-vinh-vien-thuoc", Name = "DrugHardDelete")]
        public IActionResult HardDelete(string id)
        {
            using var db = new DBContext();
            var exist = db.Drugs.Find(id);
            if (exist != null)
            {
                var units = db.DrugUnits.Where(u => u.MaThuoc == id).ToList();
                if (units.Any()) db.DrugUnits.RemoveRange(units);

                var batches = db.Batches.Where(b => b.MaThuoc == id).ToList();
                if (batches.Any()) db.Batches.RemoveRange(batches);

                db.Drugs.Remove(exist);
                db.SaveChanges();
            }
            return RedirectToRoute("DrugTrashPage");
        }
    }
}