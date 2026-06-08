using System;
using System.Collections.Generic;

namespace PharmaCare.Models;

public partial class InvoiceDetail
{
    public int Id { get; set; }

    public string? MaHd { get; set; }

    public string? MaThuoc { get; set; }

    public int? SoLuong { get; set; }

    public decimal? DonGia { get; set; }

    public virtual Invoice? MaHdNavigation { get; set; }

    public virtual Drug? MaThuocNavigation { get; set; }
}
