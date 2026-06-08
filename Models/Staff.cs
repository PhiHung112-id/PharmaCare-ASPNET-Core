using System;
using System.Collections.Generic;

namespace PharmaCare.Models;

public partial class Staff
{
    public string MaNv { get; set; } = null!;

    public string HoTen { get; set; } = null!;

    public string? TaiKhoan { get; set; }

    public string? MatKhau { get; set; }

    public string? Quyen { get; set; }

    public virtual ICollection<Invoice> Invoices { get; set; } = new List<Invoice>();

    public virtual ICollection<PurchaseOrder> PurchaseOrders { get; set; } = new List<PurchaseOrder>();
}
