# 🗺️ LỘ TRÌNH TRIỂN KHAI ĐỒ ÁN — DIGITAL TRAVEL ERP
**Công nghệ:** Java Spring Boot · Oracle EE 18c  
**Thời gian:** 8 tuần (2 tháng)  
**Trạng thái hiện tại:** Đã hoàn thành thiết kế tính năng, database, danh sách use case — chưa cài đặt

---

## 📌 NGUYÊN TẮC ƯU TIÊN

| Ký hiệu | Mức độ |
|---|---|
| 🔴 Must-have | Bắt buộc — demo sẽ fail nếu thiếu |
| 🟡 Should-have | Quan trọng — cần hoàn thành nếu còn thời gian |
| 🟢 Nice-to-have | Ấn tượng thêm — làm nếu dư thời gian |

**Quy tắc vàng:** Hoàn thiện một luồng dọc (end-to-end) trước khi mở rộng ngang.  
Luồng ưu tiên: **Đăng nhập → Đặt tour → Thanh toán → HDV vận hành → Kế toán quyết toán**

---

## Nền tảng & Hạ tầng
> **Mục tiêu:** Dựng xong môi trường, cài DB, chạy được Hello World có auth

### Ngày 1–2: Khởi tạo dự án
- [x] Khởi tạo Spring Boot project (Maven/Gradle) với các dependencies cơ bản:
  - `spring-boot-starter-web`, `spring-boot-starter-data-jpa`
  - `spring-boot-starter-security`, `jjwt` (JWT)
  - `ojdbc8` (Oracle JDBC driver)
  - `lombok`, `mapstruct`, `springdoc-openapi` (Swagger)
- [x] Cấu hình kết nối Oracle EE 18c (`application.yml`)
- [x] Thiết lập cấu trúc package theo kiến trúc phân lớp:
  ```
  com.digitaltravel
  ├── config/         (Security, CORS, Swagger)
  ├── controller/
  ├── service/
  ├── repository/
  ├── entity/
  ├── dto/
  ├── mapper/
  └── exception/
  ```
- [x] Cấu hình Git repository, `.gitignore`, quy ước branch (`main`, `dev`, `feature/*`)

### Tạo Database Schema
- [x] Viết script DDL Oracle tạo toàn bộ bảng theo thiết kế:
  - Nhóm 1 (Nền tảng): `TAIKHOAN`, `VAITRO`, `NHANVIEN`, `NANGLUCNHANVIEN`
  - Nhóm 2 (Sản phẩm): `TOURMAU`, `LICHTRINHTOUR`, `TOURTHUCTE`, `LOAIPHONG`, `DICHVUTHEM`
  - Nhóm 3 (Khách hàng): `HOCHIEUSO`, `LICHSUTOUR`, `DSKHACHDITOUR`
  - Nhóm 4 (Giao dịch): `DONDATTOUR`, `CHITIETDATTOUR`, `CHITIETDICHVU`, `THANHTOAN`
  - Nhóm 5 (Ưu đãi): `VOUCHER`, `KHUYENMAI_KH`, `DATTOUR_UUDAI`, `NHATKYDOIDIEM`
  - Nhóm 6 (Vận hành): `PHANCONGTOUR`, `HANHDONG`, `HANHDONGXANH`, `NHATKYSUCO`, `CHIPHITHUCTE`, `DIEMDANH`
  - Nhóm 7 (Tài chính): `QUYETTOAN`, `YEUCAUHOTRO`, `DANHGIAKH`
- [x] Viết script INSERT dữ liệu mẫu (seed data) cho các bảng danh mục
- [x] Test kết nối từ Spring Boot → Oracle thành công

### Cơ sở hạ tầng bảo mật (UC57–UC62) ✅ HOÀN THÀNH
- [x] `JwtAuthFilter` — trích xuất Bearer token, xác thực, inject `SecurityContext`
- [x] `JwtUtil` — generate / validate token (HS256, TTL cấu hình qua `application.yaml`)
- [x] `JwtAuthEntryPoint` — trả 401 khi chưa đăng nhập
- [x] `JwtAccessDeniedHandler` — trả 403 khi không đủ quyền
- [x] RBAC với Spring Security — 6 vai trò: `ADMIN`, `MANAGER`, `SALES`, `KETOAN`, `HDV`, `KHACHHANG`
- [x] `GlobalExceptionHandler` (`@RestControllerAdvice`) — bắt mọi exception, trả `ApiResponse` chuẩn
- [x] `ApiResponse<T>` wrapper — mọi response đều bọc `{ code, message, data }`
- [x] `UC58` `POST /api/auth/dang-ky` — Đăng ký tài khoản khách hàng (tự gán vai trò `KHACHHANG`)
- [x] `UC59` `POST /api/auth/dang-nhap` — Đăng nhập, trả JWT + thông tin vai trò
- [x] `UC60` `POST /api/auth/dang-xuat` — Đăng xuất stateless (client xóa token phía frontend)
- [x] `UC62` `POST /api/auth/doi-mat-khau` — Đổi mật khẩu (yêu cầu `Authorization`, xác thực mật khẩu cũ)
- [x] `UC64` `POST /api/admin/dang-ky-nhan-vien` — Admin tạo tài khoản nhân viên (role: MANAGER/SALES/KETOAN/HDV)
- [ ] `UC61` `POST /api/auth/quen-mat-khau` — Quên mật khẩu qua email OTP (chưa làm)

> **API đã có (Auth):**
> | Method | Path | Auth | Mô tả |
> |--------|------|------|-------|
> | POST | `/api/auth/dang-ky` | Public | Đăng ký KH, trả JWT ngay |
> | POST | `/api/auth/dang-nhap` | Public | Đăng nhập, trả JWT |
> | POST | `/api/auth/dang-xuat` | Bearer | Đăng xuất (stateless) |
> | POST | `/api/auth/doi-mat-khau` | Bearer | Đổi mật khẩu |
> | POST | `/api/admin/dang-ky-nhan-vien` | ADMIN | Tạo tài khoản nhân viên |

**✅ Milestone tuần 1:** Gọi được API đăng nhập, nhận JWT, gọi API protected thành công.

---

## Quản lý Sản phẩm Tour (Module 1)
> **Mục tiêu:** CRUD đầy đủ Tour Mẫu + Tour Thực tế + khởi động luồng định giá

### Tour Mẫu & Lịch trình (UC01–UC09) 🔴

**Các lớp cần tạo:**
- Entity đã có: `TourMau`, `LichTrinhTour`
- Tạo mới: `TourMauRepository`, `LichTrinhTourRepository`, `TourMauService`, `TourMauController`

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| GET | `/api/tour-mau` | MANAGER/SALES/ADMIN | UC06 | Danh sách tour mẫu (filter + phân trang) |
| GET | `/api/tour-mau/{id}` | MANAGER/SALES/ADMIN | UC06 | Chi tiết 1 tour mẫu |
| POST | `/api/tour-mau` | MANAGER/ADMIN | UC02 | Thêm tour mẫu |
| PUT | `/api/tour-mau/{id}` | MANAGER/ADMIN | UC04 | Sửa tour mẫu |
| DELETE | `/api/tour-mau/{id}` | MANAGER/ADMIN | UC05 | Xóa mềm (đổi `TrangThai = DA_XOA`) |
| POST | `/api/tour-mau/{id}/sao-chep` | MANAGER/ADMIN | UC03 | Sao chép tour mẫu |
| POST | `/api/tour-mau/{id}/lich-trinh` | MANAGER/ADMIN | UC08 | Thêm ngày lịch trình |
| PUT | `/api/tour-mau/{id}/lich-trinh/{ngay}` | MANAGER/ADMIN | UC09 | Sửa lịch trình |
| DELETE | `/api/tour-mau/{id}/lich-trinh/{ngay}` | MANAGER/ADMIN | UC09 | Xóa ngày lịch trình |

**DTO `TaoTourMauRequest`:**
```java
String tenTour;          // @NotBlank
String diaDiem;          // @NotBlank
Integer thoiLuong;       // @Min(1) — số ngày
BigDecimal giaSan;       // @DecimalMin("0.01") — giá sàn
String moTa;
List<LichTrinhRequest> lichTrinh;  // danh sách ngày (có thể rỗng)
```

**DTO `LichTrinhRequest`:**
```java
Integer ngayThu;         // @Min(1) — ngày thứ bao nhiêu
String tieuDe;           // @NotBlank
String moTa;
String diaDiem;
```

**Business logic:**
- [x] `UC02`: `giaSan > 0`; `thoiLuong >= 1`; tự gán `TrangThai = HOAT_DONG` khi tạo
- [x] `UC03`: Deep copy — nhân bản `TourMau` (mã mới) + toàn bộ `LichTrinhTour` của mẫu gốc; tên mặc định = `"[Sao chép] " + tenTourGoc`
- [x] `UC05`: Soft delete — không xóa DB; set `TrangThai = DA_XOA`; nếu đang có `TourThucTe` trạng thái `MO` thì từ chối xóa
- [x] `UC06`: Filter: `tenTour ILIKE`, `diaDiem`, `trangThai`, `thoiLuongMin/Max`; phân trang `Pageable`
- [x] `UC08/UC09`: Số thứ tự ngày (`NgayThu`) không trùng trong cùng 1 tour; validate `NgayThu <= thoiLuong`

---

### Tour Thực tế (UC10–UC14) 🔴

**Các lớp cần tạo:**
- Entity đã có: `TourThucTe`
- Tạo mới: `TourThucTeRepository`, `TourThucTeService`, `TourThucTeController`

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| GET | `/api/tour-thuc-te` | Bearer (tất cả) | UC14 | Danh sách (filter) |
| GET | `/api/tour-thuc-te/{id}` | Bearer | UC14 | Chi tiết |
| POST | `/api/tour-thuc-te` | MANAGER/ADMIN | UC11 | Khởi tạo từ tour mẫu |
| PUT | `/api/tour-thuc-te/{id}` | MANAGER/ADMIN | UC13 | Sửa thông tin |
| DELETE | `/api/tour-thuc-te/{id}` | MANAGER/ADMIN | UC12 | Xóa (chỉ khi chưa có đơn) |

**DTO `TaoTourThucTeRequest`:**
```java
String maTourMau;        // @NotBlank — phải tồn tại
LocalDate ngayKhoiHanh;  // @NotNull, @Future
LocalDate ngayKetThuc;   // @NotNull, sau ngayKhoiHanh
String phuongTien;       // "MAY_BAY" | "XE_DU_LICH" | "TAU_THUY"
Integer soKhachToiDa;    // @Min(1)
Integer soKhachToiThieu; // @Min(1), <= soKhachToiDa
BigDecimal giaTien;      // @DecimalMin("0.01") — giá khởi điểm
String diaDiem;
```

**Business logic:**
- [x] `UC11`: Khi khởi tạo → copy `thoiLuong`, `diaDiem`, `moTa` từ `TourMau`; `TrangThai = MO`; `ChoNgoi = soKhachToiDa`
- [x] `UC12`: Từ chối nếu `DonDatTour` có `TrangThai IN (CHO_XAC_NHAN, XAC_NHAN)` liên quan đến tour này
- [x] `UC13`: Chỉ sửa được giá/phương tiện/trạng thái; không sửa `maTourMau`
- [x] `UC14` (cho KH): Chỉ trả tour `TrangThai = MO`, `ChoNgoi > 0`, `ngayKhoiHanh > NOW()`; filter thêm: `diaDiem`, `giaTu/giaDen`, `thoiLuongMin/Max`, sort: `giaTangDan/GiamDan`, `ngayKhoiHanh`

---

### Dịch vụ bổ sung & Hành động xanh (UC15–UC20) 🟡

**API endpoints:**

| Method | Path | Auth | Mô tả |
|--------|------|------|-------|
| GET | `/api/loai-phong` | Bearer | Danh sách loại phòng |
| POST | `/api/loai-phong` | MANAGER/ADMIN | Thêm loại phòng |
| PUT | `/api/loai-phong/{id}` | MANAGER/ADMIN | Sửa loại phòng |
| DELETE | `/api/loai-phong/{id}` | MANAGER/ADMIN | Xóa loại phòng |
| GET | `/api/dich-vu-them` | Bearer | Danh sách dịch vụ |
| POST | `/api/dich-vu-them` | MANAGER/ADMIN | Thêm dịch vụ |
| PUT | `/api/dich-vu-them/{id}` | MANAGER/ADMIN | Sửa dịch vụ |
| DELETE | `/api/dich-vu-them/{id}` | MANAGER/ADMIN | Xóa dịch vụ |
| GET | `/api/tour-thuc-te/{id}/hanh-dong-xanh` | Bearer | DS hành động xanh của tour |
| PUT | `/api/tour-thuc-te/{id}/hanh-dong-xanh` | MANAGER/ADMIN | UC20 — cập nhật danh sách hành động xanh |

**DTO `LoaiPhongRequest`:**
```java
String tenLoai;          // "PHONG_DON" | "PHONG_DOI" | "PHONG_GIA_DINH"
BigDecimal phuThu;       // @DecimalMin("0")
String moTa;
```

**DTO `DichVuThemRequest`:**
```java
String tenDichVu;        // @NotBlank
BigDecimal gia;          // @DecimalMin("0")
String donVi;            // "NGUOI" | "LUOT" | "NGAY"
String moTa;
```

**DTO `HanhDongXanhRequest` (danh sách):**
```java
List<String> maHanhDongXanh;   // gán nhiều hành động xanh vào tour
```

- [ ] `UC20`: Thay toàn bộ danh sách `HanhDongXanh` của 1 `TourThucTe` theo pattern replace-all

---

## Khách hàng, Hộ chiếu số & Đặt Tour
> **Mục tiêu:** Khách hàng tra cứu tour, đặt chỗ tạm thời thành công

### Hộ chiếu số & Hồ sơ khách (UC21–UC24) 🔴

**Các lớp cần tạo:**
- Entity đã có: `HoChieuSo`, `LichSuTour`
- Tạo mới: `HoChieuSoRepository`, `LichSuTourRepository`, `HoChieuSoService`, `HoChieuSoController`

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| GET | `/api/khach-hang/ho-so` | KHACHHANG | UC21 | Xem hồ sơ cá nhân + hạng + điểm xanh |
| PUT | `/api/khach-hang/ho-so` | KHACHHANG | UC23 | Cập nhật thông tin hộ chiếu số |
| GET | `/api/khach-hang/lich-su-tour` | KHACHHANG | UC22 | Lịch sử các tour đã tham gia |
| GET | `/api/nhan-vien/khach-hang` | SALES/MANAGER/ADMIN | UC24 | Tìm kiếm hồ sơ khách |
| GET | `/api/nhan-vien/khach-hang/{id}` | SALES/MANAGER/ADMIN | UC24 | Chi tiết hồ sơ khách |

**DTO `CapNhatHoChieuSoRequest`:**
```java
String hoTen;
LocalDate ngaySinh;
String gioiTinh;           // "NAM" | "NU"
String quocTich;
String soCccd;
String soHoChieu;
LocalDate ngayHetHanHoChieu;
String ghiChuYTe;          // @Size(max=2000) — mã hóa khi lưu DB
String diUng;              // mã hóa khi lưu DB
String soThichDuLich;
String kichThuocAo;
String yeuCauDacBiet;
```

**DTO `HoChieuSoResponse`:**
```java
// Thêm các trường: hangThanhVien, diemXanh, tongSoTour
String hangThanhVien;      // "CO_BAN" | "BAC" | "VANG" | "PLATINUM"
Integer diemXanh;
Integer tongSoTour;
```

**Business logic:**
- [x] `UC21`: Join `HoChieuSo` ↔ `TaiKhoan` qua `maTaiKhoan`; tính `tongSoTour` từ `LichSuTour`
- [x] `UC23`: Không cho phép sửa `maTaiKhoan`; validate định dạng `soHoChieu`, `ngayHetHanHoChieu > NOW()`
- [ ] `UC24` (nhân viên): Filter: `hoTen ILIKE`, `soDienThoai`, `soCccd`, `email`; trả kết quả phân trang

---

### Tra cứu & Xem tour (UC25–UC26) 🔴

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| GET | `/api/tour` | Public | UC25 | Tra cứu tour (cho KH, public) |
| GET | `/api/tour/{id}` | Public | UC26 | Chi tiết tour + lịch trình + dịch vụ |

**Request params `UC25`:**
```
diaDiem, giaTu, giaDen, ngayKhoiHanhTu, ngayKhoiHanhDen,
thoiLuongMin, thoiLuongMax, phuongTien,
sort=GIA_TANG|GIA_GIAM|DANH_GIA|BEN_VUNG,
page, size
```

**Response `UC26` — `TourChiTietResponse`:**
```java
// TourThucTe info
String maTour;
String tenTour;
BigDecimal giaTien;          // giá hiện tại (sau dynamic pricing)
BigDecimal giaSan;
LocalDate ngayKhoiHanh;
LocalDate ngayKetThuc;
Integer choConLai;
String phuongTien;
// TourMau info
String moTa;
Double diemDanhGia;
// LichTrinhTour
List<LichTrinhResponse> lichTrinh;   // từng ngày
// DichVuThem + LoaiPhong
List<DichVuThemResponse> dichVuThem;
List<LoaiPhongResponse> loaiPhong;
// HanhDongXanh
List<HanhDongXanhResponse> hanhDongXanh;
```

---

### Đặt tour & Giữ chỗ tạm thời (UC27) 🔴

**Các lớp cần tạo:**
- Entity đã có: `DonDatTour`, `ChiTietDatTour`, `ChiTietDichVu`
- Tạo mới: `DonDatTourRepository`, `ChiTietDatTourRepository`, `DatTourService`, `DatTourController`

**API endpoints:**

| Method | Path | Auth | Mô tả |
|--------|------|------|-------|
| POST | `/api/dat-tour` | KHACHHANG | Tạo đơn đặt tour mới |
| GET | `/api/dat-tour/{maDon}` | KHACHHANG | Xem thông tin đơn đặt |
| GET | `/api/khach-hang/don-dat-tour` | KHACHHANG | Danh sách đơn của chính mình |

**DTO `DatTourRequest`:**
```java
String maTourThucTe;          // @NotBlank
Integer soNguoi;              // @Min(1) — số khách chính
// Danh sách người đi kèm
List<NguoiDiKemRequest> nguoiDiKem;   // họ tên, ngày sinh, CCCD
String maLoaiPhong;                    // nullable
Integer soPhong;                       // nullable, @Min(1)
List<ChiTietDichVuRequest> dichVu;     // list dịch vụ thêm
```

**DTO `ChiTietDichVuRequest`:**
```java
String maDichVu;       // @NotBlank
Integer soLuong;       // @Min(1)
```

**DTO `DatTourResponse`:**
```java
String maDonDatTour;
String trangThai;          // "CHO_XAC_NHAN"
LocalDateTime thoiGianDat;
LocalDateTime thoiGianHetHan;   // +15 phút từ lúc đặt
BigDecimal tongTienTamTinh;
// Chi tiết tính tiền
BigDecimal giaGocTour;
BigDecimal phuTruPhong;
BigDecimal tongDichVuThem;
// DS khách
List<ChiTietDatTourResponse> danhSachKhach;
```

**Business logic:**
- [x] Kiểm tra `TourThucTe.TrangThai = MO` và `ChoNgoi >= soNguoi` — nếu không đủ → `400 Bad Request`
- [x] Tính `TongTien`:
  ```
  giaGocTour    = GiaTien × soNguoi
  phuTruPhong   = LoaiPhong.PhuThu × soPhong   (nếu có)
  tongDichVu    = Σ(DichVuThem.Gia × soLuong)
  TongTien      = giaGocTour + phuTruPhong + tongDichVu
  ```
- [x] Ghi `GiaTaiThoiDiemDat = TourThucTe.GiaTien` (snapshot giá tại thời điểm đặt, không thay đổi sau)
- [ ] **Không trừ `ChoNgoi` ngay** — chỉ trừ sau khi thanh toán thành công
- [x] Tạo bản ghi `DonDatTour` với `TrangThai = CHO_XAC_NHAN`, `ThoiGianHetHan = NOW() + 15 phút`
- [ ] **Scheduler hủy đơn hết hạn:** `@Scheduled(fixedDelay = 60000)` — query `DonDatTour` có `TrangThai = CHO_XAC_NHAN` và `ThoiGianHetHan < NOW()` → cập nhật `TrangThai = HET_HAN`

---

## Thanh toán, Voucher & Hủy Tour
> **Mục tiêu:** Hoàn thiện luồng tiền — từ đặt tour đến thanh toán thành công

### Voucher & Áp dụng ưu đãi (UC28, UC30–UC31, UC55–UC56) 🔴

**Các lớp cần tạo:**
- Entity đã có: `Voucher`, `KhuyenMaiKh`, `DatTourUuDai`, `NhatKyDoiDiem`
- Tạo mới: `VoucherRepository`, `VoucherService`, `VoucherController`

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| POST | `/api/dat-tour/{maDon}/ap-dung-voucher` | KHACHHANG | UC28 | Áp dụng voucher vào đơn |
| DELETE | `/api/dat-tour/{maDon}/ap-dung-voucher` | KHACHHANG | UC28 | Gỡ voucher khỏi đơn |
| GET | `/api/khach-hang/voucher` | KHACHHANG | UC31 | DS voucher trong ví |
| POST | `/api/khach-hang/doi-diem` | KHACHHANG | UC30 | Đổi điểm xanh lấy voucher |
| GET | `/api/admin/voucher` | MANAGER/ADMIN | UC54 | Quản lý toàn bộ voucher |
| POST | `/api/admin/voucher` | MANAGER/ADMIN | UC55 | Tạo voucher mới |
| PUT | `/api/admin/voucher/{id}` | MANAGER/ADMIN | UC54 | Sửa voucher |
| POST | `/api/admin/voucher/{id}/phan-phoi` | MANAGER/ADMIN | UC56 | Phân phối voucher cho KH |

**DTO `ApDungVoucherRequest`:**
```java
String maVoucher;   // @NotBlank
```

**Business logic `UC28` — kiểm tra trước khi áp dụng:**
- [ ] Voucher `TrangThai = CON_HIEU_LUC` và `NgayHetHan > NOW()`
- [ ] `SoLuotDungConLai > 0`
- [ ] `DonDatTour.TongTien >= Voucher.DieuKienDonToiThieu`
- [ ] Kiểm tra `HoChieuSo.HangThanhVien >= Voucher.HangToiThieu` (nếu voucher chỉ cho hạng cao)
- [ ] Kiểm tra chưa dùng voucher này (không có bản ghi `DatTourUuDai` với `maVoucher` + `maTaiKhoan` này)
- [ ] Tính `GiamGia`:
  ```
  if loai = PHAN_TRAM → giamGia = TongTien × TiLeGiam / 100
  if loai = SO_TIEN   → giamGia = SoTienGiam
  TongTienSauGiam = max(TongTien - giamGia, GiaSan × soNguoi)
  ```
- [ ] Cập nhật `DonDatTour.TongTienSauGiam`, ghi `DatTourUuDai`

**DTO `DoiDiemRequest`:**
```java
String maDanhMucVoucher;   // loại voucher muốn đổi
```
- [ ] `UC30`: Kiểm tra `HoChieuSo.DiemXanh >= DiemCanDoiCuaVoucher`; trừ điểm; insert `NhatKyDoiDiem` + thêm voucher vào ví KH (`KhuyenMaiKh`)

---

### Thanh toán (UC29) 🔴

**Các lớp cần tạo:**
- Entity đã có: `ThanhToan`
- Tạo mới: `ThanhToanRepository`, `ThanhToanService`, `ThanhToanController`, `MoMoConnector`

**API endpoints:**

| Method | Path | Auth | Mô tả |
|--------|------|------|-------|
| POST | `/api/thanh-toan/khoi-tao` | KHACHHANG | Tạo giao dịch MoMo, trả `payUrl` |
| POST | `/api/thanh-toan/ipn` | Public (MoMo callback) | Nhận IPN xác nhận thanh toán |
| GET | `/api/thanh-toan/{maDon}/ket-qua` | KHACHHANG | Kiểm tra kết quả giao dịch chủ động |

**DTO `KhoiTaoThanhToanRequest`:**
```java
String maDonDatTour;       // @NotBlank
String phuongThucThanhToan; // "MOMO_WALLET" | "MOMO_ATM"
```

**DTO `KhoiTaoThanhToanResponse`:**
```java
String requestId;
String orderId;
String payUrl;       // URL redirect sang MoMo
String deeplink;     // cho mobile app
String qrCodeUrl;
```

**Business logic MoMo (`captureWallet`):**
- [ ] **Tạo giao dịch:** Gửi `POST https://test-payment.momo.vn/v2/gateway/api/create` với:
  - `partnerCode`, `accessKey` (từ `application.yaml`, **không hardcode**)
  - `requestId = UUID.randomUUID()`
  - `orderId = maDonDatTour + "_" + timestamp`
  - `amount = DonDatTour.TongTienSauGiam` (hoặc `TongTien` nếu không có voucher)
  - `redirectUrl = baseUrl + /thanh-cong`, `ipnUrl = baseUrl + /api/thanh-toan/ipn`
  - Ký `HMAC-SHA256` bằng `secretKey`
- [ ] Lưu `ThanhToan` với `TrangThai = CHO_XU_LY`
- [ ] **Xử lý IPN callback:**
  - Xác thực chữ ký `HMAC-SHA256` — **bắt buộc, từ chối nếu sai**
  - Idempotency: kiểm tra `transId` đã xử lý chưa; nếu rồi → trả `200 OK` ngay, không xử lý lại
  - Nếu `resultCode = 0` → cập nhật `ThanhToan.TrangThai = THANH_CONG`, `DonDatTour.TrangThai = XAC_NHAN`, trừ `TourThucTe.ChoNgoi -= soNguoi`, tạo bản ghi `LichSuTour`
  - Nếu `resultCode != 0` → cập nhật `ThanhToan.TrangThai = THAT_BAI`, `DonDatTour.TrangThai = THANH_TOAN_THAT_BAI`
- [ ] **Đồng bộ chủ động**: API `GET /ket-qua` gọi MoMo `query` API nếu trạng thái vẫn `CHO_XU_LY` sau X phút
- [ ] Ghi đầy đủ `requestId`, `orderId`, `transId`, `resultCode`, `message`, `payType` vào `ThanhToan`
- [ ] **Môi trường dev**: Hỗ trợ `mock=true` param để bypass MoMo (trả kết quả thành công giả)
- [ ] Mock gửi email xác nhận (log ra console trong dev, dùng `JavaMailSender` nếu có cấu hình)

---

### Hủy tour & Hoàn tiền (UC32–UC33, UC52) 🔴

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| POST | `/api/dat-tour/{maDon}/huy` | KHACHHANG | UC32 | KH gửi yêu cầu hủy tour |
| GET | `/api/nhan-vien/yeu-cau-hoan-tien` | SALES/MANAGER | UC33 | DS yêu cầu chờ duyệt |
| POST | `/api/nhan-vien/yeu-cau-hoan-tien/{id}/duyet` | SALES/MANAGER | UC33 | Duyệt hoàn tiền |
| POST | `/api/nhan-vien/yeu-cau-hoan-tien/{id}/tu-choi` | SALES/MANAGER | UC33 | Từ chối hoàn tiền |
| GET | `/api/ketoan/hoan-tien` | KETOAN | UC52 | Kế toán xem DS hoàn tiền đã duyệt |
| POST | `/api/ketoan/hoan-tien/{id}/xu-ly` | KETOAN | UC52 | Kế toán xác nhận đã chuyển tiền |

**DTO `HuyTourRequest`:**
```java
String lyDo;   // @NotBlank
```

**Business logic:**
- [ ] Tính phí hủy theo thời điểm (số ngày trước `NgayKhoiHanh`):
  ```
  > 15 ngày  → hoànTiLe = 0.90  (Hoàn 90%)
  7–15 ngày  → hoànTiLe = 0.70
  3–7 ngày   → hoànTiLe = 0.50
  < 3 ngày   → hoànTiLe = 0.00  (Không hoàn)
  ```
- [ ] Tạo `YeuCauHoTro` với `LoaiYeuCau = HOAN_TIEN`, `TrangThai = CHO_DUYET`, lưu `SoTienHoan = TongTien × hoànTiLe`
- [ ] Cập nhật `DonDatTour.TrangThai = CHO_HUY`
- [ ] Khi SALES duyệt → `TrangThai = DA_DUYET`, hoàn `ChoNgoi` vào `TourThucTe`
- [ ] Khi KETOAN xử lý → `ThanhToan.TrangThai = DA_HOAN_TIEN`
- [ ] `UC34` — API tìm kiếm đơn hàng cho nhân viên: `GET /api/nhan-vien/don-dat-tour` với filter `trangThai`, `maTourThucTe`, `tenKhach`, `tuNgay/denNgay`

---

## Điều phối Nhân sự & Vận hành Tour
> **Mục tiêu:** Phân công HDV, HDV nhận lệnh và vận hành tour trên mobile/web

### Hồ sơ nhân viên & HDV (UC63–UC68) 🔴

**Các lớp cần tạo:**
- Entity đã có: `NhanVien`, `NangLucNhanVien`
- Tạo mới: `NhanVienRepository`, `NangLucNhanVienRepository`, `NhanVienService`, `NhanVienAdminController`

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| GET | `/api/admin/nhan-vien` | MANAGER/ADMIN | UC68 | Tìm kiếm nhân viên (filter) |
| GET | `/api/admin/nhan-vien/{id}` | MANAGER/ADMIN | UC68 | Chi tiết hồ sơ nhân viên |
| POST | `/api/admin/nhan-vien/{id}/nang-luc` | MANAGER/ADMIN | UC65 | Cập nhật năng lực HDV |
| PUT | `/api/admin/nhan-vien/{id}/khoa` | ADMIN | UC66 | Khóa tài khoản |
| PUT | `/api/admin/nhan-vien/{id}/mo-khoa` | ADMIN | UC67 | Mở khóa tài khoản |
| PUT | `/api/admin/nhan-vien/{id}/vai-tro` | ADMIN | UC69 | Gán vai trò |
| GET | `/api/hdv/ho-so` | HDV | — | HDV xem hồ sơ + lịch công tác |

> **Lưu ý:** API `POST /api/admin/dang-ky-nhan-vien` đã có (UC64 ✅ done)

**DTO `NangLucHdvRequest`:**
```java
List<String> ngonNgu;         // ["EN", "ZH", "FR", ...]
List<String> chungChi;        // ["HDV_QUOC_TE", "SO_CUU", ...]
List<String> chuyenMon;       // ["BALO", "NGHI_DUONG", "SINH_THAI"]
String moTa;
```

**Business logic:**
- [ ] `UC66/UC67`: Khóa/Mở khóa cập nhật `TaiKhoan.TrangThai = KHOA / HOAT_DONG`; không cho tự khóa chính mình
- [ ] `UC68`: Filter: `hoTen ILIKE`, `maVaiTro`, `trangThai`; Include `NangLucNhanVien` trong response
- [ ] `UC69`: Validate `maVaiTro` phải thuộc tập hợp hợp lệ; không cho đổi vai trò `ADMIN` nếu chỉ còn 1 admin

---

### Điều phối HDV (UC37–UC38) 🔴

**Các lớp cần tạo:**
- Entity đã có: `PhanCongTour`
- Tạo mới: `PhanCongTourRepository`, `PhanCongTourService`, `PhanCongTourController`

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| GET | `/api/manager/hdv-kha-dung` | MANAGER/ADMIN | UC38 | DSách HDV có thể phân công |
| POST | `/api/manager/phan-cong` | MANAGER/ADMIN | UC37 | Phân công HDV vào tour |
| DELETE | `/api/manager/phan-cong/{id}` | MANAGER/ADMIN | UC37 | Hủy phân công |
| GET | `/api/hdv/tour-cua-toi` | HDV | — | HDV xem tour được giao |

**DTO `TimHdvKhaDungRequest` (query params):**
```
maTourThucTe,   // để tự tính khoảng thời gian cần loại trừ
ngonNgu, chuyenMon
```
> Response: Danh sách `NhanVien` với `TrangThai = HOAT_DONG`, chưa bị phân công trùng lịch với `TourThucTe.NgayKhoiHanh → NgayKetThuc`

**DTO `PhanCongRequest`:**
```java
String maTourThucTe;   // @NotBlank
String maNhanVien;     // @NotBlank — phải là HDV
String ghiChu;
```

**Business logic:**
- [ ] `UC38` — Truy vấn HDV không có `PhanCongTour` trong khoảng `[ngayKhoiHanh - 1, ngayKetThuc + 1]`; Query HQL:
  ```sql
  WHERE nv.TrangThai = 'HOAT_DONG'
    AND nv.MaVaiTro = 'HDV'
    AND nv.MaNhanVien NOT IN (
      SELECT pc.MaNhanVien FROM PHANCONGTOUR pc
      JOIN TOURTHUCTE tt ON pc.MaTourThucTe = tt.MaTourThucTe
      WHERE tt.NgayKhoiHanh <= :ngayKetThuc
        AND tt.NgayKetThuc  >= :ngayKhoiHanh
    )
  ```
- [ ] `UC37`: Tạo `PhanCongTour`; cập nhật `NhanVien.TrangThai = BAN`
- [ ] Khi hủy phân công: `NhanVien.TrangThai = HOAT_DONG` nếu không còn tour nào đang diễn ra

---

### Vận hành thực địa (UC42–UC46) 🔴

**Các lớp cần tạo:**
- Entity đã có: `HanhDong`, `NhatKySuCo`, `ChiPhiThucTe`, `DiemDanh`
- Tạo mới: các Repository + `VanHanhService`, `VanHanhHdvController`

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| GET | `/api/hdv/tour/{maTour}/doan` | HDV | UC42 | Xem danh sách khách trong đoàn |
| POST | `/api/hdv/tour/{maTour}/diem-danh` | HDV | UC43 | Điểm danh khách bằng QR |
| POST | `/api/hdv/tour/{maTour}/hanh-dong-xanh` | HDV | UC44 | Xác nhận hành động xanh của KH |
| POST | `/api/hdv/tour/{maTour}/su-co` | HDV | UC45 | Báo cáo sự cố |
| PUT | `/api/hdv/tour/{maTour}/su-co/{id}` | HDV | UC45 | Cập nhật trạng thái sự cố |
| POST | `/api/hdv/tour/{maTour}/chi-phi` | HDV | UC46 | Nhập chi phí phát sinh |

**DTO `DiemDanhRequest`:**
```java
String maHoChieuSo;    // @NotBlank — scan từ QR code
String loaiDiemDanh;   // "DI" | "VE"
```
> Response: Thông tin KH + trạng thái điểm danh `ConLai / DaDiemDanh / KhongCoMat`

**DTO `XacNhanHanhDongXanhRequest`:**
```java
String maTaiKhoanKhach;      // @NotBlank
String maHanhDongXanh;       // @NotBlank — phải thuộc tour này
String hinhAnhMinhChung;     // Base64 hoặc URL (upload)
String ghiChu;
```
**Business logic `UC44`:**
- [ ] Validate `maHanhDongXanh` thuộc tour hiện tại
- [ ] Kiểm tra KH chưa được tích hành động này trong tour này (không tích 2 lần 1 loại hành động)
- [ ] Cộng `HanhDongXanh.DiemXanh` vào `HoChieuSo.DiemXanh`
- [ ] `insert HanhDong(maTourThucTe, maTaiKhoan, maHanhDongXanh, thoiGian, hinhAnh)`
- [ ] **Kiểm tra nâng hạng** sau khi cộng điểm (xem logic nâng hạng bên dưới)

**DTO `BaoCaoSuCoRequest`:**
```java
String tieuDe;     // @NotBlank
String moTa;       // @NotBlank
String mucDo;      // "THAP" | "TRUNG_BINH" | "CAO" | "KHAN_CAP"
String diaPoint;   // tọa độ GPS (optional)
```

**DTO `NhapChiPhiRequest`:**
```java
String danhMuc;        // "AN_UONG" | "DI_CHUYEN" | "LUU_TRU" | "Y_TE" | "KHAC"
BigDecimal soTien;     // @DecimalMin("0.01")
String donViTien;      // "VND" (mặc định)
String ghiChu;
String hinhAnhHoaDon;  // Base64 hoặc URL
```

---

## Tài chính, Quyết toán & Báo cáo
> **Mục tiêu:** Kế toán quyết toán được tour, xem được dashboard tổng hợp

### Quyết toán tour (UC47–UC53) 🔴

**Các lớp cần tạo:**
- Entity đã có: `QuyetToan`, `ChiPhiThucTe`
- Tạo mới: `QuyetToanRepository`, `QuyetToanService`, `QuyetToanController`

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| GET | `/api/ketoan/chi-phi-cho-duyet` | KETOAN | UC49 | DS chi phí HDV nộp, chờ duyệt |
| PUT | `/api/ketoan/chi-phi/{id}/duyet` | KETOAN | UC49 | Duyệt chi phí |
| PUT | `/api/ketoan/chi-phi/{id}/tu-choi` | KETOAN | UC49 | Từ chối chi phí |
| GET | `/api/ketoan/tour-can-quyet-toan` | KETOAN | UC51 | DS tour đã kết thúc, chưa quyết toán |
| GET | `/api/ketoan/tour/{maTour}/tinh-toan` | KETOAN | UC47 | Xem trước tổng hợp tài chính |
| POST | `/api/ketoan/quyet-toan` | KETOAN | UC50 | Tạo bản ghi quyết toán, khóa dữ liệu |
| GET | `/api/ketoan/quyet-toan` | KETOAN | UC51 | DS quyết toán đã có |
| GET | `/api/ketoan/quyet-toan/{id}` | KETOAN | UC50 | Chi tiết quyết toán |

**DTO `TinhToanQuyetToanResponse` (UC47 — preview):**
```java
String maTourThucTe;
String tenTour;
LocalDate ngayKhoiHanh;
LocalDate ngayKetThuc;
Integer soKhach;

BigDecimal tongDoanhThu;     // Σ DonDatTour.TongTienSauGiam (TrangThai = XAC_NHAN)
BigDecimal tongHoanTien;     // Σ ThanhToan.SoTienHoan (TrangThai = DA_HOAN_TIEN)
BigDecimal doanhThuThuc;     // tongDoanhThu - tongHoanTien

BigDecimal tongChiPhiDaXet;  // Σ ChiPhiThucTe (TrangThai = DA_DUYET)
BigDecimal loiNhuan;         // doanhThuThuc - tongChiPhiDaXet

// Cảnh báo
boolean vuotDinhMuc;         // tongChiPhiDaXet > GiaSan × soKhach × 0.8
BigDecimal phanTramChiPhi;   // tongChiPhiDaXet / doanhThuThuc × 100

// Chi tiết chi phí theo danh mục
List<ChiPhiTheoNhomResponse> chiPhiTheoNhom;
```

**Business logic:**
- [ ] `UC49`: Chỉ duyệt chi phí có `TrangThai = CHO_DUYET`; khi duyệt → `TrangThai = DA_DUYET`; khi từ chối → `TrangThai = TU_CHOI` + lưu lý do
- [ ] `UC48`: Sau khi tính, nếu `tongChiPhi > GiaSan × soKhach × 0.8` → thêm field `canhBao = true` vào response
- [ ] `UC51`: Tour "cần quyết toán" = `TourThucTe.NgayKetThuc < NOW()` AND không có `QuyetToan.MaTourThucTe = maTour`
- [ ] `UC50`: Tạo `QuyetToan` với snapshot tài chính tại thời điểm đó; sau khi tạo **không cho sửa lại** các `ChiPhiThucTe` liên quan (validate khi có `QuyetToan` rồi thì từ chối update chi phí)
- [ ] `UC53` — API export báo cáo:
  - `GET /api/bao-cao/doanh-thu-theo-thang?nam={year}` → trả JSON `[{ thang, doanhThu, soTour, soKhach }]`
  - `GET /api/bao-cao/top-tour?top=10&nam={year}` → top tour lợi nhuận cao nhất
  - `GET /api/bao-cao/diem-xanh?nam={year}` → tổng điểm xanh tích lũy theo tháng

---

### Đánh giá & Khiếu nại (UC35–UC36, UC41) 🟡

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| POST | `/api/khach-hang/danh-gia` | KHACHHANG | UC35 | Gửi đánh giá sau tour |
| POST | `/api/khach-hang/khieu-nai` | KHACHHANG | UC36 | Gửi khiếu nại / yêu cầu hỗ trợ |
| GET | `/api/nhan-vien/khieu-nai` | SALES/MANAGER | UC41 | DS khiếu nại chờ xử lý |
| PUT | `/api/nhan-vien/khieu-nai/{id}/xu-ly` | SALES/MANAGER | UC41 | Cập nhật trạng thái khiếu nại |
| GET | `/api/tour/{maTour}/danh-gia` | Public | — | Xem đánh giá của 1 tour |

**DTO `DanhGiaRequest`:**
```java
String maTourThucTe;   // @NotBlank — phải là tour KH đã đi
Integer soSao;         // @Min(1) @Max(5)
String binhLuan;       // @Size(max=2000)
List<String> hinhAnh;  // URLs (optional)
```
> Validate: KH chỉ có thể đánh giá nếu `LichSuTour` tồn tại với `maTourThucTe` + `maTaiKhoan` và tour đã kết thúc

**Business logic:**
- [ ] `UC35`: Sau khi lưu đánh giá → trigger hoặc scheduled job cập nhật `TourMau.DiemDanhGiaTB = AVG(DanhGiaKh.SoSao)` cho tour mẫu tương ứng
- [ ] `UC41`: Update `YeuCauHoTro.TrangThai = DANG_XU_LY → DA_GIAI_QUYET`; lưu `NguoiXuLy`, `NgayXuLy`, `KetQua`

---

### Dynamic Pricing Engine 🟡

**Lớp cần tạo:** `DynamicPricingService`, `DynamicPricingScheduler`

**Business logic:**
```
TyLeLapDay = SoKhachDaDat / SoKhachToiDa

if TyLeLapDay > 0.80  → GiaBan = GiaSan × 1.30
if TyLeLapDay > 0.60  → GiaBan = GiaSan × 1.15
if TyLeLapDay > 0.40  → GiaBan = GiaSan × 1.00
if TyLeLapDay < 0.20  AND NgayConLai < 7  → GiaBan = GiaSan × 0.90   (Last-minute)
else                                        → GiaBan = GiaSan × 1.00

Ràng buộc: GiaBan = max(GiaBan, GiaSan)
```
- [ ] `@Scheduled(fixedDelay = 1800000)` — chạy mỗi 30 phút; lọc tour `TrangThai = MO` và `NgayKhoiHanh > NOW()`; cập nhật `TourThucTe.GiaTien`
- [ ] Tính `NgayConLai = ChronoUnit.DAYS.between(NOW(), ngayKhoiHanh)`
- [ ] Tính `SoKhachDaDat = SoKhachToiDa - ChoNgoi`

---

### Quản trị hệ thống & Hoàn thiện 🟡

**API endpoints:**

| Method | Path | Auth | UC | Mô tả |
|--------|------|------|----|-------|
| GET | `/api/admin/audit-log` | ADMIN | UC70 | Xem nhật ký hệ thống |
| GET | `/api/admin/voucher/{id}` | ADMIN/MANAGER | UC54 | Chi tiết voucher |
| PUT | `/api/admin/voucher/{id}/vo-hieu-hoa` | ADMIN/MANAGER | UC54 | Vô hiệu hóa voucher |

**Loyalty — Logic nâng hạng thành viên:**
```
DiemXanh   0–99    → CO_BAN
DiemXanh   100–499 → BAC
DiemXanh   500–999 → VANG
DiemXanh   1000+   → PLATINUM
```
- [ ] Sau mỗi lần `DiemXanh` thay đổi (UC44, UC30), gọi `hangThanhVienService.kiemTraNangHang(hoChieuSo)`
- [ ] Nếu hạng mới > hạng cũ → cập nhật `HoChieuSo.HangThanhVien`, ghi log

**Refresh Token:**
- [ ] Thêm bảng `RefreshToken` (hoặc dùng `TaiKhoan.RefreshToken` field) với TTL dài hơn access token
- [ ] `POST /api/auth/lam-moi-token` — nhận `refreshToken`, trả access token mới (không cần đăng nhập lại)
- [ ] `POST /api/auth/dang-xuat` — hủy `refreshToken` trong DB

**Cải thiện Security:**
- [ ] Rate limiting `POST /api/auth/dang-nhap` (max 5 lần/phút/IP) bằng bucket4j hoặc custom filter
- [ ] Input validation đầy đủ tất cả DTO (`@Valid`, `@NotNull`, `@Min`, `@Pattern`, `@Size`)
- [ ] Mã hóa trường nhạy cảm `HoChieuSo.GhiChuYTe` và `HoChieuSo.DiUng` bằng `@Convert` (AES-256)
- [ ] CORS configuration: chỉ cho phép origin của frontend

### Seed data & Test API 🔴
- [ ] Viết đủ dữ liệu mẫu để demo:
  - 10 tour mẫu, 20 tour thực tế (nhiều trạng thái)
  - 5 tài khoản các vai trò khác nhau
  - 15 khách hàng với hộ chiếu số đầy đủ
  - 30 đơn đặt tour (các trạng thái khác nhau)
  - 5 voucher các loại
- [ ] Test thủ công toàn bộ luồng chính trên Postman/Swagger
- [ ] Fix các bug phát hiện trong quá trình test
---

## Kiểm thử tổng thể & Chuẩn bị báo cáo
> **Mục tiêu:** Hệ thống ổn định, sẵn sàng demo và bảo vệ đồ án

### Kiểm thử toàn diện
- [ ] **Unit Test** các service quan trọng:
  - `BookingService` (tính tiền, kiểm tra chỗ)
  - `VoucherService` (điều kiện áp dụng, giảm giá)
  - `DynamicPricingService` (các ngưỡng giá)
  - `SettlementService` (tính lợi nhuận)
- [ ] **Integration Test** các luồng end-to-end:
  - Luồng đặt tour → thanh toán → xác nhận
  - Luồng hủy tour → hoàn tiền
  - Luồng HDV → điểm danh → tích điểm xanh
- [ ] Test bảo mật:
  - Thử truy cập endpoint không đúng quyền → phải bị từ chối
  - Test JWT hết hạn

### Tối ưu hiệu năng
- [ ] Thêm index Oracle cho các trường tìm kiếm thường xuyên:
  - `TOURTHUCTE(TrangThai, NgayKhoiHanh)`
  - `DONDATTOUR(MaKhachHang, TrangThai)`
  - `HOCHIEUSO(MaTaiKhoan)`
- [ ] Tối ưu query N+1 bằng `@EntityGraph` hoặc `JOIN FETCH`
- [ ] Bật connection pooling (HikariCP) với config phù hợp

### Viết báo cáo đồ án
- [ ] Mô tả kiến trúc hệ thống (diagram)
- [ ] Mô tả thiết kế database (ERD)
- [ ] Danh sách use case đã cài đặt vs chưa cài đặt
- [ ] Hướng dẫn cài đặt và chạy dự án (`README.md`)
- [ ] Kết quả kiểm thử (screenshot Postman/Swagger)

### Tổng duyệt demo
- [ ] Chạy demo end-to-end một lần hoàn chỉnh
- [ ] Chuẩn bị slide thuyết trình
- [ ] Backup DB + source code

---

## 📊 BẢNG TỔNG KẾT USE CASE THEO TUẦN

| Tuần | Module | Use Case | Mức độ |
|------|--------|----------|--------|
| 1 | Hạ tầng & Auth | UC58, UC59, UC60, UC61 | 🔴 |
| 2 | Quản lý Tour | UC02–UC09, UC11–UC14, UC16–UC20 | 🔴/🟡 |
| 3 | Khách hàng & Đặt tour | UC21–UC27 | 🔴 |
| 4 | Thanh toán & Voucher | UC28–UC34, UC52, UC55–UC56 | 🔴 |
| 5 | Nhân sự & Vận hành | UC37–UC38, UC42–UC46, UC64–UC68 | 🔴/🟡 |
| 6 | Tài chính & Báo cáo | UC35–UC36, UC41, UC47–UC53 | 🔴/🟡 |
| 7 | Quản trị & Hoàn thiện | UC30–UC31, UC54, UC62, UC69–UC70 | 🟡 |
| 8 | Kiểm thử & Báo cáo | Tất cả UC (regression test) | 🔴 |

### Use case Nice-to-have (làm nếu còn thời gian) 🟢
- `UC03` Sao chép tour mẫu (nếu chưa làm tuần 2)
- `UC53` Tích hợp thực tế với Power BI (thay vì API JSON)
- OCR hóa đơn (Google Vision API) cho `UC46`
- QR Code generator thực tế cho `UC43`
- Push notification cho HDV nhận lệnh điều động

---

## ➕ BỔ SUNG MVP THEO TÀI LIỆU (GIỮ TIẾN ĐỘ 2 THÁNG)

### 1) Allotment Lite (tuần 5–6) 🔴
- [ ] Theo dõi hạn mức cam kết phòng/vé theo từng `TourThucTe` ở mức tối thiểu (cam kết, đã dùng, còn lại)
- [ ] Cảnh báo khi số lượng sử dụng vượt ngưỡng cam kết
- [ ] Đưa số liệu Allotment vào quyết toán để tính đúng `TongChiPhi`

### 2) Checklist ràng buộc dữ liệu bắt buộc (tuần 1–3) 🔴
- [ ] Constraint DB + validate service cho các rule lõi:
  - Giá tiền, điểm xanh, số lượng khách luôn không âm
  - Trạng thái chỉ nhận giá trị hợp lệ (tour, thanh toán, voucher, tài khoản)
  - Không vượt sức chứa tour khi đặt chỗ
  - HDV không bị phân công trùng lịch
  - Dữ liệu tài chính không cho sửa sau khi đã quyết toán

### 3) Thanh toán MoMo production-ready tối thiểu (tuần 4 + tuần 7) 🔴
- [ ] Có idempotency khi xử lý callback/IPN (không cập nhật trùng giao dịch)
- [ ] Có cơ chế retry an toàn cho đồng bộ trạng thái thanh toán
- [ ] Có log đối soát giao dịch theo ngày cho kế toán

---

## ⚠️ RỦI RO & KẾ HOẠCH DỰ PHÒNG

| Rủi ro | Xác suất | Giải pháp |
|--------|----------|-----------|
| Tích hợp MoMo mất nhiều thời gian | Cao | Chốt sớm scope chỉ dùng luồng `captureWallet`; nếu chậm thì dùng mock payment giữ nguyên contract API |
| Callback IPN từ MoMo không về máy local | Cao | Dùng tunnel (`ngrok`/`cloudflared`) cho môi trường dev và có API đồng bộ trạng thái chủ động |
| Oracle EE 18c cài đặt gặp lỗi | Trung bình | Test kỹ trên môi trường dev ngay tuần 1; backup plan dùng H2 cho unit test |
| Dynamic Pricing phức tạp hơn dự kiến | Thấp | Implement phiên bản đơn giản (2 ngưỡng) trước, refine sau |
| Thiếu thời gian hoàn thành mobile app | Cao | Ưu tiên web API, giao diện HDV có thể là web responsive thay vì native app |
| Seed data không đủ để demo | Thấp | Viết script seed data từ tuần 3, test demo song song với dev |

---

## 🛠️ TECH STACK CHI TIẾT

```
Backend:
├── Java 17 (LTS)
├── Spring Boot 3.x
│   ├── Spring Security (JWT + RBAC)
│   ├── Spring Data JPA (Hibernate)
│   ├── Spring Validation
│   └── Spring Scheduler
├── Oracle EE 18c
├── Lombok + MapStruct
├── Springdoc OpenAPI (Swagger UI)
└── JUnit 5 + Mockito (Test)

Công cụ:
├── Maven / Gradle
├── Postman (API testing)
├── MoMo Sandbox (Payment API)
├── ngrok / cloudflared (test callback IPN trên local)
├── DBeaver (Oracle client)
├── Git + GitHub
└── Power BI Desktop (báo cáo)
```

---
