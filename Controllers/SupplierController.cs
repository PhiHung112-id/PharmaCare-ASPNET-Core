using Microsoft.AspNetCore.Mvc;
using PharmaCare.Models;
using System.Linq;

namespace PharmaCare.Controllers
{
    public class SupplierController : Controller
    {
        [Route("/nha-cung-cap", Name = "SupplierPage")]
        public IActionResult Index()
        {
            using var db = new DBContext();
            var suppliers = db.Suppliers.ToList();
            return View(suppliers);
        }

        // LƯU (THÊM HOẶC SỬA)
        [HttpPost]
        public IActionResult Save(Supplier model)
        {
            using var db = new DBContext();

            if (string.IsNullOrEmpty(model.MaNcc)) 
            {
                var lastNcc = db.Suppliers.OrderByDescending(x => x.MaNcc).FirstOrDefault();
                int nextId = (lastNcc == null) ? 1 : int.Parse(lastNcc.MaNcc.Substring(3)) + 1;
                model.MaNcc = "NCC" + nextId.ToString("D3");

                db.Suppliers.Add(model);
            }
            else 
            {
                var exist = db.Suppliers.Find(model.MaNcc);
                if (exist != null)
                {
                    exist.TenNcc = model.TenNcc;
                    exist.DiaChi = model.DiaChi;
                    exist.SoDienThoai = model.SoDienThoai;
                    exist.Email = model.Email;
                }
            }

            db.SaveChanges();
            return RedirectToRoute("SuppliersPage");
        }

        // XÓA NHÀ CUNG CẤP
        [HttpPost]
        public IActionResult Delete(string id)
        {
            using var db = new DBContext();
            var ncc = db.Suppliers.Find(id);
            if (ncc != null)
            {
                db.Suppliers.Remove(ncc);
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }
    }
}