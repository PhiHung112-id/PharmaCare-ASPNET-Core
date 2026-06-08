using System;
using System.Collections.Generic;

namespace PharmaCare.Models;

public partial class Drug
{
    public string MaThuoc { get; set; } = null!;

    public string TenThuoc { get; set; } = null!;

    public string? MaNhom { get; set; }

    public string? DonVi { get; set; }

    public decimal? GiaBan { get; set; }

    public int? TonKho { get; set; }

    public string? HinhAnh { get; set; }

    public bool? IsDeleted { get; set; }

    public virtual ICollection<Batch> Batches { get; set; } = new List<Batch>();

    public virtual ICollection<DrugUnit> DrugUnits { get; set; } = new List<DrugUnit>();

    public virtual ICollection<InvoiceDetail> InvoiceDetails { get; set; } = new List<InvoiceDetail>();

    public virtual Category? MaNhomNavigation { get; set; }

    public virtual ICollection<PurchaseOrderDetail> PurchaseOrderDetails { get; set; } = new List<PurchaseOrderDetail>();
}
