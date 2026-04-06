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

## 🏗️ TUẦN 1 — Nền tảng & Hạ tầng
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

### Quy ước Git branch (áp dụng từ tuần 1)
- `main`: nhánh ổn định để demo/release, chỉ nhận merge từ `dev`.
- `dev`: nhánh tích hợp chính trong quá trình phát triển hằng ngày.
- `feature/*`: nhánh chức năng tạo từ `dev`, ví dụ: `feature/auth-jwt`, `feature/booking-create`.
- Quy trình đề xuất: `feature/*` -> Pull Request -> `dev` -> kiểm thử -> merge `main`.

### Ngày 3–5: Tạo Database Schema
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

### Ngày 6–7: Cơ sở hạ tầng bảo mật (UC57–UC62)
- [ ] Cài đặt JWT Authentication filter
- [ ] Cài đặt RBAC với Spring Security (`@PreAuthorize`)
- [ ] Định nghĩa 5 vai trò: `ADMIN`, `MANAGER`, `SALES`, `KETOAN`, `HDV`, `KHACHHANG`
- [ ] API: Đăng ký `UC58`, Đăng nhập `UC59`, Đăng xuất `UC60`, Quên mật khẩu `UC61`
- [ ] Global Exception Handler (`@ControllerAdvice`)
- [ ] Chuẩn hóa `ApiResponse<T>` wrapper cho toàn bộ response

**✅ Milestone tuần 1:** Gọi được API đăng nhập, nhận JWT, gọi API protected thành công.

---

## 🧱 TUẦN 2 — Quản lý Sản phẩm Tour (Module 1)
> **Mục tiêu:** CRUD đầy đủ Tour Mẫu + Tour Thực tế + khởi động luồng định giá

### Ngày 8–10: Tour Mẫu & Lịch trình (UC01–UC09) 🔴
- [ ] Entity + Repository: `TourMau`, `LichTrinhTour`
- [ ] `UC02` Thêm tour mẫu (kèm validation giá sàn > 0)
- [ ] `UC03` Sao chép tour mẫu (deep copy bao gồm lịch trình)
- [ ] `UC04` Sửa thông tin tour mẫu
- [ ] `UC05` Xóa tour mẫu (soft delete — đổi `TrangThai`)
- [ ] `UC06` Tra cứu tour mẫu (filter theo tên, trạng thái, thời lượng)
- [ ] `UC08` Thêm ngày/hoạt động vào lịch trình
- [ ] `UC09` Sửa lịch trình tour

### Ngày 11–12: Tour Thực tế (UC10–UC14) 🔴
- [ ] Entity + Repository: `TourThucTe`
- [ ] `UC11` Khởi tạo tour thực tế từ tour mẫu (kế thừa lịch trình, nhập ngày/phương tiện/sức chứa)
- [ ] `UC12` Xóa tour thực tế (chỉ xóa khi chưa có đơn đặt)
- [ ] `UC13` Sửa thông tin tour thực tế (giá, trạng thái, số chỗ)
- [ ] `UC14` Tra cứu tour thực tế (filter trạng thái Mo/Dong/Huy, ngày khởi hành)

### Ngày 13–14: Dịch vụ bổ sung & Hành động xanh (UC15–UC20) 🟡
- [ ] Entity: `LoaiPhong`, `DichVuThem`, `HanhDongXanh`
- [ ] `UC16–UC19` CRUD dịch vụ bổ sung (phòng đơn/đôi, vé tham quan, phụ thu)
- [ ] `UC20` Cấu hình hành động xanh cho từng tour (gán danh mục xanh + điểm)

**✅ Milestone tuần 2:** Tạo được tour mẫu → clone ra tour thực tế → xem danh sách trên Swagger.

---

## 👤 TUẦN 3 — Khách hàng, Hộ chiếu số & Đặt Tour
> **Mục tiêu:** Khách hàng tra cứu tour, đặt chỗ tạm thời thành công

### Ngày 15–16: Hộ chiếu số & Hồ sơ khách (UC21–UC24) 🔴
- [ ] Entity: `HoChieuSo`, `LichSuTour`
- [ ] `UC21` Khách xem hồ sơ cá nhân + hạng thành viên + điểm xanh
- [ ] `UC22` Xem chi tiết lịch sử các tour đã tham gia
- [ ] `UC23` Cập nhật thông tin hộ chiếu số (thông tin y tế, dị ứng, sở thích)
- [ ] `UC24` Nhân viên tra cứu hồ sơ khách (filter theo tên, số điện thoại, CCCD)

### Ngày 17–18: Tra cứu & Xem tour (UC25–UC26) 🔴
- [ ] `UC25` API tra cứu tour thực tế cho khách hàng:
  - Filter: địa điểm, khoảng giá, ngày khởi hành, thời lượng
  - Sắp xếp: giá tăng/giảm, đánh giá, mức độ bền vững
  - Phân trang (`Pageable`)
- [ ] `UC26` Xem chi tiết tour: lịch trình từng ngày, giá hiện tại, chỗ còn lại, dịch vụ đi kèm

### Ngày 19–21: Đặt tour & Giữ chỗ tạm thời (UC27) 🔴
- [ ] Entity: `DonDatTour`, `ChiTietDatTour`, `ChiTietDichVu`
- [ ] Luồng đặt tour:
  1. Khách chọn tour + số người + loại phòng + dịch vụ thêm
  2. Hệ thống kiểm tra số chỗ còn (`ChoNgoi`) — nếu đủ thì tạm giữ
  3. Tạo `DonDatTour` với `TrangThai = ChoXacNhan` và `ThoiGianHetHan = NOW() + 15 phút`
  4. Trả về thông tin đơn + tổng tiền tạm tính
- [ ] Tính `TongTien`:
  ```
  TongTien = (GiaTaiThoiDiemDat × (SoLuongKH + 1)) 
           + PhuTruPhong × SoPhong 
           + Σ(GiaDichVu × SoLuongKhach)
  ```
- [ ] Scheduler: tự động hủy đơn hết hạn giữ chỗ (`@Scheduled`, chạy mỗi 1 phút)

**✅ Milestone tuần 3:** Khách đặt tour thành công, đơn ở trạng thái "Chờ xác nhận", countdown 15 phút.

---

## 💳 TUẦN 4 — Thanh toán, Voucher & Hủy Tour
> **Mục tiêu:** Hoàn thiện luồng tiền — từ đặt tour đến thanh toán thành công

### Ngày 22–23: Voucher & Áp dụng ưu đãi (UC28, UC30–UC31, UC55–UC56) 🔴
- [ ] Entity: `Voucher`, `KhuyenMai_KH`, `DatTour_UuDai`
- [ ] `UC28` Áp dụng voucher vào đơn hàng:
  - Kiểm tra hạn dùng, lượt dùng còn lại, điều kiện đơn tối thiểu
  - Kiểm tra hạng thành viên của khách
  - Tính giảm giá (theo %, theo số tiền cố định)
  - Đảm bảo `GiaSauGiam >= GiaSan × SoKhach`
- [ ] `UC30` Đổi điểm xanh lấy Voucher (insert `NhatKyDoiDiem`, trừ `DiemXanh` trong `HoChieuSo`)
- [ ] `UC31` Khách xem danh sách voucher trong ví (lọc theo trạng thái: chưa dùng / đã dùng / hết hạn)
- [ ] `UC55` Admin tạo voucher (loại, điều kiện, đối tượng áp dụng)
- [ ] `UC56` Phân phối voucher vào ví khách theo hạng thành viên

### Ngày 24–25: Thanh toán (UC29) 🔴
- [ ] Entity: `ThanhToan`
- [ ] Tích hợp **MoMo sandbox** (hoặc mock payment nếu chưa có key thật):
  - Tạo payment request (`captureWallet`) → nhận `payUrl`/`deeplink` để redirect khách
  - Nhận callback IPN từ MoMo và xác thực chữ ký `HMAC-SHA256`
  - Mapping trạng thái theo `resultCode` (`0 = thành công`, khác `0` = thất bại/hủy)
  - Cập nhật `DonDatTour.TrangThai = XacNhan` + trừ `ChoNgoi` trong `TourThucTe`
- [ ] API chủ động kiểm tra trạng thái giao dịch từ MoMo (phòng trường hợp IPN trễ)
- [ ] Lưu đầy đủ `requestId`, `orderId`, `transId`, `resultCode` trong `ThanhToan`
- [ ] Gửi email xác nhận đặt tour (JavaMailSender hoặc mock)
- [ ] API kiểm tra trạng thái thanh toán

### Ngày 26–27: Hủy tour & Hoàn tiền (UC32–UC33, UC52) 🔴
- [ ] `UC32` Khách gửi yêu cầu hủy tour → tạo bản ghi `YeuCauHoTro` loại Hoàn tiền
- [ ] Logic tính phí hủy theo thời điểm:
  ```
  > 15 ngày trước khởi hành  → Hoàn 90%
  7–15 ngày                   → Hoàn 70%
  3–7 ngày                    → Hoàn 50%
  < 3 ngày                    → Hoàn 0%
  ```
- [ ] `UC33` Nhân viên xác nhận hoàn tiền → cập nhật `ThanhToan.TrangThai = DaHoanTien`
- [ ] `UC52` Kế toán xử lý hoàn tiền (xem danh sách yêu cầu hoàn tiền chờ duyệt)
- [ ] `UC34` Nhân viên tra cứu đơn hàng (filter theo trạng thái, khách hàng, tour)

**✅ Milestone tuần 4:** Demo đầy đủ luồng: Đặt → Áp voucher → Thanh toán → Hủy → Hoàn tiền.

---

## 🧭 TUẦN 5 — Điều phối Nhân sự & Vận hành Tour
> **Mục tiêu:** Phân công HDV, HDV nhận lệnh và vận hành tour trên mobile/web

### Ngày 28–29: Hồ sơ nhân viên & HDV (UC63–UC68) 🔴
- [ ] Entity: `NhanVien`, `NangLucNhanVien`
- [ ] `UC64` Admin tạo tài khoản nhân viên (loại: HDV, Kế toán, Sales...)
- [ ] `UC65` Cập nhật năng lực HDV (ngôn ngữ, chứng chỉ, chuyên môn, điểm đánh giá)
- [ ] `UC66` Khóa tài khoản, `UC67` Mở khóa tài khoản
- [ ] `UC68` Tìm kiếm tài khoản (filter theo vai trò, trạng thái, tên)
- [ ] `UC69` Gán vai trò RBAC cho tài khoản

### Ngày 30–31: Điều phối HDV (UC37–UC38) 🔴
- [ ] Entity: `PhanCongTour`
- [ ] `UC38` Tra cứu HDV khả dụng:
  - Filter: `Status = Available`, ngôn ngữ, chuyên môn
  - Loại trừ HDV đã bị phân công trong khoảng thời gian tour
- [ ] `UC37` Phân công HDV vào tour thực tế:
  - Tạo bản ghi `PhanCongTour`
  - Tự động cập nhật `NhanVien.Status = Busy`
  - Gửi thông báo cho HDV (mock email/notification)

### Ngày 32–34: Vận hành thực địa (UC42–UC46) 🔴
> *Xây dưới dạng web API — có thể wrap thành mobile-friendly endpoint sau*

- [ ] Entity: `HanhDong`, `NhatKySuCo`, `ChiPhiThucTe`
- [ ] `UC42` HDV xem thông tin đoàn: danh sách khách, lưu ý y tế, dị ứng, yêu cầu đặc biệt
- [ ] `UC43` Điểm danh khách bằng QR Code (validate `MaHoChieuSo`, ghi timestamp)
- [ ] `UC44` HDV xác nhận hành động xanh của khách:
  - Upload ảnh minh chứng → lưu `HinhAnhXacMinh`
  - Cộng điểm xanh vào `HoChieuSo.DiemXanh`
  - Insert bản ghi `HanhDong`
  - Kiểm tra ngưỡng nâng hạng thành viên
- [ ] `UC45` HDV báo cáo sự cố (tạo `NhatKySuCo`, cập nhật trạng thái)
- [ ] `UC46` HDV nhập chi phí phát sinh:
  - Upload hình ảnh hóa đơn
  - Nhập danh mục, thành tiền, ghi chú

**✅ Milestone tuần 5:** HDV login → nhận danh sách đoàn → điểm danh → xác nhận hành động xanh → báo sự cố.

---

## 💰 TUẦN 6 — Tài chính, Quyết toán & Báo cáo
> **Mục tiêu:** Kế toán quyết toán được tour, xem được dashboard tổng hợp

### Ngày 35–37: Quyết toán tour (UC47–UC53) 🔴
- [ ] Entity: `QuyetToan`
- [ ] `UC49` Kế toán phê duyệt chi phí thực tế do HDV nộp (Duyệt / Từ chối từng khoản)
- [ ] `UC47` Tính lợi nhuận gộp:
  ```
  TongDoanhThu = Σ(TongTien của các đơn XacNhan) - SoTienHoanTra
  TongChiPhi   = Σ(ChiPhiThucTe đã duyệt)
  LoiNhuan     = TongDoanhThu - TongChiPhi
  ```
- [ ] `UC48` Cảnh báo chi phí vượt định mức (flag khi `TongChiPhi > GiaSan × SoKhach × 0.8`)
- [ ] `UC51` Tra cứu danh sách tour cần quyết toán (đã kết thúc, chưa có `QuyetToan`)
- [ ] `UC50` Kế toán tạo bản ghi quyết toán, khóa dữ liệu tài chính tour
- [ ] `UC53` Trích xuất báo cáo (API trả JSON cho Power BI):
  - Doanh thu theo tháng
  - Top tour có lợi nhuận cao nhất
  - Thống kê điểm xanh tích lũy

### Ngày 38–39: Đánh giá & Khiếu nại (UC35–UC36, UC41) 🟡
- [ ] Entity: `DanhGiaKH`, `YeuCauHoTro`
- [ ] `UC35` Sau tour kết thúc, khách gửi đánh giá (1–5 sao, bình luận, ảnh)
- [ ] `UC36` Khách gửi khiếu nại / yêu cầu hỗ trợ
- [ ] `UC41` Nhân viên Operations giải quyết khiếu nại (cập nhật trạng thái Pending → Resolved)
- [ ] Tổng hợp `DanhGia` trung bình vào `TourMau.DanhGia` (trigger hoặc scheduled job)

### Ngày 40: Dynamic Pricing Engine 🟡
- [ ] Implement thuật toán định giá động:
  ```
  TyLeLapDay = SoKhachDaDat / SoKhachToiDa
  
  if TyLeLapDay > 0.8    → GiaBan = GiaSan × 1.3
  if TyLeLapDay > 0.6    → GiaBan = GiaSan × 1.15
  if TyLeLapDay > 0.4    → GiaBan = GiaSan × 1.0
  if TyLeLapDay < 0.2 and NgayConLai < 7  → GiaBan = GiaSan × 0.9  (Last-minute)
  
  Ràng buộc: GiaBan >= GiaSan (không bao giờ thấp hơn giá sàn)
  ```
- [ ] Scheduled job chạy mỗi 30 phút, cập nhật `TourThucTe.GiaTien`

**✅ Milestone tuần 6:** Demo luồng tài chính đầy đủ: phê duyệt chi phí → quyết toán → xem báo cáo.

---

## 🔧 TUẦN 7 — Hoàn thiện & Tích hợp
> **Mục tiêu:** Bịt lỗ hổng, tích hợp quản trị hệ thống, chuẩn bị demo

### Ngày 41–42: Quản trị hệ thống (UC57, UC69–UC70) 🟡
- [ ] `UC69` RBAC: gán/thu hồi quyền theo vai trò từ giao diện admin
- [ ] `UC70` Nhật ký hệ thống: log mọi thao tác quan trọng (`AuditLog` với thông tin user, action, timestamp)
- [ ] `UC62` Đổi mật khẩu (xác thực mật khẩu cũ trước khi đổi)

### Ngày 43–44: Voucher nâng cao, Loyalty & Integration Gateway (UC54, UC56) 🟡
- [ ] `UC54` Admin quản lý toàn bộ voucher (xem, sửa, vô hiệu hóa)
- [ ] Logic nâng hạng thành viên tự động:
  ```
  DiemXanh  0–99   → CoBan
  DiemXanh  100–499 → Bac
  DiemXanh  500–999 → Vang
  DiemXanh  1000+   → Platinum
  ```
- [ ] Cập nhật `HoChieuSo.HangThanhVien` sau mỗi lần tích điểm
- [ ] Dựng `IntegrationGateway` dạng adapter/service:
  - `PaymentConnector` (MoMo)
  - `BIConnector` (API export JSON cho Power BI)
  - `EmailSMSConnector` (mock để gửi thông báo xác nhận)

### Ngày 45–46: Cải thiện API & Security 🔴
- [ ] Refresh Token (tránh logout khi JWT hết hạn)
- [ ] Rate limiting cho các endpoint public (tra cứu tour)
- [ ] Input validation toàn bộ DTO (`@Valid`, `@NotNull`, `@Min`, `@Pattern`)
- [ ] Mã hóa trường nhạy cảm trong DB (`GhiChuYTe`, `DiUng` của `HoChieuSo`)
- [ ] CORS configuration cho frontend
- [ ] Chuẩn hóa lại Swagger/OpenAPI docs

### Ngày 47–48: Seed data & Test API 🔴
- [ ] Viết đủ dữ liệu mẫu để demo:
  - 10 tour mẫu, 20 tour thực tế (nhiều trạng thái)
  - 5 tài khoản các vai trò khác nhau
  - 15 khách hàng với hộ chiếu số đầy đủ
  - 30 đơn đặt tour (các trạng thái khác nhau)
  - 5 voucher các loại
- [ ] Test thủ công toàn bộ luồng chính trên Postman/Swagger
- [ ] Fix các bug phát hiện trong quá trình test

**✅ Milestone tuần 7:** Toàn bộ API chạy ổn định, seed data đủ để demo.

---

## 🎬 TUẦN 8 — Kiểm thử tổng thể & Chuẩn bị báo cáo
> **Mục tiêu:** Hệ thống ổn định, sẵn sàng demo và bảo vệ đồ án

### Ngày 49–51: Kiểm thử toàn diện
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

### Ngày 52–53: Tối ưu hiệu năng
- [ ] Thêm index Oracle cho các trường tìm kiếm thường xuyên:
  - `TOURTHUCTE(TrangThai, NgayKhoiHanh)`
  - `DONDATTOUR(MaKhachHang, TrangThai)`
  - `HOCHIEUSO(MaTaiKhoan)`
- [ ] Tối ưu query N+1 bằng `@EntityGraph` hoặc `JOIN FETCH`
- [ ] Bật connection pooling (HikariCP) với config phù hợp

### Ngày 54–55: Viết báo cáo đồ án
- [ ] Mô tả kiến trúc hệ thống (diagram)
- [ ] Mô tả thiết kế database (ERD)
- [ ] Danh sách use case đã cài đặt vs chưa cài đặt
- [ ] Hướng dẫn cài đặt và chạy dự án (`README.md`)
- [ ] Kết quả kiểm thử (screenshot Postman/Swagger)

### Ngày 56: Tổng duyệt demo
- [ ] Chạy demo end-to-end một lần hoàn chỉnh
- [ ] Chuẩn bị slide thuyết trình
- [ ] Backup DB + source code

**✅ Milestone tuần 8:** Sẵn sàng bảo vệ đồ án.

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

*Lộ trình được thiết kế cho nhóm 3–4 người. Nếu làm một mình, giảm scope Nice-to-have và tập trung hoàn thiện 5 luồng chính trước khi mở rộng.*
