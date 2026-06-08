using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PharmaCare.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PharmaCare.Controllers
{

    [Authorize(Roles = "Admin")]
    public class StaffController : Controller
    {
        [Route("/nhan-vien", Name = "StaffPage")]
        public IActionResult Index(int page = 1)
        {
            using var db = new DBContext();
            int pageSize = 5;

            var model = new StaffViewModel();
            var query = db.Staffs.AsQueryable();

            model.TotalStaff = query.Count();
            model.ActiveStaff = query.Count();
            model.TotalPages = (int)Math.Ceiling((double)model.TotalStaff / pageSize);
            model.CurrentPage = page;

            model.StaffList = query
                .OrderByDescending(x => x.MaNv)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            return View(model);
        }

        // 2. THÊM MỚI NHÂN VIÊN
        [HttpPost]
        [Route("/Staff/Create")]
        public IActionResult Create(string FullName, string Username, string Password, int RoleId)
        {
            using var db = new DBContext();

            string quyenHan = RoleId switch
            {
                1 => "Dược sĩ tư vấn",
                2 => "Nhân viên bán hàng",
                3 => "Quản lý kho",
                _ => "Nhân viên"
            };

            var newStaff = new Staff
            {
                MaNv = "NV" + DateTime.Now.ToString("HHmmss"),
                HoTen = FullName,
                TaiKhoan = Username,
                Quyen = quyenHan,
                MatKhau = Password 
            };

            db.Staffs.Add(newStaff);
            db.SaveChanges();

            TempData["Success"] = "Đã thêm nhân viên thành công!";
            return RedirectToAction("Index");
        }

        // 3. SỬA THÔNG TIN NHÂN VIÊN
        [HttpPost]
        [Route("/Staff/Edit")]
        public IActionResult Edit(string MaNv, string FullName, string Password, int RoleId)
        {
            using var db = new DBContext();

            var staff = db.Staffs.FirstOrDefault(x => x.MaNv == MaNv);

            if (staff != null)
            {
                staff.HoTen = FullName;
                staff.Quyen = RoleId switch
                {
                    1 => "Dược sĩ tư vấn",
                    2 => "Nhân viên bán hàng",
                    3 => "Quản lý kho",
                    _ => "Nhân viên"
                };

                if (!string.IsNullOrWhiteSpace(Password))
                {
                    staff.MatKhau = Password;
                }

                db.SaveChanges();
                TempData["Success"] = "Cập nhật thông tin thành công!";
            }

            return RedirectToAction("Index");
        }

        // 4. XÓA NHÂN VIÊN
        [HttpPost]
        [Route("/Staff/Delete")]
        public IActionResult Delete(string MaNv)
        {
            using var db = new DBContext();
            var staff = db.Staffs.FirstOrDefault(x => x.MaNv == MaNv);

            if (staff != null)
            {
                db.Staffs.Remove(staff);
                db.SaveChanges();
                TempData["Success"] = "Đã xóa nhân viên khỏi hệ thống!";
            }

            return RedirectToAction("Index");
        }
    }
}


namespace PharmaCare.Models
{
    public class StaffViewModel
    {
        public int TotalStaff { get; set; }
        public int ActiveStaff { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }
        public List<Staff> StaffList { get; set; } = new();
    }
}