# 💊 PharmaCare - Pharmacy Management System

> **Hệ thống Quản lý Hiệu thuốc toàn diện** được xây dựng nhằm mục đích số hóa quy trình bán hàng, quản lý kho thuốc và quản lý nhân sự cho các nhà thuốc hiện đại.

Dự án này được phát triển để ứng dụng các kiến thức thực tế về quy trình thiết kế, phân tích cơ sở dữ liệu và lập trình web với ASP.NET Core MVC.

## 🚀 Tính năng nổi bật

* **🔐 Quản lý Tài khoản & Phân quyền:** Tạo tài khoản, phân quyền động theo nhóm (Quản trị viên, Nhân viên bán hàng,...).
* **📦 Quản lý Sản phẩm/Thuốc:** Thêm, sửa, xóa thông tin chi tiết của từng loại thuốc, phân loại theo danh mục.
* **📰 Quản lý Tin tức & Truyền thông:** Đăng tải bài viết, hình ảnh, video hướng dẫn sức khỏe.
* **🛒 Quản lý Giao dịch (POS):** (Đang phát triển) Hỗ trợ tạo đơn hàng và thanh toán nhanh chóng.
* **📱 Giao diện Responsive:** Giao diện quản trị thân thiện, tương thích trên cả máy tính và máy tính bảng.

## 🛠️ Công nghệ sử dụng

* **Backend:** C#, ASP.NET Core MVC 
* **Cơ sở dữ liệu:** Microsoft SQL Server
* **ORM:** Entity Framework Core
* **Frontend:** HTML5, CSS3, Bootstrap, jQuery, FontAwesome
* **Kiến trúc:** Model-View-Controller (MVC)

## ⚙️ Hướng dẫn cài đặt và chạy dự án (Dành cho Nhà tuyển dụng/Giảng viên)

Để chạy thử dự án này trên máy cá nhân, vui lòng thực hiện theo các bước sau:

### 1. Yêu cầu hệ thống
* Đã cài đặt **Visual Studio 2022** (hoặc mới hơn) với workload *ASP.NET and web development*.
* Đã cài đặt **Microsoft SQL Server** & **SQL Server Management Studio (SSMS)**.

### 2. Triển khai Cơ sở dữ liệu
1. Mở SQL Server Management Studio (SSMS).
2. Tạo một Database trống (hoặc để script tự tạo tùy theo thiết lập).
3. Mở file **`PharmacyCare.sql`** (đã đính kèm trong thư mục gốc) và bấm **Execute** để khởi tạo toàn bộ bảng và dữ liệu mẫu.

### 3. Cấu hình dự án
1. Clone dự án về máy:
   ```bash
   git clone [https://github.com/TenTaiKhoanCuaBan/PharmaCare.git](https://github.com/TenTaiKhoanCuaBan/PharmaCare.git)

2. Mở file PharmaCare.sln bằng Visual Studio.

3. Mở file appsettings.json và kiểm tra lại ConnectionStrings. Cập nhật User ID và Password sao cho khớp với tài khoản SQL Server trên máy của bạn (Mặc định đang sử dụng sa và 123456).

JSON
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost;Database=MyAdminDB;User ID=sa;Password=123456;TrustServerCertificate=True"
}
4. Bấm Ctrl + Shift + B để Build dự án và khôi phục các gói NuGet.

