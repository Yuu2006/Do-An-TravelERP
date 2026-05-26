# Phân hệ Quản lý Vận hành Mobile

**Phạm vi:** UC40-UC44
---

## 3.2.20. Xem lịch trình và thông tin đoàn
Bảng 3.42: Đặc tả Use - case Xem lịch trình và thông tin đoàn
Mục Nội dung
Mã Use - case UC40
Tên Use - case Xem lịch trình và thông tin đoàn
Tác nhân HDV
Cho phép HDV xem chi tiết lịch trình của tour được phân
Mô tả công và danh sách khách hàng trong đoàn kèm các thông tin
cần thiết để chuẩn bị và vận hành tour.
– HDV đã đăng nhập vào hệ thống.
Tiền điều kiện – HDV đã được phân công cho ít nhất một tour (có lệnh điều
động).
– Thông tin lịch trình và danh sách đoàn được hiển thị thành
Hậu điều kiện công trên thiết bị.
– Không có thay đổi dữ liệu trong CSDL.
### 1. Hệ thống hiển thị màn hình chính với danh sách các
tour được phân công.
### 2. HDV chọn một tour từ danh sách.
### 3. Hệ thống hiển thị màn hình chi tiết tour với các thông
tin tổng quan: Tên tour, mã tour, Ngày bắt đầu, ngày kết
thúc, Điểm đến chính, phương tiện di chuyển, Các lưu ý
Luồng sự kiện đặc biệt (nếu có).
chính
### 4. Màn hình được chia thành các tab chức năng:
- Tab "Lịch trình": Hiển thị lịch trình theo từng ngày.
- Tab "Danh sách đoàn": Hiển thị danh sách khách
hàng trong tour.
### 5. HDV chọn tab "Lịch trình".


### 6. Hệ thống hiển thị các ngày của tour và các hoạt động
trong ngày đó: Thời gian bắt đầu, kết thúc, Địa điểm, Mô
tả hoạt động, Thực đơn (nếu có), Ghi chú đặc biệt.
### 7. HDV chọn tab "Danh sách đoàn".
### 8. Hệ thống hiển thị danh sách khách hàng dưới dạng thẻ
(card) hoặc bảng, mỗi khách hàng hiển thị: Họ tên và các
cảnh báo nếu có lưu ý đặc biệt.
### 9. HDV nhấn vào một khách hàng để xem chi tiết.
### 10. Hệ thống hiển thị pop-up hoặc màn hình chi tiết với
các thông tin: Họ tên, năm sinh, Số điện thoại, Lưu ý y tế
và dị ứng, Yêu cầu đặc biệt khác.
### 11. Kết thúc use case.
Luồng sự kiện
Không có.
phụ
Luồng sự kiện
Không có.
lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:


## 3.2.21. Điểm danh khách hàng
Bảng 3.43: Đặc tả Use - case Điểm danh khách hàng
Mục Nội dung
Mã Use - case UC41
Tên Use - case Điểm danh khách hàng
Tác nhân HDV
Cho phép HDV xác nhận sự có mặt của khách hàng tại điểm
Mô tả hẹn để quản lý số lượng đoàn, nắm bắt các lưu ý cá nhân hóa
từ Hộ chiếu số và ghi nhận thời gian thực tế.
- HDV đã đăng nhập vào ứng dụng di động và được phân
công cho chuyến đi này.
- Chuyến đi đang ở trạng thái "Sắp khởi hành" hoặc "Đang
Tiền điều kiện
diễn ra".
- Danh sách khách hàng của chuyến đi đã được đồng bộ và
hiển thị trên giao diện web.
- Trạng thái của khách hàng trong chuyến đi được cập nhật
thành "Đã điểm danh" kèm thời gian và địa điểm thực hiện
Hậu điều kiện điểm danh.
- Các lưu ý đặc biệt được hiển thị và ghi nhận trong phiên
làm việc của HDV.
### 1. HDV truy cập trang web, đăng nhập và chọn chuyến đi
cần điểm danh từ danh sách "Tour của tôi".
### 2. Hệ thống hiển thị trang chi tiết chuyến đi, gồm thông tin
tour và danh sách khách hàng.
### 3. HDV nhấn nút "Bắt đầu điểm danh".
Luồng sự kiện
chính 4. Hệ thống hiển thị form nhập:
- Thời gian điểm danh (mặc định là thời gian hiện tại, có thể
sửa).
- Địa điểm điểm danh (ô nhập văn bản, có thể gợi ý địa điểm
của tour).


- HDV nhập/chọn và nhấn "Xác nhận".
### 5. Hệ thống hiển thị danh sách khách thàng dạng bảng, mỗi
dòng có checkbox.
### 7. HDV thực hiện thao tác điểm danh:
- HDV xem danh sách, có thể dùng ô tìm kiếm để lọc nhanh
theo tên.
- HDV tích chọn vào những khách đã có mặt. Có thể nhấn
nút "Chọn tất cả" để chọn toàn bộ.
- Sau khi chọn xong, HDV nhấn nút "Xác nhận điểm danh"
để ghi nhận những khách được chọn.
### 8. HDV có thể chuyển đổi qua lại giữa hai cách điểm danh
bất kỳ lúc nào để kết hợp cả hai phương thức.
### 9. Khi đã điểm danh xong (hoặc muốn tạm dừng), HDV
nhấn nút "Kết thúc điểm danh".
### 10. Hệ thống hiển thị hộp thoại tổng kết: "Đã điểm danh:
X/Y khách. Còn Z khách chưa điểm danh." và hỏi xác nhận
kết thúc.
### 11. HDV xác nhận kết thúc điểm danh, hệ thống kiểm tra
trong danh sách khách hàng vừa điểm danh.
- Nếu có lưu ý đặc biệt: Hệ thống tự động hiển thị một pop-
up lưu ý.
### 12. Kết thúc use case.
9a. Đến giờ khởi hành, nếu còn khách chưa điểm danh,
Luồng sự kiện
phụ HDV có thể đánh dấu họ là "Vắng mặt" bằng cách chọn
khách và nhấn nút "Đánh dấu vắng mặt".


- Camera không thể đọc được mã QR do ảnh mờ, mã bị
Luồng sự kiện
hỏng, hoặc ánh sáng kém. HDV có thể chọn "Thử lại"
lỗi hoặc ngoại lệ
để quét lại hoặc chuyển sang "Điểm danh thủ công"
Activity diagram:
Sequence diagram:


## 3.2.22. Xác nhận hành động xanh
Bảng 3.44: Đặc tả Use - case Xác nhận hành động xanh
Mục Nội dung
Mã Use - case UC42
Tên Use - case Xác nhận hành động xanh
Tác nhân HDV


Cho phép HDV xác minh và ghi nhận các hành động bảo vệ
môi trường mà du khách thực hiện trong suốt hành trình. Hệ
Mô tả
thống tự động cộng điểm thưởng xanh vào Hộ chiếu số của
khách.
- HDV đã đăng nhập vào hẹ thống và được phân công cho
chuyến đi này.
Tiền điều kiện
- Chuyến đi đang ở trạng thái "Đang diễn ra".
- Khách hàng đã được điểm danh trong chuyến đi này.
- Điểm thưởng xanh được cộng vào tài khoản của khách
Hậu điều kiện
hàng.
### 1. HDV chọn chuyến đi đang diễn ra từ danh sách "Tour của
tôi".
### 2. Tại màn hình chi tiết chuyến đi, HDV vào tab “Hành động
xanh”
### 3. Hệ thống hiển thị giao diện gồm: Danh sách khách đã
điểm danh, Danh mục hành động xanh phổ biến được đề
xuất.
### 4. HDV chọn khách hàng thực hiện hành động bằng cách
tìm và chọn tên khách từ danh sách đoàn.
### 5. Sau khi chọn khách, hệ thống hiển thị danh mục đầy đủ
các hành động xanh được thiết lập cho loại hình tour này.Luồng sự kiện
chính
### 6. HDV chọn một hoặc nhiều hành động mà khách đã thực
hiện.
### 7. Đối với các hành động yêu cầu minh chứng hình ảnh: Hệ
thống yêu cầu HDV chụp ít nhất một ảnh thực tế tại hiện
trường.
### 8. HDV nhấn nút "Gửi xác nhận" để hoàn tất.
### 9. Hệ thống thực hiện:
- Truy xuất số điểm tương ứng của hành động.
- Cộng điểm vào Hộ chiếu số của khách hàng.


### 10. Hệ thống gửi thông báo đến khách hàng và hiển thị thông
báo xác nhận thành công trên màn hình HDV.
### 11. HDV có thể tiếp tục chọn khách hàng khác để xác nhận
thêm, hoặc nhấn nút "Quay lại" để trở về màn hình chi tiết
chuyến đi.
4a. Trong trường hợp nhiều khách hàng cùng thực hiện một
Luồng sự kiện hành động xanh tập thể, HDV có thể chọn chế độ "Xác nhận
phụ
hàng loạt".
Luồng sự kiện Không có
lỗi hoặc ngoại lệ
Activity diagram:
Sequence diagram:


## 3.2.23. Báo cáo sự cố
Bảng 3.45: Đặc tả Use - case Báo cáo sự cố
Mục Nội dung
Mã Use - case UC43
Tên Use - case Báo cáo sự cố
Tác nhân HDV
Khi có sự cố, HDV ưu tiên gọi hotline để nhận hỗ trợ tức
Mô tả
thời. Sau khi tour kết thúc (hoặc khi tình hình đã ổn định),


HDV thực hiện điền form báo cáo trên hệ thống để lưu trữ
nhật ký, đối soát chi phí và phục vụ hậu kiểm.
- HDV đã được phân công cho chuyến đi này.
Tiền điều kiện
- Chuyến đi đang ở trạng thái "Đã kết thúc", "Đang diễn ra".
- Bản ghi sự cố được lưu vĩnh viễn, các bộ phận liên quan
Hậu điều kiện
nhận được thông báo để xử lý hậu kỳ.
### 1. HDV chọn mục "Thêm báo cáo sự cố".
### 2. HDV đánh giá mức độ (Thấp/Cao) nhập mô tả chi tiết:
diễn biến, cách đã xử lý tại hiện trường, và kết quả.
### 3. HDV đính kèm bằng chứng (ảnh/video) đã chụp/quay
tại thời điểm xảy ra sự cố.
### 4. HDV nhấn nút "Hoàn tất báo cáo".
Luồng sự kiện
chính 5. Hệ thống thực hiện:
- Lưu bản ghi vào nhật ký tour.
- Nếu mức độ "Cao": Gửi thông báo cảnh báo
đến Quản lý để kiểm tra lại quy trình xử lý tại hiện
trường.
### 6. Kết thúc Use Case.
4a. Nếu HDV chọn loại sự cố "Y tế/Sức khỏe khách hàng"
hoặc bất kỳ loại sự cố nào liên quan đến một cá nhân cụ thể.
Luồng sự kiện
phụ Hệ thống tự động trích xuất các thông tin y tế quan trọng của
khách đó và đính kèm vào báo cáo.
- Nếu dữ liệu không hợp lệ, hệ thống sẽ thông báo lỗi
Luồng sự kiện tương ứng và yêu cầu HDV bổ sung.
lỗi hoặc ngoại lệ


Activity diagram:
Sequence diagram:


## 3.2.24. Cập nhật chi phí thực tế
Bảng 3.46: Đặc tả Use - case Cập nhật chi phí thực tế
Mục Nội dung
Mã Use - case UC44
Tên Use - case Cập nhật chi phí thực tế
Tác nhân HDV
Cho phép HDV cập nhật các khoản chi tiêu phát sinh thực
Mô tả tế trong quá trình vận hành tour (chi phí sự cố, phát sinh
khác...) kèm theo hình ảnh hóa đơn/chứng từ.
- HDV đã đăng nhập vào ứng dụng di động và được phân
Tiền điều kiện
công cho chuyến đi này.


- Chuyến đi đang ở trạng thái "Đang diễn ra" hoặc vừa mới
"Kết thúc"- trong vòng 24 giờ.
- Một bản ghi chi phí thực tế mới được tạo trong hệ thống.
Hậu điều kiện - Hệ thống gửi thông báo đến dashboard của bộ phận Kế
toán.
### 1. HDV chọn chuyến đi đang diễn ra và truy cập tính năng
"Quản lý chi phí" từ menu chính.
### 2. Hệ thống hiển thị màn hình tổng hợp các khoản chi đã
nhập (nếu có) cho chuyến đi này, kèm tổng số tiền tạm
tính. Trên màn hình có nút "Thêm chi phí mới".
### 3. HDV nhấn nút "Thêm chi phí mới".
### 4. Hệ thống hiển thị form "Nhập chi phí thực tế" gồm:
Hạng mục chi, Số tiền, Ghi chú, Ảnh hóa đơn.
### 5. HDV chụp ảnh hóa đơn, biên lai hoặc chứng từ thanh
toán.
Luồng sự kiện
chính 6. HDV điền đầy đủ thông tin và kiểm tra lại ảnh hóa đơn
đã đính kèm.
### 7. HDV nhấn nút "Lưu chi phí".
### 8. Hệ thống kiểm tra dữ liệu nhập vào.
### 9. Hệ thống tạo bản ghi mới với các thông tin đã nhập,
kèm theo: Mã HDV, Mã tour, Thời gian hiện tại, Địa điểm
và các ảnh đã chụp.
### 10. Hệ thống hiển thị thông báo thành công và cập nhật
danh sách.


Luồng sự kiện Không có
phụ
- Nếu dữ liệu không hợp lệ, hệ thống sẽ thông báo lỗi tương Luồng sự kiện
ứng và yêu cầu bổ sung.
lỗi hoặc ngoại lệ -
Activity diagram:
Sequence diagram:


