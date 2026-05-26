# Phân hệ Báo cáo, Voucher và Khuyến mãi

**Phạm vi:** UC51-UC54

---

## 3.2.29. Trích xuất dữ liệu phân tích (phục vụ Power BI)
Bảng 3.53: Đặc tả Use - case Trích xuất dữ liệu phân tích (phục vụ Power BI)
Mục Nội dung
Mã Use - case UC51
Tên Use - case Trích xuất dữ liệu phân tích (phục vụ Power BI)
Tác nhân Nhân viên kế toán
Cho phép người dùng lấy thông tin cấu hình kết nối trực tiếp
đến CSDL Oracle để nạp vào Power BI Desktop. Ngoài ra,
Mô tả
hệ thống cũng hỗ trợ phương án dự phòng là xuất tập dữ liệu
thành file Excel/CSV.


- Người dùng đã đăng nhập vào hệ thống ERP và được cấp
quyền truy cập vào phân hệ "Báo cáo & Phân tích".
Tiền điều kiện
- Máy tính của người dùng đã được cài đặt sẵn phần mềm
Power BI Desktop.
- Hệ thống cung cấp thành công chuỗi kết nối và tài khoản
truy cập cơ sở dữ liệu tạm thời.
Hậu điều kiện - Hành động yêu cầu cấp quyền truy cập hoặc tải file được
ghi nhận vào nhật ký bảo mật .
[Thao tác cấp quyền kết nối trên hệ thống]
### 1. Người dùng truy cập phân hệ "Tổng quan", chọn "Kết nối
dữ liệu Power BI".
### 2. Hệ thống kiểm tra phân quyền và hiển thị danh sách các
kho dữ liệu khả dụng.
### 3. Người dùng chọn kho dữ liệu mong muốn và nhấn "Lấy
thông tin kết nối".
### 4. Hệ thống tự động khởi tạo tài khoản Database dạng Read-
only và chuỗi kết nối đến CSDL Oracle.
Luồng sự kiện 5. Hệ thống ghi nhận hành động này vào nhật ký hệ thống .
chính
### 6. Hệ thống hiển thị thông tin kết nối lên màn hình (bao gồm:
Host, Port, Service Name, Username, Password) và có nút
"Sao chép".
[Thao tác phân tích ngoài hệ thống]
### 7. Người dùng mở Power BI Desktop, chọn Get Data >
Oracle database, dán thông tin kết nối vừa nhận.
### 8. Người dùng thực hiện xây dựng biểu đồ, phân tích dữ liệu
đa chiều.
### 9. Người dùng xuất báo cáo ra định dạng PDF, Excel hoặc
PowerPoint từ phần mềm Power BI.
Luồng sự kiện
4a. Trích xuất thành tệp dữ liệu.
phụ


- Nếu không muốn kết nối trực tiếp, người dùng chọn nút
"Tải file dữ liệu".
- Nhập các điều kiện lọc và nhấn "Xuất dữ liệu".
- Hệ thống truy vấn CSDL, tạo file Excel/CSV, ghi nhật ký
bảo mật và cung cấp liên kết tải xuống.
- Người dùng tải file về và nạp thủ công vào Power BI
Desktop.
Luồng sự kiện
Không có.
lỗi hoặc ngoại lệ
Activity diagram:
Sequence diagram:


## 3.2.30. Quản lý voucher
Bảng 3.54: Đặc tả Use - case Quản lý voucher
Mục Nội dung
UC52Mã Use - case
Quản lý voucherTên Use - case
Nhân viên kinh doanhTác nhân
Cho phép nhân viên thực hiện các thao tác quản lý mã
Mô tả giảm giá.
- Nhân viên đã đăng nhập vào hệ thống và được cấp quyền
Tiền điều kiện "Quản lý Khuyến mãi".


- Hiển thị danh sách voucher chính xác theo tiêu chí. Trạng
thái của voucher được cập nhật thành công nếu nhân viên Hậu điều kiện
thao tác.
### 1. Nhân viên truy cập phân hệ "Quản lý Khuyến mãi" trên
hệ thống nội bộ.
### 2. Hệ thống hiển thị danh sách voucher mặc định.
### 3. Nhân viên sử dụng bộ lọc tìm kiếm voucher theo tiêu chí.
### 4. Hệ thống truy vấn CSDL và hiển thị ra màn hình.
Luồng sự kiện
chính 5. Tại giao diện quản lý này, nhân viên có thể chọn:
o Tạo mới: Hệ thống gọi thực thi UC53 - Tạo voucher.
o Phân phối: Hệ thống gọi thực thi UC54 - Phân phối
voucher.
### 4. Kết thúc use case.
5a. Nếu nhân viên nhấn nút "Vô hiệu hóa/Tạm ngưng", hệ
thống hiển thị thông báo và chuyển trạng thái voucher sang
Luồng sự kiện "Vô hiệu hóa".
phụ
4a. Nếu không có voucher nào thỏa mãn từ khóa tìm kiếm,
hệ thống hiển thị thông báo.
Luồng sự kiện Không có
lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:





### 3.2.30.1. Tạo voucher
Bảng 3.55: Đặc tả Use - case Tạo voucher
Mục Nội dung
UC53Mã Use - case
Tạo voucherTên Use - case
Nhân viên kinh doanhTác nhân
Cho phép nhân viên tạo mới các mã giảm giá với các thuộc
tính cụ thể (loại, giá trị, thời hạn, điều kiện áp dụng) phụcMô tả
vụ cho các chiến dịch kinh doanh và chăm sóc khách hàng.
- Nhân viên đã đăng nhập vào hệ thống và được cấp quyền
"Quản lý Khuyến mãi".
Tiền điều kiện
- Nhân viên đang truy cập vào phân hệ “Quản lý Khuyến
mã”.
- Một chiến dịch voucher mới được tạo thành công và lưu
Hậu điều kiện vào CSDL ở trạng thái "Sẵn sàng".
### 1. Nhân viên chọn nút "Tạo mới".
### 2. Hệ thống hiển thị biểu mẫu khởi tạo voucher với các
trường thông tin trống.
Luồng sự kiện 3. Nhân viên nhập đầy đủ các thông tin:
chính o Tên chương trình, số lượng phát hành tối đa.
o Giá trị ưu đãi: Chọn loại giảm giá (Theo phần trăm hoặc
Trừ số tiền cố định), nhập mức giảm. Nếu là giảm theo
phần trăm, nhập thêm "mức giảm tối đa".


o Điều kiện áp dụng: Thời gian hiệu lực, giá trị đơn hàng
tối thiểu, hạng thành viên được áp dụng và giới hạn chỉ
áp dụng cho một số tuyến tour nhất định.
### 4. Nhân viên kiểm tra lại thông tin và nhấn nút "Lưu và kích
hoạt".
### 5. Hệ thống kiểm tra tính hợp lệ của toàn bộ dữ liệu.
### 6. Hệ thống lưu thông tin vào CSDL với trạng thái voucher
là "Sẵn sàng".
### 7. Hiển thị thông báo: "Tạo voucher thành công".
### 8. Kết thúc Use case.
Luồng sự kiện Không có.
phụ
5a. Nếu thiếu trường thông tin bắt buộc hoặc dữ liệu không
Luồng sự kiện hợp lệ, hệ thống báo lỗi chi tiết và yêu cầu nhân viên điều
lỗi hoặc ngoại lệ
chỉnh.
Activity diagram:


Sequence diagram:


### 3.2.30.2. Phân phối và thu hồi voucher
Bảng 3.56: Đặc tả Use - case Phân phối và thu hồi voucher
Mục Nội dung
Mã Use - case UC54


Phân phối và thu hồi voucherTên Use - case
Nhân viên kinh doanhTác nhân
Cho phép nhân viên đẩy mã ưu đãi vào ví voucher của
nhóm khách hàng mục tiêu, đồng thời cho phép thu hồi
Mô tả voucher đã phân phối khi phát hiện sai sót hoặc thay đổi
chính sách.
- Có ít nhất một Voucher đang ở trạng thái "Sẵn sàng".
Nhân viên có quyền phân phối ưu đãi.
Tiền điều kiện
- Nhân viên đang truy cập vào phân hệ “Quản lý Khuyến
mã”.
- Voucher xuất hiện trong ví của tập khách hàng được chọn
với trạng thái "Có hiệu lực".
Hậu điều kiện - Nếu thực hiện thu hồi, voucher trong ví khách hàng
chuyển sang trạng thái "Đã thu hồi".
### 1. Hệ thống hiển thị danh sách voucher.
### 2. Nhân viên chọn một voucher.
### 3. Nhân viên nhấn nút "Phân phối".
### 4. Hệ thống hiển thị giao diện chọn đối tượng nhận ưu đãi.
Luồng sự kiện
chính 5. Nhân viên xác nhận số lượng hợp lý và nhấn nút "Thực
hiện phân phối".
### 6. Hệ thống gắn mã giảm giá vào "Ví ưu đãi" (Hộ chiếu số)
của từng khách hàng trong danh sách.


### 7. Hệ thống tự động kích hoạt gửi thông báo cho các khách
hàng vừa nhận được voucher.
### 8. Hệ thống hiển thị thông báo hoàn tất quá trình phân phối
cho nhân viên.
### 9. Kết thúc Use case.
2a. Nhân viên nhấn nút "Thu hồi" (chi hiển thị đối với
voucher đã phân phối), hệ thống hiển thị danh sách khách
hàng đã nhận voucher (kèm trạng thái: đã dùng, chưa dùng,
Luồng sự kiện hết hạn). Nhân viên chọn phạm vi thu hồi và nhấn xác
phụ
nhận. Hệ thống cập nhật trạng thái các voucher đã chọn
trong ví khách hàng thành "Đã thu hồi" và hiển thị thông
báo thành công
Luồng sự kiện Không có
lỗi hoặc ngoại lệ
Activity diagram:





Sequence diagram:





