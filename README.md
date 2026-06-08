# 💊 PharmaCare - Pharmacy Management System

**PharmaCare** là hệ thống quản lý hiệu thuốc được xây dựng bằng **ASP.NET Core MVC**, hỗ trợ quản lý thuốc, danh mục, tài khoản người dùng, phân quyền, tin tức sức khỏe và các chức năng quản trị cơ bản cho nhà thuốc.

Dự án được phát triển nhằm ứng dụng kiến thức về **lập trình web**, **mô hình MVC**, **Entity Framework Core**, **SQL Server** và thiết kế giao diện quản trị responsive.

---

## 🚀 Tính năng nổi bật

* 🔐 **Quản lý tài khoản & phân quyền**

  * Quản lý tài khoản người dùng.
  * Phân quyền theo vai trò như quản trị viên và nhân viên.
  * Kiểm soát quyền truy cập vào các chức năng quản trị.

* 📦 **Quản lý thuốc / sản phẩm**

  * Thêm, sửa, xóa và xem chi tiết thông tin thuốc.
  * Quản lý tên thuốc, mô tả, giá bán, hình ảnh và danh mục.
  * Hỗ trợ hiển thị danh sách thuốc trong giao diện quản trị.

* 🗂️ **Quản lý danh mục thuốc**

  * Tạo và quản lý các nhóm danh mục thuốc.
  * Phân loại thuốc theo từng danh mục cụ thể.

* 📰 **Quản lý tin tức sức khỏe**

  * Thêm, sửa, xóa bài viết.
  * Quản lý nội dung truyền thông, tin tức và thông tin sức khỏe.

* 🛒 **Quản lý giao dịch / bán hàng**

  * Hỗ trợ xây dựng nền tảng cho chức năng bán hàng tại nhà thuốc.
  * Quản lý dữ liệu phục vụ cho quy trình bán thuốc và vận hành.

* 📱 **Giao diện responsive**

  * Giao diện quản trị thân thiện.
  * Tương thích với máy tính và máy tính bảng.
  * Sử dụng Bootstrap, CSS và jQuery để tối ưu trải nghiệm người dùng.

---

## 🛠️ Công nghệ sử dụng

| Thành phần       | Công nghệ                      |
| ---------------- | ------------------------------ |
| Backend          | ASP.NET Core MVC, C#           |
| Database         | Microsoft SQL Server           |
| ORM              | Entity Framework Core          |
| Frontend         | HTML5, CSS3, Bootstrap, jQuery |
| Kiến trúc        | Model - View - Controller      |
| IDE              | Visual Studio 2022             |
| Quản lý mã nguồn | Git, GitHub                    |

---

## 📁 Cấu trúc thư mục dự án

```bash
PharmaCare/
│
├── Controllers/              # Xử lý logic điều hướng và nghiệp vụ
├── Models/                   # Chứa các model ánh xạ dữ liệu
├── Views/                    # Giao diện Razor View
├── ViewComponents/           # Các thành phần giao diện tái sử dụng
├── Helpers/                  # Các hàm hỗ trợ
├── wwwroot/                  # Chứa CSS, JS, hình ảnh và thư viện frontend
├── Properties/               # Cấu hình launch settings
│
├── Program.cs                # Cấu hình khởi chạy ứng dụng
├── appsettings.json          # Cấu hình kết nối database
├── appsettings.Development.json
├── PharmacyCare.sql          # Script khởi tạo cơ sở dữ liệu
├── PharmaCare.csproj         # File cấu hình project
└── PharmaCare.sln            # File solution mở bằng Visual Studio
```

---

## ⚙️ Hướng dẫn cài đặt và chạy dự án

### 1. Yêu cầu hệ thống

Trước khi chạy dự án, cần cài đặt:

* **Visual Studio 2022** hoặc phiên bản mới hơn.
* Workload: **ASP.NET and web development**.
* **Microsoft SQL Server**.
* **SQL Server Management Studio (SSMS)**.
* **.NET SDK** phù hợp với phiên bản project.
* Git nếu muốn clone source code từ GitHub.

---

### 2. Clone dự án

Mở Terminal, Git Bash hoặc Command Prompt và chạy lệnh:

```bash
git clone https://github.com/your-username/pharmacare-pharmacy-management.git
```

Sau đó truy cập vào thư mục dự án:

```bash
cd pharmacare-pharmacy-management
```

> Lưu ý: Thay `your-username` bằng tên tài khoản GitHub của bạn.

---

### 3. Khởi tạo cơ sở dữ liệu

Mở **SQL Server Management Studio (SSMS)**.

Sau đó thực hiện các bước:

1. Kết nối tới SQL Server trên máy.
2. Mở file:

```bash
PharmacyCare.sql
```

3. Bấm **Execute** để chạy script.
4. Kiểm tra database và các bảng đã được tạo thành công.

---

### 4. Cấu hình chuỗi kết nối database

Mở file:

```bash
appsettings.json
```

Kiểm tra và chỉnh lại phần `ConnectionStrings` cho phù hợp với SQL Server trên máy của bạn.

Ví dụ:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Database=MyAdminDB;User ID=sa;Password=123456;TrustServerCertificate=True"
  }
}
```

Nếu bạn dùng Windows Authentication, có thể chỉnh thành:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Database=MyAdminDB;Trusted_Connection=True;TrustServerCertificate=True"
  }
}
```

---

### 5. Mở dự án bằng Visual Studio

Mở file:

```bash
PharmaCare.sln
```

bằng **Visual Studio 2022**.

Sau đó:

1. Chờ Visual Studio khôi phục các gói NuGet.
2. Bấm **Ctrl + Shift + B** để build project.
3. Nếu build thành công, bấm **F5** hoặc nút **Run** để chạy ứng dụng.

---

## ▶️ Cách chạy bằng .NET CLI

Ngoài Visual Studio, bạn có thể chạy bằng Terminal:

```bash
dotnet restore
dotnet build
dotnet run
```

Sau khi chạy thành công, mở trình duyệt và truy cập URL được hiển thị trong Terminal, ví dụ:

```bash
https://localhost:5001
```

hoặc:

```bash
http://localhost:5000
```

---

## 🧩 Các chức năng chính

### Quản lý tài khoản

* Thêm tài khoản người dùng.
* Cập nhật thông tin tài khoản.
* Xóa tài khoản.
* Phân quyền người dùng theo vai trò.
* Quản lý quyền truy cập vào trang quản trị.

### Quản lý thuốc

* Thêm thuốc mới.
* Cập nhật thông tin thuốc.
* Xóa thuốc.
* Xem danh sách thuốc.
* Hiển thị chi tiết thuốc.
* Phân loại thuốc theo danh mục.

### Quản lý danh mục

* Thêm danh mục thuốc.
* Sửa danh mục.
* Xóa danh mục.
* Hiển thị danh sách danh mục.

### Quản lý tin tức

* Thêm bài viết tin tức.
* Sửa nội dung bài viết.
* Xóa bài viết.
* Hiển thị danh sách tin tức sức khỏe.

### Giao diện quản trị

* Dashboard quản trị.
* Thanh điều hướng.
* Bảng dữ liệu.
* Form nhập liệu.
* Giao diện responsive bằng Bootstrap.

---

## 🗄️ Cơ sở dữ liệu

Dự án sử dụng **Microsoft SQL Server** để lưu trữ dữ liệu.

Một số nhóm bảng chính:

* Bảng tài khoản người dùng.
* Bảng vai trò / phân quyền.
* Bảng thuốc / sản phẩm.
* Bảng danh mục thuốc.
* Bảng tin tức.
* Các bảng liên quan đến dữ liệu quản trị.

File khởi tạo database:

```bash
PharmacyCare.sql
```

---

## 📌 Mục tiêu dự án

Dự án được xây dựng nhằm:

* Ứng dụng mô hình **ASP.NET Core MVC** vào phát triển website quản lý.
* Thực hành thiết kế và kết nối cơ sở dữ liệu với **SQL Server**.
* Sử dụng **Entity Framework Core** để thao tác dữ liệu.
* Xây dựng giao diện quản trị thân thiện và dễ sử dụng.
* Rèn luyện quy trình phát triển phần mềm từ phân tích, thiết kế đến triển khai chức năng.

---

## 👨‍💻 Vai trò phát triển

Trong dự án này, người phát triển thực hiện các công việc:

* Phân tích yêu cầu hệ thống quản lý hiệu thuốc.
* Thiết kế cơ sở dữ liệu SQL Server.
* Xây dựng project theo mô hình ASP.NET Core MVC.
* Tạo Controller, Model và View cho các module quản lý.
* Xây dựng chức năng CRUD cho thuốc, danh mục, tài khoản và tin tức.
* Kết nối dữ liệu bằng Entity Framework Core.
* Thiết kế giao diện quản trị bằng Bootstrap, HTML, CSS và jQuery.
* Kiểm thử chức năng và xử lý lỗi trong quá trình chạy dự án.

---

## 📷 Hình ảnh giao diện

> Có thể bổ sung hình ảnh giao diện dự án tại đây.

```md
![Dashboard](./wwwroot/images/dashboard.png)
![Medicine Management](./wwwroot/images/medicine-management.png)
![News Management](./wwwroot/images/news-management.png)
```

---

## 🔮 Hướng phát triển trong tương lai

* Hoàn thiện chức năng bán hàng tại quầy.
* Thêm quản lý hóa đơn và chi tiết hóa đơn.
* Thêm thống kê doanh thu.
* Thêm quản lý nhập kho và tồn kho.
* Thêm chức năng tìm kiếm thuốc nâng cao.
* Thêm xuất báo cáo PDF hoặc Excel.
* Cải thiện giao diện dashboard quản trị.
* Phân quyền chi tiết hơn theo từng chức năng.

---

## 📚 Kiến thức áp dụng

* ASP.NET Core MVC.
* Entity Framework Core.
* SQL Server.
* Razor View.
* CRUD operations.
* Role-based authorization.
* Responsive web design.
* Bootstrap layout.
* Git và GitHub.

---

## 📄 Ghi chú

Dự án được xây dựng phục vụ mục đích học tập, thực hành lập trình web và làm sản phẩm portfolio cá nhân.

---

## 👤 Tác giả

**Hùng Nguyễn**
GitHub: [@PhiHung112-id](https://github.com/PhiHung112-id)

---

## 📜 License

This project is for educational purposes.
