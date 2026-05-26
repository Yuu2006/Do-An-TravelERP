# Tài liệu test case - Digital Travel ERP

**Phiên bản:** 1.0 - đối chiếu code ngày 26/05/2026  
**Phạm vi:** Luồng demo xuyên vai trò từ sản phẩm đến đánh giá và các kiểm tra nghiệp vụ trọng yếu.  
**Mục đích báo cáo:** Cung cấp bước thực hiện, dữ liệu kiểm thử và kết quả mong đợi bám API/trạng thái hiện có.

## 1. Cơ sở kiểm thử

| Thành phần | Thông tin xác thực từ mã nguồn |
|---|---|
| Backend | Java 21, Spring Boot, JWT/RBAC, JPA |
| CSDL | Oracle 19c/21c |
| Trạng thái tour | `CHO_KICH_HOAT`, `MO_BAN`, `DANG_DIEN_RA`, `KET_THUC`, `HUY`, `DA_QUYET_TOAN` |
| Trạng thái đơn trọng yếu | `CHO_XAC_NHAN`, `DA_XAC_NHAN`, `HET_HAN_GIU_CHO`, `THANH_TOAN_THAT_BAI`, `CHO_HUY`, `DA_HUY` |
| Trạng thái chi phí | `CHO_DUYET`, `DA_DUYET`, `TU_CHOI`, có luồng yêu cầu bổ sung |
| Trạng thái quyết toán | `CHUA_QUYET_TOAN`, `DA_QUYET_TOAN` |
| Thanh toán | UI QR tạo giao dịch chờ; Kinh doanh duyệt thanh toán tại Admin để xác nhận đơn và trừ chỗ. Request `mock=true` chỉ là phương án demo rút gọn |

## 2. Tiền điều kiện và dữ liệu kiểm thử

| Mã dữ liệu | Chuẩn bị |
|---|---|
| `TM_TAYBAC` | Được tạo trong TC01: Tour mẫu `Tây Bắc – Bản làng và mùa mây 3N2Đ`, thời lượng 3, giá sàn hợp lệ, có lịch trình |
| `HDX_BINH` | Hành động xanh có điểm cộng từ dữ liệu nền, được gán vào tour thực tế mới |
| `NV_HDV01` | `hdv01` / `password`; seed năng lực Tây Bắc/Trekking/Tour xanh và không trùng lịch ở ca positive |
| `KH_DEMO` | `khach02` / `password`, tương ứng `KH_02`, có hồ sơ/Hộ chiếu số gồm họ tên, SĐT, CCCD, ngày sinh |
| `KH_REVIEW` | `khach16` / `password`, tương ứng `KH_16`, có lịch sử `LST_BSLK_REVIEW_KH16` của tour Cần Thơ `TTT_BSLK_DONE_CT` ở `KET_THUC`, chưa có đánh giá hoặc khiếu nại |
| `VC_DEMO` | `VC_OPEN_LOCAL5` / mã `OPEN-LOCAL-5`, đã nằm trong ví `KH_02` ở trạng thái `CO_HIEU_LUC` |
| `TOUR_RUN` | Tour/clone dùng phần hiện trường ở `DANG_DIEN_RA`, HDV đã đồng ý, có đơn `DA_XAC_NHAN` |
| `TOUR_END` | Tour/clone dùng phần kế toán/đánh giá ở `KET_THUC`, có chi phí chờ duyệt và đơn `DA_XAC_NHAN` |
| `DON_CANCEL` | Đơn phụ để kiểm thử nhánh hủy, ở `CHO_XAC_NHAN` hoặc `DA_XAC_NHAN` và còn đủ điều kiện hủy; không dùng cho cảnh HDV |

**Lưu ý thu bằng chứng:** Với mỗi test case, chụp UI trước/sau thao tác và lưu response API hoặc dữ liệu DB của mã thực thể được tạo: `TTT_*`, `PC_*`, `DDT_*`, `CP_*`, `QT_*`, `DG_*`.

**Tài khoản dùng trong test/demo:** `sanpham01`, `manager01`, `sales01`, `ketoan01`, `hdv01`, `khach02`, `khach16`; tất cả dùng mật khẩu seed `password`.

**Quy tắc reset:** chỉ chạy `data_lien_ket.sql` trước phiên kiểm thử. Không chạy lại script này sau TC01/TC02 trong cùng một chuỗi evidence, vì phần reset sẽ xóa dữ liệu nghiệp vụ vừa tạo.

**Check seed cho TC21:** sau khi chạy seed, `khach16` phải có `LST_BSLK_REVIEW_KH16` trên `TTT_BSLK_DONE_CT`, trạng thái tour `KET_THUC`, và truy vấn `DANHGIAKH` theo cặp (`KH_16`, `TTT_BSLK_DONE_CT`) không trả về dòng nào.

## 3. Ma trận truy vết use case

| Nhóm | Use case/luồng | Test case |
|---|---|---|
| Tour mẫu/tour thực tế | UC02, UC11, UC13/14 | TC01 - TC04 |
| Điều phối HDV | UC37, UC38, UC40 | TC05 - TC07 |
| Tìm kiếm, đặt, voucher, thanh toán | UC25 - UC29 | TC08 - TC12 |
| Hủy tour và hoàn tiền | UC32, UC33, UC50 | TC11C - TC11D |
| Vận hành HDV | UC41/42/44 theo tài liệu, endpoint vận hành thực tế | TC13 - TC16 |
| Kế toán | UC45, UC47, UC48 | TC17 - TC20 |
| Đánh giá | UC35 | TC21 - TC22 |

## 4. Test case chi tiết

### TC01 - Tạo Tour mẫu hợp lệ

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Admin Sản phẩm - `POST /api/san-pham/tour-mau` |
| Tiền điều kiện | Đăng nhập vai trò `SANPHAM`; mã/tên không gây trùng dữ liệu seed |
| Dữ liệu | Tên `Tây Bắc – Bản làng và mùa mây 3N2Đ`, thời lượng `3` ngày/`2` đêm, giá sàn `5890000`, lịch trình 3 ngày như kịch bản demo |
| Bước thực hiện | Vào `Quản lý Sản phẩm` > `Quản lý Tour mẫu` > `Thêm Tour Mẫu mới`; nhập dữ liệu; lưu |
| Kết quả mong đợi | Thông báo thành công; bảng có tour mới; truy vấn chi tiết trả về thông tin và lịch trình đã lưu |
| Bằng chứng | Screenshot bảng/modal; response chứa `maTourMau` |

### TC02 - Khởi tạo Tour thực tế ở trạng thái chờ kích hoạt

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Admin Điều hành - `POST /api/dieu-hanh/tour-thuc-te` |
| Tiền điều kiện | TC01 pass để có `TM_TAYBAC`; đăng nhập `manager01` / `password` (`DIEUHANH`) hoặc `ADMIN` (không dùng `SANPHAM` để gửi POST endpoint này) |
| Dữ liệu | Ngày tương lai, `soKhachToiDa=10`, `soKhachToiThieu=2`, `giaHienHanh=6290000 >= giaSan=5890000`, `trangThai=CHO_KICH_HOAT` |
| Bước thực hiện | `Quản lý Tour thực tế` > `Khởi tạo Tour`; chọn mẫu; nhập dữ liệu; hoàn tất wizard |
| Kết quả mong đợi | Tạo `TourThucTe`; trạng thái `CHO_KICH_HOAT`; `choConLai=10`; hiển thị badge `Chờ kích hoạt` |
| Bằng chứng | Mã `TTT_*`, screenshot bảng và response |

### TC03 - Không cho tạo tour mới trực tiếp ở trạng thái mở bán

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Backend `TourThucTeService.taoMoi` |
| Tiền điều kiện | Như TC02 |
| Dữ liệu | Payload hợp lệ nhưng `trangThai=MO_BAN` |
| Bước thực hiện | Chọn `Mở bán` trong form tạo hoặc gửi request API tương đương |
| Kết quả mong đợi | Request bị từ chối; thông báo tour mới phải ở `CHO_KICH_HOAT` để phân công/xác nhận HDV trước khi mở bán; không có bản ghi mở bán mới |
| Loại | Negative/business-rule |

### TC04 - Không cho giá bán thấp hơn giá sàn

| Thuộc tính | Nội dung |
|---|---|
| Module/API | `POST /api/dieu-hanh/tour-thuc-te` |
| Dữ liệu | `giaHienHanh = giaSan - 1` |
| Bước thực hiện | Tạo tour từ mẫu với giá thấp hơn giá sàn |
| Kết quả mong đợi | UI/backend báo lỗi; không tạo tour |
| Loại | Negative/validation |

### TC05 - Phân công HDV khả dụng thành công

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Điều hành - `GET /api/dieu-hanh/hdv-kha-dung`, `POST /api/dieu-hanh/phan-cong` |
| Tiền điều kiện | Tour TC02 ở `CHO_KICH_HOAT`; `NV_HDV01` không trùng lịch |
| Bước thực hiện | `Điều phối HDV` > `Phân công HDV`; tìm tour; `Phân bổ ngay`; chọn HDV; xác nhận |
| Kết quả mong đợi | Tạo phân công `PC_*` trạng thái `CHO_PHAN_HOI`; modal `Phân công thành công!` hiển thị; yêu cầu xuất hiện ở PWA HDV |
| Bằng chứng | Mã phân công và màn hình hai phía |

### TC06 - Chặn HDV trùng lịch

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Điều hành - kiểm tra HDV khả dụng/phân công |
| Tiền điều kiện | HDV đã nhận một tour có khoảng ngày chồng với tour cần phân công |
| Bước thực hiện | Mở danh sách HDV khả dụng hoặc cố phân công HDV trùng lịch |
| Kết quả mong đợi | HDV không nằm trong danh sách khả dụng hoặc request bị từ chối; không tạo phân công hợp lệ mới |
| Loại | Negative/business-rule |

### TC07 - HDV đồng ý và Admin mở bán tour

| Thuộc tính | Nội dung |
|---|---|
| Module/API | PWA `POST /api/huong-dan-vien/phan-cong/{id}/dong-y`; Admin `PUT /api/dieu-hanh/tour-thuc-te/{id}` |
| Tiền điều kiện | TC05 pass |
| Bước thực hiện | HDV mở yêu cầu điều phối, click `Đồng ý`; Admin sửa tour, chọn trạng thái `Mở bán`, lưu |
| Kết quả mong đợi | Phân công thành `DA_DONG_Y`; tour thành `MO_BAN`; tour xuất hiện ở API công khai và Customer Web |
| Bằng chứng | Response hai API và thẻ tour customer |

### TC08 - Chặn mở bán khi chưa có HDV đã nhận

| Thuộc tính | Nội dung |
|---|---|
| Module/API | `PUT /api/dieu-hanh/tour-thuc-te/{id}` |
| Tiền điều kiện | Tour `CHO_KICH_HOAT` chưa phân công hoặc phân công còn `CHO_PHAN_HOI` |
| Bước thực hiện | Sửa trạng thái thành `MO_BAN` |
| Kết quả mong đợi | Backend báo `Tour chỉ được mở bán khi có HDV đã xác nhận phân công.`; trạng thái giữ nguyên |
| Loại | Negative/business-rule |

### TC09 - Tra cứu và xem chi tiết tour công khai

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Customer Web - `GET /api/public/tour`, `GET /api/public/tour/{id}` |
| Tiền điều kiện | TC07 pass |
| Bước thực hiện | Trang chủ tìm `Tây Bắc`; click thẻ tour |
| Kết quả mong đợi | Chỉ tour `MO_BAN` phù hợp hiển thị; chi tiết có tên, giá, ngày, số chỗ và lịch trình |
| Bằng chứng | Screenshot trang tìm kiếm/chi tiết |

### TC10 - Hộ chiếu số tự điền thông tin người đặt

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Customer - `GET /api/khach-hang/ho-so` |
| Tiền điều kiện | Đăng nhập `KH_DEMO`; hồ sơ đầy đủ |
| Bước thực hiện | Tại chi tiết tour click `Đặt tour ngay` |
| Kết quả mong đợi | Form `Thông tin hành khách` điền sẵn họ tên, điện thoại, CCCD, ngày sinh của người đặt |
| Ghi chú | Đây là lấy hồ sơ đã lưu, không kiểm thử OCR |

### TC11 - Đặt tour, áp voucher và ghi nhận QR chờ đối soát trên UI

| Thuộc tính | Nội dung |
|---|---|
| Module/API | `POST /api/khach-hang/dat-tour`, `/ap-voucher`, `/api/thanh-toan/khoi-tao`, `/{id}/xac-nhan-chuyen-khoan` |
| Tiền điều kiện | Tour `MO_BAN` còn chỗ; đăng nhập `khach02` / `password`; `OPEN-LOCAL-5` có trong ví khách và còn `CO_HIEU_LUC` |
| Dữ liệu | 1 khách, voucher hợp lệ, phương thức thanh toán hiển thị ở UI |
| Bước thực hiện | Hoàn thành ba bước booking; chọn voucher; click `Xác nhận & Thanh toán`; trên QR click báo đã chuyển khoản |
| Kết quả mong đợi | Tạo đơn `DDT_*`; giá giảm đúng rule voucher; giao dịch QR ở `CHO_THANH_TOAN` được đánh dấu khách đã báo chuyển khoản; popup hiển thị chờ xác nhận; đơn vẫn `CHO_XAC_NHAN`, chưa trừ chỗ |
| Bằng chứng | Tổng tiền trước/sau, mã đơn và kết quả API giao dịch/đơn |

### TC11B - Kinh doanh duyệt thanh toán để tạo dữ liệu cho vận hành

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Admin Kinh doanh - `PUT /api/kinh-doanh/dat-tour/{maDatTour}/xac-nhan` |
| Tiền điều kiện | TC11 pass; đăng nhập `sales01` / `password`; đơn `CHO_XAC_NHAN` có thông tin khách đã báo chuyển khoản |
| Bước thực hiện | `Quản lý Đơn hàng`; tìm mã đơn vừa tạo; click `Duyệt thanh toán`; xác nhận dialog |
| Kết quả mong đợi | Đơn `DA_XAC_NHAN`; `ChoConLai` giảm đúng số hành khách; tạo `LichSuTour`; Admin thông báo duyệt thanh toán thành công |
| Bằng chứng | Response API, dữ liệu đơn và số chỗ trước/sau |

### TC11B-R - Xác nhận thanh toán mock cho bản quay rút gọn

| Thuộc tính | Nội dung |
|---|---|
| Module/API | `POST /api/thanh-toan/khoi-tao` với `mock=true` |
| Tiền điều kiện | Môi trường cấu hình `app.payment.mock-enabled=true`; dùng đơn mới `CHO_XAC_NHAN` chưa có giao dịch thành công |
| Bước thực hiện | Gửi request thanh toán demo qua Swagger/API client hoặc dùng fixture tương đương thay cho cảnh Kinh doanh duyệt |
| Kết quả mong đợi | Đơn `DA_XAC_NHAN`; `ChoConLai` giảm đúng số hành khách; tạo `LichSuTour` |
| Ghi chú | Chỉ dùng nếu cần rút ngắn bản dựng; tuyến demo đầy đủ ưu tiên TC11B |

### TC11C - Khách gửi yêu cầu hủy tour và chờ phê duyệt

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Customer - `POST /api/khach-hang/dat-tour/{maDatTour}/huy` |
| Tiền điều kiện | Dùng `DON_CANCEL` riêng, không dùng đơn của luồng điểm danh; đơn ở `CHO_XAC_NHAN` hoặc `DA_XAC_NHAN` và ngày đi còn đủ điều kiện hủy |
| Bước thực hiện | `Hộ chiếu số` > `Lịch sử chuyến đi`; click `Hủy tour & Hoàn tiền`; xem phí/số tiền hoàn; nhập lý do; click `Xác nhận hủy & Hoàn tiền` |
| Kết quả mong đợi | Tạo yêu cầu hủy chưa xử lý; đơn chuyển `CHO_HUY`; UI hiển thị trạng thái `Chờ hủy` và thông báo yêu cầu đã được gửi |
| Bằng chứng | Screenshot modal/toast/badge, response chứa mã yêu cầu và số tiền hoàn dự kiến |

### TC11D - Nhân viên duyệt hủy và Kế toán xác nhận hoàn tiền

| Thuộc tính | Nội dung |
|---|---|
| Module/API | `POST /api/kinh-doanh/yeu-cau-huy/{maYeuCau}/duyet`; `PUT /api/ke-toan/giao-dich-hoan/{maGiaoDich}/xac-nhan` |
| Tiền điều kiện | TC11C pass; có tài khoản `KINHDOANH` và `KETOAN` |
| Bước thực hiện | Nhân viên Kinh doanh mở yêu cầu chờ xử lý và duyệt; Kế toán mở giao dịch hoàn tiền vừa tạo và xác nhận hoàn |
| Kết quả mong đợi | Khi Kinh doanh duyệt, tạo giao dịch hoàn chờ Kế toán và đơn vẫn `CHO_HUY`; khi Kế toán xác nhận, giao dịch hoàn thành, đơn thành `DA_HUY` và chỗ được trả lại tour |
| Bằng chứng | Trạng thái yêu cầu, giao dịch hoàn, đơn và `ChoConLai` trước/sau |

### TC12 - Không đặt vượt số chỗ còn lại

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Customer booking/backend locking khi xác nhận |
| Tiền điều kiện | Tour chỉ còn 1 chỗ |
| Dữ liệu | Booking nhóm 2 người |
| Bước thực hiện | Chọn 2 hành khách và tiếp tục tạo đơn/thanh toán |
| Kết quả mong đợi | UI báo chỉ còn 1 chỗ hoặc backend từ chối trước khi xác nhận; `ChoConLai` không âm |
| Loại | Negative/capacity |

### TC13 - Điểm danh khách đã xác nhận

| Thuộc tính | Nội dung |
|---|---|
| Module/API | HDV - `GET /api/huong-dan-vien/tour/{maTour}/doan`, `POST .../diem-danh` |
| Tiền điều kiện | `TOUR_RUN`; HDV đã nhận tour; khách có đơn `DA_XAC_NHAN` |
| Bước thực hiện | PWA > `Điểm danh`; click điểm danh cho khách |
| Kết quả mong đợi | Lưu bản ghi `DiemDanh`; khách hiển thị trạng thái đã điểm danh (`DA_DIEM_DANH`) |
| Ghi chú | UI hiện tại là nút thao tác, không phải QR scanner |

### TC14 - Ghi nhận hành động xanh và cộng điểm

| Thuộc tính | Nội dung |
|---|---|
| Module/API | HDV - `POST /api/huong-dan-vien/tour/{maTour}/hanh-dong-xanh` |
| Tiền điều kiện | TC13 pass; khách có Hộ chiếu số; `HDX_BINH` gán vào tour |
| Bước thực hiện | Tab `Điểm xanh`; chọn khách và hành động; tạo ảnh minh chứng trong UI; gửi |
| Kết quả mong đợi | Tạo `HanhDong`; điểm `HoChieuSo.DiemXanh` tăng đúng `DiemCong`; UI thông báo số điểm cộng |
| Bằng chứng | Điểm trước/sau và response ghi nhận |

### TC15 - Không cộng trùng cùng hành động xanh cho cùng khách/tour

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Ghi nhận hành động xanh |
| Tiền điều kiện | TC14 pass |
| Bước thực hiện | Gửi lại cùng khách, tour và hành động xanh |
| Kết quả mong đợi | Request bị bỏ qua/từ chối theo unique rule; điểm không tăng lần hai |
| Loại | Negative/data-integrity |

### TC16 - HDV khai chi phí có minh chứng

| Thuộc tính | Nội dung |
|---|---|
| Module/API | HDV - `POST /api/huong-dan-vien/tour/{maTour}/chi-phi` |
| Tiền điều kiện | `TOUR_RUN`; HDV có quyền vận hành |
| Dữ liệu | Danh mục `Ăn uống`, tiền `200000`, ghi chú `Nước suối cho đoàn`, ảnh UI |
| Bước thực hiện | Tab `Chi phí` > `Thêm yêu cầu quyết toán`; nhập form; click chụp ảnh; `Lưu chi phí` |
| Kết quả mong đợi | Tạo `CP_*`/chi phí thực tế trạng thái `CHO_DUYET`; hiển thị trong lịch sử HDV và danh sách Kế toán |
| Ghi chú | Ảnh do PWA gán URL mô phỏng trong phiên bản hiện tại |

### TC17 - Kế toán duyệt chi phí

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Admin Kế toán - `PUT /api/ke-toan/chi-phi/{id}/duyet` |
| Tiền điều kiện | TC16 pass |
| Bước thực hiện | `Tài chính & Kế toán` > `Quản lý Chi phí`; mở khoản chi; click `Phê duyệt` |
| Kết quả mong đợi | Trạng thái chi phí thành `DA_DUYET`; dữ liệu được tính vào tổng chi của quyết toán |
| Bằng chứng | Modal trước/sau và response |

### TC18 - Xem trước và chốt quyết toán thành công

| Thuộc tính | Nội dung |
|---|---|
| Module/API | `GET /api/ke-toan/tinh-toan/{maTour}`, `POST /api/ke-toan/quyet-toan/{maTour}`, `PUT .../{maQuyetToan}/chot` |
| Tiền điều kiện | `TOUR_END` ở `KET_THUC`; có đơn xác nhận và chi phí `DA_DUYET` |
| Bước thực hiện | `Quyết toán Tour`; chọn tour; nhập chi phí cam kết nếu UI yêu cầu; click `Tính toán`; chốt và xác nhận |
| Kết quả mong đợi | Preview: `loiNhuan = tongDoanhThu - tongChiPhi`; tạo `QT_*` rồi chuyển `DA_QUYET_TOAN`; tour chuyển `DA_QUYET_TOAN` |
| Bằng chứng | Ba số trên modal, response, badge trạng thái |

### TC19 - Chi phí chưa duyệt không vào phép tính lợi nhuận

| Thuộc tính | Nội dung |
|---|---|
| Module/API | `GET /api/ke-toan/tinh-toan/{maTour}` |
| Tiền điều kiện | Tour kết thúc có một chi phí `CHO_DUYET` và một chi phí `DA_DUYET` |
| Bước thực hiện | Gọi tính toán trước khi duyệt khoản chờ |
| Kết quả mong đợi | `tongChiPhi` chỉ bằng tổng các khoản `DA_DUYET`; khoản `CHO_DUYET` không được cộng |
| Loại | Accounting-rule |

### TC20 - Không sửa/chốt lại quyết toán đã chốt

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Quyết toán backend |
| Tiền điều kiện | TC18 pass, quyết toán ở `DA_QUYET_TOAN` |
| Bước thực hiện | Gửi lại thao tác chốt hoặc thử tạo/cập nhật quyết toán cho cùng tour |
| Kết quả mong đợi | Backend từ chối với thông báo quyết toán đã bị chốt/không thể sửa; số liệu giữ nguyên |
| Loại | Negative/immutability |

### TC21 - Khách đánh giá chuyến đi đã hoàn tất

| Thuộc tính | Nội dung |
|---|---|
| Module/API | Customer - `POST /api/khach-hang/danh-gia` |
| Tiền điều kiện | Đăng nhập `khach16` / `password`; seed có lịch sử `LST_BSLK_REVIEW_KH16` trên `TTT_BSLK_DONE_CT` ở `KET_THUC`; chưa có `DANHGIAKH` hoặc khiếu nại của `KH_16` trên tour này |
| Dữ liệu | 5 sao, đánh giá HDV và nhận xét |
| Bước thực hiện | `Hộ chiếu số` > lịch sử tour; tìm tour Cần Thơ đã hoàn tất > `Đánh giá chuyến đi`; điền form; gửi |
| Kết quả mong đợi | Tạo `DanhGiaKh`; UI báo thành công; số lượt/điểm trung bình của Tour mẫu cập nhật; năng lực HDV cập nhật khi có HDV liên kết |
| Bằng chứng | Toast, trang chi tiết tour reload, response `DG_*` |

### TC22 - Không cho gửi đánh giá trùng

| Thuộc tính | Nội dung |
|---|---|
| Module/API | `POST /api/khach-hang/danh-gia` |
| Tiền điều kiện | TC21 pass |
| Bước thực hiện | Cố gửi đánh giá lần hai cho cùng khách và tour |
| Kết quả mong đợi | Backend từ chối; không tăng số lượt hoặc đổi điểm do đánh giá trùng |
| Loại | Negative/data-integrity |

## 5. Kịch bản smoke test trước khi quay

| Thứ tự | Check nhanh | Pass khi |
|---:|---|---|
| 1 | Đăng nhập tài khoản seed | `sanpham01`, `manager01`, `ketoan01`, `khach02`, `hdv01` đăng nhập bằng `password` và vào đúng giao diện |
| 2 | Tạo Tour mẫu mở đầu | Lưu thành công, có tên/lịch trình/giá sàn và mã tour mẫu |
| 3 | Tạo tour thực tế từ Tour mẫu vừa tạo | Badge `Chờ kích hoạt`, có mã `TTT_*` |
| 4 | Phân công và HDV đồng ý | Có `PC_*`, `DA_DONG_Y` |
| 5 | Mở bán | Customer tìm thấy tour |
| 6 | Ví voucher khách | Dropdown checkout của `khach02` có `OPEN-LOCAL-5` trạng thái dùng được |
| 7 | QR UI và Kinh doanh duyệt thanh toán | UI cho thấy chờ đối soát; Admin duyệt đơn thành `DA_XAC_NHAN` và giảm chỗ |
| 7A | Modal nhánh hủy trong video | Đơn chính mở được `Hủy tour & Hoàn tiền`, hiển thị tiền hoàn; người quay click `Giữ lại chuyến đi` để tiếp tục luồng chính |
| 8 | Tour hiện trường | Có bản ở `DANG_DIEN_RA` cho HDV thao tác |
| 9 | Tour quyết toán | Có bản ở `KET_THUC` cho Kế toán |
| 10 | Review | Khách chưa từng đánh giá bản tour dùng cho cảnh cuối |

## 6. Mẫu ghi nhận kết quả kiểm thử

| Test case | Ngày chạy | Người chạy | Môi trường | Kết quả (`Pass/Fail/Blocked`) | Mã dữ liệu/bằng chứng | Defect ID |
|---|---|---|---|---|---|---|
| TC01 |  |  |  |  |  |  |
| TC02 |  |  |  |  |  |  |
| TC05 |  |  |  |  |  |  |
| TC07 |  |  |  |  |  |  |
| TC11 |  |  |  |  |  |  |
| TC11C |  |  |  |  |  |  |
| TC11D |  |  |  |  |  |  |
| TC13 |  |  |  |  |  |  |
| TC14 |  |  |  |  |  |  |
| TC16 |  |  |  |  |  |  |
| TC17 |  |  |  |  |  |  |
| TC18 |  |  |  |  |  |  |
| TC21 |  |  |  |  |  |  |

## 7. Các giới hạn phải ghi trong báo cáo kiểm thử

1. Việc quay QR và Kinh doanh duyệt thanh toán chứng minh luồng đối soát nội bộ hiện có, không phải chứng nhận tích hợp VNPAY/MoMo production; `mock=true` chỉ áp dụng khi dựng bản rút gọn.
2. Không có kiểm thử OCR giấy tờ vì luồng UI hiện đọc hồ sơ khách đã lưu.
3. Không có kiểm thử push notification FCM hay upload object storage; PWA đang tạo thông báo trong ứng dụng và URL ảnh minh họa.
4. Dashboard không được dùng làm bằng chứng đối soát doanh thu nếu chỉ quan sát biểu đồ tĩnh; bằng chứng tài chính phải lấy từ màn quyết toán/API/DB.
5. Việc đưa tour sang `DANG_DIEN_RA` và `KET_THUC` để quay nên được ghi là dữ liệu chuẩn bị/fixture phục vụ kiểm thử theo trạng thái.

## 8. Tài liệu và code tham chiếu

- `be/README.md` và `docs/dac-ta-use-case/*.md`.
- `be/src/main/java/com/digitaltravel/erp/service/TourThucTeService.java`.
- `be/src/main/java/com/digitaltravel/erp/service/DatTourService.java`, `ThanhToanService.java`, `VoucherService.java`, `HuyTourService.java`.
- `be/src/main/java/com/digitaltravel/erp/service/PhanCongTourService.java`, `VanHanhService.java`.
- `be/src/main/java/com/digitaltravel/erp/service/QuyetToanService.java`, `DanhGiaService.java`.
- `admin/src/pages/**`, `kh/src/components/booking/**`, `kh/src/pages/HoChieuSo.tsx`, `hdv/src/pages/**`.
