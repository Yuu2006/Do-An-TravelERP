# Phân hệ Đặt tour và Thanh toán

**Phạm vi:** UC25-UC33
---

## 3.2.9. Tra cứu tour
Bảng 3.27: Đặc tả Use - case Tra cứu tour
Mục Nội dung
UC25Mã Use - case
Tra cứu tourTên Use - case
Khách hàngTác nhân
Cho phép khách hàng tìm kiếm, lọc và xem danh sách các
Mô tả chuyến đi phù hợp với nhu cầu.


- Người dùng đang ở trang chủ hoặc trang tìm kiếm của hệ
Tiền điều kiện thống.
- Danh sách các chuyến đi khả dụng kèm giá ưu đãi được
Hậu điều kiện hiển thị.
### 1. Khách hàng nhấn chọn chức năng "Tìm kiếm tour" trên
thanh menu của hệ thống.
### 2. Hệ thống hiển thị các trường dữ liệu: Điểm đến, Ngày
khởi hành, Mức giá tối đa.
### 3. Khách hàng nhập thông tin tìm kiếm.
Luồng sự kiện 4. Khách hàng nhấn nút "Tìm kiếm".
chính
### 5. Hệ thống kiểm tra dữ liệu.
### 6. Hệ thống tính toán giá động theo thời gian thực.
### 7. Hệ thống hiển thị danh sách kết quả (Card view) gồm:
Ảnh, Lịch trình, Giá động, Số chỗ còn nhận.
### 8. Kết thúc use case.
5a. Nếu không có tour nào thỏa mãn, hệ thống hiển thị
thông báo không tìm thấy và đề xuất các tour điểm đến gần
Luồng sự kiện
nhất hoặc đang thu hút nhiều sự quan tâm nhất. Hệ thống phụ
quay lại bước 3 để khách hàng điều chỉnh tiêu chí.
Khách hàng thoát khỏi màn hình tìm kiếm. Use case kết
Luồng sự kiện
thúc. lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:





### 3.2.9.1. Xem chi tiết tour
Bảng 3.28: Đặc tả Use - case Xem chi tiết tour
Mục Nội dung
UC26Mã Use - case
Xem chi tiết tourTên Use - case
Khách hàngTác nhân
Cho phép khách hàng xem toàn bộ thông tin về một chuyến
Mô tả đi cụ thể.
- Khách hàng đang ở màn hình kết quả tra cứu (UC23).Tiền điều kiện
- Trang chi tiết tour được hiển thị.Hậu điều kiện
### 1. Khách hàng nhấn "Xem chi tiết" của một tour.
### 2. Hệ thống truy xuất dữ liệu tour và hiển thị trang chi tiết:
Luồng sự kiện tổng quan, lịch trình, bảng giá, lịch khởi hành, đánh giá,
chính
chính sách.
### 3. Kết thúc use case.
Luồng sự kiện Không có.
phụ
2a. Nếu xảy ra lỗi khi truy xuất dữ liệu, hệ thống hiển thị
thông báo lỗi và yêu cầu thử lại.
Luồng sự kiện
lỗi hoặc ngoại lệ Khách hàng thoát khỏi màn hình xem chi tiết của tour. Use
case kết thúc.


Activity diagram:
Sequence diagram:


## 3.2.10. Đặt tour
Bảng 3.29: Đặc tả Use - case Đặt tour
Mục Nội dung
UC27Mã Use - case
Đặt tourTên Use - case
Khách hàngTác nhân


Khách hàng thực hiện đăng ký giữ chỗ, cung cấp thông tin
các thành viên tham gia và lựa chọn dịch vụ đi kèm để khởiMô tả
tạo đơn hàng.
- Khách hàng đã đăng nhập thành công và đang xem chi
Tiền điều kiện tiết một chuyến đi cụ thể còn nhận khách.
- Đơn hàng được tạo ở trạng thái "Chờ thanh toán", quỹ
chỗ được tạm khóa và hồ sơ hành khách được liên kết hoặcHậu điều kiện
khởi tạo mới.
### 1. Khách hàng nhấn nút "Đặt ngay" tại trang thông tin chi
tiết của chuyến đi.
### 2. Hệ thống hiển thị màn hình chọn: [Cá nhân] hoặc [Theo
nhóm].
### 3. Trường hợp đi theo nhóm, khách hàng nhập tổng số lượng
người.
### 4. Hệ thống kiểm tra quỹ chỗ trống, nếu đáp ứng đủ sẽ thực
hiện lệnh "Tạm giữ chỗ" và kích hoạt đồng hồ đếm ngược
Luồng sự kiện
chính thời gian hoàn tất thủ tục.
### 5. Cung cấp thông tin hành khách:
- Thông tin của chính khách hàng (người đặt) được hệ thống
tự động lấy từ "Hộ chiếu số" của họ và điền sẵn vào biểu
mẫu.
- Nếu đặt cho nhiều người, khách hàng nhập thông tin cơ
bản của những người đó (cccd/hộ chiếu, sđt, email, giới tính,
ngày sinh, dị ứng, ghi chú y tế).


### 6. Khách hàng tùy chọn các dịch vụ thêm (nếu có) và hạng
phòng.
### 7. Khách hàng lựa chọn các cam kết bảo vệ môi trường
(hành động xanh) trong danh mục gợi ý để tích lũy điểm
thưởng sau chuyến đi.
### 8. Khách hàng có thể thực hiện áp dụng mã giảm giá (UC28
- Áp dụng voucher) để tối ưu chi phí.
### 9. Hệ thống tổng hợp chi tiết đơn hàng, bao gồm giá gốc,
phụ thu dịch vụ, mức giảm giá và hiển thị tổng số tiền cần
thanh toán cuối cùng.
### 10. Khách hàng xem xét lại toàn bộ thông tin, nếu chính xác
thì nhấn nút "Tiến hành thanh toán" để chuyển sang UC29 -
Thanh toán đơn hàng.
### 11. Hệ thống lưu trữ thông tin đơn hàng vào CSDL.
### 12. Kết thúc use case.
Luồng sự kiện Không có.
phụ
4a. Nếu số người đăng ký > số chỗ thực tế, hệ thống hiển
thị thông báo lỗi và gợi ý số chỗ tối đa còn lại và mời
khách chọn ngày khởi hành khác. Hệ thống quay lại bước 2
Luồng sự kiện để khách hàng điều chỉnh.
lỗi hoặc ngoại lệ
4b. Nếu khách hàng không hoàn tất đơn hàng trước thời
gian đếm ngược, hệ thống thông báo giao dịch hết hạn, tự
động hủy dữ liệu tạm và giải phóng quỹ chỗ.


Khách hàng thoát khỏi màn hình đặt tour. Use case kết
thúc.
Activity diagram:








Sequence diagram:





### 3.2.10.1. Áp dụng voucher
Bảng 3.30: Đặc tả Use - case Áp dụng voucher
Mục Nội dung
UC28Mã Use - case
Áp dụng VoucherTên Use - case
Khách hàngTác nhân
Khách hàng lựa chọn một mã giảm giá phù hợp từ ví để áp
dụng cho đơn hàng đang thực hiện nhằm giảm tổng số tiềnMô tả
phải thanh toán.
- Khách hàng đang ở bước xác nhận đơn hàng (UC27).
- Khách hàng có ít nhất một Voucher còn hạn và thỏa mãnTiền điều kiện
điều kiện đơn hàng.
- Tổng số tiền của đơn hàng được cập nhật lại sau khi trừ
giá trị voucher.
Hậu điều kiện
- Trạng thái Voucher được chuyển sang "Tạm giữ" gắn với
đơn hàng đó.
### 1. Tại bước tổng kết đơn hàng, khách hàng nhấn nút
"Chọn/Nhập mã giảm giá".
### 2. Hệ thống truy xuất và ưu tiên hiển thị danh sách các mã
Luồng sự kiện
phù hợp với giá trị đơn hàng và loại tour hiện tại.chính
### 3. Khách hàng chọn mã muốn sử dụng.
### 4. Hệ thống kiểm tra tính hợp lệ của mã theo thời gian thực.


### 5. Hệ thống "Tạm khóa" voucher này, tính toán lại số tiền
giảm trừ và cập nhật lại tổng số tiền cuối cùng.
### 6. Kết thúc use case.
Luồng sự kiện
Không có
phụ
4a. Nếu voucher không hợp lệ, hệ thống từ chối áp dụng mã
voucher này vào đơn hàng hiện tại và hiển thị thông báo. Khách
Luồng sự kiện hàng chọn voucher khác.
lỗi hoặc ngoại lệ
Khách hàng thoát khỏi màn hình áp dụng mã giảm giá. Use case
kết thúc.
Activity diagram:


Sequence diagram:





### 3.2.10.2. Thanh toán đơn hàng
Bảng 3.31: Đặc tả Use - case Thanh toán đơn hàng
Mục Nội dung
Mã Use - case UC29
Tên Use - case Thanh toán đơn hàng
Tác nhân Khách hàng, Cổng thanh toán điện tử
Khách hàng chuyển tiền thanh toán để xác nhận chính thức
Mô tả
đơn đặt tour.
- Khách hàng đã hoàn tất các bước đặt tour và đang xem
Tiền điều kiện trang tổng kết đơn hàng với trạng thái "Chờ thanh toán".
- Thời gian tạm giữ chỗ vẫn còn hiệu lực.
- Trạng thái đơn hàng được cập nhật thành "Đã xác nhận".
Hậu điều kiện - Vé điện tử được phát hành và gửi cho khách hàng.
- Số chỗ trống của chuyến đi được trừ chính thức.
### 1. Tại màn hình xác nhận đơn hàng, khách hàng lựa chọn
một trong các phương thức thanh toán khả dụng (Chuyển
khoản ngân hàng, thẻ nội địa/quốc tế hoặc ví điện tử).
### 2. Khách hàng nhấn xác nhận “Thanh toán”.
### 3. Hệ thống thiết lập kết nối an toàn với cổng thanh toán
Luồng sự kiện trung gian tương ứng.
chính
### 4. Hệ thống chuyển hướng khách hàng đến giao diện tương
ứng (hiển thị mã QR và thông tin thanh toán) kèm theo số
tiền cần thanh toán.
### 5. Khách hàng thực hiện thanh toán với cổng thanh toán
tương ứng.


### 6. Hệ thống nhận phản hồi giao dịch thành công từ cổng
thanh toán và cập nhật trạng thái đơn hàng sang "Đã xác
nhận".
### 7. Hệ thống ghi nhận đơn hàng vào cơ sở dữ liệu.
### 8. Hệ thống phát hành vé điện tử (dưới dạng mã QR) chứa
toàn bộ lịch trình và thông tin hành khách.
### 9. Hệ thống gửi thông báo xác nhận kèm vé điện tử đến
khách hàng qua ứng dụng và email của người đặt tour.
### 10. Kết thúc use case.
1a. Hệ thống hiển thị thông tin về số điểm thưởng xanh hiện có
Luồng sự kiện của khách hàng và tùy chọn quyết định sử dụng. Nếu khách
phụ hàng chọn sử dụng điểm xanh, hệ thống khấu trừ điểm và
hiển thị lại số tiền thanh toán cuối cùng đã được giảm.
5a. Nếu khách hàng thanh toán sau khi đơn hàng đã bị hủy,
hệ thống tự động ghi nhận giao dịch vào danh sách "Chờ
Luồng sự kiện hoàn tiền" và gửi thông báo hướng dẫn quy trình hoàn trả
lỗi hoặc ngoại lệ cho khách hàng.
Khách hàng thoát khỏi màn hình thanh toán hoặc xác nhận
đơn hàng. Use case kết thúc.
Activity diagram:





Sequence diagram:





## 3.2.11. Quy đổi voucher
Bảng 3.32: Đặc tả Use - case Quy đổi voucher
Mục Nội dung
UC30Mã Use - case
Quy đổi VoucherTên Use - case
Khách hàngTác nhân
Khách hàng quản lý danh sách các mã giảm giá hiện có và
thực hiện quy đổi điểm tích lũy từ hành động xanh để lấyMô tả
các ưu đãi mới.
- Khách hàng đã đăng nhập tài khoản thành công.Tiền điều kiện
- Voucher mới được thêm vào ví cá nhân và điểm thưởng
Hậu điều kiện được khấu trừ tương ứng.
### 1. Khách hàng nhấn chọn mục "Ví ưu đãi" trên thanh công
cụ cá nhân.
### 2. Hệ thống hiển thị giao diện Ví Voucher với hai phân mục
rõ rệt: "Voucher của tôi" (đã sở hữu) và "Kho ưu đãi" (để
Luồng sự kiện quy đổi).
chính
### 3. Khách hàng chuyển sang tab "Kho ưu đãi" để xem danh
sách các voucher có sẵn kèm theo số điểm xanh cần thiết.
### 4. Khách hàng nhấn chọn một Voucher cụ thể và nhấn nút
"Đổi điểm".


### 5. Hệ thống hiển thị cửa sổ xác nhận kèm thông tin: Tên ưu
đãi, số điểm bị trừ.
### 6. Khách hàng xác nhận đổi.
### 7. Hệ thống thực hiện truy vấn số dư điểm xanh trong Hộ
chiếu số của khách hàng.
### 8. Hệ thống thực hiện trừ điểm thưởng xanh tương ứng trong
CSDL.
### 9. Hệ thống cập nhật Voucher vừa đổi vào danh sách
"Voucher của tôi".
### 10. Hệ thống hiển thị thông báo thành công và cập nhật lại
số dư điểm xanh ngay trên giao diện.
### 11. Kết thúc use case.
7a. Nếu số dư điểm xanh thấp hơn số điểm yêu cầu của
Luồng sự kiện Voucher, hệ thống hiển thị thông báo lỗi và số điểm khách
phụ
hàng còn thiếu.
Khách hàng rời khỏi màn hình ví voucher. Use case kết
Luồng sự kiện
thúc. lỗi hoặc ngoại lệ
Activity diagram:





Sequence diagram:





## 3.2.12. Xem danh sách voucher
Bảng 3.33: Đặc tả Use - case Xem danh sách voucher
Mục Nội dung
UC31Mã Use - case
Xem danh sách voucherTên Use - case
Khách hàngTác nhân
Khách hàng xem danh sách các mã giảm giá hiện có trong
ví cá nhân, kiểm tra thời hạn và điều kiện sử dụng của từngMô tả
mã.
- Khách hàng đã đăng nhập tài khoản thành công và đang ở
Tiền điều kiện trang cá nhân hoặc ví ưu đãi.
- Hệ thống hiển thị đầy đủ thông tin các voucher khả dụng.Hậu điều kiện
### 1. Khách hàng chọn chức năng "Ví voucher" trên menu cá
nhân.
### 2. Hệ thống truy vấn danh sách voucher từ CSDL dựa trên
Luồng sự kiện mã định danh khách hàng.
chính
### 3. Khách hàng nhấn vào một voucher cụ thể để xem chi tiết
điều kiện áp dụng.
### 4. Kết thúc Use case.
2a. Nếu khách hàng chưa sở hữu bất kỳ mã giảm giá nào,
Luồng sự kiện hệ thống hiển thị thông báo kèm theo nút điều hướng để
phụ
gọi thực thi UC30 (Quy đổi Voucher)


Khách hàng thoát khỏi màn hình xem ví voucher. Use case
Luồng sự kiện
kết thúc. lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:


## 3.2.13. Hủy tour
Bảng 3.34: Đặc tả Use - case Hủy tour
Mục Nội dung
Mã Use - case UC32
Tên Use - case Hủy tour
Tác nhân Khách hàng
Cho phép khách hàng thực hiện yêu cầu hủy một chuyến đi
đã được xác nhận trước đó. Hệ thống sẽ tự động tính toán
Mô tả
số tiền được hoàn lại dựa trên thời điểm hủy và chính sách
hủy tour của công ty.
- Khách hàng có ít nhất một đơn hàng đã được xác nhận và
Tiền điều kiện
chưa đến ngày khởi hành.
- Đơn hàng được chuyển sang trạng thái "Đã hủy".
- Các chỗ đã đặt được trả lại vào quỹ chung.
Hậu điều kiện
- Một yêu cầu hoàn tiền được tự động khởi tạo và gửi đến
bộ phận kế toán.
### 1. Khách hàng truy cập vào mục "Chuyến đi của tôi" trên hệ
thống.
### 2. Hệ thống hiển thị danh sách các chuyến đi đã đặt (bao
gồm các chuyến sắp khởi hành và đã hoàn thành).
### 3. Khách hàng chọn một chuyến đi sắp khởi hành và nhấn
chọn chức năng "Hủy tour".
Luồng sự kiện
chính 4. Hệ thống kiểm tra điều kiện hủy.
### 5. Hệ thống tính toán mức phí phạt hủy dựa trên quy định
về thời gian (tính từ thời điểm hiện tại đến ngày khởi hành).
### 6. Hệ thống hiển thị bảng xác nhận hủy tour, bao gồm: chi
tiết mức phí phạt và số tiền thực tế sẽ được hoàn lại cho
khách hàng.


### 7. Khách hàng xem xét và nhấn nút "Xác nhận hủy tour".
### 8. Hệ thống cập nhật trạng thái đơn đặt tour thành "Đã hủy"
trong cơ sở dữ liệu.
### 9. Hệ thống ngay lập tức thu hồi mã vé (QR Code), trả lại
số chỗ trống vào quỹ chung của chuyến đi.
### 10. Hệ thống gửi thông báo xác nhận hủy tour thành công
qua ứng dụng và email của khách hàng.
### 11. Hệ thống tự động gọi thực thi UC33 - Hoàn tiền.
### 12. Kết thúc use case.
Luồng sự kiện 4a. Nếu thời gian khởi hành còn dưới 2 ngày, hệ thống thông
phụ báo lỗi không thể hủy tour.
Luồng sự kiện Khách hàng thoát khỏi màn hình hủy tour. Use case kết
lỗi hoặc ngoại lệ thúc.
Activity diagram:


Sequence diagram:





## 3.2.14. Hoàn tiền
Bảng 3.35: Đặc tả Use - case Hoàn tiền
Mục Nội dung
UC33Mã Use - case
Hoàn tiềnTên Use - case
Khách hàngTác nhân
Hệ thống thực hiện quy trình hoàn trả tiền cho khách hàng
trong các trường hợp hủy tour hợp lệ hoặc lỗi thanh toánMô tả
quá hạn.
- Đơn hàng đã được khách hàng xác nhận hủy thành công
Tiền điều kiện hoặc phát sinh giao dịch thanh toán trễ.
- Tiền được hoàn trả về tài khoản nguồn của khách hàng và
Hậu điều kiện trạng thái đơn hàng cập nhật thành "Đã hoàn tiền".
### 1. Hệ thống tự động khởi tạo yêu cầu hoàn tiền ngay khi
lệnh hủy tour được xác nhận hoặc phát sinh giao dịch trễ.
### 2. Hệ thống truy xuất thông tin giao dịch gốc: mã đơn hàng,
số tiền, phương thức thanh toán, mã giao dịch.
Luồng sự kiện 3. Hệ thống tính toán số tiền thực hoàn dựa trên các quy tắc
chính
phạt hủy tour (nếu có).
### 4. Tạo bản ghi yêu cầu hoàn tiền với trạng thái "Chờ kế toán
duyệt" và hiển thị trong danh sách công việc của kế toán.
### 5. Hệ thống hiển thị trạng thái đơn: "Đang xử lý hoàn tiền".


### 6. Chuyển sang UC50 – Xử lý hoàn tiền.
### 7. Hệ thống cập nhật trạng thái đơn hàng và gửi thông báo
cho khách hàng.
### 8. Kết thúc use case.
5a. Nếu khách hàng chủ động hủy yêu cầu hoàn tiền đang
Luồng sự kiện 'Chờ duyệt', hệ thống sẽ cập nhật trạng thái yêu cầu đó thành
phụ
'Đã hủy' và kết thúc use case.
Khách hàng thoát khỏi giao diện hoàn tiền. Use case kết
Luồng sự kiện
thúc. lỗi hoặc ngoại lệ
Activity diagram:





Sequence diagram:
