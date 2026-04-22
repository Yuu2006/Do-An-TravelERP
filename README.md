# Digital Travel ERP — Backend API

**Công nghệ:** Java 17 · Spring Boot 3.x · Oracle EE 18c · JWT (HS256)
**Package gốc:** `com.digitaltravel.erp`
**Branch hiện tại:** `feature/hochieuso`

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

- Java 17+
- Maven (hoặc dùng `mvnw.cmd` đính kèm)
- Oracle EE 18c đang chạy và đã tạo schema

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
| `MANAGER` | Quản lý sản phẩm, nhân sự, phân công |
| `SALES` | Xử lý đơn hàng, hủy tour |
| `KETOAN` | Quyết toán, chi phí, báo cáo tài chính |
| `HDV` | Vận hành thực địa, điểm danh, sự cố |
| `KHACHHANG` | Khách hàng — đặt tour, thanh toán |

### URL Pattern → Quyền

| Pattern | Roles |
|---------|-------|
| `/api/admin/**` | ADMIN |
| `/api/manager/**` | ADMIN, MANAGER |
| `/api/sales/**` | ADMIN, MANAGER, SALES |
| `/api/ketoan/**` | ADMIN, MANAGER, KETOAN |
| `/api/hdv/**` | ADMIN, MANAGER, HDV |
| `/api/khachhang/**` | ADMIN, KHACHHANG |
| `/api/auth/**` | Public |
| `GET /api/tour*/**` | Public |

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

### Admin — Tài khoản nhân viên

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| POST | `/api/admin/dang-ky-nhan-vien` | ADMIN | UC64 | DONE |
| GET | `/api/admin/nhan-vien` | ADMIN, MANAGER | UC68 | DONE |
| GET | `/api/admin/nhan-vien/{maNhanVien}` | ADMIN, MANAGER | UC68 | DONE |
| PUT | `/api/admin/nhan-vien/{maNhanVien}/khoa` | ADMIN | UC66 | DONE |
| PUT | `/api/admin/nhan-vien/{maNhanVien}/mo-khoa` | ADMIN | UC67 | DONE |

### Tour Mẫu (`/api/tour-mau`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| GET | `/api/tour-mau` | MANAGER, ADMIN | UC06 | DONE |
| GET | `/api/tour-mau/{id}` | MANAGER, ADMIN | UC06 | DONE |
| POST | `/api/tour-mau` | MANAGER, ADMIN | UC02 | DONE |
| PUT | `/api/tour-mau/{id}` | MANAGER, ADMIN | UC04 | DONE |
| DELETE | `/api/tour-mau/{id}` | MANAGER, ADMIN | UC05 | DONE (soft delete) |
| POST | `/api/tour-mau/{id}/sao-chep` | MANAGER, ADMIN | UC03 | DONE |
| POST | `/api/tour-mau/{id}/lich-trinh` | MANAGER, ADMIN | UC08 | DONE |
| PUT | `/api/tour-mau/{id}/lich-trinh/{maLT}` | MANAGER, ADMIN | UC09 | DONE |
| DELETE | `/api/tour-mau/{id}/lich-trinh/{maLT}` | MANAGER, ADMIN | UC09 | DONE |

### Tour Thực tế (`/api/tour-thuc-te`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| GET | `/api/tour-thuc-te` | Bearer (all) | UC14 | DONE |
| GET | `/api/tour-thuc-te/{id}` | Bearer | UC14 | DONE |
| POST | `/api/tour-thuc-te` | MANAGER, ADMIN | UC11 | DONE |
| PUT | `/api/tour-thuc-te/{id}` | MANAGER, ADMIN | UC13 | DONE |
| DELETE | `/api/tour-thuc-te/{id}` | MANAGER, ADMIN | UC12 | DONE |

### Danh mục

| Method | Path | Auth | Trạng thái |
|--------|------|------|-----------|
| GET/POST/PUT/DELETE | `/api/loai-phong/**` | MANAGER/ADMIN | DONE |
| GET/POST/PUT/DELETE | `/api/dich-vu-them/**` | MANAGER/ADMIN | DONE |
| GET/POST/PUT | `/api/hanh-dong-xanh/**` | MANAGER/ADMIN | DONE |

### Khách hàng (`/api/khachhang`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| GET | `/api/khachhang/ho-so` | KHACHHANG | UC21 | DONE |
| PUT | `/api/khachhang/ho-so` | KHACHHANG | UC23 | DONE |
| POST | `/api/khachhang/dat-tour` | KHACHHANG | UC27 | DONE |
| GET | `/api/khachhang/dat-tour` | KHACHHANG | -- | DONE |
| GET | `/api/khachhang/dat-tour/{id}` | KHACHHANG | -- | DONE |
| DELETE | `/api/khachhang/dat-tour/{id}` | KHACHHANG | UC32 | DONE (hủy CHO_XAC_NHAN) |
| POST | `/api/khachhang/dat-tour/{id}/huy` | KHACHHANG | UC32 | DONE (yêu cầu hủy DA_XAC_NHAN) |
| GET | `/api/admin/dat-tour` | ADMIN, MANAGER | -- | DONE |
| PUT | `/api/admin/dat-tour/{id}/xac-nhan` | ADMIN, MANAGER | -- | DONE |

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

### SALES — Yêu cầu hủy tour (`/api/sales`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| GET | `/api/sales/yeu-cau-huy` | ADMIN, MANAGER, SALES | UC33 | DONE |
| POST | `/api/sales/yeu-cau-huy/{id}/duyet` | ADMIN, MANAGER, SALES | UC33 | DONE |
| POST | `/api/sales/yeu-cau-huy/{id}/tu-choi` | ADMIN, MANAGER, SALES | UC33 | DONE |

### Manager — Phân công HDV (`/api/manager`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| GET | `/api/manager/hdv-kha-dung?maTourThucTe=...` | ADMIN, MANAGER | UC38 | DONE |
| POST | `/api/manager/phan-cong` | ADMIN, MANAGER | UC37 | DONE |
| DELETE | `/api/manager/phan-cong/{id}` | ADMIN, MANAGER | UC37 | DONE |

**Request body POST /phan-cong:**
```json
{
  "maTourThucTe": "TTT_XXXXX",
  "maNhanVien": "NV_XXXXX",
  "ghiChu": "Ghi chú phân công"
}
```

### HDV — Vận hành thực địa (`/api/hdv`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| GET | `/api/hdv/tour-cua-toi` | ADMIN, HDV | -- | DONE |
| GET | `/api/hdv/tour/{maTour}/doan` | ADMIN, MANAGER, HDV | UC42 | DONE |
| POST | `/api/hdv/tour/{maTour}/diem-danh` | ADMIN, HDV | UC43 | DONE |
| POST | `/api/hdv/tour/{maTour}/hanh-dong-xanh` | ADMIN, HDV | UC44 | DONE |
| GET | `/api/hdv/tour/{maTour}/su-co` | ADMIN, MANAGER, HDV | UC45 | DONE |
| POST | `/api/hdv/tour/{maTour}/su-co` | ADMIN, HDV | UC45 | DONE |
| PUT | `/api/hdv/su-co/{maSuCo}` | ADMIN, HDV | UC45 | DONE |
| POST | `/api/hdv/tour/{maTour}/chi-phi` | ADMIN, HDV | UC46 | DONE |
| GET | `/api/hdv/tour/{maTour}/chi-phi` | ADMIN, MANAGER, HDV | UC46 | DONE |

### Kế toán — Chi phí & Quyết toán (`/api/ketoan`)

| Method | Path | Auth | UC | Trạng thái |
|--------|------|------|----|-----------|
| GET | `/api/ketoan/chi-phi?trangThai=CHO_DUYET` | ADMIN, MANAGER, KETOAN | UC49 | DONE |
| PUT | `/api/ketoan/chi-phi/{id}/duyet` | ADMIN, MANAGER, KETOAN | UC49 | DONE |
| PUT | `/api/ketoan/chi-phi/{id}/tu-choi` | ADMIN, MANAGER, KETOAN | UC49 | DONE |
| GET | `/api/ketoan/tour-can-quyet-toan` | ADMIN, MANAGER, KETOAN | UC47 | DONE |
| GET | `/api/ketoan/tinh-toan/{maTour}` | ADMIN, MANAGER, KETOAN | UC48 | DONE (preview) |
| POST | `/api/ketoan/quyet-toan/{maTour}` | ADMIN, MANAGER, KETOAN | UC50 | DONE |
| PUT | `/api/ketoan/quyet-toan/{id}/chot` | ADMIN, MANAGER, KETOAN | UC50 | DONE (DRAFT to LOCKED) |
| GET | `/api/ketoan/quyet-toan` | ADMIN, MANAGER, KETOAN | UC51 | DONE |
| GET | `/api/ketoan/quyet-toan/{id}` | ADMIN, MANAGER, KETOAN | UC51 | DONE |

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
| UC23 | Cập nhật hộ chiếu số | Khách hàng |
| UC27 | Đặt tour (giữ chỗ 15 phút) | Đặt tour |
| UC29 | Thanh toán mock — trừ chỗ, tạo lịch sử tour | Thanh toán |
| UC32 | KH yêu cầu hủy tour | Hủy tour |
| UC33 | SALES duyệt / từ chối hoàn tiền | Hủy tour |
| UC37 | Phân công HDV vào tour | Phân công |
| UC38 | Tìm HDV khả dụng (không trùng lịch) | Phân công |
| UC42 | Xem danh sách đoàn | Vận hành |
| UC43 | Điểm danh khách | Vận hành |
| UC44 | Ghi nhận hành động xanh + cộng điểm tự động | Vận hành |
| UC45 | Báo cáo & cập nhật sự cố | Vận hành |
| UC46 | Khai báo chi phí phát sinh | Vận hành |
| UC47 | DS tour cần quyết toán | Quyết toán |
| UC48 | Preview tính toán quyết toán | Quyết toán |
| UC49 | Duyệt chi phí / tạo quyết toán DRAFT | Quyết toán |
| UC50 | Chốt quyết toán (LOCKED, tour -> DA_QUYET_TOAN) | Quyết toán |
| UC51 | Xem danh sách & chi tiết quyết toán | Quyết toán |
| UC58 | Đăng ký tài khoản khách hàng | Auth |
| UC59 | Đăng nhập, nhận JWT | Auth |
| UC60 | Đăng xuất stateless | Auth |
| UC61 | Quên / đặt lại mật khẩu | Auth |
| UC62 | Đổi mật khẩu | Auth |
| UC64 | Admin tạo tài khoản nhân viên | Nhân viên |
| UC66 | Khóa tài khoản nhân viên | Nhân viên |
| UC67 | Mở khóa tài khoản nhân viên | Nhân viên |
| UC68 | Tìm kiếm & xem hồ sơ nhân viên | Nhân viên |
| -- | Scheduler tự hủy đơn hết hạn (60s) | Đặt tour |

### TODO — Chưa hoàn thành

| UC | Tên | Ghi chú |
|----|-----|---------|
| UC22 | Lịch sử tour KH | LichSuTour được tạo, chưa có GET endpoint |
| UC24 | Nhân viên tìm hồ sơ khách | Chưa có endpoint |
| UC25 | Tra cứu tour public | Chưa tách endpoint public riêng |
| UC26 | Chi tiết tour public kèm lịch trình | Chưa aggregate response đầy đủ |
| UC28 | Áp dụng voucher vào đơn | Chưa làm |
| UC30 | Đổi điểm xanh lấy voucher | Chưa làm |
| UC31 | Xem ví voucher | Chưa làm |
| UC34 | NV tìm kiếm đơn hàng | Chưa làm |
| UC35 | Đánh giá sau tour | Chưa làm |
| UC36 | Khiếu nại / hỗ trợ | Chưa làm |
| UC39 | Lịch công tác HDV | Chưa làm |
| UC41 | SALES xử lý khiếu nại | Chưa làm |
| UC52 | Kế toán xác nhận chuyển tiền hoàn | Chưa làm |
| UC53 | Báo cáo doanh thu / top tour | Chưa làm |
| UC54–56 | Quản lý & phân phối voucher | Chưa làm |
| UC57 | Thanh toán MoMo thật | Chỉ có mock mode |
| UC63 | Cập nhật năng lực HDV | Chưa làm |
| UC69 | Gán vai trò cho nhân viên | Chưa làm |
| UC70 | Nhật ký hệ thống | Chưa làm |
| -- | Dynamic Pricing tự động | Chưa làm |
| -- | Nâng hạng thành viên tự động | Điểm cộng đúng, chưa check ngưỡng hạng |
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
| `QuyetToan.TrangThai` | DRAFT · LOCKED |
| `NhanVien.TrangThaiLamViec` | AVAILABLE · BUSY · OFF |
| `HoChieuSo.HangThanhVien` | CO_BAN · BAC · VANG · PLATINUM |

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
- ID prefix convention: `DDT_`, `TTT_`, `QT_`, `PC_`, `DD_`, `HD_`, `SC_`, `CP_`

### Tech Stack

| Layer | Công nghệ |
|-------|-----------|
| Language | Java 17 |
| Framework | Spring Boot 3.x |
| Security | Spring Security + JWT (jjwt) |
| ORM | Spring Data JPA / Hibernate |
| Database | Oracle EE 18c (ojdbc8) |
| Validation | Jakarta Bean Validation |
| Connection Pool | HikariCP (max 10) |
| Utilities | Lombok |
| API Docs | Springdoc OpenAPI (Swagger UI) |
| Build | Maven (mvnw wrapper) |
| Scheduler | Spring @EnableScheduling |
