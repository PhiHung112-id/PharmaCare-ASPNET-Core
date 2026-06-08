using System;
using System.Collections.Generic;

namespace PharmaCare.Models;

public partial class Unit
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? ShortName { get; set; }

    public string? Description { get; set; }

    public bool? Status { get; set; }

    public bool? IsDeleted { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual ICollection<DrugUnit> DrugUnits { get; set; } = new List<DrugUnit>();
}
