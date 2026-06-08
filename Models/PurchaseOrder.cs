using System;
using System.Collections.Generic;

namespace PharmaCare.Models;

public partial class PurchaseOrder
{
    public string MaPn { get; set; } = null!;

    public DateTime? NgayNhap { get; set; }

    public string? MaNv { get; set; }

    public string? MaNcc { get; set; }

    public decimal? TongTienNhap { get; set; }

    public string? GhiChu { get; set; }

    public virtual Supplier? MaNccNavigation { get; set; }

    public virtual Staff? MaNvNavigation { get; set; }

    public virtual ICollection<PurchaseOrderDetail> PurchaseOrderDetails { get; set; } = new List<PurchaseOrderDetail>();
}
