using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PharmaCare.Models;
using System;
using System.Linq;

namespace PharmaCare.Controllers
{
    public class InvoiceController : Controller
    {
        [Route("/hoa-don/lich-su", Name = "InvoicePage")]
        public IActionResult Index(int? page)
        {
            using var db = new DBContext();

            int pageSize = 10; 
            int pageNumber = page ?? 1; 

            var query = db.Invoices.Include(i => i.MaKhNavigation).OrderByDescending(i => i.NgayLap);
            int totalItems = query.Count();
            int totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            var invoices = query
                .Skip((pageNumber - 1) * pageSize) 
                .Take(pageSize)                
                .ToList();

            ViewBag.CurrentPage = pageNumber;
            ViewBag.TotalPages = totalPages;

            return View(invoices);
        }

        [HttpGet]
        [Route("Invoices/GetDetails")]
        [Route("Invoice/GetDetails")]  
        public IActionResult GetDetails(string id)
        {
            if (string.IsNullOrEmpty(id)) return BadRequest();

            try
            {
                using var db = new DBContext();
                var details = db.InvoiceDetails
                    .Include(d => d.MaThuocNavigation) 
                    .Where(d => d.MaHd == id)
                    .Select(d => new {
                        tenThuoc = d.MaThuocNavigation != null ? d.MaThuocNavigation.TenThuoc : "Thuốc không xác định",
                        soLuong = d.SoLuong ?? 0,
                        donGia = d.DonGia ?? 0,
                        thanhTien = (d.SoLuong ?? 0) * (d.DonGia ?? 0)
                    })
                    .ToList();

                if (details == null || !details.Any()) return NotFound();

                return Json(details);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}