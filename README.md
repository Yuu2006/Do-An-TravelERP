# Digital Travel ERP — Backend API

**Công nghệ:** Java 21 · Spring Boot 3.x · Oracle 19c/21c · JWT (HS256)
**Package gốc:** `com.digitaltravel.erp`
**Branch hiện tại:** `main`

---

## Mục lục

1. [Cài đặt & Chạy](#cài-đặt--chạy)
2. [Cấu trúc project](#cấu-trúc-project)
3. [Xác thực & Phân quyền](#xác-thực--phân-quyền)
4. [API Reference](#api-reference)
5. [Trạng thái cài đặt Use Case](#trạng-thái-cài-đặt-use-case)
6. [Biến môi trường](#biến-môi-trường)
7. [Ghi chú kỹ thuật](#ghi-chú-kỹ-thuật)

---

## Cài đặt & Chạy

### Yêu cầu

- Java 21+
- Maven (hoặc dùng `mvnw.cmd` đính kèm)
- Oracle 19c/21c đang chạy và đã tạo schema

### Biến môi trường (`.env` hoặc OS env)

```
DB_HOST=localhost
DB_PORT=1521
DB_SERVICE=XEPDB1
DB_USERNAME=digital_travel
DB_PASSWORD=<mật khẩu>
JWT_SECRET=<chuỗi base64, tối thiểu 42 ký tự>
JWT_EXPIRATION=86400000
```

### Khởi tạo DB

Chạy script DDL:

```sql
-- Trong DBeaver hoặc SQL*Plus:
@src/main/resources/db/KhoiTaoBang.sql
```

### Chạy ứng dụng

```bash
# Windows
.\mvnw.cmd spring-boot:run

# Hoặc build JAR
.\mvnw.cmd clean package -DskipTests
java -jar target/digital-travel-erp-*.jar
```

Swagger UI: http://localhost:8080/swagger-ui/index.html

---

## Cấu trúc project

```
src/main/java/com/digitaltravel/erp/
├── config/
│   ├── JwtAuthFilter.java          -- Trích xuất & validate Bearer token
│   ├── JwtUtil.java                -- Generate / parse JWT (HS256)
│   ├── JwtAuthEntryPoint.java      -- 401 handler
│   ├── JwtAccessDeniedHandler.java -- 403 handler
│   ├── SecurityConfig.java         -- RBAC route rules
│   ├── TaiKhoanDetails.java        -- UserDetails impl
│   └── VaiTroConst.java            -- Role constants
├── controller/
│   ├── AuthController.java
│   ├── TourMauController.java
│   ├── TourThucTeController.java
│   ├── LoaiPhongController.java
│   ├── DichVuThemController.java
│   ├── HanhDongXanhController.java
│   ├── KhachHangController.java
│   ├── ThanhToanController.java
│   ├── NhanVienController.java
│   ├── TaiKhoanAdminController.java
│   ├── PhanCongController.java
│   ├── VanHanhController.java
│   └── QuyetToanController.java
├── service/        -- Business logic
├── repository/     -- Spring Data JPA
├── entity/         -- JPA entities (Oracle mapping)
├── dto/
│   ├── requests/   -- Input DTOs (@Valid)
│   └── responses/  -- Output DTOs
└── exception/      -- GlobalExceptionHandler + AppException
```

---

## Xác thực & Phân quyền

### Roles

| Role | Mô tả |
|------|-------|
| `ADMIN` | Toàn quyền hệ thống |
| `SANPHAM` | Quản lý sản phẩm (tour mẫu, loại phòng, dịch vụ, hành động xanh) |
| `KINHDOANH` | Xử lý đơn hàng, hủy tour, khiếu nại, voucher |
| `DIEUHANH` | Quản lý nhân sự, phân công HDV, tour thực tế |
| `KETOAN` | Quyết toán, chi phí, báo cáo tài chính |
| `HDV` | Vận hành thực địa, điểm danh, sự cố |
| `KHACHHANG` | Khách hàng — đặt tour, thanh toán |

### URL Pattern → Quyền

| Pattern | Roles |
|---------|-------|
| `/api/quan-tri/**` | ADMIN |
| `/api/san-pham/**` | SANPHAM |
| `/api/kinh-doanh/**` | KINHDOANH |
| `/api/dieu-hanh/**` | DIEUHANH |
| `/api/huong-dan-vien/**` | DIEUHANH, HDV |
| `/api/ke-toan/**` | KETOAN |
| `/api/khach-hang/**` | KHACHHANG |
| `/api/thanh-toan/**` | KHACHHANG |
| `/api/auth/**` | Public |
| `/api/public/**` | Public |

---

## API Reference

### Auth (`/api/auth`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| POST | `/api/auth/dang-ky` | Public | UC58 | DONE |
| POST | `/api/auth/dang-nhap` | Public | UC59 | DONE |
| POST | `/api/auth/dang-xuat` | Bearer | UC60 | DONE |
| POST | `/api/auth/doi-mat-khau` | Bearer | UC62 | DONE |
| POST | `/api/auth/quen-mat-khau` | Public | UC61 | DONE |
| POST | `/api/auth/dat-lai-mat-khau` | Public | UC61 | DONE |

### Tour Công khai (`/api/public`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|----------|
| GET | `/api/public/tour` | Public | UC25 | DONE |
| GET | `/api/public/tour/{maTourThucTe}` | Public | UC26 | DONE |
| GET | `/api/public/tour/{maTourThucTe}/danh-gia` | Public | UC26 | DONE |

> Filter hỗ trợ: `giaTu`, `giaDen`, `thoiLuongMin`, `thoiLuongMax`, phân trang.

### Admin — Tài khoản nhân viên (`/api/quan-tri`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|----------|
| POST | `/api/quan-tri/dang-ky-nhan-vien` | ADMIN | UC64 | DONE |
| GET | `/api/quan-tri/nhan-vien` | ADMIN | UC68 | DONE |
| GET | `/api/quan-tri/nhan-vien/{maNhanVien}` | ADMIN | UC68 | DONE |
| PUT | `/api/quan-tri/nhan-vien/{maNhanVien}/khoa` | ADMIN | UC66 | DONE |
| PUT | `/api/quan-tri/nhan-vien/{maNhanVien}/mo-khoa` | ADMIN | UC67 | DONE |
| PUT | `/api/quan-tri/nhan-vien/{maNhanVien}/vai-tro` | ADMIN | UC69 | DONE |

> **Request body PUT /vai-tro:** `{"maVaiTro": "KETOAN"}` — Giá trị hợp lệ: `SANPHAM`, `KINHDOANH`, `DIEUHANH`, `KETOAN`, `HDV`

### Điều hành — Năng lực nhân viên (`/api/dieu-hanh`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|----------|
| GET | `/api/dieu-hanh/nhan-vien/{maNhanVien}/nang-luc` | DIEUHANH | UC63 | DONE |
| PUT | `/api/dieu-hanh/nhan-vien/{maNhanVien}/nang-luc` | DIEUHANH | UC63 | DONE |
| GET | `/api/huong-dan-vien/nang-luc` | HDV | UC63 | DONE |

### Kinh doanh — Khách hàng & Đơn đặt tour (`/api/kinh-doanh`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|----------|
| GET | `/api/kinh-doanh/khach-hang` | KINHDOANH | UC24 | DONE |
| GET | `/api/kinh-doanh/khach-hang/{maKhachHang}` | KINHDOANH | UC24 | DONE |
| GET | `/api/kinh-doanh/dat-tour` | KINHDOANH | -- | DONE |
| PUT | `/api/kinh-doanh/dat-tour/{maDatTour}/xac-nhan` | KINHDOANH | -- | DONE |
| GET | `/api/kinh-doanh/danh-gia` | KINHDOANH | UC35 | DONE |

### Tour Mẫu (`/api/san-pham/tour-mau`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|----------|
| GET | `/api/san-pham/tour-mau` | SANPHAM | UC06 | DONE |
| GET | `/api/san-pham/tour-mau/{id}` | SANPHAM | UC06 | DONE |
| POST | `/api/san-pham/tour-mau` | SANPHAM | UC02 | DONE |
| PUT | `/api/san-pham/tour-mau/{id}` | SANPHAM | UC04 | DONE |
| DELETE | `/api/san-pham/tour-mau/{id}` | SANPHAM | UC05 | DONE (soft delete) |
| POST | `/api/san-pham/tour-mau/{id}/sao-chep` | SANPHAM | UC03 | DONE |
| POST | `/api/san-pham/tour-mau/{id}/lich-trinh` | SANPHAM | UC08 | DONE |
| PUT | `/api/san-pham/tour-mau/{id}/lich-trinh/{maLT}` | SANPHAM | UC09 | DONE |
| DELETE | `/api/san-pham/tour-mau/{id}/lich-trinh/{maLT}` | SANPHAM | UC09 | DONE |

### Tour Thực tế (`/api/dieu-hanh/tour-thuc-te`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|----------|
| GET | `/api/dieu-hanh/tour-thuc-te` | DIEUHANH | UC14 | DONE |
| GET | `/api/dieu-hanh/tour-thuc-te/{id}` | DIEUHANH | UC14 | DONE |
| POST | `/api/dieu-hanh/tour-thuc-te` | DIEUHANH | UC11 | DONE |
| PUT | `/api/dieu-hanh/tour-thuc-te/{id}` | DIEUHANH | UC13 | DONE |
| DELETE | `/api/dieu-hanh/tour-thuc-te/{id}` | DIEUHANH | UC12 | DONE |

### Danh mục (`/api/san-pham`)

| Method | Path | Auth | Trạng thái |
|--------|------|------|-----------|
| GET/POST/PUT/DELETE | `/api/san-pham/loai-phong/**` | SANPHAM | DONE |
| GET/POST/PUT/DELETE | `/api/san-pham/dich-vu-them/**` | SANPHAM | DONE |
| GET/POST/PUT | `/api/san-pham/hanh-dong-xanh/**` | SANPHAM | DONE |

### Khách hàng (`/api/khach-hang`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| GET | `/api/khach-hang/ho-so` | KHACHHANG | UC21 | DONE |
| PUT | `/api/khach-hang/ho-so` | KHACHHANG | UC23 | DONE |
| GET | `/api/khach-hang/lich-su-tour` | KHACHHANG | UC22 | DONE |
| POST | `/api/khach-hang/dat-tour` | KHACHHANG | UC27 | DONE |
| GET | `/api/khach-hang/dat-tour` | KHACHHANG | -- | DONE |
| GET | `/api/khach-hang/dat-tour/{id}` | KHACHHANG | -- | DONE |
| DELETE | `/api/khach-hang/dat-tour/{id}` | KHACHHANG | UC32 | DONE (hủy CHO_XAC_NHAN) |
| POST | `/api/khach-hang/dat-tour/{id}/huy` | KHACHHANG | UC32 | DONE (yêu cầu hủy DA_XAC_NHAN) |
| GET | `/api/khach-hang/vi-voucher` | KHACHHANG | UC31 | DONE |
| POST | `/api/khach-hang/ap-voucher` | KHACHHANG | UC28 | DONE |
| POST | `/api/khach-hang/doi-diem` | KHACHHANG | UC30 | DONE |
| POST | `/api/khach-hang/danh-gia` | KHACHHANG | UC35 | DONE |
| POST | `/api/khach-hang/yeu-cau-ho-tro` | KHACHHANG | UC36 | DONE |
| GET | `/api/khach-hang/yeu-cau-ho-tro` | KHACHHANG | UC36 | DONE |

### Thanh toán (`/api/thanh-toan`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| POST | `/api/thanh-toan/khoi-tao` | KHACHHANG | UC29 | DONE (mock=true) |
| GET | `/api/thanh-toan/{maDatTour}/ket-qua` | KHACHHANG | UC29 | DONE |

> Thanh toán thực MoMo chưa tích hợp. Dùng `"mock": true` trong request body để bypass.

**Request body mẫu:**
```json
{
  "maDonDatTour": "DDT_XXXXX",
  "phuongThuc": "MOCK",
  "mock": true
}
```

### Kinh doanh — Hủy tour & Hỗ trợ (`/api/kinh-doanh`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|----------|
| GET | `/api/kinh-doanh/yeu-cau-huy` | KINHDOANH | UC33 | DONE |
| POST | `/api/kinh-doanh/yeu-cau-huy/{maYeuCau}/duyet` | KINHDOANH | UC33 | DONE |
| POST | `/api/kinh-doanh/yeu-cau-huy/{maYeuCau}/tu-choi` | KINHDOANH | UC33 | DONE |
| GET | `/api/kinh-doanh/don-dat-tour` | KINHDOANH | UC34 | DONE |
| GET | `/api/kinh-doanh/yeu-cau-ho-tro` | KINHDOANH | UC41 | DONE |
| PUT | `/api/kinh-doanh/yeu-cau-ho-tro/{maYeuCau}` | KINHDOANH | UC41 | DONE |

### Điều hành — Phân công HDV (`/api/dieu-hanh`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|----------|
| GET | `/api/dieu-hanh/hdv-kha-dung?maTourThucTe=...` | DIEUHANH | UC38 | DONE |
| POST | `/api/dieu-hanh/phan-cong` | DIEUHANH | UC37 | DONE |
| DELETE | `/api/dieu-hanh/phan-cong/{maPhanCong}` | DIEUHANH | UC37 | DONE |

**Request body POST /phan-cong:**
```json
{
  "maTourThucTe": "TTT_XXXXX",
  "maNhanVien": "NV_XXXXX",
  "ghiChu": "Ghi chú phân công"
}
```

### HDV — Vận hành thực địa (`/api/huong-dan-vien`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|----------|
| GET | `/api/huong-dan-vien/tour-cua-toi` | HDV | -- | DONE |
| GET | `/api/huong-dan-vien/lich-cong-tac` | DIEUHANH, HDV | UC39 | DONE |
| GET | `/api/dieu-hanh/lich-cong-tac` | DIEUHANH, HDV | UC39 | DONE |
| GET | `/api/huong-dan-vien/tour/{maTour}/doan` | DIEUHANH, HDV | UC42 | DONE |
| GET | `/api/dieu-hanh/tour/{maTour}/doan` | DIEUHANH, HDV | UC42 | DONE |
| POST | `/api/huong-dan-vien/tour/{maTour}/diem-danh` | HDV | UC43 | DONE |
| POST | `/api/huong-dan-vien/tour/{maTour}/hanh-dong-xanh` | HDV | UC44 | DONE |
| GET | `/api/huong-dan-vien/tour/{maTour}/su-co` | DIEUHANH, HDV | UC45 | DONE |
| GET | `/api/dieu-hanh/tour/{maTour}/su-co` | DIEUHANH, HDV | UC45 | DONE |
| POST | `/api/huong-dan-vien/tour/{maTour}/su-co` | HDV | UC45 | DONE |
| PUT | `/api/huong-dan-vien/su-co/{maSuCo}` | HDV | UC45 | DONE |
| POST | `/api/huong-dan-vien/tour/{maTour}/chi-phi` | HDV | UC46 | DONE |
| GET | `/api/huong-dan-vien/tour/{maTour}/chi-phi` | DIEUHANH, HDV | UC46 | DONE |
| GET | `/api/dieu-hanh/tour/{maTour}/chi-phi` | DIEUHANH, HDV | UC46 | DONE |

### Kế toán — Chi phí & Quyết toán (`/api/ke-toan`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| GET | `/api/ke-toan/chi-phi?trangThai=CHO_DUYET` | KETOAN | UC49 | DONE |
| PUT | `/api/ke-toan/chi-phi/{maChiPhi}/duyet` | KETOAN | UC49 | DONE |
| PUT | `/api/ke-toan/chi-phi/{maChiPhi}/tu-choi` | KETOAN | UC49 | DONE |
| GET | `/api/ke-toan/tour-can-quyet-toan` | KETOAN | UC47 | DONE |
| GET | `/api/ke-toan/tinh-toan/{maTour}` | KETOAN | UC48 | DONE (xem trước) |
| POST | `/api/ke-toan/quyet-toan/{maTour}` | KETOAN | UC49/50 | DONE |
| PUT | `/api/ke-toan/quyet-toan/{id}/chot` | KETOAN | UC50 | DONE (BAN_NHAP to DA_CHOT) |
| GET | `/api/ke-toan/quyet-toan` | KETOAN | UC51 | DONE |
| GET | `/api/ke-toan/quyet-toan/{id}` | KETOAN | UC51 | DONE |
| GET | `/api/ke-toan/giao-dich-hoan` | KETOAN | UC52 | DONE |
| PUT | `/api/ke-toan/giao-dich-hoan/{id}/xac-nhan` | KETOAN | UC52 | DONE |
| GET | `/api/ke-toan/bao-cao/doanh-thu` | KETOAN | UC53 | DONE |

> Filter báo cáo: `tuNgay`, `denNgay` (ISO date format: `yyyy-MM-dd`).

### Voucher Admin (`/api/kinh-doanh/voucher`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|----------|
| GET | `/api/kinh-doanh/voucher` | KINHDOANH | UC54 | DONE |
| GET | `/api/kinh-doanh/voucher/{maVoucher}` | KINHDOANH | UC54 | DONE |
| POST | `/api/kinh-doanh/voucher` | KINHDOANH | UC54 | DONE |
| PUT | `/api/kinh-doanh/voucher/{maVoucher}` | KINHDOANH | UC55 | DONE |
| PUT | `/api/kinh-doanh/voucher/{maVoucher}/vo-hieu` | KINHDOANH | UC55 | DONE |
| POST | `/api/kinh-doanh/voucher/{maVoucher}/phat-hanh` | KINHDOANH | UC56 | DONE |

---

## Trạng thái cài đặt Use Case

### DONE — Đã hoàn thành

| UC | Tên | Module |
|----|-----|--------|
| UC02 | Thêm tour mẫu | Tour Mẫu |
| UC03 | Sao chép tour mẫu | Tour Mẫu |
| UC04 | Sửa tour mẫu | Tour Mẫu |
| UC05 | Xóa mềm tour mẫu | Tour Mẫu |
| UC06 | Tìm kiếm danh sách tour mẫu | Tour Mẫu |
| UC08 | Thêm lịch trình | Tour Mẫu |
| UC09 | Sửa / xóa lịch trình | Tour Mẫu |
| UC11 | Khởi tạo tour thực tế từ tour mẫu | Tour Thực tế |
| UC12 | Xóa tour thực tế | Tour Thực tế |
| UC13 | Sửa tour thực tế | Tour Thực tế |
| UC14 | Tìm kiếm & xem chi tiết tour | Tour Thực tế |
| UC15–17 | CRUD loại phòng, dịch vụ bổ sung | Danh mục |
| UC18–20 | CRUD hành động xanh | Hành động xanh |
| UC21 | Xem hồ sơ khách hàng | Khách hàng |
| UC22 | Lịch sử tour khách hàng | Khách hàng |
| UC23 | Cập nhật hộ chiếu số | Khách hàng |
| UC24 | Tìm kiếm hồ sơ khách hàng | Nhân viên |
| UC25 | Danh sách tour công khai | Tour Thực tế |
| UC26 | Chi tiết tour + đánh giá (public) | Tour Thực tế |
| UC27 | Đặt tour (giữ chỗ 15 phút) | Đặt tour |
| UC28 | Áp dụng voucher vào đơn | Voucher |
| UC29 | Thanh toán mock — trừ chỗ, tạo lịch sử tour | Thanh toán |
| UC30 | Đổi điểm xanh lấy voucher | Voucher |
| UC31 | Xem ví voucher | Voucher |
| UC32 | KH yêu cầu hủy tour | Hủy tour |
| UC33 | KINHDOANH duyệt / từ chối hoàn tiền | Hủy tour |
| UC34 | KINHDOANH tìm kiếm đơn đặt tour | Kinh doanh |
| UC35 | Đánh giá sau tour | Khách hàng |
| UC36 | Tạo & xem yêu cầu hỗ trợ / khiếu nại | Khách hàng |
| UC37 | Phân công HDV vào tour | Phân công |
| UC38 | Tìm HDV khả dụng (không trùng lịch) | Phân công |
| UC39 | Lịch công tác HDV | HDV |
| UC41 | KINHDOANH xử lý yêu cầu hỗ trợ / khiếu nại | Kinh doanh |
| UC42 | Xem danh sách đoàn | Vận hành |
| UC43 | Điểm danh khách | Vận hành |
| UC44 | Ghi nhận hành động xanh + cộng điểm tự động | Vận hành |
| UC45 | Báo cáo & cập nhật sự cố | Vận hành |
| UC46 | Khai báo chi phí phát sinh | Vận hành |
| UC47 | DS tour cần quyết toán | Quyết toán |
| UC48 | Xem trước tính toán quyết toán | Quyết toán |
| UC49 | Duyệt chi phí / tạo quyết toán BAN_NHAP | Quyết toán |
| UC50 | Chốt quyết toán (DA_CHOT, tour -> DA_QUYET_TOAN) | Quyết toán |
| UC51 | Xem danh sách & chi tiết quyết toán | Quyết toán |
| UC52 | Kế toán xác nhận chuyển tiền hoàn | Quyết toán |
| UC53 | Báo cáo doanh thu / top tour | Quyết toán |
| UC54 | Tạo voucher mới | Voucher |
| UC55 | Cập nhật / vô hiệu voucher | Voucher |
| UC56 | Phát hành voucher cho khách hàng | Voucher |
| UC58 | Đăng ký tài khoản khách hàng | Auth |
| UC59 | Đăng nhập, nhận JWT | Auth |
| UC60 | Đăng xuất stateless | Auth |
| UC61 | Quên / đặt lại mật khẩu | Auth |
| UC62 | Đổi mật khẩu | Auth |
| UC63 | Cập nhật năng lực HDV | Nhân viên |
| UC64 | Admin tạo tài khoản nhân viên | Nhân viên |
| UC66 | Khóa tài khoản nhân viên | Nhân viên |
| UC67 | Mở khóa tài khoản nhân viên | Nhân viên |
| UC68 | Tìm kiếm & xem hồ sơ nhân viên | Nhân viên |
| UC69 | Gán vai trò cho nhân viên | Nhân viên |
| -- | Scheduler tự hủy đơn hết hạn (60s) | Đặt tour |
| -- | Scheduler tự động đổi trạng thái tour | Tour Thực tế |

### TODO — Chưa hoàn thành

| UC | Tên | Ghi chú |
|----|-----|---------|
| UC57 | Thanh toán MoMo thật | Chỉ có mock mode |
| UC70 | Nhật ký hệ thống | Chưa làm |
| -- | Dynamic Pricing tự động | Chưa làm |
| -- | Seed data đầy đủ cho demo | Chưa làm |

---

## Biến môi trường

| Biến | Mô tả | Bắt buộc |
|------|-------|----------|
| `DB_HOST` | Host Oracle | Có |
| `DB_PORT` | Port Oracle | Có |
| `DB_SERVICE` | Service name Oracle | Có |
| `DB_USERNAME` | Username DB | Có |
| `DB_PASSWORD` | Password DB | Có |
| `JWT_SECRET` | Khóa ký JWT (Base64, tối thiểu 42 ký tự) | Có |
| `JWT_EXPIRATION` | TTL access token (ms), mặc định 86400000 (24h) | Không |

Tạo file `.env` ở root project (đã có trong `.gitignore`):

```dotenv
DB_HOST=localhost
DB_PORT=1521
DB_SERVICE=XEPDB1
DB_USERNAME=digital_travel
DB_PASSWORD=your_password
JWT_SECRET=your_base64_secret_key_here_at_least_42_chars
```

---

## Ghi chú kỹ thuật

### Trạng thái hợp lệ

| Entity | Giá trị hợp lệ |
|--------|---------------|
| `TourThucTe.TrangThai` | CHO_KICH_HOAT · MO_BAN · SAP_DIEN_RA · DANG_DIEN_RA · KET_THUC · HUY · DA_QUYET_TOAN |
| `DonDatTour.TrangThai` | CHO_XAC_NHAN · DA_XAC_NHAN · DA_HUY · HET_HAN_GIU_CHO · CHO_HUY · THANH_TOAN_THAT_BAI |
| `GiaoDich.TrangThai` | CHO_THANH_TOAN · THANH_CONG · THAT_BAI · DA_HOAN_TIEN |
| `YeuCauHoTro.TrangThai` | MOI_TAO · DANG_XU_LY · DA_DONG |
| `ChiPhiThucTe.TrangThaiDuyet` | CHO_DUYET · DA_DUYET · TU_CHOI |
| `QuyetToan.TrangThai` | BAN_NHAP · DA_CHOT |
| `NhanVien.TrangThaiLamViec` | SAN_SANG · BAN · NGHI |
| `HoChieuSo.HangThanhVien` | THANH_VIEN · DONG · BAC · VANG · KIM_CUONG |

### Luồng đặt tour (business rules)

1. `datTour()` — Tạo `DonDatTour` (CHO_XAC_NHAN), `ThoiGianHetHan = NOW() + 15 phút`, KHÔNG trừ `ChoConLai`
2. Scheduler chạy mỗi 60 giây — chuyển đơn hết hạn sang HET_HAN_GIU_CHO
3. `khoiTaoThanhToan(mock=true)` — Tạo GiaoDich (THANH_CONG), đơn → DA_XAC_NHAN, trừ `ChoConLai`, tạo `LichSuTour`
4. `yeuCauHuyTour()` — chỉ cho đơn DA_XAC_NHAN; tính tỉ lệ hoàn theo ngày trước khởi hành
5. `duyetHuyTour()` — hoàn `ChoConLai`, tạo GiaoDich (HOAN_TIEN), đơn → DA_HUY

### Tỉ lệ hoàn tiền khi hủy

| Thời điểm trước khởi hành | Hoàn |
|---------------------------|------|
| Trên 15 ngày | 90% |
| 7 đến 15 ngày | 70% |
| 3 đến 7 ngày | 50% |
| Dưới 3 ngày | 0% |

### Naming conventions

- Lombok `@FieldDefaults(level = PRIVATE)` — field uppercase (e.g. `MaDatTour`) → getter `getMaDatTour()`
- `PhysicalNamingStrategyStandardImpl` — tên field Java == tên column Oracle (case-sensitive)
- ID prefix convention: `DDT_`, `TTT_`, `QT_`, `PC_`, `DD_`, `HD_`, `SC_`, `CP_`, `NV_`

### Tech Stack

| Layer | Công nghệ |
|-------|-----------|
| Language | Java 21 |
| Framework | Spring Boot 3.x |
| Security | Spring Security + JWT (jjwt) |
| ORM | Spring Data JPA / Hibernate |
| Database | Oracle 19c/21c (ojdbc8) |
| Validation | Jakarta Bean Validation |
| Connection Pool | HikariCP (max 10) |
| Utilities | Lombok |
| API Docs | Springdoc OpenAPI (Swagger UI) |
| Build | Maven (mvnw wrapper) |
| Scheduler | Spring @EnableScheduling |

