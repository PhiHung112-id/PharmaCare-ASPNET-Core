using System;
using System.Collections.Generic;

namespace PharmaCare.Models;

public partial class Batch
{
    public string MaLo { get; set; } = null!;

    public string MaThuoc { get; set; } = null!;

    public int? SoLuongTon { get; set; }

    public DateOnly? NgaySanXuat { get; set; }

    public DateOnly HanSuDung { get; set; }

    public virtual Drug MaThuocNavigation { get; set; } = null!;

    public virtual ICollection<PurchaseOrderDetail> PurchaseOrderDetails { get; set; } = new List<PurchaseOrderDetail>();
}
