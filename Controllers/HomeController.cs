using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using PharmaCare.Models;
using System;
using System.Linq;
using System.Collections.Generic;

namespace PharmaCare.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        [Route("/", Name = "HomePage")]
        public IActionResult Index()
        {
            using var db = new DBContext();
            var today = DateTime.Today;

            var model = new HomeViewModel();

            model.TodayRevenue = db.Invoices
                .Where(x => x.NgayLap.HasValue && x.NgayLap.Value.Date == today)
                .Sum(x => (decimal?)x.TongTien) ?? 0;

            model.TodayOrders = db.Invoices
                .Count(x => x.NgayLap.HasValue && x.NgayLap.Value.Date == today);

            model.LowStockItems = db.Drugs.Count(x => x.TonKho < 20);

            model.ExpiredBatches = 0;

            var last7Days = Enumerable.Range(0, 7).Select(i => today.AddDays(-6 + i)).ToList();
            model.RevenueLabels = last7Days.Select(d => d.ToString("dd/MM")).ToList();
            model.RevenueValues = new List<decimal>();

            foreach (var date in last7Days)
            {
                var rev = db.Invoices
                    .Where(x => x.NgayLap.HasValue && x.NgayLap.Value.Date == date)
                    .Sum(x => (decimal?)x.TongTien) ?? 0;
                model.RevenueValues.Add(rev);
            }

            var topProducts = db.InvoiceDetails
                .Include(x => x.MaThuocNavigation)
                .GroupBy(x => new { x.MaThuoc, TenThuoc = x.MaThuocNavigation!.TenThuoc })
                .Select(g => new {
                    Name = g.Key.TenThuoc,
                    Count = g.Count() 
                })
                .OrderByDescending(x => x.Count)
                .Take(5)
                .ToList();

            model.TopProductLabels = topProducts.Select(x => x.Name ?? "Thuốc").ToList();
            model.TopProductValues = topProducts.Select(x => x.Count).ToList();

            if (!model.TopProductLabels.Any())
            {
                model.TopProductLabels = new List<string> { "Chưa có dữ liệu" };
                model.TopProductValues = new List<int> { 0 };
            }

            // 4. CƠ CẤU DANH MỤC THUỐC
            var categoryStats = db.Drugs
                .Include(x => x.MaNhomNavigation)
                .GroupBy(x => x.MaNhomNavigation!.TenNhom)
                .Select(g => new {
                    Category = g.Key ?? "Nhóm khác",
                    Count = g.Count()
                })
                .ToList();

            model.CategoryLabels = categoryStats.Select(x => x.Category).ToList();
            model.CategoryValues = categoryStats.Select(x => x.Count).ToList();

            if (!model.CategoryLabels.Any())
            {
                model.CategoryLabels = new List<string> { "Chưa có dữ liệu" };
                model.CategoryValues = new List<int> { 0 };
            }

            model.RecentInvoices = db.Invoices
                .Include(x => x.MaKhNavigation)
                .OrderByDescending(x => x.NgayLap)
                .Take(5)
                .ToList();

            return View(model);
        }
    }
}

namespace PharmaCare.Models
{
    public class HomeViewModel
    {
        public decimal TodayRevenue { get; set; }
        public int TodayOrders { get; set; }
        public int LowStockItems { get; set; }
        public int ExpiredBatches { get; set; }

        public List<string> RevenueLabels { get; set; } = new();
        public List<decimal> RevenueValues { get; set; } = new();

        public List<string> TopProductLabels { get; set; } = new();
        public List<int> TopProductValues { get; set; } = new();

        public List<string> CategoryLabels { get; set; } = new();
        public List<int> CategoryValues { get; set; } = new();

        public List<Invoice> RecentInvoices { get; set; } = new();
    }
}