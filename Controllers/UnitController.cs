using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using PharmaCare.Models;
using System.Text.Json;

namespace PharmaCare.Controllers
{
    public class UnitController : Controller
    {
        [Route("/don-vi-tinh", Name = "UnitPage")]
        public IActionResult Index()
        {
            using var db = new DBContext();

            var units = db.Units.Where(u => u.IsDeleted == false || u.IsDeleted == null)
                .Select(u => new {
                    id = u.Id,
                    name = u.Name,
                    shortName = u.ShortName ?? "",
                    description = u.Description ?? "",
                    status = u.Status ?? true,
                    createdAt = u.CreatedAt,
                    productCount = 0 
                }).ToList();

            ViewBag.UnitsJson = JsonSerializer.Serialize(units);

            ViewBag.TotalUnits = units.Count;
            ViewBag.ActiveUnits = units.Count(u => u.status == true);
            ViewBag.TotalProducts = 0; 

            return View();
        }

        // XỬ LÝ THÊM MỚI 
        [HttpPost]
        [Route("/Units/Create")]
        public IActionResult Create(string Name, string ShortName, string Description, string Status)
        {
            if (!string.IsNullOrEmpty(Name))
            {
                using var db = new DBContext();
                var newUnit = new Unit
                {
                    Name = Name,
                    ShortName = ShortName,
                    Description = Description,
                    Status = (Status == "active"),
                    IsDeleted = false,
                    CreatedAt = DateTime.Now
                };
                db.Units.Add(newUnit);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        // XỬ LÝ CẬP NHẬT 
        [HttpPost]
        [Route("/Units/Edit")]
        public IActionResult Edit(int Id, string Name, string ShortName, string Description, string Status)
        {
            using var db = new DBContext();
            var unit = db.Units.Find(Id);
            if (unit != null)
            {
                unit.Name = Name;
                unit.ShortName = ShortName;
                unit.Description = Description;
                unit.Status = (Status == "active");
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        // CHUYỂN VÀO THÙNG RÁC (XÓA MỀM)
        [HttpPost]
        [Route("/Units/Delete")]
        public IActionResult SoftDelete(int Id)
        {
            using var db = new DBContext();
            var unit = db.Units.Find(Id);
            if (unit != null)
            {
                unit.IsDeleted = true;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        // TRANG THÙNG RÁC
        [Route("/don-vi-tinh/thung-rac", Name = "UnitsTrashPage")]
        public IActionResult Trash()
        {
            using var db = new DBContext();
            var trashData = db.Units.Where(u => u.IsDeleted == true).ToList();
            return View(trashData);
        }

        // KHÔI PHỤC ĐƠN VỊ
        [HttpPost]
        [Route("/Units/Restore")]
        public IActionResult Restore(int Id)
        {
            using var db = new DBContext();
            var unit = db.Units.Find(Id);
            if (unit != null) { unit.IsDeleted = false; db.SaveChanges(); }
            return RedirectToRoute("UnitsTrashPage");
        }

        // XÓA VĨNH VIỄN
        [HttpPost]
        [Route("/Units/HardDelete")]
        public IActionResult HardDelete(int Id)
        {
            using var db = new DBContext();
            var unit = db.Units.Find(Id);
            if (unit != null) { db.Units.Remove(unit); db.SaveChanges(); }
            return RedirectToRoute("UnitsTrashPage");
        }
    }
}