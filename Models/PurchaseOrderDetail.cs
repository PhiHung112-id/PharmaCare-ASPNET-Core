using System;
using System.Collections.Generic;

namespace PharmaCare.Models;

public partial class PurchaseOrderDetail
{
    public int Id { get; set; }

    public string MaPn { get; set; } = null!;

    public string MaThuoc { get; set; } = null!;

    public string MaLo { get; set; } = null!;

    public int SoLuongNhap { get; set; }

    public decimal DonGiaNhap { get; set; }

    public decimal ThanhTien { get; set; }

    public virtual Batch Batch { get; set; } = null!;

    public virtual PurchaseOrder MaPnNavigation { get; set; } = null!;

    public virtual Drug MaThuocNavigation { get; set; } = null!;
}
