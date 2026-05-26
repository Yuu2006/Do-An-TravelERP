# Phân hệ Quản lý Điều phối và Chăm sóc khách hàng

**Phạm vi:** UC34-UC39
---

## 3.2.15. Tra cứu đơn hàng
Bảng 3.36: Đặc tả Use - case Tra cứu đơn hàng
Mục Nội dung


UC34Mã Use - case
Tra cứu đơn hàngTên Use - case
Nhân viênTác nhân
Cho phép nhân viên tìm kiếm đơn hàng để hỗ trợ.Mô tả
- Nhân viên đăng nhập hệ thống nội bộ với phân quyền phù
Tiền điều kiện hợp.
- Hiển thị chi tiết đơn hàng.Hậu điều kiện
### 1. Nhân viên truy cập phân hệ "Quản lý đơn hàng" trên hệ
thống nội bộ.
### 2. Nhân viên nhập thông tin vào thanh tìm kiếm hoặc sử
dụng bộ lọc trạng thái.
### 3. Nhân viên nhấn nút "Tìm kiếm".
### 4. Hệ thống truy vấn CSDL và trả về danh sách các đơn hàng
Luồng sự kiện
chính khớp với tiêu chí.
### 5. Nhân viên nhấn vào mã đơn hàng cụ thể.
### 6. Hệ thống hiển thị chi tiết đơn hàng gồm: Thông tin khách
đặt, danh sách hành khách, thông tin tour, trạng thái thanh
toán.
### 7. Kết thúc use case.
4a. Nếu không có đơn hàng phù hợp, hệ thống hiển thị
Luồng sự kiện
thông báo, quay lại bước 2.phụ


Luồng sự kiện Nhân viên thoát khỏi màn hình tra cứu. Kết thúc use case.
lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:
## 3.2.16. Đánh giá
Bảng 3.37: Đặc tả Use - case Đánh giá
Mục Nội dung


UC35Mã Use - case
Đánh giáTên Use - case
Khách hàngTác nhân
Khách hàng chia sẻ trải nghiệm thực tế sau chuyến đi về
Mô tả chất lượng dịch vụ để phục vụ cho các cải tiến.
- Chuyến đi thực tế đã kết thúc và ghi nhận "Hoàn thành".Tiền điều kiện
- Phản hồi được lưu lại để cải thiện chất lượng tour. Tự
Hậu điều kiện động tính toán lại điểm đánh giá trung bình.
### 1. Hệ thống tự động gửi thông báo mời khách hàng đánh giá
sau chuyến đi.
### 2. Khách hàng vào mục "Chuyến đi của tôi", chọn chuyến
đi đã hoàn thành nhấn "Viết đánh giá".
### 3. Hệ thống hiển thị biểu mẫu: Chấm điểm (1-5 sao), Nhận
xét văn bản, Đính kèm ảnh, Tùy chọn công khai.Luồng sự kiện
chính
### 4. Khách hàng hoàn tất nhập liệu và nhấn "Gửi đánh giá".
### 5. Hệ thống tự động tính toán lại điểm trung bình của tour.
### 7. Hệ thống hiển thị thông báo thành công và tặng điểm
thưởng xanh.
### 8. Kết thúc usecase.
Luồng sự kiện Không có.
phụ


2a. Nếu đã quá 30 ngày từ lúc kết thúc tour, hệ thống khóa
tính năng và hiển thị thông báo quá hạn không thể viết
Luồng sự kiện đánh giá.
lỗi hoặc ngoại lệ
Khách hàng thoát khỏi giao diện đánh giá. Use case kết
thúc.
Activity diagram:


Sequence diagram:


## 3.2.17. Khiếu nại
Bảng 3.38: Đặc tả Use - case Khiếu nại
Mục Nội dung
UC36Mã Use - case
Khiếu nạiTên Use - case
Khách hàngTác nhân


Cho phép khách hàng gửi các yêu cầu hỗ trợ hoặc khiếu nại
chính thức đến bộ phận CSKH khi có vấn đề phát sinhMô tả
trước, trong hoặc sau chuyến đi.
- Khách hàng đã đăng nhập và có ít nhất một đơn hàng liên
Tiền điều kiện quan đến vấn đề muốn gửi.
- Yêu cầu khiếu nại được khởi tạo thành công với mã theo
Hậu điều kiện dõi riêng và chuyển đến bộ phận CSKH.
### 1. Khách hàng chọn chức năng "Khiếu nại / Gửi yêu cầu"
(có thể truy cập từ trang chi tiết của một chuyến đi cụ thể
hoặc từ trang Lịch sử yêu cầu).
### 2. Hệ thống hiển thị biểu mẫu tạo khiếu nại/yêu cầu hỗ trợ
mới.
### 3. Khách hàng nhập các thông tin vào biểu mẫu, bao gồm:
- Chọn đơn hàng liên quan (nếu truy cập từ mục Lịch sử
chung).
Luồng sự kiện
chính - Chọn loại yêu cầu (Chất lượng dịch vụ, Thanh toán/Hoàn
tiền, Hỗ trợ khẩn cấp, Khác...).
- Nhập tiêu đề và nội dung chi tiết.
- Tải lên tệp đính kèm
### 4. Khách hàng nhấn nút "Gửi yêu cầu".
### 5. Hệ thống kiểm tra tính hợp lệ của dữ liệu.
### 6. Hệ thống lưu trạng thái "Chờ tiếp nhận".


### 7. Hệ thống gửi dữ liệu khiếu nại về hệ thống quản lý công
việc nội bộ của bộ phận CSKH.
### 8. Hệ thống hiển thị thông báo "Gửi yêu cầu thành công".
### 9. Hệ thống gửi Email xác nhận tự động cho khách hàng kèm
mã khiếu nại.
### 10. Kết thúc use case.
5a. Nếu thiếu trường thông tin bắt buộc, hệ thống thông
Luồng sự kiện
báo lỗi và yêu cầu khách bổ sung (bước 3). phụ
Khách hàng thoát khỏi màn hình khiếu nại. Use case kết
Luồng sự kiện
thúc. lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:





## 3.2.18. Điều phối hướng dẫn viên
Bảng 3.39: Đặc tả Use - case Điều phối hướng dẫn viên
Mục Nội dung
Mã Use - case UC37
Tên Use - case Điều phối HDV
Tác nhân Nhân viên điều hành
Cho phép nhân viên điều hành phân công HDV phù hợp cho
Mô tả một chuyến đi dựa trên yêu cầu của đoàn khách, năng lực
HDV và tình trạng khả dụng.
- Nhân viên điều hành đã đăng nhập vào hệ thống ERP và
có quyền truy cập vào phân hệ Điều phối nguồn lực.
- Chuyến đi đã được khởi tạo và đang ở trạng thái "Mở bán"
Tiền điều kiện
hoặc "Sắp diễn ra".
- Danh sách khách hàng của chuyến đi đã được xác nhận và
có đầy đủ thông tin trong Hộ chiếu số.
- Một bản ghi phân công mới được tạo, liên kết HDV với
chuyến đi.
- Trạng thái của HDV được chuyển thành "Bận" trong khung
thời gian của tour.
Hậu điều kiện
- Khóa lịch trình của HDV để tránh tình trạng phân công
nhiệm vụ khác trùng thời gian.
- Lệnh điều động điện tử (chứa thông tin đoàn, lịch trình, lưu
ý y tế) được gửi đến HDV.
### 1. Nhân viên điều hành truy cập phân hệ, chọn một
chuyến đi cần phân bổ từ danh sách.
### 2. Hệ thống hiển thị thông tin chi tiết của chuyến đi, danh
Luồng sự kiện
chính sách khách kèm yêu cầu đặc thù.
### 3. Nhân viên nhấn nút "Phân bổ HDV" trên giao diện chi
tiết chuyến đi.


### 4. Hệ thống tự động thực hiện truy vấn dựa trên kết quả
use case Tra cứu HDV và hiển thị danh sách gợi ý theo thứ
tự phù hợp nhất lên đầu.
### 5. Nhân viên điều hành xem xét danh sách. Có thể xem
chi tiết hồ sơ năng lực đầy đủ của từng HDV. Sau đó, chọn
một HDV.
### 6. Hệ thống thực hiện kiểm tra xung đột lịch lần cuối.
### 7. Nhân viên nhấn nút "Xác nhận phân công" để hoàn tất.
### 8. Hệ thống tạo bản ghi phân công, cập nhật trạng thái
HDV thành “Bận” cho toàn bộ khoảng thời gian của tour và
khóa lịch của HDV.
### 9. Hệ thống tự động gửi thông báo kèm lịch trình, danh
sách khách, lưu ý y tế đến HDV.
### 10. Hệ thống hiển thị thông báo thành công, chuyển trạng
thái chuyến đi thành "Đã phân bổ".
### 11. Kết thúc Use Case.
6a. Khi HDV bị xung đột lịch, Nhân viên điều hành phải
Luồng sự kiện
phụ chọn lại một HDV khác
- Xung đột lịch. Hệ thống làm nổi bật (highlight đỏ)
Luồng sự kiện
dòng HDV bị xung đột trong danh sách và hiển thị chi
lỗi hoặc ngoại lệ
tiết lịch trùng. Nhân viên chọn HDV khác.
Activity diagram:


quence diagram:


### 3.2.18.1. Tra cứu hướng dẫn viên
Bảng 3.40: Đặc tả Use - case Tra cứu hướng dẫn viên
Mục Nội dung
Mã Use - case UC38
Tên Use - case Tra cứu HDV
Tác nhân Nhân viên điều hành
Hệ thống hỗ trợ nhân viên điều hành tìm kiếm và xem danh
sách các HDV đang trong trạng thái sẵn sàng làm việc dựa
Mô tả
trên các tiêu chí lọc như thời gian, ngôn ngữ, kỹ năng chuyên
môn.


- Nhân viên điều hành đã đăng nhập vào hệ thống ERP và
Tiền điều kiện
có quyền truy cập vào phân hệ Điều phối nguồn lực.
- Danh sách các HDV thỏa mãn điều kiện tìm kiếm được
Hậu điều kiện hiển thị trên màn hình (nếu có).
- Không có thay đổi dữ liệu trong CSDL.
### 1. Nhân viên điều hành truy cập chức năng tra cứu (từ menu
hoặc từ màn hình chuyến đi).
### 2. Hệ thống hiển thị giao diện tra cứu HDV và các nút chức
năng: "Tìm kiếm", "Làm mới", "Xem chi tiết", “Chọn”
(chuyển sang Phân bổ HDV).
### 3. Nhân viên nhập tiêu chí tìm kiếm như: thời gian, ngôn
ngữ, kỹ năng, tên/mã HDV.
### 4. Nhân viên nhấn nút "Tìm kiếm" để gửi yêu cầu.
### 5. Hệ thống thực hiện truy vấn tìm kiếm trong CSDL dựa
trên các tiêu chí.
Luồng sự kiện 6. Hệ thống hiển thị kết quả tìm kiếm dưới dạng danh sách
chính với các thông tin tóm tắt: Mã nhân viên, Họ và tên, Ngôn
ngữ, Thế mạnh, Trạng thái. Và cột thao tác: "Xem chi tiết",
"Chọn" (chuyển sang Phân bổ HDV).
### 7. Nhân viên có thể thực hiện:
- Nhấn "Xem chi tiết" để xem toàn bộ hồ sơ năng lực của
HDV.
- Nhấn "Chọn" để chọn HDV này và chuyển sang chức năng
phân bổ - UC37.
- Nhấn "Làm mới" để xóa các tiêu chí và hiển thị lại danh
sách ban đầu.
### 8. Kết thúc Use Case.
Luồng sự kiện Không có.
phụ
Luồng sự kiện - Nhân viên thoát khỏi màn hình tra cứu HDV, kết thúc use
lỗi hoặc ngoại lệ case.


Activity diagram:
Sequence diagram:


## 3.2.19. Giải quyết khiếu nại
Bảng 3.41: Đặc tả Use - case Giải quyết khiếu nại
Mục Nội dung
Mã Use - case UC39
Tên Use - case Giải quyết khiếu nại
Tác nhân Nhân viên điều hành


Cho phép nhân viên tiếp nhận, xử lý và theo dõi các khiếu
nại từ khách hàng liên quan đến chất lượng tour, dịch vụ,
Mô tả HDV hoặc các vấn đề phát sinh. Quy trình bao gồm xác
minh thông tin, liên hệ các bên liên quan, đề xuất phương án
giải quyết và cập nhật kết quả cuối cùng.
– Nhân viên đã đăng nhập và có quyền truy cập phân hệ
Quản lý khiếu nại.
Tiền điều kiện
– Đã có ít nhất một khiếu nại từ khách hàng ở trạng thái "Chờ
xử lý".
– Khiếu nại được cập nhật trạng thái cuối cùng (Đã giải
quyết, Đã hủy, hoặc Từ chối).
Hậu điều kiện – Các ghi chú và quyết định xử lý được lưu trong lịch sử
khiếu nại.
– Khách hàng nhận được thông báo về kết quả xử lý.
### 1. Nhân viên truy cập phân hệ "Quản lý khiếu nại".
### 2. Hệ thống hiển thị danh sách các khiếu nại, mặc định sắp
xếp theo mức độ nghiêm trọng và thời gian gửi.
### 3. Nhân viên có thể sử dụng bộ lọc (theo trạng thái, mức độ,
khoảng thời gian, tour liên quan, HDV liên quan) để thu hẹp
danh sách.
### 4. Nhân viên chọn một khiếu nại cần xử lý.
Luồng sự kiện 5. Hệ thống hiển thị màn hình chi tiết khiếu nại gồm:
chính
- Thông tin chung: mã khiếu nại, ngày gửi, khách hàng,
tour liên quan, HDV liên quan (nếu có).
- Nội dung khiếu nại: loại, mô tả chi tiết, ảnh/video đính
kèm.
- Lịch sử xử lý: các ghi chú, cập nhật trước đó.
### 6. Nhân viên xem xét nội dung, có thể nhấn vào số điện thoại
khách hàng để gọi trực tiếp.


### 7. Nhân viên chọn hướng xử lý:
- Yêu cầu bổ sung thông tin (chuyển luồng phụ A1).
- Yêu cầu HDV giải trình: nếu liên quan đến HDV
(chuyển luồng phụ A2).
- Từ chối khiếu nại (chuyển luồng phụ A3).
### 8. Sau khi có quyết định cuối cùng, nhân viên nhấn "Hoàn
tất xử lý".
### 9. Hệ thống hiển thị thông báo thành công và quay lại danh
sách khiếu nại.
### 10. Kết thúc use case.
7a. Nếu nhân viên yêu cầu bổ sung thông tin, hệ thống sẽ
chuyển trạng thái khiếu nại thành "Chờ bổ sung" để gửi
thông báo cho khách hàng, và tự động quay lại trạng thái
"Chờ xử lý" khi khách hàng phản hồi.
7b. Nếu nhân viên yêu cầu HDV giải trình, hệ thống sẽ gửi
Luồng sự kiện thông báo đến HDV, cập nhật trạng thái thành "Chờ giải
phụ
trình từ HDV" và cảnh báo lại cho nhân viên khi nhận được
phản hồi.
7c. Nếu nhân viên chọn từ chối khiếu nại, hệ thống sẽ yêu
cầu nhập lý do, cập nhật trạng thái thành "Từ chối" và gửi
thông báo kết quả cho khách hàng.
Luồng sự kiện Nhân viên thoát khỏi màn hình giải quyết khiếu nại. Use
lỗi hoặc ngoại lệ case kết thúc.
Activity diagram:


Sequence diagram:





