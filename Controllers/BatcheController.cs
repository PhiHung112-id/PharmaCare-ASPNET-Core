using Microsoft.AspNetCore.Mvc;
using PharmaCare.Models;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;

namespace PharmaCare.Controllers
{
    public class BatcheController : Controller
    {
        [Route("/kho", Name = "BatchePage")]
        public IActionResult Index()
        {
            using var db = new DBContext();

            var batches = db.Batches
                .Include(b => b.MaThuocNavigation)
                .OrderBy(b => b.HanSuDung)
                .Select(b => new {
                    maLo = b.MaLo,
                    tenThuoc = b.MaThuocNavigation.TenThuoc,
                    hanSuDung = b.HanSuDung.ToString("dd/MM/yyyy"),
                    slTon = b.SoLuongTon ?? 0,
                    tinhTrang = (b.HanSuDung < DateOnly.FromDateTime(DateTime.Now)) ? "Hết hạn" : "Bình thường"
                }).ToList();

            ViewBag.TotalStock = batches.Sum(x => x.slTon);
            ViewBag.ExpiredCount = batches.Count(x => x.tinhTrang == "Hết hạn");
            ViewBag.LowStockCount = batches.Count(x => x.slTon < 10); 

            ViewBag.BatchesJson = JsonSerializer.Serialize(batches);

            return View();
        }

        [HttpPost]
        public IActionResult Delete(string id)
        {
            using var db = new DBContext();
            var batch = db.Batches.Find(id);
            if (batch != null)
            {
                db.Batches.Remove(batch);
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }
    }
}