using System;
using System.Collections.Generic;

namespace PharmaCare.Models;

public partial class Category
{
    public string MaNhom { get; set; } = null!;

    public string TenNhom { get; set; } = null!;

    public string? GhiChu { get; set; }

    public bool? TrangThai { get; set; }

    public bool? IsDeleted { get; set; }

    public DateTime? NgayXoa { get; set; }

    public string? NguoiXoa { get; set; }

    public virtual ICollection<Drug> Drugs { get; set; } = new List<Drug>();
}
