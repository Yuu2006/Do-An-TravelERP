# Hướng dẫn sử dụng Digital Travel ERP API

Base URL: `http://localhost:8080`

---

## 1. Cài đặt & Khởi chạy

### Yêu cầu
- Java 17+
- Maven 3.8+
- Oracle Database 18c+

### Cấu hình kết nối
Chỉnh sửa `src/main/resources/application.yaml`:
```yaml
spring:
  datasource:
    url: jdbc:oracle:thin:@localhost:1521/XEPDB1
    username: your_user
    password: your_password
```

### Khởi tạo Database & Dữ liệu mẫu (Seed Data)
Để phục vụ việc test toàn diện các Use-Case (UC), file script khởi tạo đã có sẵn dữ liệu mẫu.
```sql
-- Kết nối Oracle bằng SQL*Plus hoặc SQL Developer
@src/main/resources/db/KhoiTaoBang.sql
```

**Dữ liệu mẫu sau khi chạy script:**
- Mật khẩu chung của tất cả user: `<username>123`
- Ví dụ: `admin` -> `admin123`, `kh01` -> `kh123`

### Build & Run
```powershell
./mvnw.cmd spring-boot:run
```

---

## 2. Tài khoản mặc định (Dùng để Test)

| Vai trò    | Tên đăng nhập | Chức năng test / Dữ liệu đang có                         |
|------------|-------------|---------------------------------------------------------|
| **ADMIN**  | `admin`     | Dùng test UC24, UC54-56 (Voucher), quản lý User, Vai trò |
| **SANPHAM**| `sanpham01` | Dùng test tour mẫu, loại phòng, dịch vụ thêm, hành động xanh |
| **DIEUHANH**| `manager01`   | Dùng test định giá tour, phân công HDV                   |
| **KINHDOANH**  | `sales01`   | Dùng test UC34 (Xem đơn), UC41 (Xử lý khiếu nại)         |
| **KETOAN** | `ketoan01`  | Dùng test UC52 (Hoàn tiền), UC53 (Báo cáo doanh thu)     |
| **HDV**    | `hdv01`     | Dùng test UC39 (Lịch công tác), UC63 (Năng lực), Điểm danh|
| **KHACHHANG**| `kh01`      | Đã mua tour TTT099, có Lịch sử tour, hạng THANH_VIEN (350 điểm). Có voucher `WELCOME10`, `BAC15`. Dùng test UC22, UC28, UC30, UC31, UC35. |
| **KHACHHANG**| `kh02`      | Dùng test UC36, UC28 (Đơn chờ xác nhận DDT002). Đã có giao dịch HOAN_TIEN chờ xử lý (GD_HOA01). |

*(Ghi chú: Token Bearer sinh ra từ `/api/auth/dang-nhap` của các user trên phải được gắn vào Header Authorization trong mọi request phía dưới).*

---

## 3. Xác thực (Authentication)

### 3.1 Đăng ký tài khoản khách hàng

**Endpoint:** `POST /api/auth/dang-ky`
*(Public, không yêu cầu Token).*

**Dữ liệu mẫu để Test:**
```json
{
  "tenDangNhap": "testuser01",
  "matKhau": "123456",
  "xacNhanMatKhau": "123456",
  "hoTen": "Người Dùng Test",
  "email": "testuser01@example.com",
  "soDienThoai": "0999888777"
}
```

### 3.2 Đăng nhập

**Endpoint:** `POST /api/auth/dang-nhap`

**Dữ liệu mẫu để Test (Đăng nhập KH):**
```json
{
  "tenDangNhap": "kh01",
  "matKhau": "kh123"
}
```

---

## 4. Luồng nghiệp vụ Khách hàng (KHACHHANG)

*=> Lưu ý: Cần lấy token của `kh01` hoặc `kh02` (Vai trò: KHACHHANG) để test các UC này.*

### 4.1 UC22 — Xem lịch sử tour của tôi
**Endpoint:** `GET /api/khach-hang/lich-su-tour`
- **Dữ liệu mẫu:** Sử dụng tài khoản `kh01` sẽ thấy kết quả là đơn hàng `LS001` (Nằm trong tour `TTT099` đã đi).

### 4.2 UC25/26 — Xem tour công khai
**Endpoint:** `GET /api/public/tour?page=0&size=10` *(Không cần Token)*  
**Endpoint chi tiết:** `GET /api/public/tour/TTT001` *(TTT001 có sẵn trong DB)*

### 4.3 UC28 — Áp voucher vào đơn đặt tour
**Endpoint:** `POST /api/khach-hang/ap-voucher`

**Dữ liệu mẫu để Test (User kh01):**
```json
{
  "maDatTour": "DDT001",
  "maCode": "WELCOME10"
}
```
*(Trong DB DDT001 thuộc kh01, trạng thái DA_XAC_NHAN).*

### 4.4 UC30 — Đổi điểm xanh lấy voucher
**Endpoint:** `POST /api/khach-hang/doi-diem`

Quy tắc: Tiền giảm / 100đ, Phần trăm giảm x 50đ.  
**Dữ liệu mẫu (User kh01 - đang có 350đ):**
```json
{
  "maVoucher": "VC001"
}
```

### 4.5 UC31 — Ví voucher của tôi
**Endpoint:** `GET /api/khach-hang/vi-voucher`
- **Dữ liệu mẫu (User kh01):** Sẽ thấy có sẵn voucher WELCOME10 và BAC15.

### 4.6 UC35 — Gửi đánh giá tour
**Endpoint:** `POST /api/khach-hang/danh-gia`

Điều kiện: Phải có Lịch sử tour với `maTourThucTe` truyền lên.  
**Dữ liệu mẫu (User kh01 - đã hoàn thành tour TTT099):**
```json
{
  "maTourThucTe": "TTT099",
  "diemDanhGia": 5,
  "nhanXet": "Tour rất tuyệt vời, HDV chuyên nghiệp!"
}
```

### 4.7 UC36 — Gửi yêu cầu hỗ trợ / khiếu nại
**Endpoint:** `POST /api/khach-hang/yeu-cau-ho-tro`

**Dữ liệu mẫu (Bất kỳ KH nào):**
```json
{
  "tieuDe": "Hủy tour do bận việc gấp",
  "noiDung": "Tôi muốn hủy phần booking DDT002, xin hỗ trợ"
}
```

---

## 5. Luồng nghiệp vụ nhân viên KINHDOANH

*=> Yêu cầu dùng token của User `sales01`.*

### 5.1 UC34 — Xem danh sách đơn đặt tour
**Endpoint:** `GET /api/kinh-doanh/don-dat-tour?page=0&size=20`
- **Dữ liệu mẫu:** Trả về danh sách gồm `DDT001`, `DDT002`, `DDT099`.

### 5.2 UC41 — Xử lý yêu cầu hỗ trợ
Danh sách yêu cầu (do KH gửi từ UC36):
```
GET /api/kinh-doanh/yeu-cau-ho-tro
```

Cập nhật trạng thái xử lý (Thay `Mã yêu cầu` thực tế khi test):
```
PUT /api/kinh-doanh/yeu-cau-ho-tro/{maYeuCau}
```
**Body mẫu:**
```json
{
  "trangThai": "DANG_XU_LY",
  "ghiChu": "Đang tiến hành thủ tục hoàn trả cho khách"
}
```
*(Trạng thái hợp lệ: `MOI_TAO`, `DANG_XU_LY`, `DA_DONG`)*

---

## 6. Luồng nghiệp vụ Hướng dẫn viên (HDV)

*=> Yêu cầu dùng token của User `hdv01`.*

### 6.1 UC39 — Lịch công tác HDV
**Endpoint:** `GET /api/huong-dan-vien/lich-cong-tac`
- **Dữ liệu mẫu:** Bản thân `hdv01` đã được phân công thực tế trong database vào `TTT001` và `TTT099`. Output sẽ trả về list này.

### 6.2 UC63 — Xem năng lực bản thân
**Endpoint:** `GET /api/huong-dan-vien/nang-luc`

### 6.3 Điểm danh khách hàng trên tour (Dành cho HDV)
**Endpoint:** `POST /api/huong-dan-vien/tour/{maTour}/diem-danh`
**Body mẫu (Test HDV điểm danh kh01 trên tour TTT001):**
```json
{
  "maTourThucTe": "TTT001",
  "maDatTour": "DDT001",
  "trangThai": "CO_MAT"
}
```

---

## 7. Luồng nghiệp vụ Kế toán (KETOAN)

*=> Yêu cầu dùng token của User `ketoan01`.*

### 7.1 UC52 — Quản lý hoàn tiền khách hàng
**Lấy danh sách các giao dịch chờ hoàn (CHO_HOAN_TIEN):**
**Endpoint:** `GET /api/ke-toan/giao-dich-hoan`
- **Dữ liệu mẫu:** Hệ thống sẽ trả về mã giao dịch `GD_HOA01` (Của kh02 bị hủy).

**Xác nhận đã chuyển khoản thành công giao dịch hoàn:**
**Endpoint:** `PUT /api/ke-toan/giao-dich-hoan/GD_HOA01/xac-nhan`
*(Sau request này, trạng thái GD_HOA01 về DA_HOAN_TIEN).*

### 7.2 UC53 — Báo cáo doanh thu tổng hợp
**Endpoint:** `GET /api/ke-toan/bao-cao/doanh-thu?tuNgay=2025-01-01&denNgay=2026-12-31`
- **Dữ liệu mẫu:** DB có sẵn `GD001` thanh toán thành công 12tr, `GD099` thanh toán thành công 10tr. API sẽ trả về tổng doanh thu.

---

## 8. Luồng Quản trị & Kinh doanh

*=> Yêu cầu dùng token của User `admin`.*

### 8.1 UC24 — Tìm kiếm hồ sơ khách hàng toàn hệ thống
**Endpoint:** `GET /api/kinh-doanh/khach-hang?tuKhoa=nguyen&page=0&size=20`

### 8.2 UC54-56 — Quản lý phát hành Voucher (KINHDOANH)

**Tạo voucher mới:** `POST /api/kinh-doanh/voucher`
```json
{
  "maCode": "TET2026",
  "loaiUuDai": "SO_TIEN",
  "giaTriGiam": 500000,
  "dieuKienApDung": "Sale lễ tết",
  "soLuotPhatHanh": 50,
  "ngayHieuLuc": "2026-01-01",
  "ngayHetHan": "2026-03-31"
}
```

**Phát hành voucher (Bắn thẳng vào ví một danh sách user):**
`POST /api/kinh-doanh/voucher/TET2026/phat-hanh`
```json
{
  "maKhachHang": "KH001"
}
```

### 8.3 UC69 — Phân quyền / Đổi vai trò nhân viên
**Endpoint:** `PUT /api/quan-tri/nhan-vien/NV_KINHDOANH01/vai-tro`
```json
{
  "vaiTro": "DIEUHANH"
}
```

---

## 9. Dynamic Pricing (Tự động tăng giảm giá tour)
Là một tác vụ Cron Job chạy ngầm trên Background (`TourThucTeScheduler.java` chạy mỗi giờ `0 0 * * * *`).

**Quy tắc đổi giá:**
1. **Sắp diễn ra, đắt hàng**: Còn <= 7 ngày, số chỗ đã kín định mức >= 80% => **Tăng 10%** (Tối đa = 2.0 x GiaSan từ TourMau).
2. **Còn xa, ế hàng**: Còn >= 30 ngày, tỷ lệ kín chỗ < 30% => **Giảm 5%** (Tối thiểu = GiaSan từ TourMau).

**Cách Test thủ công không chờ cron:**  
Gọi trực tiếp Method Service `tourThucTeScheduler.updateDynamicPricing()` trong một endpoint test hoặc Unit Test. Để thuận tiện, DB đã chèn sẵn tour `TTT003` cận sát ngày khởi hành (Chờ hiệu ứng đổi).

---

## Ghi chú kỹ thuật (Bảng Trạng thái Constant)

| Thuộc tính (Entity) | Trạng thái có sẵn & Hợp lệ |
|---------------------|----------------------------|
| `DonDatTour.TrangThai`| `CHO_XAC_NHAN`, `DA_XAC_NHAN`, `DA_HUY`, `THANH_TOAN_THAT_BAI` |
| `TourThucTe.TrangThai`| `MO_BAN`, `DANG_DIEN_RA`, `KET_THUC`, `HUY`, `DA_QUYET_TOAN` |
| `GiaoDich.TrangThai` | `CHO_THANH_TOAN`, `THANH_CONG`, `THAT_BAI`, `DA_HOAN_TIEN` |
| `GiaoDich.LoaiGiaoDich`| `THANH_TOAN`, `HOAN_TIEN` |
| `Voucher.LoaiUuDai` | `PHAN_TRAM`, `SO_TIEN` |
| `YeuCauHoTro.TrangThai`| `MOI_TAO`, `DANG_XU_LY`, `DA_DONG` |
| `HoChieuSo.HangThanhVien`| `THANH_VIEN` (0đ), `DONG` (500đ), `BAC` (1000đ), `VANG` (2000đ), `KIM_CUONG` (5000đ) |

**Cổng Swagger UI (Giao diện đồ họa để Test chi tiết):**
- Truy cập: `http://localhost:8080/swagger-ui/index.html`
- Tại đây đã liệt kê 100% các endpoint với tham số mẫu do hệ thống tự sinh. Chú ý click nút "Authorize" (ổ khóa) để add token Bearer trước khi gọi.
# Hướng dẫn sử dụng Digital Travel ERP API

Base URL: `http://localhost:8080`

---

## 1. Cài đặt & Khởi chạy

### Yêu cầu
- Java 17+
- Maven 3.8+
- Oracle Database 18c+

### Cấu hình kết nối
Chỉnh sửa `src/main/resources/application.yaml`:
```yaml
spring:
  datasource:
    url: jdbc:oracle:thin:@localhost:1521/XEPDB1
    username: your_user
    password: your_password
```

### Khởi tạo Database
```sql
-- Kết nối Oracle bằng SQL*Plus hoặc SQL Developer
@src/main/resources/db/KhoiTaoBang.sql
```

### Build & Run
```powershell
./mvnw.cmd spring-boot:run
```

---

## 2. Tài khoản mặc định (Seed Data)

| Vai trò    | Username    | Password     | Ghi chú                          |
|------------|-------------|--------------|----------------------------------|
| ADMIN      | `admin`     | `admin123`   | Quản trị toàn hệ thống           |
| SANPHAM    | `sanpham01` | `sanpham01123` | Nhân viên sản phẩm             |
| DIEUHANH    | `manager01`   | `manager01123` | Quản lý                          |
| KINHDOANH      | `sales01`   | `sales123`   | Nhân viên kinh doanh             |
| KETOAN     | `ketoan01`  | `ketoan123`  | Kế toán                          |
| HDV        | `hdv01`     | `hdv123`     | Hướng dẫn viên                   |
| KHACHHANG  | `kh01`      | `kh123`      | Khách hàng 1 (hạng THANH_VIEN, 350đ) |
| KHACHHANG  | `kh02`      | `kh123`      | Khách hàng 2 (hạng THANH_VIEN)       |

---

## 3. Xác thực (Authentication)

### 3.1 Đăng ký tài khoản khách hàng

**Endpoint:** `POST /api/auth/dang-ky`

**Yêu cầu token:** Không (public)

**Headers:**
```
Content-Type: application/json
```

**Body:**
```json
{
  "tenDangNhap": "nguyenvana",
  "matKhau": "123456",
  "xacNhanMatKhau": "123456",
  "hoTen": "Nguyen Van A",
  "email": "nguyenvana@example.com",
  "soDienThoai": "0901234567"
}
```

**Response thành công (201):**
```json
{
  "status": 201,
  "success": true,
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiJ9...",
    "tokenType": "Bearer",
    "maVaiTro": "KHACHHANG",
    "hoTen": "Nguyen Van A"
  }
}
```

---

### 3.2 Đăng nhập

**Endpoint:** `POST /api/auth/dang-nhap`

**Body:**
```json
{
  "tenDangNhap": "admin",
  "matKhau": "admin123"
}
```

**Response:**
```json
{
  "status": 200,
  "success": true,
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiJ9...",
    "tokenType": "Bearer",
    "maVaiTro": "ADMIN"
  }
}
```

Sử dụng token trong header tất cả các request tiếp theo:
```
Authorization: Bearer <accessToken>
```

---

### 3.3 Xem thông tin tài khoản

**Endpoint:** `GET /api/auth/toi`

**Yêu cầu token:** Có

---

### 3.4 Đổi mật khẩu

**Endpoint:** `PUT /api/auth/doi-mat-khau`

**Body:**
```json
{
  "matKhauCu": "123456",
  "matKhauMoi": "newpass123",
  "xacNhanMatKhauMoi": "newpass123"
}
```

---

## 4. Hồ sơ khách hàng

### 4.1 Xem hồ sơ

**Endpoint:** `GET /api/khach-hang/ho-so`

**Vai trò:** KHACHHANG

### 4.2 Cập nhật hồ sơ

**Endpoint:** `PUT /api/khach-hang/ho-so`

**Vai trò:** KHACHHANG

**Body:**
```json
{
  "diUng": "Hải sản, Gluten",
  "ghiChuYTe": "Cao huyết áp, dùng thuốc định kỳ"
}
```

---

## 5. Luồng nghiệp vụ theo vai trò

### 5.1 Khách hàng (KHACHHANG)

#### UC22 — Xem lịch sử tour
```
GET /api/khach-hang/lich-su-tour
Authorization: Bearer <token>
```

#### UC25/26 — Tour công khai (không cần đăng nhập)
```
GET /api/public/tour
GET /api/public/tour/{maTourThucTe}
GET /api/public/tour/{maTourThucTe}/danh-gia
```

Ví dụ:
```
GET /api/public/tour?page=0&size=10
```

#### UC28 — Áp voucher vào đơn đặt tour
```
POST /api/khach-hang/ap-voucher
Content-Type: application/json
Authorization: Bearer <token>

{
  "maDatTour": "DDT001",
  "maCode": "WELCOME10"
}
```

#### UC30 — Đổi điểm xanh lấy voucher
```
POST /api/khach-hang/doi-diem
Content-Type: application/json
Authorization: Bearer <token>

{
  "maVoucher": "VC001"
}
```

Quy tắc đổi điểm:
- Voucher loại `SO_TIEN`: GiaTriGiam / 100 điểm
- Voucher loại `PHAN_TRAM`: GiaTriGiam × 50 điểm

#### UC31 — Ví voucher của tôi
```
GET /api/khach-hang/vi-voucher
Authorization: Bearer <token>
```

#### UC35 — Gửi đánh giá tour
```
POST /api/khach-hang/danh-gia
Content-Type: application/json
Authorization: Bearer <token>

{
  "maTourThucTe": "TTT099",
  "diemDanhGia": 5,
  "nhanXet": "Tour rất tuyệt vời, HDV nhiệt tình!"
}
```

Điều kiện: khách hàng phải có lịch sử tour tương ứng, chưa đánh giá tour này.

#### UC36 — Gửi yêu cầu hỗ trợ / khiếu nại
```
POST /api/khach-hang/yeu-cau-ho-tro
Content-Type: application/json
Authorization: Bearer <token>

{
  "tieuDe": "Khiếu nại dịch vụ",
  "noiDung": "HDV đến muộn 2 tiếng, không có giải thích..."
}
```

Xem danh sách yêu cầu của mình:
```
GET /api/khach-hang/yeu-cau-ho-tro
Authorization: Bearer <token>
```

---

### 5.2 Nhân viên KINHDOANH

#### UC34 — Xem danh sách đơn đặt tour
```
GET /api/kinh-doanh/don-dat-tour?page=0&size=20
Authorization: Bearer <token>
```

#### UC41 — Xử lý yêu cầu hỗ trợ

Danh sách yêu cầu:
```
GET /api/kinh-doanh/yeu-cau-ho-tro
Authorization: Bearer <token>
```

Cập nhật trạng thái:
```
PUT /api/kinh-doanh/yeu-cau-ho-tro/{maYeuCau}
Content-Type: application/json
Authorization: Bearer <token>

{
  "trangThai": "DA_DONG",
  "ghiChu": "Đã liên hệ và giải quyết xong với khách hàng."
}
```

Giá trị `trangThai` hợp lệ: `MOI_TAO`, `DANG_XU_LY`, `DA_DONG`

---

### 5.3 Hướng dẫn viên (HDV)

#### UC39 — Xem lịch công tác
```
GET /api/huong-dan-vien/lich-cong-tac
Authorization: Bearer <token>
```

#### UC63 — Xem năng lực bản thân
```
GET /api/huong-dan-vien/nang-luc
Authorization: Bearer <token>
```

---

### 5.4 Kế toán (KETOAN)

#### Quản lý quyết toán

Danh sách tour cần quyết toán:
```
GET /api/ke-toan/tour-can-quyet-toan
Authorization: Bearer <token>
```

Tính toán sơ bộ:
```
GET /api/ke-toan/tinh-toan/{maTour}
Authorization: Bearer <token>
```

Tạo quyết toán:
```
POST /api/ke-toan/quyet-toan/{maTour}
Authorization: Bearer <token>
```

Chốt quyết toán:
```
PUT /api/ke-toan/quyet-toan/{maQuyetToan}/chot
Authorization: Bearer <token>
```

#### UC52 — Quản lý hoàn tiền

Danh sách giao dịch chờ hoàn:
```
GET /api/ke-toan/giao-dich-hoan
Authorization: Bearer <token>
```

Xác nhận đã chuyển khoản hoàn tiền:
```
PUT /api/ke-toan/giao-dich-hoan/{maGiaoDich}/xac-nhan
Authorization: Bearer <token>
```

#### UC53 — Báo cáo doanh thu
```
GET /api/ke-toan/bao-cao/doanh-thu
Authorization: Bearer <token>
```

Lọc theo kỳ (format ISO: yyyy-MM-dd):
```
GET /api/ke-toan/bao-cao/doanh-thu?tuNgay=2026-01-01&denNgay=2026-06-30
Authorization: Bearer <token>
```

**Response mẫu:**
```json
{
  "tongDoanhThu": 350000000,
  "soQuyetToan": 12,
  "soDonDatTour": 87,
  "soTourKetThuc": 12,
  "topTour": [
    {
      "maTourThucTe": "TTT001",
      "tieuDe": "Hạ Long 3N2Đ",
      "soDon": 25,
      "doanhThu": 87500000
    }
  ]
}
```

---

### 5.5 Admin

#### UC24 — Tìm kiếm hồ sơ khách hàng
```
GET /api/kinh-doanh/khach-hang?tuKhoa=nguyen&page=0&size=20
Authorization: Bearer <token>

GET /api/kinh-doanh/khach-hang/{maKhachHang}
Authorization: Bearer <token>
```

#### UC54-56 — Quản lý Voucher

Danh sách:
```
GET /api/kinh-doanh/voucher
GET /api/kinh-doanh/voucher?trangThai=SAN_SANG
Authorization: Bearer <token>
```

Tạo mới:
```
POST /api/kinh-doanh/voucher
Content-Type: application/json
Authorization: Bearer <token>

{
  "maCode": "NEWYEAR25",
  "loaiUuDai": "PHAN_TRAM",
  "giaTriGiam": 25,
  "dieuKienApDung": "Áp dụng cho đơn từ 5 triệu trở lên",
  "soLuotPhatHanh": 100,
  "ngayHieuLuc": "2026-12-25",
  "ngayHetHan": "2027-01-10"
}
```

Giá trị `loaiUuDai`: `PHAN_TRAM` (%) hoặc `SO_TIEN` (VND)

Vô hiệu hóa:
```
PUT /api/kinh-doanh/voucher/{maVoucher}/vo-hieu
Authorization: Bearer <token>
```

Phát hành cho khách hàng:
```
POST /api/kinh-doanh/voucher/{maVoucher}/phat-hanh
Content-Type: application/json
Authorization: Bearer <token>

{
  "maKhachHang": "KH001"
}
```

#### Quản lý đánh giá (Admin)
```
GET /api/kinh-doanh/danh-gia
GET /api/kinh-doanh/danh-gia?trangThai=HIEU_LUC
Authorization: Bearer <token>
```

#### UC63 — Năng lực HDV (Admin)

Xem năng lực:
```
GET /api/dieu-hanh/nhan-vien/{maNhanVien}/nang-luc
Authorization: Bearer <token>
```

Cập nhật:
```
PUT /api/dieu-hanh/nhan-vien/{maNhanVien}/nang-luc
Content-Type: application/json
Authorization: Bearer <token>

{
  "ngonNgu": "Tiếng Việt, Tiếng Anh (IELTS 7.5), Tiếng Pháp (B2)",
  "chungChi": "HDV quốc tế, Sơ cứu nâng cao, WSET Level 2",
  "chuyenMon": "Miền Bắc, Eco-tour, Du thuyền"
}
```

#### UC69 — Gán vai trò nhân viên
```
PUT /api/quan-tri/nhan-vien/{maNhanVien}/vai-tro
Content-Type: application/json
Authorization: Bearer <token>

{
  "vaiTro": "HDV"
}
```

Giá trị `vaiTro` hợp lệ: `SANPHAM`, `KINHDOANH`, `DIEUHANH`, `KETOAN`, `HDV`

---

## 6. Quản lý Tour (Sản phẩm/Điều hành)

### Tour mẫu

```
GET    /api/san-pham/tour-mau
POST   /api/san-pham/tour-mau
PUT    /api/san-pham/tour-mau/{id}
DELETE /api/san-pham/tour-mau/{id}
```

### Tour thực tế

```
GET    /api/dieu-hanh/tour-thuc-te
POST   /api/dieu-hanh/tour-thuc-te
PUT    /api/dieu-hanh/tour-thuc-te/{id}
```

### Phòng & Dịch vụ thêm

```
GET    /api/san-pham/loai-phong
POST   /api/san-pham/loai-phong
GET    /api/san-pham/dich-vu-them
POST   /api/san-pham/dich-vu-them
```

---

## 7. Tính năng tự động

### Dynamic Pricing (Định giá động)

Scheduler chạy **mỗi giờ** tự động điều chỉnh giá các tour đang mở bán:

| Điều kiện | Hành động |
|-----------|-----------|
| Còn ≤ 7 ngày đến khởi hành **VÀ** tỷ lệ đặt chỗ ≥ 80% | Tăng giá 10% (tối đa 2× giá sàn) |
| Còn ≥ 30 ngày đến khởi hành **VÀ** tỷ lệ đặt chỗ < 30% | Giảm giá 5% (tối thiểu bằng giá sàn) |

### Nâng hạng thành viên (Tự động)

Sau mỗi lần tích điểm xanh từ hành động xanh, hệ thống tự kiểm tra và nâng hạng:

| Điểm tích lũy | Hạng thành viên |
|--------------|-----------------|
| 0 – 499      | THANH_VIEN |
| 500 – 999    | DONG       |
| 1000 – 1999  | BAC        |
| 2000 – 4999  | VANG       |
| ≥ 5000       | KIM_CUONG  |

---

## 8. Hành động xanh & Điểm xanh

### Xem danh sách hành động xanh
```
GET /api/public/hanh-dong-xanh
```

### Ghi nhận hành động xanh (cho khách hàng)
```
POST /api/huong-dan-vien/tour/{maTour}/hanh-dong-xanh
Content-Type: application/json
Authorization: Bearer <token>

{
  "maHanhDong": "HD001",
  "maTourThucTe": "TTT001"
}
```

---

## 9. Phân công tour & Điểm danh (Manager/HDV)

### Phân công HDV cho tour
```
POST /api/dieu-hanh/phan-cong
Content-Type: application/json
Authorization: Bearer <token>

{
  "maTourThucTe": "TTT001",
  "maNhanVien": "NV_HDV01",
  "vaiTro": "HDV_CHINH"
}
```

### Điểm danh khách hàng (HDV)
```
POST /api/huong-dan-vien/tour/{maTour}/diem-danh
Content-Type: application/json
Authorization: Bearer <token>

{
  "maTourThucTe": "TTT001",
  "maDatTour": "DDT001",
  "trangThai": "CO_MAT"
}
```

---

## 10. Chi phí thực tế & Quyết toán (KeToan)

### Quản lý chi phí

```
GET  /api/ke-toan/chi-phi?maTour=TTT001
POST /api/ke-toan/chi-phi
PUT  /api/ke-toan/chi-phi/{maChiPhi}/duyet
PUT  /api/ke-toan/chi-phi/{maChiPhi}/tu-choi
```

---

## 11. Swagger / API Docs

Sau khi ứng dụng chạy, truy cập:
- **Swagger UI:** `http://localhost:8080/swagger-ui/index.html`
- **OpenAPI JSON:** `http://localhost:8080/v3/api-docs`

---

## 12. Ghi chú kỹ thuật

### Trạng thái đơn đặt tour (`DONDATTOUR.TrangThai`)
| Giá trị | Ý nghĩa |
|---------|---------|
| `CHO_XAC_NHAN` | Chờ KINHDOANH xác nhận |
| `DA_XAC_NHAN` | Đã xác nhận, chờ thanh toán |
| `DA_HUY` | Đã hủy |
| `HET_HAN_GIU_CHO` | Hết hạn giữ chỗ |
| `CHO_HUY` | Yêu cầu hủy đang xử lý |
| `THANH_TOAN_THAT_BAI` | Thanh toán thất bại |

### Trạng thái tour thực tế (`TOURTHUCTE.TrangThai`)
| Giá trị | Ý nghĩa |
|---------|---------|
| `CHO_KICH_HOAT` | Chờ kích hoạt |
| `MO_BAN` | Đang mở bán |
| `SAP_DIEN_RA` | Sắp diễn ra |
| `DANG_DIEN_RA` | Đang diễn ra |
| `KET_THUC` | Đã kết thúc |
| `HUY` | Đã hủy |
| `DA_QUYET_TOAN` | Đã quyết toán |

### Trạng thái giao dịch (`GIAODICH.TrangThai`)
| Giá trị | Ý nghĩa |
|---------|---------|
| `CHO_THANH_TOAN` | Đang chờ |
| `THANH_CONG` | Thành công |
| `THAT_BAI` | Thất bại |
| `DA_HOAN_TIEN` | Đã hoàn tiền |

---

## 13. Xác thực nâng cao (Auth)

### 13.1 Quên mật khẩu
**Endpoint:** `POST /api/auth/quen-mat-khau` *(Không cần Token)*

**Body:**
```json
{
  "tenDangNhap": "kh01"
}
```
**Response:** Trả về `resetToken` (hợp lệ 15 phút). Môi trường production thay bằng gửi email.

### 13.2 Đặt lại mật khẩu
**Endpoint:** `POST /api/auth/dat-lai-mat-khau` *(Không cần Token)*

**Body:**
```json
{
  "resetToken": "<token từ bước trên>",
  "matKhauMoi": "newpass123",
  "xacNhanMatKhau": "newpass123"
}
```

### 13.3 Đăng xuất
**Endpoint:** `POST /api/auth/dang-xuat`  
*(Phía client xóa token. Server trả 200 ngay lập tức, không blacklist token.)*

---

## 14. Quản trị — Quản lý nhân viên

### 14.1 Tạo tài khoản nhân viên
**Endpoint:** `POST /api/quan-tri/dang-ky-nhan-vien`  
**Vai trò:** ADMIN

**Dữ liệu mẫu:**
```json
{
  "tenDangNhap": "hdv_new01",
  "matKhau": "hdv123",
  "hoTen": "Nguyen Thi Mai",
  "email": "mai.hdv@company.vn",
  "soDienThoai": "0912345678",
  "maVaiTro": "HDV"
}
```
Giá trị `maVaiTro` hợp lệ: `SANPHAM`, `KINHDOANH`, `DIEUHANH`, `KETOAN`, `HDV`

### 14.2 UC68 — Danh sách nhân viên
**Endpoint:** `GET /api/quan-tri/nhan-vien?hoTen=&maVaiTro=HDV&trangThai=&page=0&size=10`  
**Vai trò:** ADMIN, DIEUHANH

### 14.3 UC68 — Chi tiết nhân viên
**Endpoint:** `GET /api/quan-tri/nhan-vien/{maNhanVien}`  
**Vai trò:** ADMIN, DIEUHANH

### 14.4 UC66 — Khóa tài khoản nhân viên
**Endpoint:** `PUT /api/quan-tri/nhan-vien/{maNhanVien}/khoa`  
**Vai trò:** ADMIN  
**Test:** `PUT /api/quan-tri/nhan-vien/NV_HDV01/khoa`

### 14.5 UC67 — Mở khóa tài khoản nhân viên
**Endpoint:** `PUT /api/quan-tri/nhan-vien/{maNhanVien}/mo-khoa`  
**Vai trò:** ADMIN

---

## 15. Khách hàng — Đặt tour & Quản lý đơn

*=> Token của `kh01` hoặc `kh02`.*

### 15.1 UC27 — Đặt tour
**Endpoint:** `POST /api/khach-hang/dat-tour`

**Dữ liệu mẫu:**
```json
{
  "maTourThucTe": "TTT001",
  "soLuongKhach": 2,
  "loaiPhong": "DELUXE",
  "dsDichVuThem": ["DV001", "DV002"],
  "ghiChu": "Ăn chay cho 1 người"
}
```
- `dsDichVuThem`: danh sách `maDichVuThem` từ `/api/san-pham/dich-vu-them`
- `loaiPhong`: mã từ `/api/san-pham/loai-phong`

### 15.2 Xem danh sách đơn của tôi
**Endpoint:** `GET /api/khach-hang/dat-tour?page=0&size=10`  
**Dữ liệu mẫu (kh01):** Trả về DDT001, DDT099.

### 15.3 Chi tiết đơn của tôi
**Endpoint:** `GET /api/khach-hang/dat-tour/DDT001`

### 15.4 Hủy đơn (khi còn CHO_XAC_NHAN)
**Endpoint:** `DELETE /api/khach-hang/dat-tour/{maDatTour}`  
*(Chỉ hủy được khi đơn đang ở trạng thái `CHO_XAC_NHAN`. Đơn chuyển sang `DA_HUY`.)*

### 15.5 UC32 — Yêu cầu hủy tour đã thanh toán (DA_XAC_NHAN)
**Endpoint:** `POST /api/khach-hang/dat-tour/{maDatTour}/huy`

**Dữ liệu mẫu (kh01 — đơn DDT001):**
```json
{
  "lyDoHuy": "Thay đổi kế hoạch cá nhân, không thể đi được",
  "soTaiKhoanNganHang": "1234567890",
  "tenNganHang": "BIDV"
}
```
*(Tạo bản ghi `YeuCauHoTro`. KINHDOANH duyệt qua UC33. KeToan chuyển tiền qua UC52.)*

---

## 16. KINHDOANH — Xác nhận đơn & Xử lý hủy tour

*=> Token của `sales01`.*

### 16.1 Xác nhận đơn đặt tour
**Endpoint:** `PUT /api/kinh-doanh/dat-tour/{maDatTour}/xac-nhan`  
**Vai trò:** ADMIN, DIEUHANH, KINHDOANH

**Test:** `PUT /api/kinh-doanh/dat-tour/DDT002/xac-nhan`  
*(Đơn DDT002 đang `CHO_XAC_NHAN`, sau xác nhận sẽ thành `DA_XAC_NHAN`.)*

### 16.2 UC33 — Danh sách yêu cầu hủy tour
**Endpoint:** `GET /api/kinh-doanh/yeu-cau-huy?loaiYeuCau=&trangThai=MOI_TAO&page=0&size=10`  
**Vai trò:** ADMIN, DIEUHANH, KINHDOANH

### 16.3 UC33 — Duyệt yêu cầu hủy tour
**Endpoint:** `POST /api/kinh-doanh/yeu-cau-huy/{maYeuCau}/duyet`

**Body (có thể để trống hoặc truyền thêm ghi chú):**
```json
{
  "ghiChu": "Đã xác nhận đủ điều kiện hoàn tiền theo chính sách"
}
```

### 16.4 UC33 — Từ chối yêu cầu hủy tour
**Endpoint:** `POST /api/kinh-doanh/yeu-cau-huy/{maYeuCau}/tu-choi`

```json
{
  "ghiChu": "Tour đã khởi hành, không thể hoàn tiền"
}
```

---

## 17. HDV — Vận hành tour trên chuyến đi

*=> Token của `hdv01`.*

### 17.1 Xem tour được giao (đơn giản)
**Endpoint:** `GET /api/huong-dan-vien/tour-cua-toi`  
*(Giống `/api/huong-dan-vien/lich-cong-tac` nhưng trả về format PhanCongResponse.)*

### 17.2 UC42 — Xem danh sách đoàn khách trên tour
**Endpoint:** `GET /api/huong-dan-vien/tour/{maTour}/doan`  
**Vai trò:** ADMIN, DIEUHANH, HDV

**Test:** `GET /api/huong-dan-vien/tour/TTT001/doan`

### 17.3 UC43 — Điểm danh khách
**Endpoint:** `POST /api/huong-dan-vien/tour/{maTour}/diem-danh`

**Dữ liệu mẫu (hdv01 điểm danh kh01 trên TTT001):**
```json
{
  "maDatTour": "DDT001",
  "trangThai": "CO_MAT"
}
```
Giá trị `trangThai` hợp lệ: `CO_MAT`, `VANG_MAT`, `TRE_MUON`

### 17.4 UC44 — Ghi nhận hành động xanh trong chuyến
**Endpoint:** `POST /api/huong-dan-vien/tour/{maTour}/hanh-dong-xanh`  
**Vai trò:** ADMIN, HDV

**Dữ liệu mẫu:**
```json
{
  "maKhachHang": "KH001",
  "maHanhDong": "HD001",
  "ghiChu": "Khách mang túi tái sử dụng trong suốt hành trình"
}
```
*(Hành động này tự động tích điểm xanh và kiểm tra nâng hạng thành viên.)*

### 17.5 UC45 — Báo cáo sự cố
**Xem danh sách sự cố:** `GET /api/huong-dan-vien/tour/{maTour}/su-co`

**Báo cáo sự cố mới:**  
`POST /api/huong-dan-vien/tour/{maTour}/su-co`
```json
{
  "tieuDe": "Khách bị cảm nắng",
  "moTa": "Một khách trong đoàn bị cảm nắng nhẹ lúc 14:00, đã xử lý bằng thuốc sơ cứu",
  "mucDoNghiemTrong": "NHE"
}
```

**Cập nhật sự cố:**  
`PUT /api/huong-dan-vien/su-co/{maSuCo}`
```json
{
  "tieuDe": "Khách bị cảm nắng — đã xử lý xong",
  "moTa": "Khách đã hồi phục, tiếp tục hành trình bình thường",
  "mucDoNghiemTrong": "NHE"
}
```

### 17.6 UC46 — Khai chi phí phát sinh
**Endpoint:** `POST /api/huong-dan-vien/tour/{maTour}/chi-phi`

**Dữ liệu mẫu:**
```json
{
  "loaiChiPhi": "PHAT_SINH",
  "soTien": 500000,
  "moTa": "Mua thêm nước uống cho đoàn do nắng nóng bất ngờ",
  "hoaDonUrl": "https://example.com/hoadon.jpg"
}
```

**Xem chi phí của tour:** `GET /api/huong-dan-vien/tour/{maTour}/chi-phi`

---

## 18. Kế toán — Duyệt chi phí phát sinh

*=> Token của `ketoan01`.*

### 18.1 Danh sách chi phí (lọc theo trạng thái)
**Endpoint:** `GET /api/ke-toan/chi-phi?trangThai=CHO_DUYET&page=0&size=20`

### 18.2 Duyệt chi phí
**Endpoint:** `PUT /api/ke-toan/chi-phi/{maChiPhi}/duyet`

### 18.3 Từ chối chi phí
**Endpoint:** `PUT /api/ke-toan/chi-phi/{maChiPhi}/tu-choi`

---

## 19. Quyết toán — Endpoints đầy đủ

*=> Token của `ketoan01`.*

| Endpoint | Mô tả |
|----------|-------|
| `GET /api/ke-toan/tour-can-quyet-toan` | UC47 — Tour KET_THUC chưa có quyết toán |
| `GET /api/ke-toan/tinh-toan/{maTour}` | UC48 — Xem trước quyết toán (không lưu) |
| `POST /api/ke-toan/quyet-toan/{maTour}` | UC49 — Tạo/cập nhật bản nháp |
| `PUT /api/ke-toan/quyet-toan/{maQuyetToan}/chot` | UC50 — Chốt quyết toán |
| `GET /api/ke-toan/quyet-toan?trangThai=BAN_NHAP` | UC51 — Danh sách quyết toán (lọc) |
| `GET /api/ke-toan/quyet-toan/{maQuyetToan}` | Chi tiết 1 quyết toán |

**Dữ liệu mẫu Test UC47-50:**  
Trong DB có tour `TTT099` (KET_THUC). Dùng `maTour = TTT099` qua từng bước UC48 → UC49 → UC50.

---

## 20. UC29 — Thanh toán

*=> Token của `kh01` hoặc `kh02`.*

### 20.1 Khởi tạo giao dịch thanh toán
**Endpoint:** `POST /api/thanh-toan/khoi-tao`

**Dữ liệu mẫu (kh01 thanh toán đơn DDT001):**
```json
{
  "maDatTour": "DDT001",
  "mock": true
}
```
- `mock: true` → Bỏ qua cổng MoMo, tự động tạo giao dịch THANH_CONG (dùng khi test dev).
- `mock: false` → Gửi request thật đến MoMo (cần cấu hình key MoMo).

### 20.2 Kiểm tra kết quả giao dịch (polling)
**Endpoint:** `GET /api/thanh-toan/{maDatTour}/ket-qua`

**Test:** `GET /api/thanh-toan/DDT001/ket-qua`

---

## 21. Phân công HDV — Endpoints đầy đủ

*=> Token của `manager01`.*

### 21.1 UC38 — Xem HDV khả dụng cho tour
**Endpoint:** `GET /api/dieu-hanh/hdv-kha-dung?maTourThucTe=TTT001`  
*(Trả về HDV chưa có lịch trùng với ngày tour TTT001.)*

### 21.2 UC37 — Phân công HDV vào tour
**Endpoint:** `POST /api/dieu-hanh/phan-cong`

**Dữ liệu mẫu:**
```json
{
  "maTourThucTe": "TTT001",
  "maNhanVien": "NV_HDV01",
  "vaiTro": "HDV_CHINH"
}
```

### 21.3 UC37 — Hủy phân công
**Endpoint:** `DELETE /api/dieu-hanh/phan-cong/{maPhanCong}`

---

## 22. Tour mẫu — Endpoints đầy đủ (SANPHAM)

*=> Token của `sanpham01`.*

| Endpoint | UC | Mô tả |
|----------|-----|-------|
| `GET /api/san-pham/tour-mau?tieuDe=&trangThai=&page=0` | UC06 | Danh sách + filter |
| `GET /api/san-pham/tour-mau/{id}` | UC06 | Chi tiết + lịch trình |
| `POST /api/san-pham/tour-mau` | UC02 | Tạo tour mẫu mới |
| `PUT /api/san-pham/tour-mau/{id}` | UC04 | Sửa tour mẫu |
| `DELETE /api/san-pham/tour-mau/{id}` | UC05 | Xóa mềm (ẩn) |
| `POST /api/san-pham/tour-mau/{id}/sao-chep` | UC03 | Sao chép tour mẫu |
| `POST /api/san-pham/tour-mau/{id}/lich-trinh` | UC08 | Thêm ngày lịch trình |
| `PUT /api/san-pham/tour-mau/{id}/lich-trinh/{maLT}` | UC09 | Sửa lịch trình |
| `DELETE /api/san-pham/tour-mau/{id}/lich-trinh/{maLT}` | UC09 | Xóa lịch trình |

**Dữ liệu mẫu tạo tour mẫu (POST /api/san-pham/tour-mau):**
```json
{
  "tieuDe": "Hội An - Đà Nẵng 3N2Đ",
  "moTa": "Tour trải nghiệm văn hóa miền Trung",
  "thoiLuong": 3,
  "soNguoiToiDa": 20,
  "soNguoiToiThieu": 5,
  "giaSan": 3500000,
  "loaiTour": "TRONG_NUOC",
  "diemKhoiHanh": "Hà Nội",
  "diemDen": "Đà Nẵng"
}
```

**Dữ liệu mẫu thêm lịch trình (POST /api/san-pham/tour-mau/TM001/lich-trinh):**
```json
{
  "ngayThu": 1,
  "hoatDong": "Khởi hành từ Hà Nội, bay vào Đà Nẵng, check-in khách sạn",
  "moTa": "Máy bay 06:00, đến Đà Nẵng 08:00, xe đưa đón khách sạn",
  "thucDon": "Bữa trưa hải sản Mỹ Khê, bữa tối buffet"
}
```

---

## 23. Tour thực tế — Endpoints đầy đủ

*=> Token của `manager01`.*

| Endpoint | UC | Vai trò | Mô tả |
|----------|-----|---------|-------|
| `GET /api/dieu-hanh/tour-thuc-te?trangThai=MO_BAN` | UC14 | Tất cả (trừ public) | Danh sách nội bộ |
| `GET /api/dieu-hanh/tour-thuc-te?congKhai=true` | UC25 | Tất cả | Chỉ tour đang mở bán, còn chỗ |
| `GET /api/dieu-hanh/tour-thuc-te/{id}` | UC14 | Tất cả | Chi tiết |
| `POST /api/dieu-hanh/tour-thuc-te` | UC11 | DIEUHANH | Tạo từ tour mẫu |
| `PUT /api/dieu-hanh/tour-thuc-te/{id}` | UC13 | DIEUHANH | Sửa thông tin |
| `DELETE /api/dieu-hanh/tour-thuc-te/{id}` | UC12 | DIEUHANH | Hủy tour (→ HUY) |

**Dữ liệu mẫu tạo tour thực tế (POST /api/dieu-hanh/tour-thuc-te):**
```json
{
  "maTourMau": "TM001",
  "ngayKhoiHanh": "2026-08-15",
  "soKhachToiDa": 20,
  "soKhachToiThieu": 5,
  "giaHienHanh": 3800000
}
```

---

## 24. Hành động xanh — Quản lý CRUD

| Endpoint | Vai trò | Mô tả |
|----------|---------|-------|
| `GET /api/san-pham/hanh-dong-xanh` | SANPHAM | Danh sách |
| `GET /api/san-pham/hanh-dong-xanh/{id}` | SANPHAM | Chi tiết |
| `POST /api/san-pham/hanh-dong-xanh` | SANPHAM | Tạo mới |
| `PUT /api/san-pham/hanh-dong-xanh/{id}` | SANPHAM | Sửa |
| `DELETE /api/san-pham/hanh-dong-xanh/{id}` | SANPHAM | Xóa |

**Dữ liệu mẫu (POST /api/san-pham/hanh-dong-xanh) — Token sanpham01:**
```json
{
  "tenHanhDong": "Không dùng nhựa một lần",
  "moTa": "Khách mang bình nước cá nhân, không dùng chai nhựa trong suốt hành trình",
  "diemThuong": 30
}
```

---

## 25. Dịch vụ thêm — Quản lý CRUD

| Endpoint | Vai trò | Mô tả |
|----------|---------|-------|
| `GET /api/san-pham/dich-vu-them` | SANPHAM | Danh sách dịch vụ |
| `POST /api/san-pham/dich-vu-them` | SANPHAM | Tạo mới |
| `PUT /api/san-pham/dich-vu-them/{id}` | SANPHAM | Sửa |
| `DELETE /api/san-pham/dich-vu-them/{id}` | SANPHAM | Xóa |

**Dữ liệu mẫu (POST /api/san-pham/dich-vu-them) — Token sanpham01:**
```json
{
  "tenDichVu": "Bảo hiểm du lịch cao cấp",
  "moTa": "Bảo hiểm tai nạn + hành lý + hủy chuyến",
  "giaTien": 150000
}
```

---

## 26. Loại phòng — Quản lý CRUD

| Endpoint | Vai trò | Mô tả |
|----------|---------|-------|
| `GET /api/san-pham/loai-phong` | SANPHAM | Danh sách loại phòng |
| `POST /api/san-pham/loai-phong` | SANPHAM | Tạo mới |
| `PUT /api/san-pham/loai-phong/{id}` | SANPHAM | Sửa |
| `DELETE /api/san-pham/loai-phong/{id}` | SANPHAM | Xóa |

**Dữ liệu mẫu (POST /api/san-pham/loai-phong) — Token sanpham01:**
```json
{
  "tenLoaiPhong": "Suite",
  "moTa": "Phòng Suite cao cấp, view biển",
  "phuThu": 500000
}
```

---

## 27. Tóm tắt toàn bộ API theo nhóm

| Nhóm | Base Path | Token |
|------|-----------|-------|
| Public (không cần token) | `/api/public/**`, `/api/auth/**` | Không |
| Xác thực | `/api/auth/**` | Không (trừ đổi MK) |
| Khách hàng | `/api/khach-hang/**`, `/api/thanh-toan/**` | KHACHHANG |
| Kinh doanh | `/api/kinh-doanh/**` | KINHDOANH |
| HDV | `/api/huong-dan-vien/**` | HDV |
| Kế toán | `/api/ke-toan/**` | KETOAN |
| Sản phẩm | `/api/san-pham/**` | SANPHAM |
| Điều hành | `/api/dieu-hanh/**` | DIEUHANH |
| Admin | `/api/quan-tri/**` + tất cả bên trên | ADMIN |

