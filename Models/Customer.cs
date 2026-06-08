using System;
using System.Collections.Generic;

namespace PharmaCare.Models;

public partial class Customer
{
    public string MaKh { get; set; } = null!;

    public string HoTen { get; set; } = null!;

    public string? SoDienThoai { get; set; }

    public int? DiemTichLuy { get; set; }

    public DateTime? NgayTao { get; set; }

    public virtual ICollection<Invoice> Invoices { get; set; } = new List<Invoice>();
}
