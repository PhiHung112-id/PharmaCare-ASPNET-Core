using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using PharmaCare.Models;
using System.Text.Json;

namespace PharmaCare.Controllers
{
    public class CategorieController : Controller
    {
        // 1. TRANG DANH SÁCH NHÓM THUỐC
        [HttpGet]
        [Route("/nhom-thuoc", Name = "CategoriePage")]
        public IActionResult Index()
        {
            using var db = new DBContext();

            var categories = db.Categories
                .Where(x => x.IsDeleted == false || x.IsDeleted == null)
                .Select(c => new
                {
                    id = c.MaNhom,
                    name = c.TenNhom,
                    description = c.GhiChu ?? "",
                    status = c.TrangThai ?? true,
                    drugCount = db.Drugs.Count(d => d.MaNhom == c.MaNhom && (d.IsDeleted == false || d.IsDeleted == null))
                })
                .ToList();

            ViewBag.CategoriesJson = JsonSerializer.Serialize(categories);

            ViewBag.TotalCategories = categories.Count;
            ViewBag.TotalDrugs = categories.Sum(c => c.drugCount);
            ViewBag.AvgDrugs = categories.Count > 0 ? Math.Round((double)categories.Sum(c => c.drugCount) / categories.Count, 1) : 0;
            ViewBag.InactiveCount = categories.Count(c => c.status == false);

            return View();
        }

        // 2. THÊM NHÓM
        [HttpPost]
        [Route("/nhom-thuoc/them", Name = "CategoryCreate")]
        public IActionResult Create(string Name, string Description, string Status)
        {
            using var db = new DBContext();

            var lastCat = db.Categories.OrderByDescending(x => x.MaNhom).FirstOrDefault();
            string newId = lastCat == null ? "NH001" : "NH" + (int.Parse(lastCat.MaNhom.Replace("NH", "")) + 1).ToString("D3");

            var newCategory = new Category
            {
                MaNhom = newId,
                TenNhom = Name,
                GhiChu = Description,
                TrangThai = Status == "active",
                IsDeleted = false
            };

            db.Categories.Add(newCategory);
            db.SaveChanges();

            return RedirectToRoute("CategoriePage");
        }

        // 3. SỬA NHÓM
        [HttpPost]
        [Route("/nhom-thuoc/sua", Name = "CategoryEdit")]
        public IActionResult Edit(string Id, string Name, string Description, string Status)
        {
            using var db = new DBContext();
            var exist = db.Categories.Find(Id);
            if (exist != null)
            {
                exist.TenNhom = Name;
                exist.GhiChu = Description;
                exist.TrangThai = Status == "active";
                db.SaveChanges();
            }
            return RedirectToRoute("CategoriePage"); 
        }

        // 4. XÓA MỀM (VÀO THÙNG RÁC)
        [HttpPost]
        [Route("/nhom-thuoc/xoa-mem", Name = "CategorySoftDelete")]
        public IActionResult SoftDelete(string Id)
        {
            using var db = new DBContext();
            var exist = db.Categories.Find(Id);
            if (exist != null)
            {
                exist.IsDeleted = true;
                exist.NgayXoa = DateTime.Now;
                exist.NguoiXoa = "Admin";
                db.SaveChanges();
            }
            return RedirectToRoute("CategoriePage"); 
        }

        // 5. TRANG THÙNG RÁC
        [HttpGet]
        [Route("/nhom-thuoc/thung-rac", Name = "CategoryTrashPage")]
        public IActionResult Trash()
        {
            using var db = new DBContext();
            var trashData = db.Categories.Where(x => x.IsDeleted == true).ToList();
            return View(trashData);
        }

        // 6. KHÔI PHỤC
        [HttpPost]
        [Route("/nhom-thuoc/khoi-phuc", Name = "CategoryRestore")]
        public IActionResult Restore(string Id)
        {
            using var db = new DBContext();
            var exist = db.Categories.Find(Id);
            if (exist != null)
            {
                exist.IsDeleted = false;
                exist.NgayXoa = null;
                exist.NguoiXoa = null;
                db.SaveChanges();
            }
            return RedirectToRoute("CategoryTrashPage");
        }

        // 7. XÓA VĨNH VIỄN
        [HttpPost]
        [Route("/nhom-thuoc/xoa-vinh-vien", Name = "CategoryHardDelete")]
        public IActionResult HardDelete(string Id)
        {
            using var db = new DBContext();
            var exist = db.Categories.Find(Id);
            if (exist != null)
            {
                var hasDrugs = db.Drugs.Any(d => d.MaNhom == Id);
                if (!hasDrugs)
                {
                    db.Categories.Remove(exist);
                    db.SaveChanges();
                }
            }
            return RedirectToRoute("CategoryTrashPage");
        }

        // 8. CHI TIẾT NHÓM
        [HttpGet]
        [Route("/nhom-thuoc/chi-tiet/{id}", Name = "CategoryDetailPage")]
        public IActionResult Detail(string id)
        {
            using var db = new DBContext();
            var category = db.Categories.Find(id);
            if (category == null) return RedirectToRoute("CategoriePage"); 

            ViewBag.DrugsInCat = db.Drugs.Where(d => d.MaNhom == id && (d.IsDeleted == false || d.IsDeleted == null)).ToList();
            return View(category);
        }
    }
}