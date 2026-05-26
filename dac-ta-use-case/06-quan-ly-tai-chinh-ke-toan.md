# Phân hệ Quản lý Tài chính - Kế toán

**Phạm vi:** UC45-UC50

---

## 3.2.25. Tính lợi nhuận gộp
Bảng 3.47: Đặc tả Use - case Tính lợi nhuận gộp
Mục Nội dung
Mã Use - case UC45
Tên Use - case Tính lợi nhuận gộp
Tác nhân Nhân viên Kế toán
Cho phép nhân viên kế toán xem bảng tổng hợp doanh thu
và chi phí thực tế của một tour đã kết thúc, đồng thời tự nhập
Mô tả phần chi phí cam kết. Từ đó hệ thống sẽ tính toán ra lợi
nhuận gộp. Kết quả hiển thị kèm các cảnh báo về chi phí bất
thường.


– Nhân viên Kế toán đã đăng nhập vào hệ thống ERP và có
quyền truy cập phân hệ Tài chính – Kế toán.
Tiền điều kiện
– Tour đã kết thúc và có đầy đủ dữ liệu doanh thu, chi phí
liên quan.
-– Bảng tổng hợp tài chính của tour được hiển thị.
– Lợi nhuận gộp được tính toán và hiển thị.
Hậu điều kiện
– Các cảnh báo về chi phí được làm nổi bật.
– Không có thay đổi dữ liệu trong CSDL.
### 1. Nhân viên Kế toán truy cập phân hệ "Tài chính – Kế toán",
chọn mục "Quyết toán tour".
### 2. Hệ thống hiển thị danh sách các tour đã kết thúc và chưa
quyết toán.
### 3. Kế toán chọn một tour cụ thể từ danh sách.
### 4. Hệ thống hiển thị màn hình "Tổng hợp tài chính" của tour,
bao gồm các khối thông tin:
– Thông tin chung tour: Mã tour, tên tour, ngày khởi hành,
ngày kết thúc.
– Tổng doanh thu: Tổng số tiền từ các đơn hàng đã xác nhận
của tour.Luồng sự kiện
chính
– Tổng chi phí thực tế: Tổng các khoản chi do HDV nhập
(đã được phê duyệt hoặc chờ duyệt).
– Tổng chi phí cam kết: Ô trống để kế toán tự nhập số tiền
chi phí cố định theo hợp đồng (khách sạn, nhà hàng...)
– Tổng chi phí cam kết: Ô trống
– Lợi nhuận gộp: Được tính theo công thức.
### 5. Kế toán nhập số tiền vào ô "Tổng chi phí cam kết".
### 6. Kế toán nhấn nút "Tính toán".
### 7. Hệ thống thực hiện tính toán và hiển thị kết quả lợi nhuận
gộp, làm nổi bật. Kèm danh sách đã đánh dấu các khoản chi


phí vi phạm quy tắc. (chi phí vượt quá định mức /có dấu hiệu
bất thường khác).
### 8. Bên dưới bảng tổng hợp, hệ thống hiển thị danh sách chi
tiết các khoản chi phí thực tế (đã phê duyệt và chưa phê
duyệt), kèm theo các cột:
– Hạng mục chi, số tiền, HDV nhập, thời gian nhập, trạng
thái (Đã duyệt/Chờ duyệt) và các cột cảnh báo.
### 10. Kết thúc use case (kế toán có thể chọn tour khác hoặc
quay lại danh sách).
Luồng sự kiện 9a. Kế toán có thể nhấn vào từng khoản chi để xem chi tiết,
phụ bao gồm cả ảnh hóa đơn và ghi chú của HDV.
4a. Tour chưa đủ dữ liệu (chưa có doanh thu hoặc chi phí thực
tế) để tính lợi nhuận. Hệ thống cảnh báo không thể tính toán. Luồng sự kiện
6a. Kế toán bỏ trống ô "Tổng chi phí cam kết" hoặc nhập sai định
lỗi hoặc ngoại lệ dạng ở bước 5. Khi nhấn "Tính toán", hệ thống sẽ báo lỗi và chặn
việc tính toán.
Activity diagram:


Sequence diagram:


### 3.2.25.1. Xem cảnh báo chi phí
Bảng 3.48: Đặc tả Use - case Xem báo cáo chi phí
Mục Nội dung
Mã Use - case UC46
Tên Use - case Xem cảnh báo chi phí
Tác nhân Nhân viên Kế toán


Cho phép nhân viên kế toán xem danh sách các cảnh báo
liên quan đến chi phí thực tế của các tour. Các cảnh báo bao
gồm: chi phí vượt định mức, thiếu chứng từ hóa đơn, chi phí
Mô tả
bất thường so với giá thị trường. Từ danh sách này, kế toán
có thể điều hướng đến chi tiết để xử lý (phê duyệt, từ chối,
yêu cầu bổ sung).
– Nhân viên Kế toán đã đăng nhập vào hệ thống ERP và có
quyền truy cập phân hệ Tài chính – Kế toán.
Tiền điều kiện
– Có ít nhất một khoản chi phí thực tế vi phạm một trong các
ngưỡng cảnh báo do hệ thống cấu hình.
– Danh sách các cảnh báo được hiển thị trên màn hình.
Hậu điều kiện
– Không có thay đổi dữ liệu trong CSDL.
### 1. Nhân viên Kế toán truy cập phân hệ "Tài chính – Kế toán",
chọn mục "Quản lý chi phí" từ menu hoặc dashboard.
### 2. Hệ thống hiển thị màn hình tổng quan các cảnh báo.
### 3. Mỗi cảnh báo hiển thị các thông tin: Mã tour, tên tour,
hạng mục chi, số tiền, mức độ cảnh báo, thời gian nhập,
HDV nhập, lý do cảnh báo.
### 4. Kế toán có thể sử dụng bộ lọc (theo mức độ, theo tour,
theo khoảng thời gian) để thu hẹp danh sách.
### 5. Kế toán nhấn vào một cảnh báo bất kỳ để xem chi tiết.
Luồng sự kiện
chính 6. Hệ thống hiển thị màn hình chi tiết khoản chi kèm ảnh hóa
đơn, ghi chú và các thông tin liên quan.
### 7. Từ màn hình chi tiết, kế toán có thể thực hiện các thao tác
xử lý:
- "Phê duyệt" (chuyển sang UC – Phê duyệt chi phí thực tế).
- "Từ chối" (kèm nhập lý do).
- "Yêu cầu bổ sung" (gửi thông báo đến HDV).
### 8. Sau khi xử lý xong, hệ thống cập nhật trạng thái và quay
lại danh sách cảnh báo.


7a. Kế toán có thể chọn một hoặc nhiều cảnh cáo đánh dấu
Luồng sự kiện
là “Đã xem” nhưng vẫn giữ nguyên cảnh cáo cho đến khi
phụ
được xử lý.
Luồng sự kiện
Không có.
lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:








## 3.2.26. Phê duyệt chi phí thực tế
Bảng 3.49: Đặc tả Use - case Phê duyệt chi phí thực tế
Mục Nội dung
Mã Use - case UC47
Tên Use - case Phê duyệt chi phí thực tế
Tác nhân Nhân viên Kế toán
Cho phép nhân viên kế toán xem xét từng khoản chi phí thực
Mô tả tế do HDV nhập, đối chiếu với ảnh hóa đơn và các chứng từ
liên quan, sau đó phê duyệt hoặc từ chối khoản chi đó.


– Nhân viên Kế toán đã đăng nhập vào hệ thống và có quyền
truy cập phân hệ Tài chính - Kế toán.
Tiền điều kiện
– Có ít nhất một khoản chi phí thực tế đang ở trạng thái "Chờ
duyệt".
– Trạng thái của khoản chi được cập nhật thành "Đã duyệt"
hoặc "Từ chối".
Hậu điều kiện
– Nếu bị từ chối, HDV nhận được thông báo kèm lý do.
– Tổng chi phí tạm tính của tour được cập nhật tự động.
### 1. Nhân viên Kế toán truy cập phân hệ "Tài chính – Kế toán",
chọn mục "Quản lý chi phí" hoặc "Phê duyệt chi phí".
### 2. Hệ thống hiển thị danh sách các khoản chi phí đang ở
trạng thái "Chờ duyệt", có thể lọc theo: Mã tour, HDV nhập,
Thời gian nhập, Hạng mục chi phí.
### 3. Danh sách hiển thị các thông tin tóm tắt cho mỗi khoản
chi: Mã tour, HDV nhập, Hạng mục chi, Số tiền, Thời gian
nhập.
### 4. Kế toán chọn một khoản chi từ danh sách để xem chi tiết.
### 5. Hệ thống hiển thị màn hình chi tiết khoản chi, bao gồm:
Luồng sự kiện - Tất cả thông tin từ form nhập (hạng mục, số tiền, ghi chú).
chính
- Ảnh hóa đơn được hiển thị.
- Thông tin bổ sung: thời gian nhập, địa điểm lúc chụp ảnh
(nếu có).
### 6. Kế toán xem xét, đối chiếu số tiền trên hóa đơn với số tiền
đã nhập, tính hợp lệ của hóa đơn (ngày tháng, nội dung).
### 7. Kế toán đưa ra quyết định:
- Phê duyệt: Nếu thông tin hợp lệ, nhấn nút "Phê duyệt".
- Từ chối: Nếu có sai sót (sai số tiền, thiếu ảnh, ảnh không
rõ, không hợp lệ), nhấn nút "Từ chối".


### 8. Nếu chọn "Từ chối", hệ thống hiển thị form nhập lý do từ
chối (bắt buộc).
### 9. Kế toán nhập lý do và nhấn "Xác nhận".
### 10. Hệ thống cập nhật trạng thái khoản chi, ghi lại lịch sử
phê duyệt (người duyệt, thời gian, quyết định, lý do từ chối
nếu có).
### 11. Nếu khoản chi được phê duyệt, tổng chi phí tạm tính của
tour được cập nhật tự động.
### 12. Nếu khoản chi bị từ chối, hệ thống gửi thông báo đến
ứng dụng của HDV kèm lý do để HDV biết và có thể điều
chỉnh.
### 13. Hệ thống hiển thị thông báo thành công và quay lại danh
sách các khoản chi chờ duyệt.
Luồng sự kiện 7a. Yêu cầu HDV bổ sung thông tin, gửi thông báo đến HDV
phụ liên quan. Kết thúc Use Case.
Luồng sự kiện
Không có.
lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:


## 3.2.27. Quyết toán tour
Bảng 3.50: Đặc tả Use - case Quyết toán tour
Mục Nội dung
Mã Use - case UC48


Tên Use - case Quyết toán tour
Tác nhân Nhân viên Kế toán
Cho phép nhân viên kế toán thực hiện tổng hợp và đối soát toàn
bộ doanh thu, chi phí của một chuyến đi thực tế đã kết thúc, từ
Mô tả
đó tính toán lợi nhuận gộp, xử lý các khoản chi bất thường và
chính thức đóng hồ sơ tài chính của tour.
- Nhân viên Kế toán đã đăng nhập vào hệ thống ERP và có
quyền truy cập vào phân hệ Tài chính – Kế toán.
- Chuyến đi đã ở trạng thái "Kết thúc".
Tiền điều kiện - HDV đã hoàn tất việc nhập tất cả chi phí thực tế (hoặc đã hết
thời hạn cho phép nhập – thường là 24h sau khi tour kết thúc).
- Tất cả các đơn hàng liên quan đến tour đều đã có trạng thái
thanh toán cuối cùng và không còn giao dịch nào đang treo.
- Một bản ghi quyết toán mới được tạo, ghi nhận tổng doanh
thu, tổng chi phí và lợi nhuận gộp của tour.
Hậu điều kiện - Trạng thái của chuyến đi được chuyển thành "Đã quyết toán".
- Toàn bộ dữ liệu tài chính liên quan đến tour bị khóa, không
cho phép chỉnh sửa thêm.
### 1. Nhân viên Kế toán truy cập phân hệ "Tài chính – Kế toán",
chọn "Quyết toán tour" và xem danh sách các tour cần quyết
toán.
### 2. Kế toán chọn một tour cụ thể từ danh sách.
### 3. Hệ thống hiển thị màn hình chi tiết quyết toán của tour, gồm:
Thông tin chung, Tổng doanh thu, Tổng chi phí cam kết, Tổng
chi phí thực tế, Trạng thái đối soát chi phí.
Luồng sự kiện
### 4. Kế toán xem xét các thông tin. Nếu phát hiện bất thường , kế
chính
toán có thể ghi chú và yêu cầu HDV bổ sung (chuyển sang
luồng phụ A1).
### 5. Khi kế toán nhấn nút "Tính lợi nhuận", hệ thống chuyển
hướng sang use case Tính lợi nhuận gộp để thực hiện tính toán.
6.Sau khi tính toán, hệ thống tự động kiểm tra nếu chi phí thực
tế vượt ngưỡng cho phép, hiển thị cảnh báo và yêu cầu một
bước phê duyệt bổ sung (chuyển sang luồng phụ A2).


### 7. Nếu mọi dữ liệu đã chính xác, kế toán nhấn nút "Hoàn tất
quyết toán".
### 8. Hệ thống hiển thị hộp thoại xác nhận khóa dữ liệu.
### 9. Hệ thống tạo bản ghi quyết toán, cập nhật trạng thái tour
thành "Đã quyết toán", khóa các bản ghi liên quan.
### 10. Hệ thống hiển thị thông báo thành công kèm mã quyết toán
và lợi nhuận.
11.Kết thúc use case.
4a. Nếu tại kế toán phát hiện khoản chi phí không có hóa đơn,
ảnh mờ hoặc nghi ngờ không hợp lệ, kế toán chọn “Yêu cầu
giải trình” và nhập lý do. Hệ thống gửi thông báo cho HDV phụ
trách tour để yêu cầu bổ sung chứng từ, đồng thời tạm dừng
quy trình quyết toán và chuyển tour sang trạng thái “Chờ bổ
sung”.
6a. Nếu hệ thống phát hiện tổng chi phí thực tế vượt quá
Luồng sự kiện ngưỡng cho phép, hệ thống sẽ hiển thị cảnh báo đỏ.
phụ - Kế toán gửi yêu cầu phê duyệt kèm lý do giải trình lên cấp
quản lý. Hệ thống chuyển yêu cầu và thông báo đến người
quản lý được cấu hình để xem xét chi tiết các khoản chi.
- Nếu quản lý phê duyệt, hệ thống cho phép kế toán tiếp tục
quy trình quyết toán. Nếu quản lý từ chối, hệ thống cập nhật
trạng thái yêu cầu là “Yêu cầu bị từ chối”, tour vẫn ở trạng
thái chờ và kế toán cần phối hợp điều chỉnh lại chi phí.
Luồng sự kiện
Không có.
lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:


### 3.2.27.1. Tra cứu tour cần quyết toán
Bảng 3.51: Đặc tả Use - case Tra cứu tour cần quyết toán
Mục Nội dung
Mã Use - case UC49
Tên Use - case Tra cứu tour cần quyết toán
Tác nhân Nhân viên Kế toán
Cho phép nhân viên kế toán xem danh sách các chuyến đi
Mô tả thực tế đã kết thúc và đủ điều kiện để thực hiện quyết toán
tài chính. Danh sách hiển thị các thông tin tổng quan về


doanh thu, chi phí và trạng thái, giúp kế toán dễ dàng theo
dõi và lựa chọn tour để thực hiện quyết toán.
- Nhân viên Kế toán đã đăng nhập vào hệ thống ERP và có
Tiền điều kiện
quyền truy cập vào phân hệ Tài chính - Kế toán.
- Danh sách các tour đáp ứng điều kiện "cần quyết toán"
Hậu điều kiện
được hiển thị trên màn hình (nếu có).
### 1. Nhân viên Kế toán truy cập phân hệ "Tài chính - Kế toán"
và chọn "Quyết toán tour".
### 2. Hệ thống tự động hiển thị danh sách các tour cần quyết
toán với bộ lọc mặc định:
- Trạng thái tour: "Đã kết thúc”
- Trạng thái quyết toán: "Chưa quyết toán"
### 3. Danh sách tour hiển thị dưới dạng bảng kèm cột thao tác:
Luồng sự kiện "Xem chi tiết", "Quyết toán" (chuyển sang quyết toán)
chính
### 4. Nhân viên Kế toán xem xét danh sách các tour cần quyết
toán. Các tour được sắp xếp theo thứ tự ưu tiên mặc định.
### 5. Nhân viên có thể sử dụng các bộ lọc và ô tìm kiếm để thu
hẹp danh sách.
### 6. Nhân viên có thể di chuột vào các tour để xem nhanh
thông tin tóm tắt như: tổng số khoản chi phí đã nhập, tổng
số tiền chi phí, cảnh báo nếu có chi phí vượt định mức.7.
### 8. Kết thúc use case (không có thay đổi dữ liệu).
Luồng sự kiện
Không có.
phụ
Luồng sự kiện
Không có.
lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:


## 3.2.28. Xử lý hoàn tiền
Bảng 3.52: Đặc tả Use - case Xử lý hoàn tiền
Mục Nội dung
Mã Use - case UC50
Tên Use - case Xử lý hoàn tiền
Tác nhân Nhân viên Kế toán
Cho phép nhân viên kế toán thực hiện hoàn tiền cho khách
hàng khi có yêu cầu hủy tour hợp lệ đã được phê duyệt. Quy
Mô tả trình bao gồm xác minh thông tin, lựa chọn phương thức
hoàn tiền (qua cổng thanh toán hoặc thủ công), thực hiện
giao dịch và cập nhật trạng thái đơn hàng.


– Nhân viên Kế toán đã đăng nhập và có quyền truy cập phân
hệ Tài chính – Kế toán.
– Đã có yêu cầu hủy tour từ khách hàng được bộ phận Kinh
Tiền điều kiện
doanh phê duyệt và chuyển sang trạng thái "Chờ hoàn tiền".
– Đơn hàng liên quan đã được xác định số tiền hoàn lại sau
khi trừ phí hủy (nếu có).
– Giao dịch hoàn tiền được thực hiện thành công (hoặc ghi
nhận yêu cầu hoàn thủ công).
Hậu điều kiện – Trạng thái đơn hàng được cập nhật thành "Đã hoàn tiền".
– Lịch sử giao dịch hoàn tiền được lưu lại.
– Khách hàng nhận được thông báo xác nhận đã hoàn tiền.
### 1. Nhân viên Kế toán truy cập phân hệ "Tài chính – Kế toán",
chọn mục "Quản lý hoàn tiền" hoặc "Danh sách chờ hoàn
tiền".
### 2. Hệ thống hiển thị danh sách các yêu cầu hoàn tiền đang ở
trạng thái "Chờ xử lý", bao gồm: Mã yêu cầu, Mã đơn hàng,
Tên khách hàng, Số tiền hoàn, Phương thức thanh toán gốc,
Ngày yêu cầu.
### 3. Kế toán chọn một yêu cầu từ danh sách để xem chi tiết.
### 4. Hệ thống hiển thị màn hình chi tiết yêu cầu hoàn tiền gồm:
Thông tin đơn hàng, Thông tin khách hàng, Thông tin hủy
tour và Số tiền hoàn lại (đã tính phí hủy).
Luồng sự kiện
chính 5. Kế toán xác minh lại thông tin, đặc biệt là số tiền hoàn và
phương thức thanh toán gốc.
### 6. Kế toán thực hiện giao dịch bên ngoài, nhập form thông
tin hoàn tiền và nhấn "Xác nhận đã hoàn".
### 7. Sau khi giao dịch hoàn tiền thành công, hệ thống cập nhật
trạng thái yêu cầu thành "Đã xử lý" và lưu lại thông tin giao
dịch “Hoàn tiền”.
### 8. Hệ thống tự động gửi thông báo đến khách hàng xác nhận
việc hoàn tiền đã được thực hiện, kèm số tiền và thời gian.
### 10. Hệ thống hiển thị thông báo thành công và quay lại danh
sách yêu cầu.


Luồng sự kiện
4a. Từ chối hoàn tiền.
phụ
Luồng sự kiện
Không có.
lỗi hoặc ngoại lệ
Activity diagram:
Sequence diagram:


