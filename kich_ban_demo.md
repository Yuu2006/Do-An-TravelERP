# Kịch bản quay demo Digital Travel ERP: Hành trình dữ liệu khép kín
 
**Thời lượng đề xuất:** 5:30 - 6:00 cho bản lời bình đầy đủ; có thể dựng rút gọn còn 4:25 - 4:55  

**Điểm bắt đầu chính thức:** Sau cold open Dashboard ngắn, nghiệp vụ chính bắt đầu từ thao tác tạo `Tour mẫu`. Dashboard được đưa về cuối video để tổng kết kết quả vận hành.

## 1. Nguyên tắc trung thực khi trình bày

Tài liệu này ưu tiên những gì đang có trong code hơn mô tả ý tưởng ban đầu.

| Nội dung | Có thể trình bày trong demo | Không nên khẳng định là đã triển khai |
|---|---|---|
| Backend và dữ liệu | Spring Boot, Spring Security/JWT, Spring Data JPA, Oracle; API REST theo vai trò | PostgreSQL, Redis cache/distributed lock, Kafka/RabbitMQ |
| Thanh toán | UI QR; backend hỗ trợ thanh toán demo/mock và thao tác xác nhận đã chuyển khoản | Webhook thật từ MoMo/VNPAY, email vé tự động |
| Hộ chiếu số | Hồ sơ khách được lấy qua `GET /api/khach-hang/ho-so` để điền người đặt | OCR căn cước/hộ chiếu tự động |
| App HDV | PWA React gọi API vận hành; ảnh minh chứng/ảnh hóa đơn hiển thị mô phỏng camera | FCM push thật, Native camera/upload S3 pre-signed URL |
| Điểm danh | Chọn khách và đổi trạng thái `DA_DIEM_DANH` trên app | Quét QR bằng camera |
| Đánh giá | Khách gửi đánh giá sau tour; hệ thống cập nhật điểm tour và HDV | Scheduler gửi lời mời review sau 24 giờ |
| Dashboard | Một số thẻ/lists lấy từ API; biểu đồ doanh thu hiện dùng dữ liệu giao diện tĩnh | Endpoint `GET /api/v1/dashboard/metrics` hoặc SLA cache dưới 50 ms |

## 2. Dữ liệu và cửa sổ cần chuẩn bị

### 2.1. Tài khoản quay theo SQL seed

Chạy `be/src/main/resources/db/data_v1.sql` rồi `be/src/main/resources/db/data_lien_ket.sql`. Tất cả tài khoản dưới đây dùng mật khẩu mặc định `password`, đúng với BCrypt seed trong `data_v1.sql`.

| Cảnh sử dụng | Vai trò | Tài khoản / mật khẩu | Lý do chọn |
|---|---|---|---|
| Tạo Tour mẫu | `SANPHAM` | `sanpham01` / `password` | Đúng quyền `POST /api/san-pham/tour-mau` |
| Tạo tour thực tế, phân công, mở bán | `DIEUHANH` | `manager01` / `password` | Đúng quyền tour thực tế và điều phối HDV |
| Xác nhận thanh toán đơn; nhánh hủy nếu quay thêm | `KINHDOANH` | `sales01` / `password` | Đúng quyền duyệt thanh toán đơn và duyệt yêu cầu hủy |
| Duyệt chi phí, hoàn tiền, quyết toán | `KETOAN` | `ketoan01` / `password` | Đúng quyền tài chính/kế toán |
| Đặt tour/voucher/modal hủy | `KHACHHANG` | `khach02` / `password` | Có Hộ chiếu số và voucher `OPEN-LOCAL-5` còn `CO_HIEU_LUC` |
| Quay riêng cảnh gửi đánh giá đã sẵn dữ liệu | `KHACHHANG` | `khach16` / `password` | Có lịch sử tour Cần Thơ `TTT_BSLK_DONE_CT` đã kết thúc và chưa có `DANHGIAKH` |
| Nhận phân công và vận hành Tây Bắc | `HDV` | `hdv01` / `password` | Seed năng lực ghi rõ `Tây Bắc, Trekking, Tour xanh` |

**Không chọn `khach03` cho luồng chính:** khách này có voucher `OPEN-FAMILY-1M` còn hiệu lực nhưng điều kiện mô tả là đơn gia đình từ 4 khách, khiến thao tác đặt tour dài hơn và kém tự nhiên hơn demo một khách.  
**Không chọn `hdv11` cho tour Tây Bắc:** tài khoản này có dữ liệu vận hành seed đẹp nhưng chuyên môn mô tả nghiêng về biển/di sản; `hdv01` phù hợp câu chuyện Tây Bắc hơn.

### 2.2. Seed/checkpoint dữ liệu

Do nghiệp vụ chính bắt đầu bằng việc tạo Tour mẫu, **không cần và không nên seed trước** tour `Tây Bắc – Bản làng và mùa mây 3N2Đ`. Tour đó phải xuất hiện do thao tác ở Cảnh 1, rồi được dùng tiếp để tạo tour thực tế ở Cảnh 2.

**Thứ tự chạy dữ liệu:** chạy các script seed trước khi bắt đầu ghi hình. Không chạy lại `data_lien_ket.sql` giữa các cảnh sau khi đã tạo tour Tây Bắc, vì phần đầu script reset các bản ghi liên kết theo prefix và có thể xóa dữ liệu vừa quay.

| Dữ liệu | Có cần seed trước? | Giá trị sử dụng khi quay |
|---|---:|---|
| Tài khoản và phân quyền | Có | `sanpham01`, `manager01`, `sales01`, `ketoan01`, `khach02`, `khach16`, `hdv01` |
| Hộ chiếu số khách | Có | `KH_02` của `khach02`, đã có họ tên/CCCD/SĐT và ghi chú sức khỏe |
| Voucher trong ví khách | Có | `VC_OPEN_LOCAL5` / mã hiển thị `OPEN-LOCAL-5`, trạng thái ví `CO_HIEU_LUC` của `KH_02` |
| Dữ liệu quay đánh giá độc lập | Có | `khach16` / `KH_16`, lịch sử `LST_BSLK_REVIEW_KH16` trên tour Cần Thơ `KET_THUC`, không seed đánh giá và không có khiếu nại |
| Năng lực HDV | Có | `NV_HDV01`, chuyên môn `Tây Bắc, Trekking, Tour xanh`; bảo đảm không trùng lịch với ngày tour mới |
| Dịch vụ thêm/hành động xanh | Có thể dùng seed | Chọn một mục sẵn có phù hợp; ưu tiên hành động liên quan bình nước/tour xanh |
| Tour mẫu Tây Bắc chính | Không | Tạo trực tiếp ở Cảnh 1 |
| Tour thực tế Tây Bắc chính | Không | Sinh từ Tour mẫu ở Cảnh 2, sau đó phân công/mở bán ở Cảnh 3 |
| Đơn đặt tour chính | Không | Do `khach02` tạo trong Cảnh 4-5 |
| Trạng thái đi thực địa/quyết toán | Cần checkpoint dựng | Sau Cảnh 5, đưa tour chính sang `DANG_DIEN_RA` cho HDV; sau phần vận hành đưa sang `KET_THUC` để Kế toán quyết toán |

1. UI checkout chỉ liệt kê voucher từ `GET /api/khach-hang/vi-voucher`; khi đăng nhập `khach02`, chọn `OPEN-LOCAL-5`, không gõ voucher ngoài ví.
2. UI QR chỉ ghi nhận khách đã báo chuyển khoản; để đơn chính thành `DA_XAC_NHAN` trước cảnh HDV, quay thao tác nhân viên Kinh doanh duyệt thanh toán tại `Quản lý Đơn hàng`. Có thể dùng thanh toán demo `mock=true` hoặc checkpoint dữ liệu nếu cần quay rút gọn.
3. Khi dùng chuyển cảnh tua thời gian, vẫn giữ cùng `maTourThucTe`/`maDatTour` của luồng Tây Bắc; việc cập nhật trạng thái đến `DANG_DIEN_RA` và `KET_THUC` là bước chuẩn bị giữa các take, không mô tả như thời gian thực trôi qua.
4. Nhánh hủy trong video chỉ mở modal trên đơn chính rồi click `Giữ lại chuyến đi`. Nếu cần chứng minh `CHO_HUY`/hoàn tiền, tạo đơn phụ riêng để không loại hành khách khỏi cảnh điểm danh.

**Kiểm tra nhanh tài khoản quay đánh giá sau khi chạy seed**

```sql
SELECT tk.TenDangNhap, ttt.MaTourThucTe, ttt.TrangThai, dg.MaDanhGiaKhachHang
FROM TAIKHOAN tk
JOIN HOCHIEUSO hcs ON hcs.MaTaiKhoan = tk.MaTaiKhoan
JOIN LICHSUTOUR lst ON lst.MaKhachHang = hcs.MaKhachHang
JOIN TOURTHUCTE ttt ON ttt.MaTourThucTe = lst.MaTourThucTe
LEFT JOIN DANHGIAKH dg
  ON dg.MaKhachHang = hcs.MaKhachHang
 AND dg.MaTourThucTe = ttt.MaTourThucTe
WHERE tk.TenDangNhap = 'khach16'
  AND ttt.MaTourThucTe = 'TTT_BSLK_DONE_CT';
```

Kết quả cần thấy: `TrangThai = KET_THUC` và `MaDanhGiaKhachHang` là `NULL`.

### 2.3. Thiết lập quay

1. Mở các profile trình duyệt: `sanpham01`, `manager01`, `sales01`, `ketoan01`, `khach02`, `khach16`, `hdv01` dạng mobile viewport. `sales01` dùng để duyệt thanh toán đơn ở luồng chính; `khach16` dùng khi cần quay riêng cảnh đánh giá bằng dữ liệu đã sẵn sàng.
2. Đặt zoom trình duyệt 100%, riêng PWA HDV quay ở khung dọc 390 x 844.
3. Bật highlight con trỏ và giữ mỗi thông báo thành công trên màn hình tối thiểu 1 giây.
4. Ghi lại `maTourThucTe`, `maDatTour`, `maPhanCong`, `maChiPhi` sau mỗi cảnh để nối dữ liệu khi dựng.

## 3. Bản đồ dữ liệu xuyên suốt

```text
TourMau
  -> TourThucTe (CHO_KICH_HOAT)
  -> PhanCongTour (CHO_PHAN_HOI -> DA_DONG_Y)
  -> TourThucTe (MO_BAN)
  -> DonDatTour (CHO_XAC_NHAN) + ChiTietDatTour
  -> KhuyenMaiKh/DatTourUuDai (voucher được sử dụng)
  -> GiaoDich thanh toán + DonDatTour (DA_XAC_NHAN) + ChoConLai giảm
     [nhánh minh họa: yêu cầu hủy -> CHO_HUY -> nhân viên duyệt -> kế toán hoàn -> DA_HUY]
  -> DiemDanh / HanhDong / ChiPhiThucTe (CHO_DUYET -> DA_DUYET)
  -> QuyetToan (CHUA_QUYET_TOAN -> DA_QUYET_TOAN)
  -> TourThucTe (DA_QUYET_TOAN) -> DanhGiaKh
```

## 4. Shot list tổng thể

| Cảnh | Thời lượng | Ý chính |
|---|---:|---|
| 0 | + 0:15 (tùy chọn) | Dashboard cold open và giới thiệu luồng dữ liệu |
| 1 | 0:00 - 0:35 | Khởi tạo Tour mẫu|
| 2 | 0:35 - 1:05 | Khởi tạo tour thực tế ở trạng thái chờ |
| 3 | 1:05 - 1:35 | Điều hành phân công, HDV xác nhận, mở bán |
| 4 | 1:35 - 2:00 | Khách tìm tour, hồ sơ số tự điền |
| 5 | 2:00 - 2:42 | Voucher, QR, Kinh doanh xác nhận đơn và giới thiệu nhánh hủy |
| 6 | 2:42 - 3:12 | Tua đến ngày khởi hành; HDV điểm danh và hành động xanh |
| 7 | 3:12 - 3:32 | HDV báo cáo sự cố và khai chi phí |
| 8 | 3:32 - 4:07 | Kế toán duyệt chi phí và chốt quyết toán |
| 9 | 4:07 - 4:27 | Khách đánh giá |
| 10 | 4:27 - 4:42 | Dashboard kết quả và lời kết |

## 5. Kịch bản quay chi tiết

**Nhịp đọc:** Phần voiceover dưới đây là bản thuyết minh đầy đủ, phù hợp video khoảng 5 phút 30 giây đến 6 phút nếu đọc rõ và giữ các toast/modal. Nếu cần giữ bản dựng ngắn khoảng 4 phút 40 giây, có thể lược bỏ các đoạn bắt đầu bằng "Trong vận hành thực tế" và rút ngắn các câu mô tả hệ thống.

### Cảnh 0 - Cold open Dashboard: giới thiệu hành trình dữ liệu (đề xuất thêm 0:00 - 0:15)

**Lưu ý thời lượng:** Nếu sử dụng đoạn mở đầu này, cộng thêm khoảng 15 giây vào các mốc cảnh phía sau. Đây là đoạn dẫn nhập ngắn trước khi bắt đầu thao tác nghiệp vụ thật tại Cảnh 1.

**Khung hình và thao tác quay**

1. Fade-in từ logo `Digital Travel ERP` sang Admin Web tại trang `Tổng quan`.
2. Pan chậm qua các thẻ số liệu và vùng danh sách tour; không dừng lâu ở biểu đồ doanh thu vì phần biểu đồ hiện dùng dữ liệu giao diện minh họa.
3. Khi lời bình nói đến "thiết kế sản phẩm", chuyển cảnh sang tài khoản Sản phẩm tại màn `Quản lý Tour mẫu`.

**Voiceover**

> "Chào mừng các bạn đến với Digital Travel ERP - nền tảng quản trị du lịch toàn diện, kết nối trọn vẹn hành trình từ thiết kế sản phẩm, đặt tour, điều phối đến vận hành thực địa. Trong video hôm nay, chúng ta sẽ trải nghiệm một luồng dữ liệu khép kín giữa Back-office, khách hàng và ứng dụng di động của hướng dẫn viên."

### Cảnh 1 - Điểm khởi đầu: tạo Tour mẫu (0:00 - 0:35)

**Khung hình:** Logo xuất hiện 2 giây, sau đó cắt thẳng vào Admin Web tại menu `Quản lý Tour mẫu`; zoom sidebar rồi focus modal.

**Chỉ dẫn thao tác quay**

1. Đăng nhập Admin Web bằng `sanpham01` / `password` (vai trò `SANPHAM`) trước khi bắt đầu ghi hình.
2. Click `Quản lý Sản phẩm` > `Quản lý Tour mẫu`.
3. Click `Thêm Tour Mẫu mới`.
4. Ở tab `Thông tin chung`, nhập lần lượt theo bảng dữ liệu mẫu phía dưới; khi nhập `Tên Tour Mẫu`, dừng con trỏ 1 giây để tên tour hiện rõ.
5. Chuyển sang tab `Lịch trình`, điền ba ngày. Khi quay, có thể dán sẵn nội dung timeline theo từng ngày để hình ảnh mượt và tránh mất thời gian gõ.
6. Cuộn kiểm tra nhanh ngày 1 đến ngày 3, rồi click `Tạo mới`; giữ alert `Tạo mới thành công` và dòng tour mẫu xuất hiện trong bảng khoảng 2 giây.

**Phiếu nhập liệu Tour mẫu dùng trong video**

| Ô trên giao diện | Dữ liệu nhập |
|---|---|
| `Tên Tour Mẫu` | `Tây Bắc – Bản làng và mùa mây 3N2Đ` |
| `Mô tả ngắn` | `Chạm vào vẻ đẹp hùng vĩ của núi rừng Tây Bắc qua hành trình săn mây Tà Xùa, khám phá Mộc Châu và trải nghiệm bản làng địa phương. Tour được thiết kế cân bằng giữa nghỉ dưỡng, văn hóa bản địa và các hoạt động du lịch xanh.` |
| `Số ngày` | `3` |
| `Số đêm` | `2` |
| `Giá Sàn (VNĐ)` | `5890000` |
| `Bao gồm` | Dán nội dung trong khối `Bao gồm` bên dưới |
| `Không bao gồm` | Dán nội dung trong khối `Không bao gồm` bên dưới |

`Bao gồm`

```text
- Xe du lịch đưa đón theo lịch trình
- 02 đêm lưu trú tiêu chuẩn tại Mộc Châu và Tà Xùa
- 05 bữa chính đặc sản địa phương, 02 bữa sáng
- Vé tham quan trong chương trình
- Hướng dẫn viên và bảo hiểm du lịch
- Nước uống refill, khuyến khích sử dụng bình cá nhân
```

`Không bao gồm`

```text
- Vé máy bay hoặc chi phí di chuyển đến điểm đón
- Chi phí cá nhân, đồ uống ngoài chương trình
- Phụ thu phòng đơn và dịch vụ nâng hạng tự chọn
- Thuế VAT và tiền tip tự nguyện
```

**Tab `Lịch trình` - dữ liệu nhập từng ngày**

| Ngày | Trường | Nội dung nhập |
|---:|---|---|
| 1 | `Timeline hoạt động Ngày 1` | Dán nội dung khối `Ngày 1` phía dưới |
| 1 | `Ghi chú lịch trình` | `Khởi động nhẹ, ưu tiên nghỉ ngơi và làm quen văn hóa địa phương.` |
| 1 | `Bữa Sáng` | `Tự túc trước giờ khởi hành` |
| 1 | `Bữa Trưa` | `Cơm bản: gà nướng mắc khén, rau rừng` |
| 1 | `Bữa Tối` | `Lẩu cá suối và xôi ngũ sắc` |
| 2 | `Timeline hoạt động Ngày 2` | Dán nội dung khối `Ngày 2` phía dưới |
| 2 | `Ghi chú lịch trình` | `Ngày trải nghiệm xanh chính, ghi nhận khách dùng bình nước cá nhân.` |
| 2 | `Bữa Sáng` | `Buffet tại khách sạn Mộc Châu` |
| 2 | `Bữa Trưa` | `Bê chao Mộc Châu, cải mèo luộc` |
| 2 | `Bữa Tối` | `Set menu tại homestay Tà Xùa` |
| 3 | `Timeline hoạt động Ngày 3` | Dán nội dung khối `Ngày 3` phía dưới |
| 3 | `Ghi chú lịch trình` | `Kết thúc hành trình, ưu tiên sản phẩm địa phương và hạn chế rác nhựa.` |
| 3 | `Bữa Sáng` | `Phở bò vùng cao và trà nóng` |
| 3 | `Bữa Trưa` | `Cơm lam, cá nướng và rau theo mùa` |
| 3 | `Bữa Tối` | `Không phục vụ - kết thúc tour` |

`Ngày 1 - Hà Nội - Mộc Châu - Bản Áng`

```text
06:00 - Đón khách tại điểm hẹn, khởi hành đi Mộc Châu
11:30 - Dùng bữa trưa với đặc sản Tây Bắc
14:00 - Tham quan đồi chè trái tim và rừng thông Bản Áng
18:30 - Nhận phòng, dùng bữa tối và giao lưu văn hóa địa phương
```

`Ngày 2 - Mộc Châu - Tà Xùa - Săn mây xanh`

```text
05:30 - Khởi hành sớm đến Tà Xùa
08:00 - Săn mây tại Sống Lưng Khủng Long, check-in cảnh núi rừng
11:30 - Dùng bữa trưa, nghỉ ngơi tại homestay
14:30 - Trải nghiệm đi bộ ngắn và tiếp nước bằng bình cá nhân
18:30 - Bữa tối địa phương, nghỉ đêm tại Tà Xùa
```

`Ngày 3 - Tà Xùa - Chợ địa phương - Hà Nội`

```text
06:00 - Ngắm bình minh và dùng bữa sáng
08:30 - Ghé chợ địa phương, mua sản phẩm cộng đồng
11:30 - Dùng bữa trưa, tổng kết hành trình xanh
13:30 - Khởi hành về Hà Nội, kết thúc chương trình
```

**Hệ thống ngầm chạy**

| Thao tác | Dữ liệu/API đã xác thực trong code |
|---|---|
| Lưu tour mẫu | `POST /api/san-pham/tour-mau` với `tieuDe`, `moTa`, `thoiLuong`, `giaSan`, `lichTrinh` |
| Bản ghi nền | Backend lưu `TOURMAU` và các dòng `LICHTRINHTOUR` trong Oracle |
| Vai trò trong luồng | Tour mẫu là dữ liệu gốc để khởi tạo các chuyến cụ thể sau này |

**Voiceover**

> "Chúng ta bắt đầu tại bộ phận Sản phẩm với chức năng Quản lý Tour mẫu. Nhân viên chọn tạo mới và thiết lập thông tin sản phẩm  bao gồm tên tour, mô tả trải nghiệm, thời lượng và mức giá sàn. Giá sàn là căn cứ kiểm soát để những chuyến mở bán sau này không bị cấu hình thấp hơn định hướng kinh doanh của sản phẩm."
>
> "Tiếp theo là lịch trình chi tiết. Từng ngày được mô tả bằng các điểm dừng, hoạt động và bữa ăn cụ thể.
>
> "Khi nhấn Tạo mới, hệ thống lưu Tour mẫu cùng các dòng lịch trình tương ứng. Đây là dữ liệu gốc của sản phẩm: được xây dựng một lần, sau đó dùng làm nền để điều hành sinh ra nhiều đợt khởi hành thực tế."

### Cảnh 2 - Khởi tạo chuyến cụ thể: Tour thực tế (0:35 - 1:05)

**Khung hình:** Admin Điều hành (hoặc `ADMIN`); giữ modal wizard rõ nét. Frontend có hiển thị menu cho Sản phẩm, nhưng API ghi tour thực tế thuộc quyền `DIEUHANH`.

**Chỉ dẫn thao tác quay**

1. Đăng nhập `manager01` / `password` (vai trò Điều hành), click `Quản lý Sản phẩm` > `Quản lý Tour thực tế`.
2. Click nút `Khởi tạo Tour`.
3. Trong modal `Khởi tạo Tour Thực Tế (Bước 1/3)`, tại `Chọn Tour Mẫu *`, chọn chuyến Tây Bắc.
4. Quay hiệu ứng dữ liệu điền giá sàn/lịch trình sau khi chọn mẫu.
5. Chọn ngày khởi hành tương lai; nhập `Số chỗ tối thiểu = 2`, `Số chỗ tối đa = 10`, `Giá bán hiện hành = 6290000`. Giá này cao hơn giá sàn `5890000` và phù hợp tour khởi hành thực tế.
6. Giữ `Trạng thái` là `Chờ kích hoạt`. Không chọn `Mở bán` ở bước tạo mới.
7. Click nút tiếp tục để cấu hình dịch vụ/hành động xanh hoặc nút tạo nhanh tùy dữ liệu quay.
8. Kết thúc wizard; quay alert `Khởi tạo tour thành công!` và bảng hiển thị badge `Chờ kích hoạt`.

**Hệ thống ngầm chạy**

| Thao tác | API/ghi dữ liệu |
|---|---|
| Chọn mẫu | `GET /api/san-pham/tour-mau/{id}` để hiển thị thông tin tham chiếu |
| Tạo tour | `POST /api/dieu-hanh/tour-thuc-te` tạo `TourThucTe`, sinh mã `TTT_*`, đặt `ChoConLai = SoKhachToiDa` |
| Chọn dịch vụ/hành động xanh | `PUT /api/dieu-hanh/tour-thuc-te/{id}` ghi liên kết dịch vụ và hành động xanh |

**Điểm kiến trúc cần nói đúng:** Backend giữ quan hệ tới `TourMau`; lịch trình công khai hiện được đọc từ tour mẫu. Không mô tả đây là snapshot độc lập nếu chưa bổ sung cột/bảng snapshot.

**Voiceover**

> "Sau khi sản phẩm gốc đã sẵn sàng, nhân viên Sản phẩm chuyển sang phân hệ Quản lý Tour thực tế và chọn Khởi tạo Tour. Tại đây, hệ thống cho phép chọn lại chính tour mẫu Tây Bắc vừa được xây dựng."
>
> "Từ khuôn mẫu sẵn có, nhân viên sản phẩm thiết lập một đợt khởi hành cụ thể: chọn ngày đi trong tương lai, cấu hình số khách tối đa và giá bán hiện hành. Mức giá này cao hơn giá sàn của tour mẫu, bảo đảm quy tắc định giá được tuân thủ."
>
> "Điểm quan trọng là Tour thực tế có vòng đời riêng: ngày đi, số lượng chỗ và lượng chỗ còn lại sẽ được quản lý độc lập theo từng chuyến. Ngay sau khi lưu, chuyến vẫn ở trạng thái Chờ kích hoạt, bởi hệ thống chưa cho phép khách đặt chỗ khi chưa xác lập người phụ trách vận hành."

### Cảnh 3 - Điều phối trước khi lên kệ: HDV xác nhận và mở bán (1:05 - 1:35)

**Khung hình:** Split screen Admin Điều hành bên trái và PWA HDV bên phải.

**Chỉ dẫn thao tác quay - Admin**

1. Giữ phiên `manager01` / `password` ở vai trò Điều hành.
2. Click `Điều phối HDV` > `Phân công HDV`.
3. Ở `Danh sách chờ phân bổ`, tìm tour Tây Bắc và click `Phân bổ ngay`.
4. Trong modal `Phân công Hướng dẫn viên`, chọn HDV khả dụng và click `Chọn người này`.
5. Xác nhận dialog; giữ modal `Phân công thành công!`.

**Chỉ dẫn thao tác quay - HDV**

1. Đăng nhập PWA bằng `hdv01` / `password`; đây là HDV có năng lực Tây Bắc/Tour xanh trong seed.
2. Trên `Bảng điều khiển`, quan sát thẻ yêu cầu điều phối hoặc click biểu tượng thông báo.
3. Click `Đồng ý`; giữ thông báo xác nhận trên màn hình.

**Chỉ dẫn thao tác quay - Admin mở bán**

1. Quay lại `Quản lý Tour thực tế`.
2. Click biểu tượng `Sửa` ở tour đang `Chờ kích hoạt`.
3. Đổi trạng thái sang `Mở bán`, lưu; quay badge `Mở bán`.

**Hệ thống ngầm chạy**

| Bước | API/trạng thái |
|---|---|
| Liệt kê HDV khả dụng | `GET /api/dieu-hanh/hdv-kha-dung?maTourThucTe=...` kiểm tra lịch trùng |
| Phân công | `POST /api/dieu-hanh/phan-cong`, tạo `PhanCongTour` ở `CHO_PHAN_HOI` |
| HDV đồng ý | `POST /api/huong-dan-vien/phan-cong/{maPhanCong}/dong-y`, chuyển `DA_DONG_Y` |
| Mở bán | `PUT /api/dieu-hanh/tour-thuc-te/{id}` với `MO_BAN`; backend từ chối nếu chưa có phân công đã nhận |

**Voiceover**

> "Để chuyến đi có thể lên kệ, Điều hành viên mở chức năng Phân công HDV và chọn tour Tây Bắc đang chờ phân bổ. Trong danh sách nhân sự, chúng ta chọn hướng dẫn viên có năng lực phù hợp.
>
> "Yêu cầu phân công ngay lập tức xuất hiện trên ứng dụng của hướng dẫn viên. HDV có quyền xxem thông tin lịch trình và Khi HDV nhấn Đồng ý, hệ thống ghi nhận trách nhiệm phụ trách chuyến đi, đồng thời giúp Điều hành biết rằng nguồn lực thực địa đã sẵn sàng."
>
> "Quay trở lại màn quản lý tour, Điều hành viên mở chi tiết chuyến và đổi trạng thái sang Mở bán. Chính từ thời điểm này, tour mới xuất hiện trên kênh khách hàng. Như vậy, việc mở bán không chỉ là một nút bấm, mà là kết quả của chuỗi kiểm soát sản phẩm, lịch khởi hành và nhân sự thực hiện."

### Cảnh 4 - Khách tìm tour và sử dụng Hộ chiếu số (1:35 - 2:00)

**Khung hình:** Customer Web sáng; slide-left từ Admin sang khách hàng.

**Chỉ dẫn thao tác quay**

1. Trên trang chủ, nhập `Tây Bắc` vào ô tìm kiếm và đưa khung hình đến danh sách tour.
2. Click thẻ tour vừa mở bán; dừng ở ảnh, giá, ngày khởi hành và lịch trình.
3. Click `Đặt tour ngay`.
4. Nếu chưa đăng nhập, modal `Đăng nhập khách hàng` xuất hiện; đăng nhập `khach02` / `password`, tài khoản đã có Hộ chiếu số.
5. Mở lại `Đặt tour ngay`; ở Bước 1 `Thông tin hành khách`, zoom vào các trường người đặt đã được điền từ hồ sơ.

**Hệ thống ngầm chạy**

| Thao tác | API/dữ liệu |
|---|---|
| Danh sách/chi tiết tour | `GET /api/public/tour`, `GET /api/public/tour/{maTourThucTe}` |
| Đăng nhập | `POST /api/auth/dang-nhap`, nhận JWT |
| Điền hồ sơ người đặt | `GET /api/khach-hang/ho-so`, map họ tên/điện thoại/CCCD/ngày sinh vào form |

**Voiceover**

> "Trên giao diện khách hàng, người dùng sẽ nhìn thấy các chuyến đi được mở bán, cùng thông tin về giá, ngày khởi hành và lịch trình. Những chuyến chưa kích hoạt sẽ không được đưa vào hành trình đặt chỗ này. Ngoài ra khách hàng có thể tìm kiếm từ khóa Tây Bắc và xem chi tiết tour"
>
> "Khách chọn Đặt tour ngay. Tại bước Thông tin hành khách, các dữ liệu hồ sơ đã lưu như họ tên và thông tin liên hệ được tự động đưa vào biểu mẫu, giúp rút ngắn thao tác và hạn chế nhập sai."
>
> "Ở phiên bản demo hiện tại, dữ liệu này được lấy từ hồ sơ số đã tồn tại trên hệ thống. Điều đó cũng cho thấy một nguyên tắc quan trọng: đơn đặt tour luôn gắn với hồ sơ khách hàng có thể kiểm tra và truy vết. Tức là khách hàng luôn phải đăng nhập trước khi đặt tour"

### Cảnh 5 - Chốt đơn, voucher, QR, xác nhận thanh toán và nhánh hủy tùy chọn (2:00 - 2:42)

**Khung hình:** Giữ modal booking; focus phần tổng tiền rồi chuyển sang QR. Sau khi khách báo đã chuyển khoản, cắt nhanh sang Admin Kinh doanh xác nhận đơn, trở lại `Hộ chiếu số` để giới thiệu nhánh hủy mà không rời khỏi luồng chính.

**Chỉ dẫn thao tác quay**

1. Ở Bước 1, bảo đảm dữ liệu hành khách hợp lệ; click tiếp tục.
2. Ở Bước 2, chọn một dịch vụ hoặc hành động xanh (nếu đã gán vào tour); click tiếp tục.
3. Ở Bước 3, tại `Chọn Voucher có sẵn`, chọn `OPEN-LOCAL-5` đang có trong ví của `khach02`; quay dòng giảm giá theo phần trăm.
4. Chọn phương thức thanh toán, click `Xác nhận & Thanh toán`.
5. Quay màn `Quét Mã QR Thanh Toán`, số tiền và bộ đếm 5 phút.
6. Click nút báo đã chuyển khoản trên màn QR để hoàn tất phần trình diễn giao diện; popup hiện đơn đang chờ xác nhận thanh toán.
7. Quay popup `Đăng Ký Thành Công!` và ghi lại `Mã đặt tour`.
8. Chuyển tab Admin Kinh doanh đã đăng nhập bằng `sales01` / `password`; click `Quản lý Đơn hàng`.
9. Tìm mã đơn vừa nhận, quan sát trạng thái chờ và chỉ dấu khách đã báo chuyển khoản; click biểu tượng/nút `Duyệt thanh toán`, xác nhận dialog và giữ toast thành công.
10. Trở lại giao diện khách, click `Xem chi tiết trong Hộ chiếu số`; tại `Lịch sử chuyến đi`, quay đơn đã chuyển sang trạng thái xác nhận.
11. Click `Hủy tour & Hoàn tiền`. Khi modal `Xác nhận hủy đăng ký Tour` xuất hiện, pan nhẹ vào phí phạt, số tiền hoàn dự kiến và nút `Xác nhận hủy & Hoàn tiền`.
12. Để tiếp tục luồng chính, **không click xác nhận hủy trên đơn dùng cho điểm danh**; click `Giữ lại chuyến đi` để đóng modal.
13. Nếu không muốn quay màn Kinh doanh, mới thay bước 8-10 bằng đơn fixture `DA_XAC_NHAN` hoặc thanh toán demo `mock=true`; đây là phương án dựng rút gọn, không phải tuyến quay ưu tiên.

**Hệ thống ngầm chạy**

| Bước | API/trạng thái |
|---|---|
| Tạo đơn | `POST /api/khach-hang/dat-tour`; tạo `DonDatTour` trạng thái `CHO_XAC_NHAN`, chưa trừ chỗ |
| Áp voucher | `POST /api/khach-hang/ap-voucher`; voucher phải thuộc ví khách và hợp lệ |
| Khởi tạo QR từ UI | `POST /api/thanh-toan/khoi-tao` không gửi `mock=true`; tạo giao dịch `CHO_THANH_TOAN` |
| Khách báo đã chuyển khoản | `POST /api/thanh-toan/{maDatTour}/xac-nhan-chuyen-khoan`; đánh dấu giao dịch chờ đối soát, đơn vẫn `CHO_XAC_NHAN` |
| Kinh doanh duyệt thanh toán | `PUT /api/kinh-doanh/dat-tour/{maDatTour}/xac-nhan`; chuyển đơn sang `DA_XAC_NHAN`, giảm `ChoConLai` và tạo lịch sử tour |
| Thanh toán demo xác nhận ngay | Khi gọi với `mock=true` và môi trường cho phép, backend chuyển đơn sang `DA_XAC_NHAN`, giảm `ChoConLai` và tạo lịch sử tour |
| Khách thực sự xác nhận hủy | `POST /api/khach-hang/dat-tour/{maDatTour}/huy`; với đơn đủ điều kiện, tạo yêu cầu hỗ trợ loại hủy và đổi đơn sang `CHO_HUY` |
| Nhân viên/Kế toán xử lý nhánh hủy | Kinh doanh duyệt qua `/api/kinh-doanh/yeu-cau-huy/{maYeuCau}/duyet`; Kế toán xác nhận hoàn qua `PUT /api/ke-toan/giao-dich-hoan/{maGiaoDich}/xac-nhan`, khi đó đơn thành `DA_HUY` |
| Quá hạn | Scheduler/endpoint quá hạn đưa đơn hoặc QR không hoàn tất sang trạng thái hết hạn phù hợp |

**Voiceover**

> "Khách tiếp tục tới bước lựa chọn dịch vụ và phần tổng kết thanh toán. Tại đây, voucher đang có sẵn trong ví ưu đãi của khách được chọn áp dụng; hệ thống kiểm tra quyền sở hữu và hiệu lực của voucher trước khi hiển thị mức giảm trực tiếp trên tổng tiền."
>
> "Trong vận hành thực tế, các ưu đãi như thế này có thể được bộ phận Kinh doanh tạo mới tại màn Quản lý Khuyến mãi, cấu hình giá trị, thời hạn, số lượt phát hành rồi phân bổ đến đúng nhóm khách hàng. Ở video này, voucher đã được chuẩn bị trước để chúng ta tập trung vào trải nghiệm đặt tour."
>
> "Sau khi khách nhấn Xác nhận và Thanh toán, đơn đặt tour được sinh ra ở trạng thái chờ xác nhận, đồng thời màn hình hiển thị mã QR, số tiền và nội dung chuyển khoản để đối soát. Khi này quỹ chỗ sẽ được khóa lại trong vòng 5p để khách thực hiện thanh toaans. Khi khách nhấn Tôi đã chuyển khoản thành công, giao dịch được đánh dấu là đã báo chuyển khoản, chờ nhân viên Kinh doanh kiểm tra."
>
> "Sau đó, nhân viên kinh doanh mở danh sách đơn, xem mã đơn và thông tin thanh toán vừa gửi về, và nhấn Duyệt thanh toán. Khi được xác nhận, đơn chuyển sang Đã xác nhận, và số chỗ còn lại của chuyến đi được cập nhật."
>
> "Từ Hộ chiếu số, khách còn có thể chọn Hủy tour và Hoàn tiền để xem trước phí hủy cùng khoản hoàn dự kiến. Nếu thực sự xác nhận, yêu cầu sẽ chuyển sang trạng thái chờ Kinh doanh phê duyệt, sau đó Kế toán xử lý hoàn tiền theo chính sách. Tuy nhiên, chúng ta sẽ đóng cửa sổ này và tiếp tục theo luồng chính của chuyến đi đã thanh toán."

### Cảnh 6 - Tua đến ngày khởi hành: điểm danh và điểm xanh (2:42 - 3:12)

**Điều kiện cắt dựng:** Sau khi đơn được Kinh doanh duyệt, dùng checkpoint dữ liệu có kiểm soát để đưa chính tour đó sang `DANG_DIEN_RA`, vì các nghiệp vụ thực địa chỉ hợp lý khi tour đang chạy. Chèn overlay để người xem hiểu đây là bước tua nhanh đến ngày khởi hành.

**Chỉ dẫn thao tác quay**

1. Sau khi đóng modal hủy, chèn transition lật lịch/time-lapse khoảng 1 giây, overlay `Đến ngày khởi hành - Tour đang diễn ra`; trước khi ghi hình app HDV, bảo đảm tour trong dữ liệu đã ở `DANG_DIEN_RA`.
2. Cắt sang PWA HDV, mở tour hiện tại.
3. Click tab dưới cùng `Điểm danh`.
4. Trên thẻ khách vừa đặt, click nút điểm danh để chuyển sang trạng thái tham gia; nếu khách có lưu ý sức khỏe, xác nhận popup cảnh báo.
5. Click tab `Điểm xanh`.
6. Chọn khách đã tham gia, chọn hành động xanh, click vùng `Nhấp vào đây để chụp ảnh thực tế`.
7. Khi ảnh minh chứng mô phỏng hiện ra, click nút gửi/ghi nhận hành động; giữ toast cộng điểm.

**Hệ thống ngầm chạy**

| Nghiệp vụ | API/dữ liệu |
|---|---|
| Xem đoàn | `GET /api/huong-dan-vien/tour/{maTour}/doan`, chỉ lấy đơn `DA_XAC_NHAN` |
| Điểm danh | `POST /api/huong-dan-vien/tour/{maTour}/diem-danh`, lưu `DiemDanh` với `DA_DIEM_DANH`/`VANG` |
| Điểm xanh | `POST /api/huong-dan-vien/tour/{maTour}/hanh-dong-xanh`, lưu `HanhDong`, cộng `DiemXanh` ngay vào `HoChieuSo` và xét nâng hạng |

**Voiceover**

> "Sau khi đơn đã được xác nhận, chúng ta tua nhanh đến ngày khởi hành nên chúng em sẽ chuyển trạng thái tour thành "Đang diễn ra"."
>
> "Trên ứng dụng di động, hướng dẫn viên mở tour đang phụ trách và chuyển sang chức năng Điểm danh. Danh sách tại đây chỉ gồm những khách đã có đơn hợp lệ và được xác nhận thanh toán. Khi nhấn điểm danh cho khách, hệ thống tạo bản ghi tham gia gắn với chính chuyến tour và HDV phụ trách."
>
> "Tiếp đó, HDV chọn mục Điểm xanh, ghi nhận hành động xanh và gửi minh chứng. Điểm thưởng được cộng vào Hộ chiếu số của khách, tạo ra một vòng nối thú vị: hoạt động tốt ở chuyến đi hôm nay có thể trở thành điều kiện để khách đổi voucher cho hành trình tiếp theo."

### Cảnh 7 - HDV báo cáo sự cố và khai chi phí (3:12 - 3:32)

**Khung hình:** Full mobile, focus popup nhập sự cố và chi phí.

**Chỉ dẫn thao tác quay**

1. Click tab `Sự cố`, chọn `Báo cáo sự cố mới`.
2. Nhập mô tả sự cố (ví dụ: "Thay đổi lộ trình do thời tiết"), chọn mức độ `THẤP`.
3. Click `Gửi báo cáo`; giữ toast thành công.
4. Chuyển sang tab `Chi phí`.
5. Click `Thêm yêu cầu quyết toán`.
6. Trong popup `Nhập chi phí thực tế`, chọn `Ăn uống` hoặc `Khác`, nhập số tiền `200000`, ghi chú `Nước suối cho đoàn`.
7. Click `Nhấp để chụp ảnh hóa đơn (Bắt buộc)`; chờ ảnh mẫu xuất hiện.
8. Click `Lưu chi phí`; quay dòng hóa đơn trạng thái `Chờ duyệt`.

**Hệ thống ngầm chạy**

`POST /api/huong-dan-vien/tour/{maTour}/chi-phi` tạo `ChiPhiThucTe` với `thanhTien`, `hoaDonAnh`, `ghiChu` và `TrangThaiDuyet = CHO_DUYET`. Trong PWA hiện tại, thao tác chụp gán URL minh họa `MOCK_RECEIPT_URL`.

**Voiceover**

> "Để đảm bảo an toàn và xử lý kịp thời các tình huống phát sinh cũng nư rút kinh nghiệm về sau, hướng dẫn viên có thể báo cáo các sự cố ngay trên ứng dụng."

> "Trong quá trình dẫn đoàn, một vài khoản chi phát sinh có thể xuất hiện. HDV mở tab Chi phí, tạo yêu cầu quyết toán mới, chọn nhóm chi phù hợp và điền đầy đủ thông tin."
>
> "Khi gửi kèm hình ảnh hóa đơn, khoản chi chưa lập tức được tính vào lợi nhuận. Hệ thống lưu chứng từ ở trạng thái Chờ duyệt, gắn rõ người khai và chuyến tour tương ứng, để bộ phận Kế toán có cơ sở kiểm tra trước khi ghi nhận vào chi phí thực tế."

### Cảnh 8 - Kế toán duyệt chi phí và đóng vòng đời tài chính (3:32 - 4:07)

**Điều kiện cắt dựng:** Sau khi quay chi phí từ HDV, chuyển chính tour demo sang `KET_THUC` trong checkpoint dữ liệu chuẩn bị. Tour dùng để quyết toán phải ở trạng thái này.

**Chỉ dẫn thao tác quay**

1. Đăng nhập Admin Web bằng `ketoan01` / `password` (vai trò Kế toán).
2. Click `Tài chính & Kế toán` > `Quản lý Chi phí`.
3. Tìm khoản `Nước suối cho đoàn`; click nút thao tác để mở modal `Phê duyệt chi phí`.
4. Pan vào ảnh hóa đơn và số tiền; click `Phê duyệt`. Quay trạng thái đã duyệt.
5. Click `Tài chính & Kế toán` > `Quyết toán Tour`.
6. Ở tour Tây Bắc, click `Quyết toán`.
7. Nhập `Chi phí cam kết` nếu form yêu cầu, click `Tính toán`.
8. Focus ba số `Tổng doanh thu`, `Tổng chi phí`, `Lợi nhuận`.
9. Click hành động lưu/chốt quyết toán; trong modal xác nhận click `Xác nhận`.
10. Quay toast `Quyết toán thành công!` và trạng thái `Đã quyết toán`.

**Hệ thống ngầm chạy**

| Thao tác | API/công thức |
|---|---|
| Duyệt chứng từ | `PUT /api/ke-toan/chi-phi/{maChiPhi}/duyet`, đổi `CHO_DUYET` thành `DA_DUYET` |
| Xem trước | `GET /api/ke-toan/tinh-toan/{maTour}`; doanh thu = tổng đơn còn hiệu lực/đã xác nhận, chi phí = tổng chi phí `DA_DUYET` |
| Tạo bản quyết toán | `POST /api/ke-toan/quyet-toan/{maTour}`, trạng thái `CHUA_QUYET_TOAN` |
| Chốt | `PUT /api/ke-toan/quyet-toan/{maQuyetToan}/chot`, đổi quyết toán và tour sang `DA_QUYET_TOAN` |

**Voiceover**

> "Khi hành trình đã hoàn thành, Kế toán đăng nhập vào Back-office và mở danh sách chi phí. Chi phí HDV gửi hiện ra cùng số tiền và ảnh chứng từ; sau khi đối chiếu, kế toán có thể nhấn Phê duyệt hoặc Từ chối. Trường hợp thông tin chưa rõ ràng, kế toán có thể gửi yêu cầu bổ sung ngay trên hệ thống; yêu cầu này sẽ xuất hiện ở trạng thái chờ cập nhật trên ứng dụng của hướng dẫn viên để họ kịp thời cung cấp thêm minh chứng."
>
> "Tour phải được chuyển sang trạng thái Kết thúc trước khi thực hiện quyết toán. Tại màn Quyết toán Tour, kế toán chọn chuyến Tây Bắc, điền thông tin chi phí còn thiếu và nhấn Tính toán. Hệ thống tổng hợp doanh thu từ các đơn đã được xác nhận, đồng thời cộng các khoản chi thực tế đã qua duyệt để trình bày tổng thu, tổng chi và lợi nhuận."

### Cảnh 9 - Khách đánh giá sau chuyến đi (4:07 - 4:27)

**Khung hình:** Customer Web, trang `Hộ chiếu số`, sau đó logo end card.

**Chỉ dẫn thao tác quay**

1. Nếu quay xuyên suốt chính tour Tây Bắc, đăng nhập lại `khach02` / `password` sau khi tour đã được chuyển `KET_THUC` và chưa gửi review. Nếu quay cảnh độc lập hoặc quay lại nhiều lần sau khi reset seed, đăng nhập `khach16` / `password`.
2. Với `khach16`, mở `Hộ chiếu số` > `Lịch sử chuyến đi`, tìm tour Cần Thơ đã hoàn tất (`TTT_BSLK_DONE_CT`) và click `Đánh giá chuyến đi`. Tài khoản này được seed có lịch sử tham gia nhưng chưa có đánh giá.
3. Chọn 5 sao cho trải nghiệm và HDV, chọn tag, nhập nhận xét ngắn.
4. Click `Gửi đánh giá chuyến đi`; giữ toast xác nhận.
5. Cut sang trang chi tiết tour để quay rating/review đã cập nhật nếu dữ liệu tải lại kịp.

**Hệ thống ngầm chạy**

`POST /api/khach-hang/danh-gia` lưu `DanhGiaKh`; backend chặn đánh giá trùng và yêu cầu khách có lịch sử tour hợp lệ. Sau khi lưu, `DanhGiaService` tính lại điểm trung bình/số đánh giá của `TourMau` và năng lực HDV.

**Tài khoản quay ổn định cho riêng cảnh này:** `khach16` / `password`; tour hiển thị là tour Cần Thơ đã hoàn tất. Sau khi đã click gửi thành công, muốn quay lại cảnh này cần chạy lại seed hoặc dùng một lịch sử chưa đánh giá khác.

**Voiceover**

> "Sau chuyến đi, khách hàng quay lại Hộ chiếu số và nhìn thấy hành trình đã hoàn tất. Khách chọn Đánh giá chuyến đi, chấm sao cho trải nghiệm và hướng dẫn viên, sau đó gửi nhận xét."
>
> "Phản hồi này không chỉ là lời cảm ơn sau hành trình. Hệ thống ghi nhận đánh giá cho sản phẩm Tour mẫu và năng lực của HDV, giúp doanh nghiệp nhìn lại chất lượng phục vụ, cải thiện lịch trình và lựa chọn nhân sự phù hợp hơn cho những lần khởi hành tiếp theo."
> "Cuối cùng, kế toán chốt quyết toán. Từ thời điểm này, bản quyết toán và chuyến đi chuyển sang trạng thái Đã quyết toán; số liệu đã chốt trở thành cơ sở báo cáo, không còn được tùy ý chỉnh sửa. Đây là điểm kết thúc của dòng tiền cho một đợt khởi hành."

### Cảnh 10 - Dashboard kết quả và lời kết (4:27 - 4:42)

**Khung hình:** Full screen Admin Web tại `Tổng quan`; cuối cảnh fade-out sang logo.

**Chỉ dẫn thao tác quay**

1. Chuyển về Admin Web, click `Tổng quan`.
2. Pan qua các thẻ thống kê và vùng tour nổi bật/top điểm đến.
3. Dừng ở một thẻ tour hoặc chỉ số tổng quan rồi fade-out sang logo.

**Hệ thống ngầm chạy**

| Thành phần UI | Dữ liệu/API đã xác thực trong code |
|---|---|
| Số khách, đơn, tour | Frontend gọi các service khách hàng, đơn hàng và `GET /api/dieu-hanh/tour-thuc-te` |
| Tour nổi bật | Frontend lấy tour trạng thái `MO_BAN` còn chỗ, sắp xếp theo số chỗ còn |
| Biểu đồ doanh thu | Hiện là mảng `revenueData` trong `Dashboard.tsx`, dùng làm hình ảnh minh họa |

**Voiceover**

> "Với Digital Travel ERP, con người đến tài chính và trải nghiệm khách hàng, dữ liệu được kết nối xuyên suốt trên cùng một nền tảng. Digital Travel ERP - số hóa toàn diện, vận hành tối ưu, nâng tầm trải nghiệm xanh. Cảm ơn các bạn đã theo dõi."

## 6. Overlay kiến trúc dùng trong hậu kỳ

Chèn overlay nhỏ ở góc phải trong từng cảnh, không che nút đang thao tác:

| Cảnh | Overlay đề xuất |
|---|---|
| 1 | `TourMau + LichTrinhTour` |
| 2 | `POST /dieu-hanh/tour-thuc-te -> CHO_KICH_HOAT` |
| 3 | `PhanCongTour: CHO_PHAN_HOI -> DA_DONG_Y -> MO_BAN` |
| 4 | `JWT -> GET /khach-hang/ho-so -> auto-fill` |
| 5 | `QR -> đơn xác nhận | Nhánh tùy chọn: HUY_TOUR -> CHO_HUY -> duyệt/hoàn tiền` |
| 6 | `Time jump: DANG_DIEN_RA -> DiemDanh + HanhDong -> HoChieuSo.DiemXanh++` |
| 7 | `ChiPhiThucTe: CHO_DUYET` |
| 8 | `ChiPhi: DA_DUYET -> QuyetToan -> DA_QUYET_TOAN` |
| 9 | `DanhGiaKh -> TourMau rating + HDV rating` |
| 10 | `Dashboard: tổng hợp dữ liệu vận hành` |

## 7. Nguồn đã đối chiếu

- `be/README.md`: API, roles, business rules và công nghệ đang dùng.
- `docs/dac-ta-use-case/*.md`: mục tiêu UC01-UC68.
- `admin/src/App.tsx`, `admin/src/components/ui/Sidebar.tsx`: route và tên menu Admin.
- `admin/src/pages/tour-instance/CreateTourInstanceWizard.tsx`, `TourInstanceList.tsx`: thao tác tạo/mở bán tour.
- `admin/src/pages/dispatch/AssignGuide*.tsx`: thao tác phân công.
- `admin/src/pages/finance/**`: duyệt chi phí và quyết toán.
- `kh/src/components/booking/CuaSoDatTour.tsx`, `DatTourThanhCong.tsx`, `kh/src/pages/HoChieuSo.tsx`: luồng khách hàng.
- `hdv/src/App.tsx`, `hdv/src/pages/*.tsx`: thao tác PWA HDV.
- `be/src/main/java/com/digitaltravel/erp/service/*.java`: luật trạng thái và phép tính backend.
