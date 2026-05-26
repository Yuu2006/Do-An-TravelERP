# Phân hệ Quản trị hệ thống

**Phạm vi:** UC55-UC68
---

## 3.2.31. Quản lý truy cập tài khoản
Bảng 3.57: Đặc tả Use - case Quản lý truy cập tài khoản
Mục Nội dung
Mã Use - case UC55
Tên Use - case Quản lý truy cập tài khoản
Tác nhân Người dùng
Cho phép người dùng đăng ký tài khoản, đăng nhập, đăng
Mô tả
xuất và khôi phục mật khẩu để truy cập hệ thống
Tiền điều kiện - Người dùng có kết nối internet và truy cập hệ thống
- Người dùng truy cập thành công hệ thống hoặc cập nhật
Hậu điều kiện
mật khẩu thành công
### 1. Khách hàng truy cập chức năng "Tài khoản".
### 2. Hệ thống kiểm tra trạng thái đăng nhập hiện tại.
### 3. Nếu khách hàng chưa đăng nhập:
- Khách hàng chọn một thao tác:
- Nếu chọn “Đăng ký”, chuyển đến UC56.
Luồng sự kiện - Nếu chọn “Đăng nhập”, chuyển đến UC57.
chính - Nếu chọn “Quên mật khẩu”, chuyển đến UC59.
### 4. Nếu khách hàng đã đăng nhập:
- Khách hàng chọn một thao tác:
- Nếu chọn “Đăng xuất”, chuyển đến U58.
- Nếu chọn “Quên mật khẩu”, chuyển đến UC60.
### 5. Kết thúc Use Case.
Luồng sự kiện Không có
phụ
Luồng sự kiện Không có
lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:


### 3.2.31.1. Đăng ký
Bảng 3.58: Đặc tả Use - case Đăng ký
Mục Nội dung
Mã Use - case UC56
Tên Use - case Đăng ký
Tác nhân Khách hàng
Khách hàng tạo tài khoản để sử dụng các chức năng của hệ
Mô tả
thống như tìm kiếm và đặt tour.
Tiền điều kiện - Khách hàng chưa có tài khoản trong hệ thống.


- Khách hàng đang ở trạng thái chưa đăng nhập
Hậu điều kiện - Tài khoản được tạo trong CSDL.
### 1. Khách hàng truy cập chức năng “Đăng ký”.
### 2. Hệ thống hiển thị form đăng ký tài khoản
### 3. Khách hàng nhập các thông tin: Email, Tên đăng
nhập, Mật khẩu, Nhập lại mật khẩu, Số điện thoại,
Tỉnh/Thành, Quận/Huyện.
### 4. Khách hàng nhấn nút “Đăng ký”.
### 5. Hệ thống kiểm tra thông tin đăng ký.
Luồng sự kiện
### 6. Hệ thống tạo mã OTP và gửi về Email đã đăng ký.
chính
### 7. Khách hàng nhập mã OTP và nhấn "Xác thực".
### 8. Hệ thống kiểm tra OTP hợp lệ.
### 9. Hệ thống mã hoá mật khẩu và tạo tài khoản mới lưu
trong CSDL.
### 10. Hệ thống hiển thị “Đăng ký thành công”.
### 11. Hệ thống chuyển hướng đến trang đăng nhập.
### 12. Kết thúc Use Case.
7a. Khách hàng chọn “Gửi lại OTP” tại giao diện, hệ thống
thực hiện tạo OTP mới, gửi lại email và tiếp tục thực thi từ
bước 8 của luồng chính. Luồng sự kiện
phụ 9a. Nếu OTP không đúng, hệ thống hiển thị thông báo lỗi.
Hệ thống cho phép khách hàng nhập lại OTP (tối đa 5 lần).
Trở về bước 8 của luồng chính.
5a. Nếu email đã tồn tại, hệ thống hiển thị thông báo lỗi và
yêu cầu khách hàng nhập lại email khác. Trở về bước 3 của
Luồng sự kiện luồng chính.
lỗi hoặc ngoại lệ
- Khách hàng thoát khỏi màn hình đăng ký. Use Case dừng
lại.
Activity diagram:


Sequence diagram:





### 3.2.31.2. Đăng nhập
Bảng 3.59: Đặc tả Use - case Đăng nhập
Mục Nội dung
Mã Use - case UC57
Tên Use - case Đăng nhập
Tác nhân Người dùng
Hệ thống cho phép người dùng đăng nhập để truy cập các
Mô tả
chức năng theo quyền được phân.
Tiền điều kiện - Người dùng đã có tài khoản và đã xác nhận email.
- Phiên đăng nhập được tạo và chuyển đến giao diện phù
Hậu điều kiện
hợp với vai trò.
### 1. Luồng sự kiện chính:
### 2. Người dùng truy cập chức năng “Đăng nhập”.
### 3. Hệ thống hiển thị form đăng nhập.
### 4. Người dùng nhập Email/Tên đăng nhập và Mật khẩu.
Luồng sự kiện
### 5. Người dùng nhấn nút "Đăng nhập".
chính
### 6. Hệ thống kiểm tra thông tin đăng nhập.
### 7. Hệ thống xác thực vai trò và tạo phiên đăng nhập.
### 8. Hệ thống chuyển hướng đến màn hình tương ứng.
### 9. Kết thúc Use Case.
Luồng sự kiện 2a. Người dùng chọn “Quên mật khẩu”. Hệ thống chuyển
phụ sang Use Case “Quên mật khẩu”.
5a. Nếu thông tin đăng nhập không đúng, hệ thống hiển thị
thông báo lỗi và yêu cầu người dùng nhập lại mật khẩu tại
Luồng sự kiện bước 3 của luồng chính.
lỗi hoặc ngoại lệ
-Người dùng thoát khỏi màn hình đăng nhập. Use Case
dừng lại.
Activity diagram:


Sequence diagram:


### 3.2.31.3. Đăng xuất
Bảng 3.60: Đặc tả Use - case Đăng xuất
Mục Nội dung
Mã Use - case UC58
Tên Use - case Đăng xuất
Tác nhân Người dùng
Cho phép người dùng kết thúc phiên làm việc và đăng xuất
Mô tả
khỏi hệ thống
Tiền điều kiện - Người dùng đã đăng nhập thành công vào hệ thống


- Phiên đăng nhập bị hủy và người dùng được chuyển về
Hậu điều kiện
trang đăng nhập hoặc trang chủ
### 1. Người dùng truy cập chức năng “Đăng xuất”.
### 2. Hệ thống nhận yêu cầu đăng xuất.
Luồng sự kiện 3. Hệ thống hủy phiên đăng nhập.
chính 4. Hệ thống xóa token xác thực.
### 5. Hệ thống chuyển hướng người dùng về trang chủ.
### 6. Kết thúc Use Case.
1a. Nếu người dùng chọn “Đăng xuất khỏi tất cả thiết bị”.
Luồng sự kiện Hệ thống hủy toàn bộ phiên đăng nhập của tài khoản trên
phụ các thiết bị. Người dùng bị đăng xuất khỏi tất cả các phiên
đang hoạt động.
Luồng sự kiện
Không có
lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:
### 3.2.31.4. Quên mật khẩu
Bảng 3.61: Đặc tả Use - case Quên mật khẩu
Mục Nội dung
Mã Use - case UC59
Tên Use - case Quên mật khẩu
Tác nhân Người dùng
Mô tả Hệ thống hỗ trợ người dùng đặt lại mật khẩu khi quên.
Tiền điều kiện - Người dùng có tài khoản hợp lệ.
Hậu điều kiện - Mật khẩu mới được cập nhật thành công.


### 1. Người dùng truy cập chức năng “Quên mật khẩu”.
### 2. Hệ thống hiển thị form nhập Email.
### 3. Người dùng nhập Email và gửi yêu cầu.
### 4. Hệ thống kiểm tra Email tồn tại.
### 5. Hệ thống gửi OTP đặt lại mật khẩu.
Luồng sự kiện
### 6. Người dùng xác nhận OTP và nhập mật khẩu mới.
chính
### 7. Người dùng nhấn “Xác nhận”.
### 8. Hệ thống kiểm tra mật khẩu mới.
### 9. Hệ thống cập nhật mật khẩu sau khi mã hóa.
### 10. Hệ thống hiển thị thông báo thành công.
### 11. Kết thúc Use Case.
Luồng sự kiện 7a. Tại bước 7, người dùng chọn "Gửi lại OTP". Hệ thống
phụ tạo OTP mới. Trở về bước 7 của luồng chính.
5a. Tại bước 5, nếu Email không tồn tại, hệ thống hiển thị
thông báo và yêu cầu nhập lại.
8a. Tại bước 8, nếu mã OTP không chính xác, hệ thống
kiểm tra số lần nhập sai.
- Nếu chưa vượt giới hạn: Hệ thống hiển thị thông báo và
trở về bước 6.
Luồng sự kiện - Nếu vượt quá 5 lần: Hệ thống thông báo lỗi, hủy quy
lỗi hoặc ngoại lệ trình và khóa tính năng quên mật khẩu của email này trong
## 15 phút. Kết thúc Use Case.
8b. Tại bước 8, nếu mã OTP đã quá thời gian hiệu lực, hệ
thống hiển thị thông báo "Mã OTP đã hết hạn". Người
dùng chọn "Gửi lại OTP" (trở về bước 6) hoặc chọn “Hủy
bỏ” để kết thúc Use Case.
- Người dùng thoát khỏi màn hình quên mật khẩu, kết thúc
Use Case
Activity diagram:


Sequence diagram:





### 3.2.31.5. Đổi mật khẩu
Bảng 3.62: Đặc tả Use - case Đổi mật khẩu
Mục Nội dung
Mã Use - case UC60
Tên Use - case Đổi mật khẩu
Tác nhân Người dùng đã đăng nhập
Mô tả Cho phép người dùng thay đổi mật khẩu hiện tại.
Tiền điều kiện - Người dùng đã đăng nhập thành công.
Hậu điều kiện - Mật khẩu mới được lưu vào hệ thống.
### 1. Người dùng truy cập chức năng "Đổi mật khẩu".
### 2. Hệ thống hiển thị biểu mẫu nhập mật khẩu cũ và mật
khẩu mới.
### 3. Người dùng nhập thông tin và xác nhận.
### 4. Hệ thống kiểm tra mật khẩu cũ.
Luồng sự kiện 5. Hệ thống kiểm tra độ mạnh mật khẩu mới.
chính 6. Hệ thống gửi email xác nhận đi kèm với OTP.
### 7. Người dùng nhập OTP để xác nhận.
### 8. Hệ thống kiểm tra OTP.
### 9. Hệ thống mã hóa và cập nhật mật khẩu.
### 10. Hệ thống hiển thị thông báo thành công.
### 11. Kết thúc Use Case.
8a. Tại bước 8, người dùng chọn "Gửi lại OTP". Hệ thống
Luồng sự kiện
tạo, gửi OTP mới đến email người dùng và quay trở về
phụ
bước 7.
5a. Tại bước 5, nếu mật khẩu không chính xác, hệ thống
hiển thị thông báo lỗi. Người dùng nhập lại mật khẩu cũ và
hệ thống trở về bước 3 của luồng chính.
Luồng sự kiện 9a. Tại bước 9, nếu mã OTP không chính xác, hệ thống
lỗi hoặc ngoại lệ thông báo lỗi và quay trở về bước 8.
- Nếu nhập sai OTP quá 5 lần, hệ thống huỷ thao tác đổi
mật khẩu.


- Người dùng thoát khỏi màn hình đổi mật khẩu, kết thúc
Use Case
Activity diagram:
Sequence diagram:





## 3.2.32. Quản lý tài khoản người dùng
Bảng 3.63: Đặc tả Use - case Quản lý tài khoản người dùng
Mục Nội dung
Mã Use - case UC61
Tên Use - case Quản lý tài khoản người dùng
Tác nhân Quản trị viên
Cho phép Quản trị viên thực hiện các thao tác quản lý tài
Mô tả khoản người dùng trong hệ thống bao gồm: tìm kiếm, cập
nhật thông tin, khóa/mở khóa tài khoản và đặt lại mật khẩu.
- Quản trị viên đã đăng nhập vào hệ thống.
Tiền điều kiện - Quản trị viên có quyền truy cập vào phân hệ "Quản trị hệ
thống" và được phân quyền quản lý tài khoản người dùng.
- Các thay đổi về thông tin tài khoản được cập nhật thành
công vào cơ sở dữ liệu.
Hậu điều kiện
- Mọi thao tác quan trọng (khóa/mở khóa, đặt lại mật khẩu,
thay đổi vai trò) đều được ghi lại trong nhật ký hệ thống.
### 1. Quản trị viên truy cập phân hệ "Quản lý tài khoản
người dùng".
### 2. Hệ thống hiển thị giao diện danh sách
### 3. Quản trị viên chọn chức năng:
- Nếu chọn "Tạo tài khoản mới" chuyển sang
UC62.
Luồng sự kiện
- Nếu chọn "Tìm kiếm", chuyển sang UC66.
chính
- Nếu chọn "Chỉnh sửa" / "Cập nhật", chuyển sang
UC63.
- Nếu chọn "Khóa", chuyển sang UC64.
- Nếu chọn "Mở khóa", chuyển sang UC65.
- Nếu chọn "Phân quyền", chuyển sang UC67.
### 4. Kết thúc Use case.
Luồng sự kiện Không có
phụ
Luồng sự kiện Không có
lỗi hoặc ngoại lệ


Activity diagram:
Sequence diagram:


### 3.2.32.1. Tạo tài khoản nhân viên
Bảng 3.64: Đặc tả Use - case Tạo tài khoản nhân viên
Mục Nội dung
Mã Use - case UC62
Tên Use - case Tạo tài khoản nhân viên
Tác nhân Quản trị viên
Hệ thống cho phép Quản trị viên tạo mới tài khoản cho
Mô tả nhân viên để truy cập hệ thống theo vai trò được phân
công.


- Quản trị viên đã đăng nhập và có quyền quản lý tài
Tiền điều kiện
khoản.
- Tài khoản nhân viên mới được tạo trong hệ thống với vai
Hậu điều kiện
trò và trạng thái phù hợp.
### 1. Quản trị viên truy cập chức năng "Tạo tài khoản
nhân viên".
### 2. Hệ thống hiển thị biểu mẫu tạo tài khoản.
### 3. Quản trị viên nhập thông tin gồm: Họ tên, Email,
Username, Số điện thoại và Vai trò.
### 4. Quản trị viên nhấn "Lưu".
Luồng sự kiện
### 5. Hệ thống kiểm tra tính hợp lệ của thông tin.
chính
### 6. Hệ thống mã hóa mật khẩu mặc định hoặc tạo mật
khẩu ngẫu nhiên.
### 7. Hệ thống lưu tài khoản vào CSDL.
### 8. Hệ thống hiển thị thông báo "Tạo tài khoản thành
công".
### 9. Kết thúc Use Case.
Luồng sự kiện 6a. Hệ thống sinh mật khẩu ngẫu nhiên theo chuẩn bảo
phụ mật. Sau đó gửi mật khẩu qua email nội bộ.
5a. Nếu Email/Tên đăng nhập đã tồn tại thì hệ thống hiển
thị thông báo lỗi. Người dùng nhập một email/Tên đăng
Luồng sự kiện nhập khác.
lỗi hoặc ngoại lệ
- Quản trị viên thoát khỏi màn hình tạo tài khoản, kết thúc
Use Case
Activity diagram:


Sequence diagram:


### 3.2.32.2. Cập nhật năng lực nhân viên
Bảng 3.65: Đặc tả Use - case Cập nhật năng lực nhân viên
Mục Nội dung
Mã Use - case UC63
Tên Use - case Cập nhật năng lực nhân viên
Tác nhân Quản trị viên
Cho phép cập nhật thông tin năng lực của nhân viên bao
Mô tả
gồm: ngôn ngữ, chứng chỉ, thế mạnh chuyên môn.
Tiền điều kiện - Nhân viên đã tồn tại trong hệ thống.
- Thông tin năng lực được lưu/cập nhật/xóa thành công
Hậu điều kiện
trong hệ thống
### 1. Quản trị viên truy cập chức năng "Quản lý tài khoản
Luồng sự kiện
nhân viên".
chính
### 2. Hệ thống hiển thị danh sách nhân viên.


### 3. Quản trị viên tìm kiếm và chọn một nhân viên cần
cập nhật năng lực.
### 4. Hệ thống hiển thị giao diện Chi tiết nhân viên, bao
gồm danh sách năng lực hiện có.
### 5. Quản trị viên chọn một trong các thao tác:
- Thêm mới, hệ thống hiển thị biểu mẫu thêm mới.
- Chỉnh sửa, hệ thống hiển thị biểu mẫu chỉnh sủa.
- Xóa, hệ thống hiển thị hộp thoại xác nhận.
### 6. Quản trị viên nhấn "Lưu".
### 7. Hệ thống kiểm tra tính hợp lệ của dữ liệu.
### 8. Hệ thống lưu các thay đổi vào Cơ sở dữ liệu.
### 9. Hệ thống hiển thị thông báo "Cập nhật thành công"
và làm mới danh sách năng lực.
### 10. Kết thúc Use Case.
Luồng sự kiện Không có
phụ
8a. Nếu dữ liệu bị trống hoặc sai định dạng, hệ thống hiển
thị thông báo lỗi. Yêu cầu quản trị viên nhập lại dữ liệu.
Luồng sự kiện Trở về bước 7.
lỗi hoặc ngoại lệ
- Quản trị viên thoát khỏi màn hình cập nhật năng lực nhân
viên, kết thúc Use Case
Activity diagram:


Sequence diagram:


### 3.2.32.3. Xóa/Khóa tài khoản
Bảng 3.66: Đặc tả Use - case Xóa/Khóa tài khoản
Mục Nội dung
Mã Use - case UC64
Tên Use - case Xóa/Khóa tài khoản


Tác nhân Quản trị viên
Cho phép quản trị viên khóa tạm thời hoặc xóa tài khoản
Mô tả
khỏi hệ thống
Tiền điều kiện - Tài khoản nhân viên hoặc tài khoản khách hàng tồn tại
Hậu điều kiện - Tài khoản bị khóa hoặc bị xóa khỏi hệ thống
### 1. Quản trị viên truy cập chức năng Quản lý tài khoản.
### 2. Hệ thống hiển thị danh sách tài khoản.
### 3. Quản trị viên lọc hoặc tìm tài khoản.
### 4. Quản trị viên chọn một tài khoản.
### 5. Quản trị viên chọn thao tác Khóa tài khoản hoặc Xóa
tài khoản.
Luồng sự kiện 6. Hệ thống hiển thị hộp thoại xác nhận.
chính 7. Quản trị viên xác nhận thao tác.
### 8. Hệ thống thực hiện:
- Cập nhật trạng thái tài khoản thành KHOA nếu
chọn khóa.
- Xóa tài khoản khỏi cơ sở dữ liệu nếu chọn xóa.
### 9. Hệ thống hiển thị thông báo Thao tác thành công.
### 10. Kết thúc Use Case.
Luồng sự kiện Không có
phụ
8a. Nếu tài khoản đang có giao dịch hoặc đơn đặt tour hoạt
động, hệ thống hiển thị thông báo “Không cho phép xóa”
và đề xuất khóa tài khoản thay vì xóa.
Luồng sự kiện - Nếu Quản trị viên chọn "Khóa tài khoản": Hệ thống
lỗi hoặc ngoại lệ chuyển sang thực hiện nhánh Khóa tài khoản (cập nhật
trạng thái thành KHOA như bước 8 của luồng chính).
- Quản trị viên thoát khỏi màn hình khoá/xoá tài khoản,
kết thúc Use Case
Activity diagram:


Sequence diagram:


### 3.2.32.4. Mở khoá tài khoản
Bảng 3.67: Đặc tả Use - case Mở khóa tài khoản
Mục Nội dung
Mã Use - case UC65
Tên Use - case Mở khóa tài khoản
Tác nhân Quản trị viên


Cho phép quản trị viên mở khóa tài khoản khách hàng và
Mô tả
nhân viên đang bị khóa trước đó.
- Tài khoản nhân viên hoặc tài khoản khách hàng đang
Tiền điều kiện
trong trạng thái KHOA
Hậu điều kiện - Tài khoản được mở khóa và có thể đăng nhập lại
### 1. Quản trị viên truy cập Quản lý tài khoản khách
hàng.
### 2. Hệ thống hiển thị danh sách tài khoản.
### 3. Quản trị viên lọc hoặc tìm tài khoản bị khóa.
### 4. Quản trị viên chọn tài khoản cần mở khóa.
Luồng sự kiện 5. Quản trị viên nhấn Mở khóa tài khoản.
chính 6. Hệ thống hiển thị hộp thoại xác nhận.
### 7. Quản trị viên xác nhận thao tác.
### 8. Hệ thống cập nhật trạng thái tài khoản thành
HOAT_DONG.
### 9. Hệ thống hiển thị thông báo Mở khóa thành công.
### 10. Kết thúc Use Case.
Luồng sự kiện Không có
phụ
## 5 a. Nếu tài khoản không ở trạng thái khóa, hệ thống phát
hiện tài khoản đang ở trạng thái HOAT_DONG. Luồng sự kiện
lỗi hoặc ngoại lệ - Quản trị viên thoát khỏi màn hình mở khoá, kết thúc Use
Case
Activity diagram:


Sequence diagram:


### 3.2.32.5. Tìm kiếm tài khoản
Bảng 3.68: Đặc tả Use - case Tìm kiếm tài khoản
Mục Nội dung
Mã Use - case UC66
Tên Use - case Tìm kiếm tài khoản
Tác nhân Quản trị viên
Cho phép quản trị viên tra cứu và tìm kiếm tài khoản khách
Mô tả
hàng và nhân viên đang bị khóa trước đó


Tiền điều kiện - Quản trị viên đã đăng nhập
Hậu điều kiện - Danh sách tài khoản phù hợp được hiển thị
### 1. Quản trị viên truy cập chức năng Tìm kiếm tài
khoản.
### 2. Hệ thống hiển thị giao diện tìm kiếm.
### 3. Quản trị viên nhập một hoặc nhiều tiêu chí: Mã khách
hàng, Họ tên, Email, Số điện thoại, Trạng thái tài
khoản
Luồng sự kiện
### 4. Quản trị viên nhấn Tìm kiếm.
chính
### 5. Hệ thống kiểm tra tính hợp lệ dữ liệu.
### 6. Hệ thống truy vấn cơ sở dữ liệu.
### 7. Hệ thống hiển thị kết quả tìm kiếm gồm: Mã khách
hàng, Họ tên, Email, Số điện thoại, Trạng thái tài
khoản
### 8. Kết thúc Use Case.
4a. Quản trị viên nhấn "Làm mới". Hệ thống xóa các tiêu
chí tìm kiếm và hiển thị lại giao diện tìm kiếm. Luồng sự kiện
phụ 7a. Quản trị viên chọn "Xem chi tiết". Hệ thống hiển thị
đầy đủ thông tin khách hàng.
5a. Nếu tiêu chí tìm kiếm không hợp lệ. Hệ thống hiển thị
thông báo lỗi và yêu cầu nhập lại.
Luồng sự kiện 6a. Nếu không tìm thấy dữ liệu. Hệ thống hiển thị thông
lỗi hoặc ngoại lệ báo "Không tìm thấy dữ liệu". Kết thúc Use Case.
- Quản trị viên thoát khỏi màn hình tìm kiếm tài khoản, kết
thúc Use Case
Activity diagram:


Sequence diagram:


## 3.2.33. Phân quyền truy cập
Bảng 3.69: Đặc tả Use - case Phân quyền truy cập
Mục Nội dung
Mã Use - case UC67
Tên Use - case Phân quyền truy cập
Tác nhân Quản trị viên


Hệ thống cho phép Quản trị viên gán vai trò và quyền truy
Mô tả
cập cho tài khoản nhân viên.
- Quản trị viên đã đăng nhập và có quyền quản lý tài
Tiền điều kiện khoản.
- Tài khoản nhân viên tồn tại.
- Quyền truy cập của tài khoản được cập nhật trong hệ
Hậu điều kiện
thống.
### 1. Quản trị viên truy cập chức năng "Phân quyền truy
cập".
### 2. Hệ thống hiển thị danh sách tài khoản nhân viên.
### 3. Quản trị viên chọn một tài khoản và nhấn "Phân
quyền".
### 4. Hệ thống hiển thị danh sách vai trò và các quyền
Luồng sự kiện tương ứng.
chính 5. Quản trị viên tùy chỉnh quyền.
### 6. Quản trị viên nhấn "Lưu".
### 7. Hệ thống kiểm tra tính hợp lệ và quyền thực thi.
### 8. Hệ thống cập nhật vai trò, quyền hạn vào CSDL.
### 9. Hệ thống hiển thị thông báo "Cập nhật phân quyền
thành công".
### 10. Kết thúc Use Case.
4a. Quản trị viên nhấn vào một vai trò để xem chi tiết. Hệ
thống hiển thị danh sách các chức năng được phép truy cập.
Luồng sự kiện
phụ Quản trị viên quay lại bước 5 của luồng chính để tiếp tục
phân quyền.
Luồng sự kiện Không có.
lỗi hoặc ngoại lệ
Activity diagram:


Sequence diagram:


## 3.2.34. Xem nhật ký hệ thống
Bảng 3.70: Đặc tả Use - case Xem nhật ký hệ thống
Mục Nội dung


Mã Use - case UC68
Tên Use - case Xem nhật ký hệ thống
Tác nhân Quản trị viên
Cho phép Quản trị viên tra cứu lịch sử hoạt động của người
Mô tả
dùng và lỗi hệ thống nhằm mục đích kiểm soát và giám sát.
- Quản trị viên đã đăng nhập và có quyền xem log hệ
Tiền điều kiện
thống.
- Danh sách log được hiển thị theo tiêu chí lọc; không thay
Hậu điều kiện
đổi dữ liệu hệ thống.
### 1. Quản trị viên truy cập chức năng "Nhật ký hệ
thống".
### 2. Hệ thống hiển thị màn hình tìm kiếm log với các bộ
lọc: “Khoảng thời gian”, “Người dùng”, “Loại hành
động (Cập nhật, Xoá…)”, “Mức độ (Lỗi, Cảnh báo)”
Luồng sự kiện 3. Quản trị viên nhập tiêu chí lọc.
chính 4. Quản trị viên nhấn "Tìm kiếm".
### 5. Hệ thống kiểm tra tính hợp lệ của tiêu chí.
### 6. Hệ thống truy vấn dữ liệu từ các log.
### 7. Hệ thống hiển thị danh sách log gồm: Thời gian,
Người thực hiện, Hành động, Địa chỉ IP, Trạng thái.
### 8. Kết thúc Use Case.
3a.Quản trị viên nhấn "Làm mới". Hệ thống xóa toàn bộ tiêu
Luồng sự kiện chí và hiển thị log mặc định. Kết thúc Use Case.
phụ
7a. Nếu không có log phù hợp, hệ thống hiển thị thông báo
Luồng sự kiện
lỗi hoặc ngoại lệ "Không có dữ liệu". Trở về bước 3.
Activity diagram:


Sequence diagram:





