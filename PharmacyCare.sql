USE [PharmacyCare]
GO
/****** Object:  Table [dbo].[Batches]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batches](
	[MaLo] [nvarchar](50) NOT NULL,
	[MaThuoc] [nvarchar](50) NOT NULL,
	[SoLuongTon] [int] NULL,
	[NgaySanXuat] [date] NULL,
	[HanSuDung] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLo] ASC,
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[MaNhom] [nvarchar](50) NOT NULL,
	[TenNhom] [nvarchar](100) NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[NgayXoa] [datetime] NULL,
	[NguoiXoa] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[MaKH] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[SoDienThoai] [varchar](15) NULL,
	[DiemTichLuy] [int] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drugs](
	[MaThuoc] [nvarchar](50) NOT NULL,
	[TenThuoc] [nvarchar](200) NOT NULL,
	[MaNhom] [nvarchar](50) NULL,
	[DonVi] [nvarchar](20) NULL,
	[GiaBan] [decimal](18, 2) NULL,
	[TonKho] [int] NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugUnits]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugUnits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaThuoc] [nvarchar](50) NOT NULL,
	[UnitId] [int] NOT NULL,
	[IsBaseUnit] [bit] NULL,
	[ConversionRate] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Note] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [nvarchar](50) NULL,
	[MaThuoc] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[MaHD] [nvarchar](50) NOT NULL,
	[NgayLap] [datetime] NULL,
	[MaNV] [nvarchar](50) NULL,
	[KhachHang] [nvarchar](100) NULL,
	[MaKH] [nvarchar](50) NULL,
	[TongTien] [decimal](18, 2) NULL,
	[GiamGia] [decimal](18, 2) NULL,
	[ThueVAT] [decimal](18, 2) NULL,
	[KhachCanTra] [decimal](18, 2) NULL,
	[KhachThanhToan] [decimal](18, 2) NULL,
	[TienThua] [decimal](18, 2) NULL,
	[PhuongThucTT] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderDetails]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaPN] [nvarchar](50) NOT NULL,
	[MaThuoc] [nvarchar](50) NOT NULL,
	[MaLo] [nvarchar](50) NOT NULL,
	[SoLuongNhap] [int] NOT NULL,
	[DonGiaNhap] [decimal](18, 2) NOT NULL,
	[ThanhTien] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[MaPN] [nvarchar](50) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[MaNV] [nvarchar](50) NULL,
	[MaNCC] [nvarchar](50) NULL,
	[TongTienNhap] [decimal](18, 2) NULL,
	[GhiChu] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[MaNV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [nvarchar](max) NULL,
	[Quyen] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenNCC] [nvarchar](200) NOT NULL,
	[SoDienThoai] [varchar](15) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 4/9/2026 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-01', N'T001', 1000, CAST(N'2024-01-01' AS Date), CAST(N'2026-01-01' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-02', N'T002', 498, CAST(N'2024-05-15' AS Date), CAST(N'2026-05-15' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-03', N'T003', 43, CAST(N'2024-02-10' AS Date), CAST(N'2027-02-10' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-04', N'T004', 299, CAST(N'2024-06-20' AS Date), CAST(N'2025-12-20' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-05', N'T005', 600, CAST(N'2023-11-05' AS Date), CAST(N'2025-11-05' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-06', N'T006', 50, CAST(N'2024-03-12' AS Date), CAST(N'2027-03-12' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-07', N'T007', 400, CAST(N'2024-08-01' AS Date), CAST(N'2026-08-01' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-08', N'T008', 80, CAST(N'2024-04-18' AS Date), CAST(N'2027-04-18' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-09', N'T009', 120, CAST(N'2023-12-30' AS Date), CAST(N'2025-12-30' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-10', N'T010', 200, CAST(N'2024-07-07' AS Date), CAST(N'2026-07-07' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-11', N'T011', 90, CAST(N'2024-01-15' AS Date), CAST(N'2026-01-15' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-12', N'T012', 70, CAST(N'2024-02-20' AS Date), CAST(N'2026-02-20' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-13', N'T013', 40, CAST(N'2024-03-25' AS Date), CAST(N'2027-03-25' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-14', N'T014', 80, CAST(N'2024-04-10' AS Date), CAST(N'2026-04-10' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-15', N'T015', 60, CAST(N'2024-05-05' AS Date), CAST(N'2027-05-05' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-16', N'T016', 30, CAST(N'2024-06-15' AS Date), CAST(N'2025-12-15' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-17', N'T017', 150, CAST(N'2024-07-20' AS Date), CAST(N'2027-07-20' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-18', N'T018', 20, CAST(N'2024-08-10' AS Date), CAST(N'2028-08-10' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-19', N'T019', 500, CAST(N'2024-09-01' AS Date), CAST(N'2026-09-01' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO-20', N'T020', 0, CAST(N'2024-10-10' AS Date), CAST(N'2027-10-10' AS Date))
GO
INSERT [dbo].[Batches] ([MaLo], [MaThuoc], [SoLuongTon], [NgaySanXuat], [HanSuDung]) VALUES (N'LO260407154104', N'T015', 1, NULL, CAST(N'2026-04-08' AS Date))
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH001', N'Kháng sinh', N'Diệt khuẩn, ức chế vi khuẩn', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH002', N'Giảm đau - Hạ sốt', N'Thuốc giảm đau, hạ thân nhiệt', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH003', N'Vitamin & Khoáng chất', N'Bổ sung dinh dưỡng thiết yếu', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH004', N'Tiêu hóa', N'Thuốc dạ dày, men tiêu hóa', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH005', N'Tim mạch', N'Huyết áp, mỡ máu', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH006', N'Hô hấp', N'Thuốc ho, hen suyễn, long đờm', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH007', N'Dị ứng', N'Kháng Histamin', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH008', N'Da liễu', N'Kem bôi, thuốc trị mụn, nấm', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH009', N'Thực phẩm chức năng', N'Hỗ trợ tăng cường sức khỏe', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH010', N'Vật tư y tế', N'Băng gạc, cồn, khẩu trang', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH011', N'Mắt', N'Thuốc nhỏ mắt, mỡ tra mắt', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH012', N'Tai Mũi Họng', N'Thuốc xịt mũi, nhỏ tai', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH013', N'Xương khớp', N'Thuốc trị đau khớp, loãng xương', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH014', N'Thần kinh', N'Thuốc an thần, tuần hoàn não', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH015', N'Dược mỹ phẩm', N'Sữa rửa mặt, dưỡng da y khoa', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH016', N'Nhi khoa', N'Thuốc chuyên dùng cho trẻ em', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH017', N'Phụ khoa', N'Thuốc điều trị, dung dịch vệ sinh', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH018', N'Nam khoa', N'Sản phẩm sinh lý nam', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH019', N'Đông y - Thảo dược', N'Các loại thuốc nguồn gốc tự nhiên', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Categories] ([MaNhom], [TenNhom], [GhiChu], [TrangThai], [IsDeleted], [NgayXoa], [NguoiXoa]) VALUES (N'NH020', N'Sơ cứu', N'Hộp cứu thương, thiết bị sơ cứu', 1, 0, NULL, NULL)
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH001', N'Khách vãng lai', N'0000000000', 0, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH002', N'Chị Lan', N'0901111111', 150, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH003', N'Chú Bảy', N'0902222222', 45, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH004', N'Cô Hoa', N'0903333333', 200, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH005', N'Bác Ba', N'0904444444', 10, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH006', N'Anh Tuấn', N'0905555555', 80, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH007', N'Chị Thủy', N'0906666666', 300, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH008', N'Em Sơn', N'0907777777', 15, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH009', N'Bà Tám', N'0908888888', 500, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH010', N'Ông Tốn', N'0909999999', 0, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH011', N'Anh Dũng', N'0911222333', 120, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH012', N'Chị Hằng', N'0922333444', 50, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH013', N'Chú Mạnh', N'0933444555', 20, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH014', N'Bà Năm', N'0944555666', 30, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH015', N'Em Trang', N'0955666777', 60, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH016', N'Cô Lệ', N'0966777888', 90, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH017', N'Anh Quyết', N'0977888999', 110, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH018', N'Chị Ngọc', N'0988999000', 400, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH019', N'Bác Toàn', N'0999000111', 250, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Customers] ([MaKH], [HoTen], [SoDienThoai], [DiemTichLuy], [NgayTao]) VALUES (N'KH020', N'Cô Cúc', N'0888111222', 5, CAST(N'2026-04-06T20:24:59.510' AS DateTime))
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T001', N'Amoxicillin 500mg', N'NH001', N'Kg', CAST(2500.00 AS Decimal(18, 2)), 1000, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T002', N'Panadol Extra', N'NH002', N'Viên', CAST(2000.00 AS Decimal(18, 2)), 500, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T003', N'Vitamin C Plusssz', N'NH003', N'Tuýp', CAST(35000.00 AS Decimal(18, 2)), 48, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T004', N'Omeprazole 20mg', N'NH004', N'Viên', CAST(1500.00 AS Decimal(18, 2)), 300, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T005', N'Amlodipine 5mg', N'NH005', N'Viên', CAST(3000.00 AS Decimal(18, 2)), 600, N'/uploads/drugs/4e9a09b3-15a6-4f1d-8a87-cc6942d3c9fe.png', 1)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T006', N'Siro Ho Prospan', N'NH006', N'Chai', CAST(75000.00 AS Decimal(18, 2)), 50, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T007', N'Loratadine 10mg', N'NH007', N'Viên', CAST(2000.00 AS Decimal(18, 2)), 400, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T008', N'Kem bôi Dibetalic', N'NH008', N'Tuýp', CAST(45000.00 AS Decimal(18, 2)), 80, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T009', N'Hoạt huyết Nhất Nhất', N'NH009', N'Hộp', CAST(95000.00 AS Decimal(18, 2)), 120, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T010', N'Băng cá nhân Urgo', N'NH010', N'Hộp', CAST(20000.00 AS Decimal(18, 2)), 200, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T011', N'V.Rohto Vitamin', N'NH011', N'Lọ', CAST(55000.00 AS Decimal(18, 2)), 90, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T012', N'Thuốc xịt mũi Otrivin', N'NH012', N'Chai', CAST(45000.00 AS Decimal(18, 2)), 70, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T013', N'Jex Max', N'NH013', N'Hộp', CAST(330000.00 AS Decimal(18, 2)), 40, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T014', N'Ginkgo Biloba 120mg', N'NH014', N'Hộp', CAST(150000.00 AS Decimal(18, 2)), 80, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T015', N'Sữa rửa mặt Cetaphil', N'NH015', N'Chai', CAST(120000.00 AS Decimal(18, 2)), 61, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T016', N'Men vi sinh BioGaia', N'NH016', N'Tuýp', CAST(395000.00 AS Decimal(18, 2)), 30, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T017', N'Dung dịch Dạ Hương', N'NH017', N'Chai', CAST(35000.00 AS Decimal(18, 2)), 150, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T018', N'Sâm Alipas', N'NH018', N'Hộp', CAST(720000.00 AS Decimal(18, 2)), 20, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T019', N'Trà thanh nhiệt', N'NH019', N'Gói', CAST(5000.00 AS Decimal(18, 2)), 500, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T020', N'Cồn y tế 70 độ', N'NH020', N'Chai', CAST(10000.00 AS Decimal(18, 2)), 0, N'/uploads/drugs/amoxicillin-500mg-brawn-h-100v-2-1.jpg', 0)
GO
INSERT [dbo].[Drugs] ([MaThuoc], [TenThuoc], [MaNhom], [DonVi], [GiaBan], [TonKho], [HinhAnh], [IsDeleted]) VALUES (N'T021', N'hi', NULL, N'Tuýp', CAST(4000.00 AS Decimal(18, 2)), 900, N'/uploads/drugs/a6e99d5c-ac87-4e27-86a1-4fe896c066aa.png', 1)
GO
SET IDENTITY_INSERT [dbo].[DrugUnits] ON 
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (2, N'T002', 1, 1, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (3, N'T003', 5, 1, 1, CAST(35000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (4, N'T004', 1, 1, 1, CAST(1500.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (6, N'T006', 4, 1, 1, CAST(75000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (7, N'T007', 1, 1, 1, CAST(2000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (8, N'T008', 5, 1, 1, CAST(45000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (9, N'T009', 2, 1, 1, CAST(95000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (11, N'T011', 7, 1, 1, CAST(55000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (12, N'T012', 4, 1, 1, CAST(45000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (13, N'T013', 2, 1, 1, CAST(330000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (14, N'T014', 2, 1, 1, CAST(150000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (15, N'T015', 4, 1, 1, CAST(120000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (16, N'T016', 5, 1, 1, CAST(395000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (17, N'T017', 4, 1, 1, CAST(35000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (18, N'T018', 2, 1, 1, CAST(720000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (19, N'T019', 8, 1, 1, CAST(5000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (20, N'T020', 4, 1, 1, CAST(10000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (21, N'T005', 1, 1, 1, CAST(3000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (22, N'T005', 17, 0, 10, CAST(20000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (23, N'T021', 5, 1, 1, CAST(4000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (24, N'T021', 18, 0, 99, CAST(999.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (27, N'T010', 2, 1, 1, CAST(20000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (28, N'T010', 19, 0, 555, CAST(55555.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (33, N'T001', 18, 1, 1, CAST(2500.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (34, N'T001', 20, 0, 6, CAST(55555.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[DrugUnits] ([Id], [MaThuoc], [UnitId], [IsBaseUnit], [ConversionRate], [Price], [Note]) VALUES (35, N'T001', 16, 0, 5, CAST(20000.00 AS Decimal(18, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[DrugUnits] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceDetails] ON 
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (1, N'HD001', N'T001', 10, CAST(2500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (2, N'HD002', N'T002', 20, CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (3, N'HD003', N'T006', 2, CAST(75000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (4, N'HD004', N'T003', 1, CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (5, N'HD004', N'T010', 2, CAST(20000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (6, N'HD005', N'T008', 2, CAST(45000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (7, N'HD006', N'T005', 10, CAST(3000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (8, N'HD007', N'T009', 2, CAST(95000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (9, N'HD007', N'T007', 5, CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (10, N'HD008', N'T004', 10, CAST(1500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (11, N'HD011', N'T011', 1, CAST(55000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (12, N'HD012', N'T012', 1, CAST(45000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (13, N'HD013', N'T013', 1, CAST(330000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (14, N'HD014', N'T014', 1, CAST(150000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (15, N'HD015', N'T015', 1, CAST(120000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (16, N'HD016', N'T016', 1, CAST(395000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (17, N'HD017', N'T017', 1, CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (18, N'HD018', N'T018', 1, CAST(720000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (19, N'HD019', N'T019', 10, CAST(5000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (20, N'HD020', N'T020', 2, CAST(10000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (21, N'HD-20260401', N'T001', 20, CAST(2500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (22, N'HD-20260402', N'T003', 2, CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (23, N'HD-20260402', N'T010', 4, CAST(20000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (24, N'HD-20260403', N'T014', 1, CAST(150000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (25, N'HD-20260403', N'T020', 6, CAST(10000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (26, N'HD-20260404-1', N'T006', 1, CAST(75000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (27, N'HD-20260404-2', N'T017', 10, CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (28, N'HD-20260405-1', N'T008', 1, CAST(45000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (29, N'HD-20260405-2', N'T002', 40, CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (30, N'HD-20260405-3', N'T015', 1, CAST(120000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (31, N'HD-20260406-1', N'T013', 1, CAST(330000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (32, N'HD-20260406-2', N'T001', 10, CAST(2500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (33, N'HD20260407141359', N'T002', 1, CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (34, N'HD20260407141419', N'T003', 1, CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (35, N'HD20260407142151', N'T003', 3, CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (36, N'HD20260407155716', N'T002', 1, CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (37, N'HD20260408132438', N'T003', 1, CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (38, N'HD20260408132438', N'T004', 1, CAST(1500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (39, N'HD20260408133935', N'T003', 4, CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (40, N'HD20260408134323', N'T003', 34, CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[InvoiceDetails] ([ID], [MaHD], [MaThuoc], [SoLuong], [DonGia]) VALUES (41, N'HD20260408140448', N'T003', 14, CAST(35000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[InvoiceDetails] OFF
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD001', CAST(N'2026-03-01T00:00:00.000' AS DateTime), N'NV001', NULL, N'KH001', CAST(25000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD002', CAST(N'2026-03-02T00:00:00.000' AS DateTime), N'NV002', NULL, N'KH002', CAST(40000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(40000.00 AS Decimal(18, 2)), NULL, NULL, N'Chuyển khoản')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD003', CAST(N'2026-03-03T00:00:00.000' AS DateTime), N'NV003', NULL, N'KH003', CAST(150000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(150000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD004', CAST(N'2026-03-04T00:00:00.000' AS DateTime), N'NV004', NULL, N'KH004', CAST(75000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(75000.00 AS Decimal(18, 2)), NULL, NULL, N'Quẹt thẻ')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD005', CAST(N'2026-03-05T00:00:00.000' AS DateTime), N'NV005', NULL, N'KH005', CAST(90000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(90000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD006', CAST(N'2026-03-06T00:00:00.000' AS DateTime), N'NV006', NULL, N'KH006', CAST(30000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), NULL, NULL, N'Chuyển khoản')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD007', CAST(N'2026-03-07T00:00:00.000' AS DateTime), N'NV007', NULL, N'KH007', CAST(200000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(200000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD008', CAST(N'2026-03-08T00:00:00.000' AS DateTime), N'NV008', NULL, N'KH008', CAST(15000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD009', CAST(N'2026-03-09T00:00:00.000' AS DateTime), N'NV009', NULL, N'KH009', CAST(50000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), NULL, NULL, N'Chuyển khoản')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD010', CAST(N'2026-03-10T00:00:00.000' AS DateTime), N'NV010', NULL, N'KH010', CAST(60000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(60000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD011', CAST(N'2026-03-11T00:00:00.000' AS DateTime), N'NV011', NULL, N'KH011', CAST(55000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(55000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD012', CAST(N'2026-03-12T00:00:00.000' AS DateTime), N'NV012', NULL, N'KH012', CAST(45000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(45000.00 AS Decimal(18, 2)), NULL, NULL, N'Chuyển khoản')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD013', CAST(N'2026-03-13T00:00:00.000' AS DateTime), N'NV013', NULL, N'KH013', CAST(330000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(330000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD014', CAST(N'2026-03-14T00:00:00.000' AS DateTime), N'NV014', NULL, N'KH014', CAST(150000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(150000.00 AS Decimal(18, 2)), NULL, NULL, N'Quẹt thẻ')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD015', CAST(N'2026-03-15T00:00:00.000' AS DateTime), N'NV015', NULL, N'KH015', CAST(120000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(120000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD016', CAST(N'2026-03-16T00:00:00.000' AS DateTime), N'NV016', NULL, N'KH016', CAST(395000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(395000.00 AS Decimal(18, 2)), NULL, NULL, N'Chuyển khoản')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD017', CAST(N'2026-03-17T00:00:00.000' AS DateTime), N'NV017', NULL, N'KH017', CAST(35000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(35000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD018', CAST(N'2026-03-18T00:00:00.000' AS DateTime), N'NV018', NULL, N'KH018', CAST(720000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(720000.00 AS Decimal(18, 2)), NULL, NULL, N'Chuyển khoản')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD019', CAST(N'2026-03-19T00:00:00.000' AS DateTime), N'NV019', NULL, N'KH019', CAST(50000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD020', CAST(N'2026-03-20T00:00:00.000' AS DateTime), N'NV020', NULL, N'KH020', CAST(20000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD-20260401', CAST(N'2026-04-01T08:30:00.000' AS DateTime), N'NV001', NULL, N'KH001', CAST(50000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD-20260402', CAST(N'2026-04-02T10:15:00.000' AS DateTime), N'NV002', NULL, N'KH003', CAST(150000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(150000.00 AS Decimal(18, 2)), NULL, NULL, N'Chuyển khoản')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD-20260403', CAST(N'2026-04-03T14:45:00.000' AS DateTime), N'NV001', NULL, N'KH005', CAST(210000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(210000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD-20260404-1', CAST(N'2026-04-04T09:20:00.000' AS DateTime), N'NV003', NULL, N'KH002', CAST(75000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(75000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD-20260404-2', CAST(N'2026-04-04T16:10:00.000' AS DateTime), N'NV001', NULL, N'KH001', CAST(350000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(350000.00 AS Decimal(18, 2)), NULL, NULL, N'Quẹt thẻ')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD-20260405-1', CAST(N'2026-04-05T07:45:00.000' AS DateTime), N'NV004', NULL, N'KH008', CAST(45000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(45000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD-20260405-2', CAST(N'2026-04-05T11:30:00.000' AS DateTime), N'NV002', NULL, N'KH010', CAST(80000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(80000.00 AS Decimal(18, 2)), NULL, NULL, N'Chuyển khoản')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD-20260405-3', CAST(N'2026-04-05T19:20:00.000' AS DateTime), N'NV001', NULL, N'KH001', CAST(120000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(120000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD-20260406-1', CAST(N'2026-04-06T08:05:00.000' AS DateTime), N'NV005', NULL, N'KH015', CAST(330000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(330000.00 AS Decimal(18, 2)), NULL, NULL, N'Chuyển khoản')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD-20260406-2', CAST(N'2026-04-06T13:40:00.000' AS DateTime), N'NV001', NULL, N'KH001', CAST(25000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), NULL, NULL, N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD20260407141359', CAST(N'2026-04-07T14:13:59.910' AS DateTime), NULL, NULL, NULL, CAST(2200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD20260407141419', CAST(N'2026-04-07T14:14:19.683' AS DateTime), NULL, NULL, NULL, CAST(38500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(3500.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD20260407142151', CAST(N'2026-04-07T14:21:51.087' AS DateTime), NULL, NULL, NULL, CAST(115500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(10500.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD20260407155716', CAST(N'2026-04-07T15:57:16.263' AS DateTime), NULL, NULL, NULL, CAST(2200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD20260408132438', CAST(N'2026-04-08T13:24:38.060' AS DateTime), NULL, NULL, NULL, CAST(40150.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(3650.00 AS Decimal(18, 2)), NULL, CAST(42000.00 AS Decimal(18, 2)), CAST(1850.00 AS Decimal(18, 2)), N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD20260408133935', CAST(N'2026-04-08T13:39:35.127' AS DateTime), NULL, NULL, NULL, CAST(154000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(14000.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD20260408134323', CAST(N'2026-04-08T13:43:23.713' AS DateTime), NULL, NULL, NULL, CAST(1309000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(119000.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Tiền mặt')
GO
INSERT [dbo].[Invoices] ([MaHD], [NgayLap], [MaNV], [KhachHang], [MaKH], [TongTien], [GiamGia], [ThueVAT], [KhachCanTra], [KhachThanhToan], [TienThua], [PhuongThucTT]) VALUES (N'HD20260408140448', CAST(N'2026-04-08T14:04:48.623' AS DateTime), NULL, NULL, NULL, CAST(539000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(49000.00 AS Decimal(18, 2)), NULL, CAST(4000000.00 AS Decimal(18, 2)), CAST(3461000.00 AS Decimal(18, 2)), N'Tiền mặt')
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetails] ON 
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (1, N'PN001', N'T001', N'LO-01', 1000, CAST(1500.00 AS Decimal(18, 2)), CAST(1500000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (2, N'PN002', N'T002', N'LO-02', 500, CAST(1200.00 AS Decimal(18, 2)), CAST(600000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (3, N'PN003', N'T003', N'LO-03', 100, CAST(25000.00 AS Decimal(18, 2)), CAST(2500000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (4, N'PN004', N'T004', N'LO-04', 300, CAST(1000.00 AS Decimal(18, 2)), CAST(300000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (5, N'PN005', N'T005', N'LO-05', 600, CAST(2000.00 AS Decimal(18, 2)), CAST(1200000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (6, N'PN006', N'T006', N'LO-06', 50, CAST(50000.00 AS Decimal(18, 2)), CAST(2500000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (7, N'PN007', N'T007', N'LO-07', 400, CAST(1200.00 AS Decimal(18, 2)), CAST(480000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (8, N'PN008', N'T008', N'LO-08', 80, CAST(30000.00 AS Decimal(18, 2)), CAST(2400000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (9, N'PN009', N'T009', N'LO-09', 120, CAST(70000.00 AS Decimal(18, 2)), CAST(8400000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (10, N'PN010', N'T010', N'LO-10', 200, CAST(15000.00 AS Decimal(18, 2)), CAST(3000000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (11, N'PN011', N'T011', N'LO-11', 90, CAST(38000.00 AS Decimal(18, 2)), CAST(3420000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (12, N'PN012', N'T012', N'LO-12', 70, CAST(30000.00 AS Decimal(18, 2)), CAST(2100000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (13, N'PN013', N'T013', N'LO-13', 40, CAST(225000.00 AS Decimal(18, 2)), CAST(9000000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (14, N'PN014', N'T014', N'LO-14', 80, CAST(100000.00 AS Decimal(18, 2)), CAST(8000000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (15, N'PN015', N'T015', N'LO-15', 60, CAST(83000.00 AS Decimal(18, 2)), CAST(4980000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (16, N'PN016', N'T016', N'LO-16', 30, CAST(283000.00 AS Decimal(18, 2)), CAST(8490000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (17, N'PN017', N'T017', N'LO-17', 150, CAST(23000.00 AS Decimal(18, 2)), CAST(3450000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (18, N'PN018', N'T018', N'LO-18', 20, CAST(550000.00 AS Decimal(18, 2)), CAST(11000000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (19, N'PN019', N'T019', N'LO-19', 500, CAST(3000.00 AS Decimal(18, 2)), CAST(1500000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseOrderDetails] ([ID], [MaPN], [MaThuoc], [MaLo], [SoLuongNhap], [DonGiaNhap], [ThanhTien]) VALUES (27, N'PN2604001', N'T015', N'LO260407154104', 1, CAST(8000.00 AS Decimal(18, 2)), CAST(8000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetails] OFF
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN001', CAST(N'2025-01-10T00:00:00.000' AS DateTime), N'NV001', N'NCC001', CAST(1500000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN002', CAST(N'2025-01-15T00:00:00.000' AS DateTime), N'NV002', N'NCC002', CAST(600000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN003', CAST(N'2025-01-20T00:00:00.000' AS DateTime), N'NV003', N'NCC003', CAST(2500000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN004', CAST(N'2025-01-25T00:00:00.000' AS DateTime), N'NV004', N'NCC004', CAST(300000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN005', CAST(N'2025-02-01T00:00:00.000' AS DateTime), N'NV005', N'NCC005', CAST(1200000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN006', CAST(N'2025-02-05T00:00:00.000' AS DateTime), N'NV006', N'NCC006', CAST(2500000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN007', CAST(N'2025-02-10T00:00:00.000' AS DateTime), N'NV007', N'NCC007', CAST(480000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN008', CAST(N'2025-02-15T00:00:00.000' AS DateTime), N'NV008', N'NCC008', CAST(2400000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN009', CAST(N'2025-02-20T00:00:00.000' AS DateTime), N'NV009', N'NCC009', CAST(8400000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN010', CAST(N'2025-02-25T00:00:00.000' AS DateTime), N'NV010', N'NCC010', CAST(3000000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN011', CAST(N'2025-03-01T00:00:00.000' AS DateTime), N'NV011', N'NCC011', CAST(3500000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN012', CAST(N'2025-03-05T00:00:00.000' AS DateTime), N'NV012', N'NCC012', CAST(2100000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN013', CAST(N'2025-03-10T00:00:00.000' AS DateTime), N'NV013', N'NCC013', CAST(9000000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN014', CAST(N'2025-03-15T00:00:00.000' AS DateTime), N'NV014', N'NCC014', CAST(8000000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN015', CAST(N'2025-03-20T00:00:00.000' AS DateTime), N'NV015', N'NCC015', CAST(5000000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN016', CAST(N'2025-03-25T00:00:00.000' AS DateTime), N'NV016', N'NCC016', CAST(8500000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN017', CAST(N'2025-04-01T00:00:00.000' AS DateTime), N'NV017', N'NCC017', CAST(3500000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN018', CAST(N'2025-04-05T00:00:00.000' AS DateTime), N'NV018', N'NCC018', CAST(11000000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN019', CAST(N'2025-04-10T00:00:00.000' AS DateTime), N'NV019', N'NCC019', CAST(1500000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[PurchaseOrders] ([MaPN], [NgayNhap], [MaNV], [MaNCC], [TongTienNhap], [GhiChu]) VALUES (N'PN2604001', CAST(N'2026-04-07T15:41:00.000' AS DateTime), N'NV001', N'NCC004', CAST(8000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV001', N'Nguyễn Phi Hùng', N'admin', N'123', N'Admin')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV002', N'Nguyễn Thị Mai', N'mai_nt', N'123', N'Nhân viên bán hàng')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV003', N'Lê Văn Tám', N'tam_lv', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV004', N'Phạm Thu Hà', N'ha_pt', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV005', N'Hoàng Ngọc Điệp', N'diep_hn', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV006', N'Vũ Đức Quyết', N'quyet_vd', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV007', N'Bùi Thanh Trúc', N'truc_bt', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV008', N'Đặng Phương Nam', N'nam_dp', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV009', N'Đỗ Thị Yến', N'yen_dt', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV010', N'Ngô Bá Khá', N'kha_nb', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV011', N'Trần Văn Long', N'long_tv', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV012', N'Lý Hải Anh', N'anh_lh', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV013', N'Tạ Quang Bửu', N'buu_tq', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV014', N'Phan Đình Phùng', N'phung_pd', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV015', N'Trịnh Công Sơn', N'son_tc', N'123', N'Quản lý kho')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV016', N'Lương Bích Hữu', N'huu_lb', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV017', N'Võ Tòng', N'tong_v', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV018', N'Châu Tinh Trì', N'tri_ct', N'123', N'Staff')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV019', N'Lưu Đức Hoa', N'hoa_ld', N'123', N'Quản lý kho')
GO
INSERT [dbo].[Staffs] ([MaNV], [HoTen], [TaiKhoan], [MatKhau], [Quyen]) VALUES (N'NV020', N'Cổ Thiên Lạc', N'lac_ct', N'123', N'Nhân viên bán hàng')
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC001', N'Dược Hậu Giang', N'0292111111', N'Cần Thơ', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC002', N'Traphaco', N'0242222222', N'Hà Nội', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC003', N'Domesco', N'0277333333', N'Đồng Tháp', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC004', N'Imexpharm', N'0277444444', N'Đồng Tháp', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC005', N'Sao Thái Dương', N'0245555555', N'Hà Nội', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC006', N'Sanofi Việt Nam', N'0286666666', N'TP.HCM', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC007', N'Pymepharco', N'0257777777', N'Phú Yên', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC008', N'Mekophar', N'0288888888', N'TP.HCM', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC009', N'OPV', N'0289999999', N'Đồng Nai', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC010', N'Rohto Mentholatum', N'0274112233', N'Bình Dương', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC011', N'Mega We Care', N'0281122334', N'TP.HCM', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC012', N'Bayer Việt Nam', N'0282233445', N'Đồng Nai', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC013', N'Pharmedic', N'0283344556', N'TP.HCM', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC014', N'Nam Dược', N'0244455667', N'Nam Định', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC015', N'Dược phẩm Trung ương 1', N'0245566778', N'Hà Nội', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC016', N'Dược phẩm Trung ương 3', N'0225667788', N'Hải Phòng', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC017', N'Novartis Việt Nam', N'0287788990', N'TP.HCM', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC018', N'GSK Pharma', N'0288899001', N'Bình Dương', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC019', N'Dược Hà Tây', N'0249900112', N'Hà Tây', NULL)
GO
INSERT [dbo].[Suppliers] ([MaNCC], [TenNCC], [SoDienThoai], [DiaChi], [Email]) VALUES (N'NCC020', N'CVI Pharma', N'0241011223', N'Hòa Lạc', NULL)
GO
SET IDENTITY_INSERT [dbo].[Units] ON 
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (1, N'Viên', N'Đơn vị lẻ', N'ggggg', 1, 1, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (2, N'Hộp', N'Đóng gói lớn', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (3, N'Vỉ', N'10 viên/vỉ', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (4, N'Chai', N'Dung dịch', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (5, N'Tuýp', N'Kem bôi', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (6, N'Ống', N'Tiêm/Uống', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (7, N'Lọ', N'Bột/Nước', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (8, N'Gói', N'Cốm/Bột', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (9, N'Túi', N'Chứa dịch', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (10, N'Miếng', N'Dán/Đắp', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (11, N'Bịch', N'Khẩu trang', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (12, N'Cuộn', N'Băng rốn/Băng keo', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (13, N'Bơm', N'Tiêm', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (14, N'Cặp', N'Dầu gội/Xả', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (15, N'Bộ', N'Thiết bị', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (16, N'Thùng', N'Đóng gói sỉ', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (17, N'Gam', N'Cân nặng', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (18, N'Kg', N'Kilogram', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (19, N'Mililit', N'ml', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (20, N'Lít', N'Thể tích lớn', NULL, 1, 0, CAST(N'2026-04-06T20:24:59.507' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (21, N'tet', N'd', N'd', 0, 1, CAST(N'2026-04-07T10:16:10.020' AS DateTime))
GO
INSERT [dbo].[Units] ([Id], [Name], [ShortName], [Description], [Status], [IsDeleted], [CreatedAt]) VALUES (22, N'ee', N'Đơn vị lẻ', N'ê', 1, 1, CAST(N'2026-04-07T15:33:17.323' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__0389B7BD01868AFD]    Script Date: 4/9/2026 11:30:46 AM ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[SoDienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staffs__D5B8C7F0DD3B74FD]    Script Date: 4/9/2026 11:30:46 AM ******/
ALTER TABLE [dbo].[Staffs] ADD UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batches] ADD  DEFAULT ((0)) FOR [SoLuongTon]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ((0)) FOR [DiemTichLuy]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [TonKho]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DrugUnits] ADD  DEFAULT ((0)) FOR [IsBaseUnit]
GO
ALTER TABLE [dbo].[DrugUnits] ADD  DEFAULT ((1)) FOR [ConversionRate]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ((0)) FOR [ThueVAT]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (N'Tiền mặt') FOR [PhuongThucTT]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  DEFAULT ((0)) FOR [TongTienNhap]
GO
ALTER TABLE [dbo].[Units] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Units] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Units] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Batches]  WITH CHECK ADD FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Drugs] ([MaThuoc])
GO
ALTER TABLE [dbo].[Drugs]  WITH CHECK ADD FOREIGN KEY([MaNhom])
REFERENCES [dbo].[Categories] ([MaNhom])
GO
ALTER TABLE [dbo].[DrugUnits]  WITH CHECK ADD FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Drugs] ([MaThuoc])
GO
ALTER TABLE [dbo].[DrugUnits]  WITH CHECK ADD FOREIGN KEY([UnitId])
REFERENCES [dbo].[Units] ([Id])
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Drugs] ([MaThuoc])
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[Invoices] ([MaHD])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[Customers] ([MaKH])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[Staffs] ([MaNV])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Drugs] ([MaThuoc])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD FOREIGN KEY([MaPN])
REFERENCES [dbo].[PurchaseOrders] ([MaPN])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD FOREIGN KEY([MaLo], [MaThuoc])
REFERENCES [dbo].[Batches] ([MaLo], [MaThuoc])
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[Suppliers] ([MaNCC])
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[Staffs] ([MaNV])
GO
