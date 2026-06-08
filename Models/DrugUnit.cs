using System;
using System.Collections.Generic;

namespace PharmaCare.Models;

public partial class DrugUnit
{
    public int Id { get; set; }

    public string MaThuoc { get; set; } = null!;

    public int UnitId { get; set; }

    public bool? IsBaseUnit { get; set; }

    public int? ConversionRate { get; set; }

    public decimal Price { get; set; }

    public string? Note { get; set; }

    public virtual Drug MaThuocNavigation { get; set; } = null!;

    public virtual Unit Unit { get; set; } = null!;
}
