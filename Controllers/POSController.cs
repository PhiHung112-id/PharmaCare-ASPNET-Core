using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PharmaCare.Models;

namespace PharmaCare.Controllers
{
    public class POSController : Controller
    {
        [Route("/ban-hang",  Name = "POSPage")]
        public IActionResult Index()
        {
            using var db = new DBContext();
            ViewBag.Customers = db.Customers.ToList();
            return View();
        }

        // Tìm kiếm nhanh
        [HttpGet]
        public IActionResult SearchDrugs(string term)
        {
            if (string.IsNullOrEmpty(term)) return Json(new List<object>());
            using var db = new DBContext();
            var results = db.Batches
                .Include(b => b.MaThuocNavigation)
                .Where(b => (b.MaThuocNavigation.TenThuoc.Contains(term) || b.MaLo.Contains(term)) && b.SoLuongTon > 0)
                .Select(b => new {
                    id = b.MaLo,
                    maThuoc = b.MaThuoc,
                    name = b.MaThuocNavigation.TenThuoc,
                    price = b.MaThuocNavigation.GiaBan,
                    stock = b.SoLuongTon,
                    unit = b.MaThuocNavigation.DonVi,
                    batch = b.MaLo
                }).Take(10).ToList();
            return Json(results);
        }

        // Lấy toàn bộ thuốc 
        [HttpGet]
        public IActionResult GetAllDrugs()
        {
            using var db = new DBContext();
            var drugs = db.Drugs
                .Where(d => d.IsDeleted != true)
                .Select(d => new {
                    id = d.MaThuoc,
                    text = d.TenThuoc,
                    price = d.GiaBan,
                    unit = d.DonVi
                }).ToList();
            return Json(drugs);
        }

        // Lấy mã lô tự động khi chọn thuốc trong Modal
        [HttpGet]
        public IActionResult GetAutoBatch(string maThuoc)
        {
            using var db = new DBContext();
            var batch = db.Batches
                .Where(b => b.MaThuoc == maThuoc && b.SoLuongTon > 0)
                .OrderByDescending(b => b.MaLo)
                .Select(b => new { maLo = b.MaLo, stock = b.SoLuongTon })
                .FirstOrDefault();
            return Json(batch);
        }

        // Thanh toán 
        [HttpPost]
        public IActionResult Checkout([FromBody] OrderRequest data)
        {
            using var db = new DBContext();
            using var transaction = db.Database.BeginTransaction();
            try
            {
                // 1. Tạo Hóa đơn
                var invoice = new Invoice
                {
                    MaHd = "HD" + DateTime.Now.ToString("yyyyMMddHHmmss"),
                    NgayLap = DateTime.Now,
                    MaKh = data.MaKh == "retail" ? null : data.MaKh,
                    TongTien = data.Total,
                    ThueVat = data.Vat,
                    KhachThanhToan = data.CustomerCash,
                    TienThua = data.Change,
                    PhuongThucTt = "Tiền mặt"
                };
                db.Invoices.Add(invoice);

                // 2. Xử lý Chi tiết Hóa đơn & Trừ kho
                foreach (var item in data.Items)
                {
                    var batch = db.Batches.FirstOrDefault(b => b.MaLo == item.BatchId && b.MaThuoc == item.MaThuoc);
                    if (batch == null)
                    {
                        throw new Exception($"Không tìm thấy lô {item.BatchId} của thuốc {item.MaThuoc}");
                    }

                    if (batch.SoLuongTon < item.Qty)
                    {
                        throw new Exception($"Lô {item.BatchId} không đủ số lượng (Chỉ còn {batch.SoLuongTon}).");
                    }

                    batch.SoLuongTon -= item.Qty;

                    var drug = db.Drugs.FirstOrDefault(d => d.MaThuoc == item.MaThuoc);
                    if (drug != null)
                    {
                        drug.TonKho -= item.Qty;
                    }

                    db.InvoiceDetails.Add(new InvoiceDetail
                    {
                        MaHd = invoice.MaHd,
                        MaThuoc = item.MaThuoc,
                        SoLuong = item.Qty,
                        DonGia = item.Price
                    });
                }

                db.SaveChanges();
                transaction.Commit();

                return Json(new { success = true, msg = invoice.MaHd });
            }
            catch (Exception ex)
            {
                transaction.Rollback(); 
                return Json(new { success = false, msg = ex.Message });
            }
        }
    }

    public class OrderRequest
    {
        public string? MaKh { get; set; }
        public decimal Total { get; set; }
        public decimal Vat { get; set; }
        public decimal CustomerCash { get; set; }
        public decimal Change { get; set; }
        public List<CartItemDTO> Items { get; set; } = new();
    }
    public class CartItemDTO
    {
        public string BatchId { get; set; } = "";
        public string MaThuoc { get; set; } = "";
        public int Qty { get; set; }
        public decimal Price { get; set; }
    }
}