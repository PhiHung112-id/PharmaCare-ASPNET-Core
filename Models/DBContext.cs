using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace PharmaCare.Models;

public partial class DBContext : DbContext
{
    public DBContext()
    {
    }

    public DBContext(DbContextOptions<DBContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Batch> Batches { get; set; }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Drug> Drugs { get; set; }

    public virtual DbSet<DrugUnit> DrugUnits { get; set; }

    public virtual DbSet<Invoice> Invoices { get; set; }

    public virtual DbSet<InvoiceDetail> InvoiceDetails { get; set; }

    public virtual DbSet<PurchaseOrder> PurchaseOrders { get; set; }

    public virtual DbSet<PurchaseOrderDetail> PurchaseOrderDetails { get; set; }

    public virtual DbSet<Staff> Staffs { get; set; }

    public virtual DbSet<Supplier> Suppliers { get; set; }

    public virtual DbSet<Unit> Units { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=localhost;Initial Catalog=PharmacyCare;TrustServerCertificate=True;Persist Security Info=True;User ID=sa;Password=123456");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Batch>(entity =>
        {
            entity.HasKey(e => new { e.MaLo, e.MaThuoc }).HasName("PK__Batches__339ED834BDE8284F");

            entity.Property(e => e.MaLo).HasMaxLength(50);
            entity.Property(e => e.MaThuoc).HasMaxLength(50);
            entity.Property(e => e.SoLuongTon).HasDefaultValue(0);

            entity.HasOne(d => d.MaThuocNavigation).WithMany(p => p.Batches)
                .HasForeignKey(d => d.MaThuoc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Batches__MaThuoc__38996AB5");
        });

        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.MaNhom).HasName("PK__Categori__234F91CDF049DBEA");

            entity.Property(e => e.MaNhom).HasMaxLength(50);
            entity.Property(e => e.IsDeleted).HasDefaultValue(false);
            entity.Property(e => e.NgayXoa).HasColumnType("datetime");
            entity.Property(e => e.NguoiXoa).HasMaxLength(50);
            entity.Property(e => e.TenNhom).HasMaxLength(100);
            entity.Property(e => e.TrangThai).HasDefaultValue(true);
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.MaKh).HasName("PK__Customer__2725CF1E20CDF66E");

            entity.HasIndex(e => e.SoDienThoai, "UQ__Customer__0389B7BD01868AFD").IsUnique();

            entity.Property(e => e.MaKh)
                .HasMaxLength(50)
                .HasColumnName("MaKH");
            entity.Property(e => e.DiemTichLuy).HasDefaultValue(0);
            entity.Property(e => e.HoTen).HasMaxLength(100);
            entity.Property(e => e.NgayTao)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.SoDienThoai)
                .HasMaxLength(15)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Drug>(entity =>
        {
            entity.HasKey(e => e.MaThuoc).HasName("PK__Drugs__4BB1F620CD1558B4");

            entity.Property(e => e.MaThuoc).HasMaxLength(50);
            entity.Property(e => e.DonVi).HasMaxLength(20);
            entity.Property(e => e.GiaBan).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.IsDeleted).HasDefaultValue(false);
            entity.Property(e => e.MaNhom).HasMaxLength(50);
            entity.Property(e => e.TenThuoc).HasMaxLength(200);
            entity.Property(e => e.TonKho).HasDefaultValue(0);

            entity.HasOne(d => d.MaNhomNavigation).WithMany(p => p.Drugs)
                .HasForeignKey(d => d.MaNhom)
                .HasConstraintName("FK__Drugs__MaNhom__300424B4");
        });

        modelBuilder.Entity<DrugUnit>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__DrugUnit__3214EC07EF475F93");

            entity.Property(e => e.ConversionRate).HasDefaultValue(1);
            entity.Property(e => e.IsBaseUnit).HasDefaultValue(false);
            entity.Property(e => e.MaThuoc).HasMaxLength(50);
            entity.Property(e => e.Note).HasMaxLength(255);
            entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.MaThuocNavigation).WithMany(p => p.DrugUnits)
                .HasForeignKey(d => d.MaThuoc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__DrugUnits__MaThu__656C112C");

            entity.HasOne(d => d.Unit).WithMany(p => p.DrugUnits)
                .HasForeignKey(d => d.UnitId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__DrugUnits__UnitI__66603565");
        });

        modelBuilder.Entity<Invoice>(entity =>
        {
            entity.HasKey(e => e.MaHd).HasName("PK__Invoices__2725A6E020D97FCB");

            entity.Property(e => e.MaHd)
                .HasMaxLength(50)
                .HasColumnName("MaHD");
            entity.Property(e => e.GiamGia)
                .HasDefaultValue(0m)
                .HasColumnType("decimal(18, 2)");
            entity.Property(e => e.KhachCanTra).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.KhachHang).HasMaxLength(100);
            entity.Property(e => e.KhachThanhToan).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.MaKh)
                .HasMaxLength(50)
                .HasColumnName("MaKH");
            entity.Property(e => e.MaNv)
                .HasMaxLength(50)
                .HasColumnName("MaNV");
            entity.Property(e => e.NgayLap)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.PhuongThucTt)
                .HasMaxLength(50)
                .HasDefaultValue("Tiền mặt")
                .HasColumnName("PhuongThucTT");
            entity.Property(e => e.ThueVat)
                .HasDefaultValue(0m)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("ThueVAT");
            entity.Property(e => e.TienThua).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.TongTien).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.MaKhNavigation).WithMany(p => p.Invoices)
                .HasForeignKey(d => d.MaKh)
                .HasConstraintName("FK__Invoices__MaKH__48CFD27E");

            entity.HasOne(d => d.MaNvNavigation).WithMany(p => p.Invoices)
                .HasForeignKey(d => d.MaNv)
                .HasConstraintName("FK__Invoices__MaNV__47DBAE45");
        });

        modelBuilder.Entity<InvoiceDetail>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__InvoiceD__3214EC278B4343AA");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.DonGia).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.MaHd)
                .HasMaxLength(50)
                .HasColumnName("MaHD");
            entity.Property(e => e.MaThuoc).HasMaxLength(50);

            entity.HasOne(d => d.MaHdNavigation).WithMany(p => p.InvoiceDetails)
                .HasForeignKey(d => d.MaHd)
                .HasConstraintName("FK__InvoiceDet__MaHD__4E88ABD4");

            entity.HasOne(d => d.MaThuocNavigation).WithMany(p => p.InvoiceDetails)
                .HasForeignKey(d => d.MaThuoc)
                .HasConstraintName("FK__InvoiceDe__MaThu__4F7CD00D");
        });

        modelBuilder.Entity<PurchaseOrder>(entity =>
        {
            entity.HasKey(e => e.MaPn).HasName("PK__Purchase__2725E7F068ED33F9");

            entity.Property(e => e.MaPn)
                .HasMaxLength(50)
                .HasColumnName("MaPN");
            entity.Property(e => e.MaNcc)
                .HasMaxLength(50)
                .HasColumnName("MaNCC");
            entity.Property(e => e.MaNv)
                .HasMaxLength(50)
                .HasColumnName("MaNV");
            entity.Property(e => e.NgayNhap)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.TongTienNhap)
                .HasDefaultValue(0m)
                .HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.MaNccNavigation).WithMany(p => p.PurchaseOrders)
                .HasForeignKey(d => d.MaNcc)
                .HasConstraintName("FK__PurchaseO__MaNCC__3E52440B");

            entity.HasOne(d => d.MaNvNavigation).WithMany(p => p.PurchaseOrders)
                .HasForeignKey(d => d.MaNv)
                .HasConstraintName("FK__PurchaseOr__MaNV__3D5E1FD2");
        });

        modelBuilder.Entity<PurchaseOrderDetail>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Purchase__3214EC27ABDD1BF1");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.DonGiaNhap).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.MaLo).HasMaxLength(50);
            entity.Property(e => e.MaPn)
                .HasMaxLength(50)
                .HasColumnName("MaPN");
            entity.Property(e => e.MaThuoc).HasMaxLength(50);
            entity.Property(e => e.ThanhTien).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.MaPnNavigation).WithMany(p => p.PurchaseOrderDetails)
                .HasForeignKey(d => d.MaPn)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__PurchaseOr__MaPN__4222D4EF");

            entity.HasOne(d => d.MaThuocNavigation).WithMany(p => p.PurchaseOrderDetails)
                .HasForeignKey(d => d.MaThuoc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__PurchaseO__MaThu__4316F928");

            entity.HasOne(d => d.Batch).WithMany(p => p.PurchaseOrderDetails)
                .HasForeignKey(d => new { d.MaLo, d.MaThuoc })
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__PurchaseOrderDet__440B1D61");
        });

        modelBuilder.Entity<Staff>(entity =>
        {
            entity.HasKey(e => e.MaNv).HasName("PK__Staffs__2725D70A2A669CFA");

            entity.HasIndex(e => e.TaiKhoan, "UQ__Staffs__D5B8C7F0DD3B74FD").IsUnique();

            entity.Property(e => e.MaNv)
                .HasMaxLength(50)
                .HasColumnName("MaNV");
            entity.Property(e => e.HoTen).HasMaxLength(100);
            entity.Property(e => e.Quyen).HasMaxLength(20);
            entity.Property(e => e.TaiKhoan)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Supplier>(entity =>
        {
            entity.HasKey(e => e.MaNcc).HasName("PK__Supplier__3A185DEB8E6A9577");

            entity.Property(e => e.MaNcc)
                .HasMaxLength(50)
                .HasColumnName("MaNCC");
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.SoDienThoai)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.TenNcc)
                .HasMaxLength(200)
                .HasColumnName("TenNCC");
        });

        modelBuilder.Entity<Unit>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Units__3214EC07476E1E66");

            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description).HasMaxLength(255);
            entity.Property(e => e.IsDeleted).HasDefaultValue(false);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.ShortName).HasMaxLength(50);
            entity.Property(e => e.Status).HasDefaultValue(true);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
