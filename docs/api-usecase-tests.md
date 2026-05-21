# TravelERP API Test Thủ Công Theo Use-Case

Tài liệu này dùng để test API thủ công bằng Postman.

## Cấu hình chung

Base URL:

```text
http://localhost:8080
```

Header cho request có đăng nhập:

```http
Authorization: Bearer <accessToken>
Content-Type: application/json
```

Response chuẩn của backend:

```json
{
  "status": 200,
  "success": true,
  "message": "Thành công",
  "data": {},
  "error": null
}
```

Tài khoản seed, mật khẩu mặc định là `password`:

| Vai trò | Username |
|---|---|
| ADMIN | `admin` |
| SANPHAM | `sanpham01` |
| DIEUHANH | `manager01` |
| KINHDOANH | `sales01` |
| KETOAN | `ketoan01` |
| HDV | `hdv01` |
| KHACHHANG | `khachhang04` |

Mã dữ liệu seed hay dùng:

| Loại | Mã mẫu |
|---|---|
| Tour mẫu | `TM001` |
| Lịch trình | `LT001_N1` |
| Tour thực tế mở bán | `TTT001` |
| Tour vận hành/kết thúc | `TTT099` |
| Dịch vụ thêm | `DV002` |
| Hành động xanh | `HDX001` |
| Đơn chờ xác nhận | `DDT004` |
| Đơn đã xác nhận | `DDT001` |
| Khách hàng | `KH001` |
| HDV | `NV_HDV01` |
| Phân công | `PCT001` |
| Sự cố | `NKSC001` |
| Chi phí chờ duyệt | `CPTT005` |
| Quyết toán | `QT001` |
| Giao dịch hoàn | `GD_HOA01` |
| Voucher | `VC001` |
| Yêu cầu hỗ trợ | `YCHT004` |
| Yêu cầu hủy | `YCHT005` |

## UC00 - Xác Thực

### Đăng nhập

```http
POST http://localhost:8080/api/auth/dang-nhap
```

Body mẫu:

```json
{
  "tenDangNhap": "admin",
  "matKhau": "password"
}
```

Output mong muốn:

```json
{
  "status": 200,
  "success": true,
  "message": "Dang nhap thanh cong",
  "data": {
    "accessToken": "<jwt_token>",
    "tokenType": "Bearer",
    "maVaiTro": "ADMIN",
    "tenHienThi": "...",
    "hoTen": "..."
  }
}
```

### Đăng ký khách hàng

```http
POST http://localhost:8080/api/auth/dang-ky
```

Body mẫu:

```json
{
  "tenDangNhap": "khachtest01",
  "matKhau": "password",
  "xacNhanMatKhau": "password",
  "hoTen": "Khach Test 01",
  "email": "khachtest01@example.com",
  "cccd": "099999999999",
  "soDienThoai": "0909999999"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.accessToken` có JWT.

### Quên mật khẩu

```http
POST http://localhost:8080/api/auth/quen-mat-khau
```

Body mẫu:

```json
{
  "tenDangNhap": "khachhang01"
}
```

Output mong muốn: `200 OK`, `success=true`, `data` là reset token dev/test.

### Đặt lại mật khẩu

```http
POST http://localhost:8080/api/auth/dat-lai-mat-khau
```

Body mẫu:

```json
{
  "resetToken": "PASTE_RESET_TOKEN_HERE",
  "matKhauMoi": "password",
  "xacNhanMatKhau": "password"
}
```

Output mong muốn: `200 OK`, `success=true`, `data=null`.

### Đổi mật khẩu

```http
POST http://localhost:8080/api/auth/doi-mat-khau
```

Header: token của tài khoản đang đăng nhập.

Body mẫu:

```json
{
  "matKhauCu": "password",
  "matKhauMoi": "password",
  "xacNhanMatKhau": "password"
}
```

Output mong muốn: `200 OK`, `success=true`, `message="Doi mat khau thanh cong"`.

## UC02 - Tạo Tour Mẫu

```http
POST http://localhost:8080/api/san-pham/tour-mau
```

Header: token `SANPHAM`.

Body mẫu:

```json
{
  "tieuDe": "Ninh Binh xanh 2N1D",
  "moTa": "Trang An, Hang Mua, Tam Coc",
  "thoiLuong": 2,
  "giaSan": 1800000,
  "lichTrinh": [
    {
      "ngayThu": 1,
      "hoatDong": "Ha Noi - Trang An",
      "moTa": "Di thuyen tham quan danh thang",
      "thucDon": "Com de"
    }
  ]
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maTourMau` có mã tour mẫu mới.

## UC03 - Sao Chép Tour Mẫu

```http
POST http://localhost:8080/api/san-pham/tour-mau/TM001/sao-chep
```

Header: token `SANPHAM`.

Output mong muốn: `201 Created`, `success=true`, `data.maTourMau` là mã mới.

## UC04 - Cập Nhật Tour Mẫu

```http
PUT http://localhost:8080/api/san-pham/tour-mau/TM001
```

Header: token `SANPHAM`.

Body mẫu:

```json
{
  "tieuDe": "Kham pha Ha Long - Cat Ba 3N2D",
  "moTa": "Cap nhat mo ta tour mau",
  "thoiLuong": 3,
  "giaSan": 3550000
}
```

Output mong muốn: `200 OK`, `success=true`, `message="Cap nhat thanh cong"`.

## UC05 - Xóa Mềm Tour Mẫu

```http
DELETE http://localhost:8080/api/san-pham/tour-mau/TM001
```

Header: token `SANPHAM`.

Output mong muốn: `200 OK`, `success=true`, `data=null`.

## UC06 - Xem Tour Mẫu

### Danh sách tour mẫu

```http
GET http://localhost:8080/api/san-pham/tour-mau?page=0&size=10&tieuDe=Ha%20Long
```

Header: token `SANPHAM`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách tour mẫu.

### Chi tiết tour mẫu

```http
GET http://localhost:8080/api/san-pham/tour-mau/TM001
```

Header: token `SANPHAM`.

Output mong muốn: `200 OK`, `success=true`, `data.maTourMau="TM001"`.

## UC07 - Quản Lý Dịch Vụ Thêm

### Danh sách dịch vụ thêm

```http
GET http://localhost:8080/api/san-pham/dich-vu-them
```

Output mong muốn: `200 OK`, `success=true`, `data` là mảng dịch vụ.

### Chi tiết dịch vụ thêm

```http
GET http://localhost:8080/api/san-pham/dich-vu-them/DV002
```

Output mong muốn: `200 OK`, `success=true`, `data.maDichVuThem="DV002"`.

### Tạo dịch vụ thêm

```http
POST http://localhost:8080/api/san-pham/dich-vu-them
```

Header: token `SANPHAM`.

Body mẫu:

```json
{
  "ten": "Phu thu ghe tre em",
  "donViTinh": "Nguoi",
  "donGia": 120000
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maDichVuThem` có mã mới.

### Cập nhật dịch vụ thêm

```http
PUT http://localhost:8080/api/san-pham/dich-vu-them/DV002
```

Header: token `SANPHAM`.

Body mẫu:

```json
{
  "ten": "Bao hiem du lich",
  "donViTinh": "Nguoi",
  "donGia": 90000
}
```

Output mong muốn: `200 OK`, `success=true`.

### Xóa dịch vụ thêm

```http
DELETE http://localhost:8080/api/san-pham/dich-vu-them/DV002
```

Header: token `SANPHAM`.

Output mong muốn: `200 OK`, `success=true`, `data=null`.

## UC08 - Thêm Lịch Trình Tour Mẫu

```http
POST http://localhost:8080/api/san-pham/tour-mau/TM001/lich-trinh
```

Header: token `SANPHAM`.

Body mẫu:

```json
{
  "ngayThu": 4,
  "hoatDong": "Trai nghiem them tai dia phuong",
  "moTa": "Hoat dong tuy chon cho khach",
  "thucDon": "An trua dia phuong"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maLichTrinhTour` có mã mới.

## UC09 - Sửa/Xóa Lịch Trình Tour Mẫu

### Sửa lịch trình

```http
PUT http://localhost:8080/api/san-pham/tour-mau/TM001/lich-trinh/LT001_N1
```

Header: token `SANPHAM`.

Body mẫu:

```json
{
  "ngayThu": 1,
  "hoatDong": "Ha Noi - Ha Long",
  "moTa": "Cap nhat noi dung lich trinh ngay 1",
  "thucDon": "Hai san"
}
```

Output mong muốn: `200 OK`, `success=true`.

### Xóa lịch trình

```http
DELETE http://localhost:8080/api/san-pham/tour-mau/TM001/lich-trinh/LT001_N1
```

Header: token `SANPHAM`.

Output mong muốn: `200 OK`, `success=true`, `data=null`.

## UC10 - Quản Lý Hành Động Xanh

### Danh sách hành động xanh

```http
GET http://localhost:8080/api/san-pham/hanh-dong-xanh
```

Output mong muốn: `200 OK`, `success=true`, `data` là mảng hành động xanh.

### Chi tiết hành động xanh

```http
GET http://localhost:8080/api/san-pham/hanh-dong-xanh/HDX001
```

Output mong muốn: `200 OK`, `success=true`, `data.maHanhDongXanh="HDX001"`.

### Tạo hành động xanh

```http
POST http://localhost:8080/api/san-pham/hanh-dong-xanh
```

Header: token `SANPHAM`.

Body mẫu:

```json
{
  "tenHanhDong": "Su dung tui vai ca nhan",
  "diemCong": 60
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maHanhDongXanh` có mã mới.

### Cập nhật hành động xanh

```http
PUT http://localhost:8080/api/san-pham/hanh-dong-xanh/HDX001
```

Header: token `SANPHAM`.

Body mẫu:

```json
{
  "tenHanhDong": "Mang binh nuoc tai su dung",
  "diemCong": 50
}
```

Output mong muốn: `200 OK`, `success=true`.

### Xóa hành động xanh

```http
DELETE http://localhost:8080/api/san-pham/hanh-dong-xanh/HDX001
```

Header: token `SANPHAM`.

Output mong muốn: `200 OK`, `success=true`, `data=null`.

## UC11 - Tạo Tour Thực Tế

```http
POST http://localhost:8080/api/dieu-hanh/tour-thuc-te
```

Header: token `DIEUHANH`.

Body mẫu:

```json
{
  "maTourMau": "TM001",
  "ngayKhoiHanh": "2026-08-20",
  "soKhachToiDa": 25,
  "soKhachToiThieu": 10,
  "giaHienHanh": 3600000
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maTourThucTe` có mã mới.

## UC12 - Hủy Tour Thực Tế

```http
DELETE http://localhost:8080/api/dieu-hanh/tour-thuc-te/TTT001
```

Header: token `DIEUHANH`.

Output mong muốn: `200 OK`, `success=true`, tour chuyển trạng thái hủy.

## UC13 - Cập Nhật Tour Thực Tế

```http
PUT http://localhost:8080/api/dieu-hanh/tour-thuc-te/TTT001
```

Header: token `DIEUHANH`.

Body mẫu:

```json
{
  "giaHienHanh": 3650000,
  "soKhachToiDa": 25,
  "soKhachToiThieu": 10,
  "trangThai": "MO_BAN"
}
```

Output mong muốn: `200 OK`, `success=true`, `message="Cap nhat thanh cong"`.

## UC14 - Xem Tour Thực Tế

### Danh sách tour thực tế

```http
GET http://localhost:8080/api/dieu-hanh/tour-thuc-te?trangThai=MO_BAN&page=0&size=10
```

Header: token `DIEUHANH`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách tour thực tế.

### Chi tiết tour thực tế

```http
GET http://localhost:8080/api/dieu-hanh/tour-thuc-te/TTT001
```

Header: token `DIEUHANH`.

Output mong muốn: `200 OK`, `success=true`, `data.maTourThucTe="TTT001"`.

## UC24 - Kinh Doanh Quản Lý Khách Hàng

### Tìm kiếm khách hàng

```http
GET http://localhost:8080/api/kinh-doanh/khach-hang?hoTen=&page=0&size=10
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách khách hàng.

### Chi tiết khách hàng

```http
GET http://localhost:8080/api/kinh-doanh/khach-hang/KH001
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, `data.maKhachHang="KH001"`.

## UC25 - Xem Danh Sách Tour Công Khai

```http
GET http://localhost:8080/api/public/tour?giaTu=1000000&giaDen=6000000&page=0&size=10
```

Không cần token.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách tour đang mở bán.

## UC26 - Xem Chi Tiết Tour Công Khai

### Chi tiết tour

```http
GET http://localhost:8080/api/public/tour/TTT001
```

Không cần token.

Output mong muốn: `200 OK`, `success=true`, `data.maTourThucTe="TTT001"`.

### Đánh giá tour

```http
GET http://localhost:8080/api/public/tour/TTT001/danh-gia?page=0&size=10
```

Không cần token.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách đánh giá.

## UC27 - Khách Hàng Đặt Tour Và Quản Lý Đơn

### Cập nhật hồ sơ

```http
PUT http://localhost:8080/api/khach-hang/ho-so
```

Header: token `KHACHHANG`.

Body mẫu:

```json
{
  "cccd": "012345678901",
  "soDienThoai": "0900000004",
  "diUng": "Khong",
  "ghiChuYTe": "Can tu van lich trinh nhe"
}
```

Output mong muốn: `200 OK`, `success=true`, `data.maKhachHang` là hồ sơ hiện tại.

### Xem hồ sơ

```http
GET http://localhost:8080/api/khach-hang/ho-so
```

Header: token `KHACHHANG`.

Output mong muốn: `200 OK`, `success=true`, `data.maKhachHang` tồn tại.

### Đặt tour

```http
POST http://localhost:8080/api/khach-hang/dat-tour
```

Header: token `KHACHHANG`.

Body mẫu:

```json
{
  "maTourThucTe": "TTT001",
  "danhSachDichVu": [
    {
      "maDichVuThem": "DV012",
      "soLuong": 1
    },
    {
      "maDichVuThem": "DV002",
      "soLuong": 2
    }
  ],
  "danhSachNguoiDongHanh": [
    {
      "hoTen": "Nguoi di cung 01",
      "cccd": "011111111111",
      "soDienThoai": "0911111111",
      "ngaySinh": "1995-01-01",
      "gioiTinh": "NAM",
      "ghiChu": "An chay"
    }
  ],
  "ghiChu": "Uu tien phong tang thap"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maDatTour` có mã mới, trạng thái thường là `CHO_XAC_NHAN`.

### Danh sách đơn của tôi

```http
GET http://localhost:8080/api/khach-hang/dat-tour?page=0&size=10
```

Header: token `KHACHHANG`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách đơn của khách hiện tại.

### Chi tiết đơn của tôi

```http
GET http://localhost:8080/api/khach-hang/dat-tour/DDT004
```

Header: token `KHACHHANG`.

Output mong muốn: `200 OK`, `success=true`, `data.maDatTour="DDT004"` nếu đơn thuộc khách đang đăng nhập.

### Hủy đơn đang chờ xác nhận

```http
DELETE http://localhost:8080/api/khach-hang/dat-tour/DDT004
```

Header: token `KHACHHANG`.

Output mong muốn: `200 OK`, `success=true`, `message="Huy dat tour thanh cong"`.

## UC28 - Áp Voucher

```http
POST http://localhost:8080/api/khach-hang/ap-voucher
```

Header: token `KHACHHANG`.

Body mẫu:

```json
{
  "maDatTour": "DDT004",
  "maVoucher": "VC001"
}
```

Output mong muốn: `200 OK`, `success=true`, `message="Ap dung voucher thanh cong"`.

## UC29 - Thanh Toán

### Khởi tạo thanh toán mock

```http
POST http://localhost:8080/api/thanh-toan/khoi-tao
```

Header: token `KHACHHANG`.

Body mẫu:

```json
{
  "maDonDatTour": "DDT004",
  "phuongThuc": "MOCK",
  "mock": true
}
```

Output mong muốn: `200 OK`, `success=true`, `data.trangThai` thể hiện thanh toán thành công hoặc đã khởi tạo.

### Kiểm tra kết quả thanh toán

```http
GET http://localhost:8080/api/thanh-toan/DDT004/ket-qua
```

Header: token `KHACHHANG`.

Output mong muốn: `200 OK`, `success=true`, `data.maDatTour="DDT004"`.

## UC30 - Đổi Điểm Xanh Lấy Voucher

```http
POST http://localhost:8080/api/khach-hang/doi-diem
```

Header: token `KHACHHANG`.

Body mẫu:

```json
{
  "maVoucher": "VC006"
}
```

Output mong muốn: `200 OK`, `success=true`, `message="Doi diem lay voucher thanh cong"`.

## UC31 - Xem Ví Voucher

```http
GET http://localhost:8080/api/khach-hang/vi-voucher?page=0&size=10
```

Header: token `KHACHHANG`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là ví voucher của khách hiện tại.

## UC32 - Yêu Cầu Hủy Tour Đã Xác Nhận

```http
POST http://localhost:8080/api/khach-hang/dat-tour/DDT001/huy
```

Header: token `KHACHHANG`.

Body mẫu:

```json
{
  "lyDo": "Co viec dot xuat, can huy tour"
}
```

Output mong muốn: `200 OK`, `success=true`, tạo yêu cầu hỗ trợ/hủy tour.

## UC33 - Kinh Doanh Xử Lý Yêu Cầu Hủy

### Danh sách yêu cầu hủy

```http
GET http://localhost:8080/api/kinh-doanh/yeu-cau-huy?trangThai=CHUA_XU_LY&page=0&size=10
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách yêu cầu hủy.

### Duyệt yêu cầu hủy

```http
POST http://localhost:8080/api/kinh-doanh/yeu-cau-huy/YCHT005/duyet
```

Header: token `KINHDOANH`.

Body mẫu:

```json
{
  "ghiChu": "Duyet theo chinh sach huy tour"
}
```

Output mong muốn: `200 OK`, `success=true`, yêu cầu chuyển trạng thái đã xử lý/đã duyệt.

### Từ chối yêu cầu hủy

```http
POST http://localhost:8080/api/kinh-doanh/yeu-cau-huy/YCHT005/tu-choi
```

Header: token `KINHDOANH`.

Body mẫu:

```json
{
  "ghiChu": "Khong du dieu kien huy tour"
}
```

Output mong muốn: `200 OK`, `success=true`, yêu cầu chuyển trạng thái từ chối.

## UC34 - Kinh Doanh Quản Lý Booking

### Danh sách booking

```http
GET http://localhost:8080/api/kinh-doanh/don-dat-tour?trangThai=CHO_XAC_NHAN&page=0&size=10
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách booking.

### Danh sách booking qua endpoint dat-tour

```http
GET http://localhost:8080/api/kinh-doanh/dat-tour?trangThai=CHO_XAC_NHAN&page=0&size=10
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách booking.

### Xác nhận booking

```http
PUT http://localhost:8080/api/kinh-doanh/dat-tour/DDT004/xac-nhan
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, booking chuyển trạng thái xác nhận.

## UC35 - Lịch Sử Tour Và Đánh Giá

### Khách hàng xem lịch sử tour

```http
GET http://localhost:8080/api/khach-hang/lich-su-tour?page=0&size=10
```

Header: token `KHACHHANG`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là lịch sử tour của khách hiện tại.

### Khách hàng đánh giá tour

```http
POST http://localhost:8080/api/khach-hang/danh-gia
```

Header: token `KHACHHANG`.

Body mẫu:

```json
{
  "maTourThucTe": "TTT099",
  "soSao": 5,
  "nhanXet": "Tour tot, huong dan vien nhiet tinh"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.soSao=5`.

### Kinh doanh xem tất cả đánh giá

```http
GET http://localhost:8080/api/kinh-doanh/danh-gia?page=0&size=10
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách đánh giá.

## UC36 - Khách Hàng Gửi Yêu Cầu Hỗ Trợ

### Tạo yêu cầu hỗ trợ

```http
POST http://localhost:8080/api/khach-hang/yeu-cau-ho-tro
```

Header: token `KHACHHANG`.

Body mẫu:

```json
{
  "maDatTour": "DDT004",
  "loaiYeuCau": "HO_TRO",
  "noiDung": "Can xac nhan thoi gian khoi hanh"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maYeuCauHoTro` có mã mới.

### Xem yêu cầu hỗ trợ của tôi

```http
GET http://localhost:8080/api/khach-hang/yeu-cau-ho-tro?loaiYeuCau=HO_TRO&page=0&size=10
```

Header: token `KHACHHANG`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách ticket của khách hiện tại.

## UC37 - Điều Hành Phân Công HDV

### Phân công HDV

```http
POST http://localhost:8080/api/dieu-hanh/phan-cong
```

Header: token `DIEUHANH`.

Body mẫu:

```json
{
  "maTourThucTe": "TTT001",
  "maNhanVien": "NV_HDV01",
  "ghiChu": "Phan cong test"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maPhanCongTour` có mã mới.

### Hủy phân công

```http
DELETE http://localhost:8080/api/dieu-hanh/phan-cong/PCT001
```

Header: token `DIEUHANH`.

Output mong muốn: `200 OK`, `success=true`, `data=null`.

## UC38 - Tìm HDV Khả Dụng

```http
GET http://localhost:8080/api/dieu-hanh/hdv-kha-dung?maTourThucTe=TTT001
```

Header: token `DIEUHANH`.

Output mong muốn: `200 OK`, `success=true`, `data` là mảng nhân viên HDV khả dụng.

## UC39 - Lịch Công Tác HDV/Điều Hành

### HDV xem tour của tôi

```http
GET http://localhost:8080/api/huong-dan-vien/tour-cua-toi
```

Header: token `HDV`.

Output mong muốn: `200 OK`, `success=true`, `data` là mảng tour được phân công.

### HDV xem lịch công tác

```http
GET http://localhost:8080/api/huong-dan-vien/lich-cong-tac
```

Header: token `HDV`.

Output mong muốn: `200 OK`, `success=true`, `data` là mảng lịch công tác.

### Điều hành xem lịch công tác

```http
GET http://localhost:8080/api/dieu-hanh/lich-cong-tac
```

Header: token `DIEUHANH`.

Output mong muốn: `200 OK`, `success=true`.

## UC41 - Kinh Doanh Xử Lý Yêu Cầu Hỗ Trợ

### Danh sách yêu cầu hỗ trợ

```http
GET http://localhost:8080/api/kinh-doanh/yeu-cau-ho-tro?trangThai=CHUA_XU_LY&page=0&size=10
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách ticket.

### Xử lý yêu cầu hỗ trợ

```http
PUT http://localhost:8080/api/kinh-doanh/yeu-cau-ho-tro/YCHT004
```

Header: token `KINHDOANH`.

Body mẫu:

```json
{
  "maNhanVienXuLy": "NV_SALES01",
  "trangThai": "DA_XU_LY",
  "ghiChu": "Da lien he va ho tro khach"
}
```

Output mong muốn: `200 OK`, `success=true`, ticket được cập nhật trạng thái.

## UC42 - Xem Danh Sách Đoàn

### HDV xem danh sách đoàn

```http
GET http://localhost:8080/api/huong-dan-vien/tour/TTT099/doan
```

Header: token `HDV`.

Output mong muốn: `200 OK`, `success=true`, `data` là danh sách khách trong đoàn.

### Điều hành xem danh sách đoàn

```http
GET http://localhost:8080/api/dieu-hanh/tour/TTT099/doan
```

Header: token `DIEUHANH`.

Output mong muốn: `200 OK`, `success=true`, `data` là danh sách khách trong đoàn.

## UC43 - HDV Điểm Danh

```http
POST http://localhost:8080/api/huong-dan-vien/tour/TTT099/diem-danh
```

Header: token `HDV`.

Body mẫu:

```json
{
  "maKhachHang": "KH001",
  "trangThai": "DA_DIEM_DANH",
  "diaDiem": "Ben xe My Dinh"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maDiemDanh` có mã điểm danh.

## UC44 - HDV Ghi Nhận Hành Động Xanh

```http
POST http://localhost:8080/api/huong-dan-vien/tour/TTT099/hanh-dong-xanh
```

Header: token `HDV`.

Body mẫu:

```json
{
  "maKhachHang": "KH001",
  "maHanhDongXanh": "HDX001",
  "minhChung": "Anh khach dung binh nuoc ca nhan"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maGhiNhanHanhDong` có mã ghi nhận.

## UC45 - Sự Cố Tour

### HDV xem sự cố

```http
GET http://localhost:8080/api/huong-dan-vien/tour/TTT099/su-co?mucDo=TRUNG_BINH
```

Header: token `HDV`.

Output mong muốn: `200 OK`, `success=true`, `data` là mảng sự cố.

### Điều hành xem sự cố

```http
GET http://localhost:8080/api/dieu-hanh/tour/TTT099/su-co
```

Header: token `DIEUHANH`.

Output mong muốn: `200 OK`, `success=true`, `data` là mảng sự cố.

### HDV báo cáo sự cố

```http
POST http://localhost:8080/api/huong-dan-vien/tour/TTT099/su-co
```

Header: token `HDV`.

Body mẫu:

```json
{
  "moTa": "Khach bi say song nhe",
  "giaiPhap": "Da cho khach nghi ngoi va cap thuoc",
  "mucDo": "TRUNG_BINH"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maNhatKySuCo` có mã mới.

### HDV cập nhật sự cố

```http
PUT http://localhost:8080/api/huong-dan-vien/su-co/NKSC001
```

Header: token `HDV`.

Body mẫu:

```json
{
  "moTa": "Cap nhat mo ta su co",
  "giaiPhap": "Da xu ly on dinh",
  "mucDo": "THAP"
}
```

Output mong muốn: `200 OK`, `success=true`.

## UC46 - Chi Phí Phát Sinh

### HDV khai chi phí

```http
POST http://localhost:8080/api/huong-dan-vien/tour/TTT099/chi-phi
```

Header: token `HDV`.

Body mẫu:

```json
{
  "danhMuc": "Nuoc uong phat sinh",
  "thanhTien": 150000,
  "hoaDonAnh": "https://example.com/hoa-don.jpg"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maChiPhiThucTe` có mã mới.

### HDV xem chi phí tour

```http
GET http://localhost:8080/api/huong-dan-vien/tour/TTT099/chi-phi
```

Header: token `HDV`.

Output mong muốn: `200 OK`, `success=true`, `data` là mảng chi phí.

### Điều hành xem chi phí tour

```http
GET http://localhost:8080/api/dieu-hanh/tour/TTT099/chi-phi
```

Header: token `DIEUHANH`.

Output mong muốn: `200 OK`, `success=true`, `data` là mảng chi phí.

### HDV bổ sung chi phí

```http
PUT http://localhost:8080/api/huong-dan-vien/chi-phi/CPTT005/bo-sung
```

Header: token `HDV`.

Body mẫu:

```json
{
  "danhMuc": "Bo sung hoa don chi phi",
  "thanhTien": 350000,
  "hoaDonAnh": "https://example.com/hoa-don-bo-sung.jpg"
}
```

Output mong muốn: `200 OK`, `success=true`.

## UC47 - Tour Cần Quyết Toán

```http
GET http://localhost:8080/api/ke-toan/tour-can-quyet-toan?page=0&size=10
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách tour cần quyết toán.

## UC48 - Tính Toán Sơ Bộ Quyết Toán

```http
GET http://localhost:8080/api/ke-toan/tinh-toan/TTT099
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, `data.tongDoanhThu`, `data.tongChiPhi`, `data.loiNhuan` có giá trị.

## UC49 - Tạo/Cập Nhật Nháp Quyết Toán

```http
POST http://localhost:8080/api/ke-toan/quyet-toan/TTT099
```

Header: token `KETOAN`.

Body mẫu:

```json
{
  "giaCamKet": 2500000,
  "ghiChu": "Quyet toan nhap test"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maQuyetToan` có mã quyết toán.

## UC50 - Chốt Quyết Toán / Từ Chối Hoàn Tiền

### Chốt quyết toán

```http
PUT http://localhost:8080/api/ke-toan/quyet-toan/QT001/chot
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, quyết toán chuyển trạng thái đã chốt.

### Từ chối hoàn tiền

```http
PUT http://localhost:8080/api/ke-toan/giao-dich-hoan/GD_HOA01/tu-choi
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, giao dịch hoàn chuyển trạng thái từ chối.

## UC51 - Xem Quyết Toán

### Danh sách quyết toán

```http
GET http://localhost:8080/api/ke-toan/quyet-toan?trangThai=DA_QUYET_TOAN&page=0&size=10
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách quyết toán.

### Chi tiết quyết toán

```http
GET http://localhost:8080/api/ke-toan/quyet-toan/QT001
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, `data.maQuyetToan="QT001"`.

## UC52 - Kế Toán Xử Lý Chi Phí Và Hoàn Tiền

### Danh sách chi phí

```http
GET http://localhost:8080/api/ke-toan/chi-phi?trangThai=CHO_DUYET&page=0&size=10
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách chi phí.

### Duyệt chi phí

```http
PUT http://localhost:8080/api/ke-toan/chi-phi/CPTT005/duyet
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, chi phí chuyển trạng thái duyệt.

### Từ chối chi phí

```http
PUT http://localhost:8080/api/ke-toan/chi-phi/CPTT005/tu-choi
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, chi phí chuyển trạng thái từ chối.

### Yêu cầu bổ sung chi phí

```http
PUT http://localhost:8080/api/ke-toan/chi-phi/CPTT005/yeu-cau-bo-sung
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, chi phí chuyển trạng thái yêu cầu bổ sung.

### Danh sách cảnh báo chi phí

```http
GET http://localhost:8080/api/ke-toan/canh-bao-chi-phi?page=0&size=10
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách cảnh báo.

### Chi tiết cảnh báo chi phí

```http
GET http://localhost:8080/api/ke-toan/canh-bao-chi-phi/CB001
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true` nếu mã cảnh báo tồn tại, hoặc `404` nếu chưa có dữ liệu cảnh báo seed.

### Danh sách giao dịch hoàn

```http
GET http://localhost:8080/api/ke-toan/giao-dich-hoan?page=0&size=10
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách giao dịch hoàn.

### Xác nhận hoàn tiền

```http
PUT http://localhost:8080/api/ke-toan/giao-dich-hoan/GD_HOA01/xac-nhan
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, giao dịch hoàn chuyển trạng thái xác nhận.

## UC52 - Kinh Doanh Quản Lý Voucher

### Danh sách voucher

```http
GET http://localhost:8080/api/kinh-doanh/voucher?page=0&size=10
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách voucher.

### Chi tiết voucher

```http
GET http://localhost:8080/api/kinh-doanh/voucher/VC001
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, `data.maVoucher="VC001"`.

### Cập nhật voucher

```http
PUT http://localhost:8080/api/kinh-doanh/voucher/VC001
```

Header: token `KINHDOANH`.

Body mẫu:

```json
{
  "maCode": "WELCOME10",
  "loaiUuDai": "PHAN_TRAM",
  "giaTriGiam": 10,
  "dieuKienApDung": "Giam 10% cho khach dat tour lan dau",
  "soLuotPhatHanh": 100,
  "ngayHieuLuc": "2026-04-01",
  "ngayHetHan": "2026-12-31"
}
```

Output mong muốn: `200 OK`, `success=true`.

### Vô hiệu hóa voucher

```http
PUT http://localhost:8080/api/kinh-doanh/voucher/VC001/vo-hieu-hoa
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, voucher chuyển trạng thái vô hiệu hóa.

## UC53 - Báo Cáo Doanh Thu / Tạo Voucher

### Báo cáo doanh thu

```http
GET http://localhost:8080/api/ke-toan/bao-cao/doanh-thu?tuNgay=2026-01-01&denNgay=2026-12-31
```

Header: token `KETOAN`.

Output mong muốn: `200 OK`, `success=true`, `data.tongDoanhThu` có giá trị.

### Kinh doanh tạo voucher

```http
POST http://localhost:8080/api/kinh-doanh/voucher
```

Header: token `KINHDOANH`.

Body mẫu:

```json
{
  "maCode": "TET2027",
  "loaiUuDai": "SO_TIEN",
  "giaTriGiam": 500000,
  "dieuKienApDung": "Uu dai Tet",
  "soLuotPhatHanh": 50,
  "ngayHieuLuc": "2027-01-01",
  "ngayHetHan": "2027-03-31"
}
```

Output mong muốn: `201 Created`, `success=true`, `data.maVoucher` có mã mới.

## UC54 - Phát Hành / Thu Hồi Voucher

### Phát hành voucher cho khách

```http
POST http://localhost:8080/api/kinh-doanh/voucher/VC001/phat-hanh
```

Header: token `KINHDOANH`.

Body mẫu:

```json
{
  "maKhachHang": "KH004"
}
```

Output mong muốn: `201 Created`, `success=true`, khách có voucher trong ví.

### Thu hồi voucher của khách

```http
PUT http://localhost:8080/api/kinh-doanh/voucher/VC001/khach-hang/KH001/thu-hoi
```

Header: token `KINHDOANH`.

Output mong muốn: `200 OK`, `success=true`, voucher trong ví khách chuyển trạng thái thu hồi.

## UC63 - Năng Lực HDV

### HDV xem năng lực của tôi

```http
GET http://localhost:8080/api/huong-dan-vien/nang-luc
```

Header: token `HDV`.

Output mong muốn: `200 OK`, `success=true`, `data` là năng lực của HDV đang đăng nhập.

### Điều hành xem năng lực HDV

```http
GET http://localhost:8080/api/dieu-hanh/nhan-vien/NV_HDV01/nang-luc
```

Header: token `DIEUHANH`.

Output mong muốn: `200 OK`, `success=true`, `data.maNhanVien="NV_HDV01"`.

### Điều hành cập nhật năng lực HDV

```http
PUT http://localhost:8080/api/dieu-hanh/nhan-vien/NV_HDV01/nang-luc
```

Header: token `DIEUHANH`.

Body mẫu:

```json
{
  "ngonNgu": "Tieng Anh, Tieng Trung",
  "chungChi": "HDV quoc te",
  "chuyenMon": "Tour bien dao, trekking nhe"
}
```

Output mong muốn: `200 OK`, `success=true`.

## UC66 - Khóa Tài Khoản Nhân Viên

```http
PUT http://localhost:8080/api/quan-tri/nhan-vien/NV_HDV01/khoa
```

Header: token `ADMIN`.

Output mong muốn: `200 OK`, `success=true`, nhân viên bị khóa.

## UC67 - Mở Khóa Tài Khoản Nhân Viên

```http
PUT http://localhost:8080/api/quan-tri/nhan-vien/NV_HDV01/mo-khoa
```

Header: token `ADMIN`.

Output mong muốn: `200 OK`, `success=true`, nhân viên được mở khóa.

## UC68 - Quản Trị Nhân Viên

### Tạo tài khoản nhân viên

```http
POST http://localhost:8080/api/quan-tri/dang-ky-nhan-vien
```

Header: token `ADMIN`.

Body mẫu:

```json
{
  "tenDangNhap": "hdvtest01",
  "matKhau": "password",
  "hoTen": "Huong Dan Vien Test",
  "email": "hdvtest01@example.com",
  "soDienThoai": "0908888888",
  "maVaiTro": "HDV"
}
```

Output mong muốn: `201 Created`, `success=true`, tài khoản nhân viên được tạo.

### Danh sách nhân viên

```http
GET http://localhost:8080/api/quan-tri/nhan-vien?maVaiTro=HDV&page=0&size=10
```

Header: token `ADMIN`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách nhân viên.

### Chi tiết nhân viên

```http
GET http://localhost:8080/api/quan-tri/nhan-vien/NV_HDV01
```

Header: token `ADMIN`.

Output mong muốn: `200 OK`, `success=true`, `data.maNhanVien="NV_HDV01"`.

## UC69 - Gán Vai Trò Nhân Viên

```http
PUT http://localhost:8080/api/quan-tri/nhan-vien/NV_HDV01/vai-tro
```

Header: token `ADMIN`.

Body mẫu:

```json
{
  "maVaiTro": "HDV"
}
```

Output mong muốn: `200 OK`, `success=true`, nhân viên có vai trò mới.

## UC70 - Tra Cứu Nhật Ký Hệ Thống

```http
GET http://localhost:8080/api/quan-tri/nhat-ky-he-thong?page=0&size=20
```

Header: token `ADMIN`.

Output mong muốn: `200 OK`, `success=true`, `data.content` là danh sách nhật ký hệ thống.

## Đăng Xuất

```http
POST http://localhost:8080/api/auth/dang-xuat
```

Header: token của tài khoản đang đăng nhập.

Output mong muốn: `200 OK`, `success=true`, `message="Dang xuat thanh cong"`.

## Lỗi Mong Muốn Khi Test Sai

Sai hoặc thiếu token:

```json
{
  "status": 401,
  "success": false,
  "error": "UNAUTHORIZED"
}
```

Đúng token nhưng sai vai trò:

```json
{
  "status": 403,
  "success": false,
  "error": "FORBIDDEN"
}
```

Dữ liệu không tồn tại:

```json
{
  "status": 404,
  "success": false,
  "error": "NOT_FOUND"
}
```
