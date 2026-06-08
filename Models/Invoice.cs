using System;
using System.Collections.Generic;

namespace PharmaCare.Models;

public partial class Invoice
{
    public string MaHd { get; set; } = null!;

    public DateTime? NgayLap { get; set; }

    public string? MaNv { get; set; }

    public string? KhachHang { get; set; }

    public string? MaKh { get; set; }

    public decimal? TongTien { get; set; }

    public decimal? GiamGia { get; set; }

    public decimal? ThueVat { get; set; }

    public decimal? KhachCanTra { get; set; }

    public decimal? KhachThanhToan { get; set; }

    public decimal? TienThua { get; set; }

    public string? PhuongThucTt { get; set; }

    public virtual ICollection<InvoiceDetail> InvoiceDetails { get; set; } = new List<InvoiceDetail>();

    public virtual Customer? MaKhNavigation { get; set; }

    public virtual Staff? MaNvNavigation { get; set; }
}
