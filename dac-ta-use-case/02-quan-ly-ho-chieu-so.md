# Phân hệ Quản lý Hộ chiếu số

**Phạm vi:** UC21-UC24
---

## 3.2.6. Xem thông tin hồ sơ số
Bảng 3.23: Đặc tả Use - case Xem thông tin hồ sơ số
Mục Nội dung
Mã Use - case UC21
Tên Use - case Xem thông tin hồ sơ số
Tác nhân Khách hàng
Cho phép khách hàng xem toàn bộ thông tin trong hồ sơ du
Mô tả lịch điện tử của mình, theo dõi hạng thành viên, điểm
thưởng xanh và tóm tắt lịch sử các chuyến đi.
Tiền điều kiện - Khách hàng đã đăng nhập thành công.
- Hệ thống hiển thị thành công thông tin tổng quan hồ sơ cá
Hậu điều kiện
nhân của khách hàng.


### 1. Khách hàng truy cập vào khu vực cá nhân và chọn mục
"Hộ chiếu số" trên thanh menu.
### 2. Hệ thống truy xuất dữ liệu từ CSDL và hiển thị trang tổng
quan gồm:
- Thông tin cá nhân (Họ tên, ngày sinh, giới tính, số
CCCD/Passport)
- Thông tin liên lạc (SĐT, Email, Địa chỉ)
- Hạng thành viên hiện tại và điểm thưởng xanh
Luồng sự kiện
- Thông tin sức khỏe, dị ứng (nếu có) chính
### 3. Khách hàng có thể chọn thao tác tiếp theo:
- Nếu khách hàng chọn "Xem tất cả lịch sử": Hệ thống
thực thi Use case UC22 - Xem chi tiết lịch sử hành trình.
- Nếu khách hàng chọn "Chỉnh sửa hồ sơ": Hệ thống thực
thi UC23 - Cập nhật hồ sơ số.
- Nếu khách hàng chọn "Ví ưu đãi": Hệ thống thực thi
UC31 - Xem danh sách voucher.
### 4. Kết thúc use case
Luồng sự kiện Không có.
phụ
Luồng sự kiện Khách hàng thoát khỏi mục “Hộ chiếu số”. Use case dừng
lỗi hoặc ngoại lệ lại.
Activity diagram:


Sequence diagram:


### 3.2.6.1. Xem chi tiết lịch sử hành trình
Bảng 3.24: Đặc tả Use - case Xem chi tiết lịch sử hành trình
Mục Nội dung
UC22Mã Use - case
Xem chi tiết lịch sử hành trìnhTên Use - case
Khách hàngTác nhân


Cho phép khách hàng xem danh sách đầy đủ các chuyến đi
đã, đang và sắp thực hiện, đồng thời tra cứu chi tiết từngMô tả
đơn đặt tour.
- Khách hàng đã đăng nhập và đang ở trang hồ sơ số
Tiền điều kiện (UC21).
- Hệ thống hiển thị chi tiết thông tin chuyến đi được chọn.Hậu điều kiện
### 1. Hệ thống truy vấn CSDL và hiển thị danh sách toàn bộ
các chuyến đi của khách hàng, phân loại theo các tab: "Sắp
khởi hành", "Đã hoàn thành", "Đã hủy".
### 2. Khách hàng nhấn chọn vào một Card chuyến đi cụ thể
trong danh sách.
### 3. Hệ thống hiển thị chi tiết đơn hàng: Lịch trình, HDV, chi
phí, mã vé QR.
### 4. Tại giao diện chi tiết, khách hàng có thể chọn các thao
Luồng sự kiện
tác:chính
- Nếu tour chưa khởi hành, khách hàng chọn "Hủy tour":
Hệ thống gọi thực thi UC32 - Hủy tour.
- Nếu tour đã hoàn thành, khách hàng chọn "Đánh giá":
Hệ thống gọi thực thi UC35 - Đánh giá.
- Nếu khách hàng chọn "Khiếu nại": Hệ thống gọi thực
thi UC36 - Khiếu nại
### 5. Kết thúc use case.
Luồng sự kiện Không có.
phụ


Khách hàng thoát khỏi tab thông tin chi tiết chuyến đi. Use
Luồng sự kiện
case dừng lại. lỗi hoặc ngoại lệ
Activity diagram:
Sequence diagram:


## 3.2.7. Cập nhật hồ sơ số
Bảng 3.25: Đặc tả Use - case Cập nhật hồ sơ số
Mục Nội dung
UC23Mã Use - case
Cập nhật hồ sơ sốTên Use - case
Khách hàngTác nhân


Cho phép khách hàng chỉnh sửa, bổ sung các thông tin cá
Mô tả nhân, liên lạc và cập nhật tình trạng sức khỏe vào hồ sơ.
- Khách hàng đã đăng nhập và đang ở trang hồ sơ số
Tiền điều kiện (UC21).
- Dữ liệu cá nhân mới của khách hàng được cập nhật thành
Hậu điều kiện công vào hệ thống.
### 1. Khách hàng nhấn nút "Chỉnh sửa hồ sơ" tại trang thông
tin hồ sơ số.
### 2. Hệ thống hiển thị biểu mẫu chỉnh sửa thông tin. Các dữ
liệu cũ đã được điền sẵn vào ô nhập liệu.
### 3. Khách hàng thay đổi thông tin (SĐT, Email, Tình trạng
sức khỏe) và nhấn nút "Lưu thay đổi".
### 4. Hệ thống kiểm tra tính hợp lệ của các dữ liệu vừa nhập
(định dạng email, độ dài SĐT).
Luồng sự kiện
chính 5. Hệ thống tạo và gửi một mã OTP về SĐT của khách hàng.
### 6. Khách hàng kiểm tra và nhập mã OTP vào hộp thoại xác
thực trên hệ thống.
### 7. Hệ thống đối chiếu mã OTP hợp lệ, tiến hành lưu dữ liệu
vào CSDL, hiển thị thông báo "Cập nhật thành công".
### 8. Hệ thống tự động đóng biểu mẫu và trả luồng về trang
tổng quan của UC21.


3a. Nếu khách hàng hủy thao tác, hệ thống hủy bỏ toàn bộ
Luồng sự kiện
dữ liệu tạm và quay lại trang tổng quan hộ chiếu số. phụ
3a. Nếu thông tin nhập vào không đúng định dạng: Hệ
thống hiển thông báo và yêu cầu thử lại.
6a. Nếu khách hàng nhập sai OTP, hệ thống từ chối cập
Luồng sự kiện nhật thông tin mới và yêu cầu khách hàng thực hiện gửi lại
lỗi hoặc ngoại lệ
mã hoặc thử lại sau.
7a. Nếu xảy ra lỗi khi lưu dữ liệu, hệ thống hiển thị thông
báo lỗi và yêu cầu thử lại.
Activity diagram:





Sequence diagram:





## 3.2.8. Tra cứu khách hàng
Bảng 3.26: Đặc tả Use - case Tra cứu khách hàng
Mục Nội dung
UC24Mã Use - case
Tra cứu khách hàngTên Use - case
Nhân viênTác nhân
Cho phép nhân viên tìm kiếm và xem hồ sơ của khách
hàng và đơn hàng tương ứng để hỗ trợ các nghiệp vụ liênMô tả
quan.
- Nhân viên đã đăng nhập thành công vào hệ thống quản trị
nội bộ và được cấp quyền truy cập phân hệ "Quản lý kháchTiền điều kiện
hàng".
- Hệ thống hiển thị danh sách kết quả hoặc chi tiết hồ sơ
của khách hàng được tìm kiếm. Trạng thái dữ liệu của hệHậu điều kiện
thống không thay đổi (chỉ xem, không ghi đè).
### 1. Nhân viên truy cập phân hệ "Quản lý khách hàng", nhập
thông tin (SĐT, Email, CCCD) vào thanh tìm kiếm.
### 2. Hệ thống truy vấn CSDL.
Luồng sự kiện
chính 3. Hệ thống hiển thị hồ sơ khách hàng gồm: tên, hạng thẻ,
điểm xanh, lịch sử đơn hàng, khiếu nại.
### 4. Kết thúc use case.


Luồng sự kiện Không có.
phụ
2a. Nếu không có khách hàng nào thỏa yêu cầu tìm kiếm,
Luồng sự kiện
hệ thống thông báo không tìm thấy và yêu cầu thử lại. lỗi hoặc ngoại lệ
Activity diagram:
Sequence diagram:


