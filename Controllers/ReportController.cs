using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PharmaCare.Models;
using System;
using System.Linq;
using System.Collections.Generic;

namespace PharmaCare.Models
{
    public class DashboardViewModel
    {
        public decimal MonthlyRevenue { get; set; }
        public decimal NetProfit { get; set; }
        public int InventoryTarget { get; set; }
        public int PendingOrders { get; set; }

        public List<string> Days { get; set; } = new();
        public List<decimal> RevenueByDay { get; set; } = new();

        public List<string> Categories { get; set; } = new();
        public List<double> CategoryPercents { get; set; } = new();

        public List<ExpiryAlert> ExpiryAlerts { get; set; } = new();
    }

    public class ExpiryAlert
    {
        public string DrugName { get; set; } = "";
        public string BatchCode { get; set; } = "";
        public int DaysLeft { get; set; }
        public int Percent { get; set; }
    }
}

namespace PharmaCare.Controllers
{
    public class ReportController : Controller
    {
        [Route("/bao-cao", Name = "ReportPage")]
        public IActionResult Revenue()
        {
            using var db = new DBContext();

            DateTime now = DateTime.Now;
            DateTime startOfToday = now.Date;
            DateTime endOfToday = startOfToday.AddDays(1);

            DateOnly todayDateOnly = DateOnly.FromDateTime(now);
            DateOnly expiryLimitDateOnly = todayDateOnly.AddDays(90);

            var model = new DashboardViewModel();

            model.MonthlyRevenue = db.Invoices
                .Where(i => i.NgayLap.HasValue && i.NgayLap.Value.Month == now.Month && i.NgayLap.Value.Year == now.Year)
                .Sum(i => i.TongTien) ?? 0;

            model.NetProfit = model.MonthlyRevenue * 0.25m;

            model.PendingOrders = db.Invoices
                .Count(i => i.NgayLap >= startOfToday && i.NgayLap < endOfToday);

            DateTime sevenDaysAgo = startOfToday.AddDays(-6);
            var dailyData = db.Invoices
                .Where(i => i.NgayLap >= sevenDaysAgo && i.NgayLap < endOfToday)
                .GroupBy(i => i.NgayLap!.Value.Date)
                .Select(g => new { Ngay = g.Key, Tong = g.Sum(x => x.TongTien) })
                .OrderBy(x => x.Ngay)
                .ToList();

            foreach (var item in dailyData)
            {
                model.Days.Add(item.Ngay.ToString("dd/MM"));
                model.RevenueByDay.Add(item.Tong ?? 0);
            }

            var batches = db.Batches
                .Include(b => b.MaThuocNavigation)
                .Where(b => b.HanSuDung <= expiryLimitDateOnly && b.SoLuongTon > 0)
                .OrderBy(b => b.HanSuDung)
                .Take(3)
                .ToList();

            model.ExpiryAlerts = batches.Select(b => {
                int daysLeft = b.HanSuDung.DayNumber - todayDateOnly.DayNumber;

                return new ExpiryAlert
                {
                    DrugName = b.MaThuocNavigation?.TenThuoc ?? "Không rõ tên",
                    BatchCode = b.MaLo ?? "N/A",
                    DaysLeft = daysLeft,
                    Percent = daysLeft <= 0 ? 0 : (daysLeft > 30 ? 80 : 20)
                };
            }).ToList();

            model.Categories = new List<string> { "Kháng sinh", "Thực phẩm CN", "Dụng cụ y tế" };
            model.CategoryPercents = new List<double> { 45, 30, 25 };

            return View(model);
        }
    }
}