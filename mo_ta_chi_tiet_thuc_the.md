# Mô tả chi tiết các thực thể

Tài liệu được lập theo các entity và lược đồ Oracle tại `be/src/main/java/com/digitaltravel/erp/entity` và `be/src/main/resources/db/KhoiTaoBang.sql`. Các phương thức dưới đây được chuyển sang cách đặt tên tiếng Việt theo định dạng báo cáo, đối chiếu từ thao tác công khai tại tầng service/controller. Những thao tác của bảng liên kết hoặc nhật ký được tạo gián tiếp trong một nghiệp vụ chính sẽ được ghi rõ trong phần ý nghĩa.

## 3.4.5.1. VAITRO

**Bảng 3.60. Mô tả chi tiết thực thể VAITRO**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaVaiTro: String` | Mã định danh duy nhất của vai trò, là khóa chính. |
| Thuộc tính | `TenHienThi: String` | Tên vai trò hiển thị cho người sử dụng. |
| Phương thức | `GanVaiTroChoNhanVien(MaNhanVien, MaVaiTro)` | Gán vai trò cho nhân viên; thao tác được cài đặt trong nghiệp vụ quản lý nhân viên. |

## 3.4.5.2. TAIKHOAN

**Bảng 3.61. Mô tả chi tiết thực thể TAIKHOAN**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaTaiKhoan: String` | Mã định danh tài khoản, là khóa chính. |
| Thuộc tính | `TenDangNhap: String` | Tên đăng nhập duy nhất dùng để xác thực. |
| Thuộc tính | `MatKhau: String` | Mật khẩu đã được mã hóa để lưu trữ an toàn. |
| Thuộc tính | `HoTen: String` | Họ tên của chủ tài khoản. |
| Thuộc tính | `CCCD: String` | Số căn cước công dân, không trùng nếu được cung cấp. |
| Thuộc tính | `NgaySinh: Date` | Ngày sinh của chủ tài khoản. |
| Thuộc tính | `Email: String` | Địa chỉ email, không trùng nếu được cung cấp. |
| Thuộc tính | `SoDienThoai: String` | Số điện thoại liên hệ. |
| Thuộc tính | `VaiTro: String` | Mã vai trò đăng nhập của tài khoản. |
| Thuộc tính | `TrangThai: String` | Trạng thái tài khoản: `HOAT_DONG` hoặc `KHOA`. |
| Phương thức | `DangNhap(TenDangNhap, MatKhau)` | Kiểm tra thông tin đăng nhập và trả về phiên xác thực hợp lệ. |
| Phương thức | `DangKy(ThongTinTaiKhoan)` | Tạo tài khoản khách hàng mới và hồ sơ liên quan. |
| Phương thức | `DangKyNhanVien(ThongTinNhanVien)` | Quản trị viên tạo tài khoản đăng nhập cho nhân viên mới. |
| Phương thức | `DoiMatKhau(MaTaiKhoan, MatKhauMoi)` | Cập nhật mật khẩu sau khi kiểm tra yêu cầu hợp lệ. |
| Phương thức | `KiemTraMatKhau(MaTaiKhoan, MatKhau)` | Kiểm tra mật khẩu hiện tại trước thao tác cần xác minh. |
| Phương thức | `QuenMatKhau(Email)` | Tạo yêu cầu đặt lại mật khẩu khi người dùng quên thông tin truy cập. |
| Phương thức | `DatLaiMatKhau(ThongTinDatLai)` | Thiết lập mật khẩu mới theo yêu cầu hợp lệ. |
| Phương thức | `DangXuat()` | Kết thúc phiên đăng nhập hiện tại. |
| Phương thức | `KhoaTaiKhoan(MaNhanVien)` | Khóa tài khoản gắn với nhân viên. |
| Phương thức | `MoKhoaTaiKhoan(MaNhanVien)` | Mở lại tài khoản nhân viên đã bị khóa. |

## 3.4.5.3. NHATKYHETHONG

**Bảng 3.62. Mô tả chi tiết thực thể NHATKYHETHONG**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaNhatKyHeThong: String` | Mã định danh bản ghi nhật ký, là khóa chính. |
| Thuộc tính | `MaTaiKhoan: String` | Mã tài khoản thực hiện thao tác. |
| Thuộc tính | `HanhDong: String` | Loại thao tác: thêm, cập nhật, xóa hoặc xuất dữ liệu Power BI. |
| Thuộc tính | `DoiTuong: String` | Tên loại dữ liệu bị tác động. |
| Thuộc tính | `MaDoiTuong: String` | Mã bản ghi bị tác động. |
| Thuộc tính | `ThoiGian: Timestamp` | Thời điểm hệ thống ghi nhận thao tác. |
| Phương thức | `GhiNhan(MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong)` | Tạo một dòng nhật ký kiểm toán cho thao tác quản trị. |
| Phương thức | `TimKiem(TuNgay, DenNgay, HanhDong, DoiTuong)` | Tra cứu nhật ký theo điều kiện lọc và phân trang. |

## 3.4.5.4. HOCHIEUSO

**Bảng 3.63. Mô tả chi tiết thực thể HOCHIEUSO (Khách hàng)**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaKhachHang: String` | Mã hồ sơ khách hàng, là khóa chính. |
| Thuộc tính | `MaTaiKhoan: String` | Tài khoản sở hữu duy nhất của hồ sơ khách hàng. |
| Thuộc tính | `GhiChuYTe: String` | Lưu ý y tế phục vụ chuyến đi. |
| Thuộc tính | `DiUng: String` | Thông tin dị ứng của khách hàng. |
| Thuộc tính | `HangThanhVien: String` | Hạng thành viên: thành viên, đồng, bạc, vàng hoặc kim cương. |
| Thuộc tính | `DiemXanh: Long` | Số điểm xanh khách hàng đã tích lũy. |
| Phương thức | `LayHoSo(MaTaiKhoan)` | Lấy thông tin hộ chiếu số của khách hàng đang đăng nhập. |
| Phương thức | `CapNhatHoSo(MaTaiKhoan, ThongTinHoSo)` | Cập nhật ghi chú y tế và dị ứng trong hồ sơ. |
| Phương thức | `LichSuTour(MaTaiKhoan)` | Trả về các chuyến khách hàng đã tham gia. |
| Phương thức | `TimKiemKhachHang(HoTen, Email, SoDienThoai)` | Nhân viên tra cứu khách hàng theo điều kiện lọc. |
| Phương thức | `ChiTietKhachHang(MaKhachHang)` | Nhân viên xem chi tiết hồ sơ một khách hàng. |
| Phương thức | `CapNhatDiemXanh(MaKhachHang, SoDiem)` | Cộng hoặc trừ điểm, được xử lý gián tiếp khi ghi nhận hành động xanh hoặc đổi điểm lấy voucher. |

## 3.4.5.5. NHANVIEN

**Bảng 3.64. Mô tả chi tiết thực thể NHANVIEN**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaNhanVien: String` | Mã nhân viên, là khóa chính. |
| Thuộc tính | `MaTaiKhoan: String` | Tài khoản duy nhất gắn với nhân viên. |
| Thuộc tính | `LoaiNhanVien: String` | Nhóm nghiệp vụ của nhân viên, ví dụ hướng dẫn viên hoặc kế toán. |
| Thuộc tính | `NgayVaoLam: Date` | Ngày nhân viên bắt đầu làm việc. |
| Thuộc tính | `TrangThaiLamViec: String` | Trạng thái làm việc: `HOAT_DONG`, `BAN`, `NGHI`. |
| Phương thức | `DangKyNhanVien(ThongTinNhanVien)` | Tạo hồ sơ nhân viên đồng thời với tài khoản đăng nhập mới. |
| Phương thức | `TimKiemNhanVien(HoTen, MaVaiTro, TrangThai)` | Tra cứu danh sách nhân viên theo điều kiện lọc. |
| Phương thức | `ChiTietNhanVien(MaNhanVien)` | Lấy thông tin chi tiết của nhân viên. |
| Phương thức | `KhoaTaiKhoan(MaNhanVien)` | Khóa tài khoản của nhân viên trong hệ thống. |
| Phương thức | `MoKhoaTaiKhoan(MaNhanVien)` | Mở khóa tài khoản của nhân viên. |
| Phương thức | `GanVaiTro(MaNhanVien, MaVaiTro)` | Cập nhật vai trò nghiệp vụ của nhân viên. |
| Phương thức | `LayHoSoCaNhan(MaTaiKhoan)` | Lấy hồ sơ nhân viên đang đăng nhập. |

## 3.4.5.6. NANGLUCNHANVIEN

**Bảng 3.65. Mô tả chi tiết thực thể NANGLUCNHANVIEN**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaNangLucNhanVien: String` | Mã hồ sơ năng lực, là khóa chính. |
| Thuộc tính | `MaNhanVien: String` | Nhân viên sở hữu hồ sơ năng lực. |
| Thuộc tính | `NgonNgu: String` | Các ngôn ngữ nhân viên có thể phục vụ. |
| Thuộc tính | `ChungChi: String` | Thông tin chứng chỉ chuyên môn. |
| Thuộc tính | `ChuyenMon: String` | Tuyến hoặc nghiệp vụ chuyên môn. |
| Thuộc tính | `DanhGia: Decimal` | Điểm đánh giá trung bình từ 0 đến 5. |
| Thuộc tính | `SoDanhGia: Integer` | Tổng số lượt đánh giá đã được tính. |
| Phương thức | `LayNangLuc(MaNhanVien)` | Lấy hồ sơ năng lực của nhân viên. |
| Phương thức | `CapNhatNangLuc(MaNhanVien, ThongTin)` | Cập nhật kỹ năng, ngôn ngữ và chứng chỉ. |
| Phương thức | `CapNhatDanhGiaHuongDanVien()` | Cập nhật điểm trung bình gián tiếp bên trong nghiệp vụ `GuiDanhGia()` khi khách đánh giá tour. |

## 3.4.5.7. TOURMAU

**Bảng 3.66. Mô tả chi tiết thực thể TOURMAU**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaTourMau: String` | Mã sản phẩm tour mẫu, là khóa chính. |
| Thuộc tính | `TieuDe: String` | Tiêu đề giới thiệu tour. |
| Thuộc tính | `MoTa: String` | Mô tả chi tiết sản phẩm tour. |
| Thuộc tính | `ThoiLuong: Integer` | Số ngày thực hiện tour, phải lớn hơn 0. |
| Thuộc tính | `GiaSan: Decimal` | Giá bán thấp nhất được phép áp dụng. |
| Thuộc tính | `DanhGia: Decimal` | Điểm đánh giá trung bình của sản phẩm tour. |
| Thuộc tính | `SoDanhGia: Integer` | Tổng số lượt đánh giá sản phẩm. |
| Phương thức | `DanhSachTourMau(TieuDe, ThoiLuongToiThieu, ThoiLuongToiDa)` | Liệt kê tour mẫu theo các điều kiện tìm kiếm và phân trang. |
| Phương thức | `ChiTietTourMau(MaTourMau)` | Lấy tour mẫu cùng lịch trình theo ngày. |
| Phương thức | `TaoMoiTourMau(ThongTinTour)` | Tạo sản phẩm tour và các ngày lịch trình. |
| Phương thức | `CapNhatTourMau(MaTourMau, ThongTinTour)` | Cập nhật nội dung và thông tin của tour mẫu. |
| Phương thức | `XoaTourMau(MaTourMau)` | Xóa tour mẫu và lịch trình nếu chưa có tour thực tế liên kết. |
| Phương thức | `SaoChepTourMau(MaTourMau)` | Tạo tour mẫu mới dựa trên thông tin của tour đã có. |

## 3.4.5.8. LICHTRINHTOUR

**Bảng 3.67. Mô tả chi tiết thực thể LICHTRINHTOUR**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaLichTrinhTour: String` | Mã một ngày lịch trình, là khóa chính. |
| Thuộc tính | `MaTourMau: String` | Mã tour mẫu chứa lịch trình. |
| Thuộc tính | `NgayThu: Integer` | Thứ tự ngày trong hành trình. |
| Thuộc tính | `HoatDong: String` | Hoạt động chính của ngày. |
| Thuộc tính | `MoTa: String` | Diễn giải chi tiết lịch trình. |
| Thuộc tính | `ThucDon: String` | Nội dung thực đơn dự kiến trong ngày. |
| Phương thức | `LayLichTrinhTour(MaTourThucTe)` | Lấy lịch trình để phục vụ vận hành một chuyến tour. |
| Phương thức | `ThemLichTrinh(MaTourMau, ThongTinLichTrinh)` | Thêm một ngày lịch trình vào tour mẫu. |
| Phương thức | `SuaLichTrinh(MaTourMau, MaLichTrinh, ThongTin)` | Cập nhật thông tin một ngày lịch trình. |
| Phương thức | `XoaLichTrinh(MaTourMau, MaLichTrinh)` | Xóa lịch trình thuộc tour mẫu. |

## 3.4.5.9. DICHVUTHEM

**Bảng 3.68. Mô tả chi tiết thực thể DICHVUTHEM**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaDichVuThem: String` | Mã dịch vụ bổ sung, là khóa chính. |
| Thuộc tính | `Ten: String` | Tên dịch vụ khách có thể mua thêm. |
| Thuộc tính | `DonViTinh: String` | Đơn vị bán hoặc tính phí. |
| Thuộc tính | `DonGia: Decimal` | Giá bán của một đơn vị dịch vụ. |
| Phương thức | `DanhSachDichVu()` | Trả về toàn bộ danh mục dịch vụ bổ sung. |
| Phương thức | `DanhSachDichVuTheoTour(MaTourThucTe)` | Trả về dịch vụ được mở bán cho một tour thực tế. |
| Phương thức | `ChiTietDichVu(MaDichVuThem)` | Lấy nội dung chi tiết của dịch vụ. |
| Phương thức | `TaoMoiDichVu(ThongTinDichVu)` | Tạo dịch vụ bổ sung mới. |
| Phương thức | `CapNhatDichVu(MaDichVuThem, ThongTin)` | Cập nhật tên, đơn vị tính hoặc đơn giá. |
| Phương thức | `XoaDichVu(MaDichVuThem)` | Loại bỏ dịch vụ không còn sử dụng. |

## 3.4.5.10. HANHDONGXANH

**Bảng 3.69. Mô tả chi tiết thực thể HANHDONGXANH**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaHanhDongXanh: String` | Mã loại hành động xanh, là khóa chính. |
| Thuộc tính | `TenHanhDong: String` | Tên hành động bền vững được ghi nhận. |
| Thuộc tính | `DiemCong: Long` | Số điểm xanh được cộng khi hành động được xác minh. |
| Phương thức | `DanhSachHanhDongXanh(MaTourThucTe)` | Liệt kê hành động xanh, có thể lọc theo tour. |
| Phương thức | `ChiTietHanhDongXanh(MaHanhDongXanh)` | Lấy chi tiết loại hành động xanh. |
| Phương thức | `TaoMoiHanhDongXanh(ThongTinHanhDong)` | Thêm một loại hành động xanh. |
| Phương thức | `CapNhatHanhDongXanh(MaHanhDongXanh, ThongTin)` | Cập nhật nội dung hoặc điểm cộng. |
| Phương thức | `XoaHanhDongXanh(MaHanhDongXanh)` | Xóa loại hành động khỏi danh mục. |

## 3.4.5.11. TOURTHUCTE

**Bảng 3.70. Mô tả chi tiết thực thể TOURTHUCTE**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaTourThucTe: String` | Mã chuyến khởi hành thực tế, là khóa chính. |
| Thuộc tính | `MaTourMau: String` | Tour mẫu làm nguồn cho chuyến đi. |
| Thuộc tính | `NgayKhoiHanh: Date` | Ngày bắt đầu chuyến đi. |
| Thuộc tính | `GiaHienHanh: Decimal` | Giá bán hiện tại, không thấp hơn giá sàn. |
| Thuộc tính | `SoKhachToiDa: Integer` | Sức chứa tối đa của chuyến. |
| Thuộc tính | `SoKhachToiThieu: Integer` | Số khách tối thiểu để vận hành. |
| Thuộc tính | `ChoConLai: Integer` | Số chỗ còn có thể bán. |
| Thuộc tính | `TrangThai: String` | Trạng thái vòng đời chuyến đi. |
| Phương thức | `DanhSachTourThucTe(TrangThai, MaTourMau)` | Tra cứu các chuyến tour thực tế theo bộ lọc quản trị. |
| Phương thức | `DanhSachTourCongKhai(KhoangGia, ThoiLuong)` | Lấy các chuyến đang được công khai cho khách hàng. |
| Phương thức | `DanhSachTourCanPhanCong()` | Liệt kê chuyến cần phân công hướng dẫn viên. |
| Phương thức | `ChiTietTourThucTe(MaTourThucTe)` | Lấy thông tin chi tiết chuyến trong chức năng quản lý. |
| Phương thức | `ChiTietTourCongKhai(MaTourThucTe)` | Lấy thông tin chi tiết chuyến hiển thị cho khách. |
| Phương thức | `TaoMoiTourThucTe(ThongTinKhoiHanh)` | Mở một chuyến từ tour mẫu có sẵn. |
| Phương thức | `CapNhatTourThucTe(MaTourThucTe, ThongTin)` | Cập nhật giá, sức chứa hoặc trạng thái chuyến. |
| Phương thức | `XoaTourThucTe(MaTourThucTe)` | Xóa chuyến thực tế theo điều kiện nghiệp vụ. |
| Phương thức | `CapNhatGiaDong()` | Tự động điều chỉnh giá tour theo lịch chạy định kỳ. |

## 3.4.5.12. DICHVU_TOURTHUCTE

**Bảng 3.71. Mô tả chi tiết thực thể DICHVU_TOURTHUCTE**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaTourThucTe: String` | Mã tour thực tế, thành phần khóa chính ghép. |
| Thuộc tính | `MaDichVuThem: String` | Mã dịch vụ được mở bán cho tour, thành phần khóa chính ghép. |
| Phương thức | `GanDichVuChoTour(MaTourThucTe, DanhSachDichVu)` | Thiết lập quan hệ dịch vụ của chuyến khi tạo hoặc cập nhật tour thực tế; được xử lý gián tiếp qua nghiệp vụ tour. |
| Phương thức | `LayDichVuCuaTour(MaTourThucTe)` | Trả về danh mục dịch vụ khả dụng của chuyến. |

## 3.4.5.13. HDX_TOURTHUCTE

**Bảng 3.72. Mô tả chi tiết thực thể HDX_TOURTHUCTE**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaTourThucTe: String` | Mã tour thực tế, thành phần khóa chính ghép. |
| Thuộc tính | `MaHanhDongXanh: String` | Mã hành động xanh áp dụng, thành phần khóa chính ghép. |
| Phương thức | `GanHanhDongXanhChoTour(MaTourThucTe, DanhSachHanhDongXanh)` | Cấu hình hành động xanh khi tạo hoặc cập nhật tour thực tế; được xử lý gián tiếp qua nghiệp vụ tour. |
| Phương thức | `LayHanhDongXanhCuaTour(MaTourThucTe)` | Liệt kê hành động xanh hợp lệ của chuyến. |

## 3.4.5.14. DONDATTOUR

**Bảng 3.73. Mô tả chi tiết thực thể DONDATTOUR**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaDatTour: String` | Mã đơn đặt tour, là khóa chính. |
| Thuộc tính | `MaTourThucTe: String` | Chuyến đi được khách đặt. |
| Thuộc tính | `MaKhachHang: String` | Khách hàng đứng tên đặt tour. |
| Thuộc tính | `NgayDat: Timestamp` | Thời điểm tạo đơn. |
| Thuộc tính | `TongTien: Decimal` | Tổng tiền đơn sau khi tính dịch vụ và ưu đãi. |
| Thuộc tính | `TrangThai: String` | Trạng thái xử lý hoặc thanh toán của đơn. |
| Thuộc tính | `ThoiGianHetHan: Timestamp` | Hạn thanh toán hoặc giữ chỗ. |
| Thuộc tính | `GhiChu: String` | Ghi chú bổ sung của đơn. |
| Thuộc tính | `HanhDongXanh: String` | Dữ liệu hành động xanh khách đã chọn. |
| Phương thức | `DatTour(MaTaiKhoan, YeuCauDatTour)` | Tạo đơn, hành khách, dịch vụ và giữ số chỗ tương ứng. |
| Phương thức | `DanhSachCuaToi(MaTaiKhoan)` | Tra cứu các đơn của khách hàng hiện tại. |
| Phương thức | `ChiTietDonCuaToi(MaTaiKhoan, MaDatTour)` | Lấy thông tin chi tiết một đơn thuộc về khách hàng. |
| Phương thức | `HuyDatTour(MaTaiKhoan, MaDatTour)` | Gửi hoặc thực hiện hủy đơn theo điều kiện nghiệp vụ. |
| Phương thức | `DanhSachTatCaDon(TrangThai, MaTourThucTe)` | Nhân viên tra cứu toàn bộ đơn theo trạng thái hoặc chuyến. |
| Phương thức | `XacNhanDon(MaDatTour)` | Xác nhận đơn sau khi kiểm tra thanh toán. |
| Phương thức | `TuChoiThanhToan(MaDatTour)` | Từ chối xác nhận thanh toán của đơn. |
| Phương thức | `HuyDonHetHan()` | Tự động hủy đơn đã vượt thời hạn giữ chỗ. |

## 3.4.5.15. DSNGUOIDONGHANH

**Bảng 3.74. Mô tả chi tiết thực thể DSNGUOIDONGHANH**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaNguoiDongHanh: String` | Mã người đi cùng không cần tài khoản, là khóa chính. |
| Thuộc tính | `MaDatTour: String` | Đơn đặt chứa người đồng hành. |
| Thuộc tính | `HoTen: String` | Họ tên đầy đủ của người đồng hành. |
| Thuộc tính | `CCCD: String` | Số căn cước nếu có. |
| Thuộc tính | `SoDienThoai: String` | Số điện thoại liên hệ. |
| Thuộc tính | `NgaySinh: Date` | Ngày sinh để xác định thông tin hành khách và giá vé. |
| Thuộc tính | `GioiTinh: String` | Giới tính của hành khách. |
| Thuộc tính | `GhiChu: String` | Lưu ý riêng của người đồng hành. |
| Phương thức | `ThemNguoiDongHanh(MaDatTour, ThongTin)` | Lưu người đi cùng bên trong nghiệp vụ `DatTour()`. |
| Phương thức | `LayDanhSachNguoiDongHanh(MaDatTour)` | Lấy người đi cùng khi hiển thị đoàn khách trong nghiệp vụ vận hành. |

## 3.4.5.16. CHITIETDATTOUR

**Bảng 3.75. Mô tả chi tiết thực thể CHITIETDATTOUR**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaChiTietDat: String` | Mã dòng hành khách trong đơn, là khóa chính. |
| Thuộc tính | `MaDatTour: String` | Đơn đặt tour chứa hành khách. |
| Thuộc tính | `MaKhachHang: String` | Mã khách hàng nếu dòng này là người đặt. |
| Thuộc tính | `MaNguoiDongHanh: String` | Mã người đồng hành nếu dòng này là khách đi cùng. |
| Thuộc tính | `LoaiKhach: String` | Loại hành khách: `NGUOI_DAT` hoặc `NGUOI_DONG_HANH`. |
| Thuộc tính | `GiaTaiThoiDiemDat: Decimal` | Giá được chốt cho hành khách tại lúc đặt. |
| Phương thức | `TaoChiTietDatTour(MaDatTour, DanhSachKhach)` | Tạo từng dòng hành khách bên trong nghiệp vụ `DatTour()`. |
| Phương thức | `LayChiTietDatTour(MaDatTour)` | Trả về hành khách và giá vé khi xem chi tiết hoặc xác nhận đơn. |

## 3.4.5.17. CHITIETDICHVU

**Bảng 3.76. Mô tả chi tiết thực thể CHITIETDICHVU**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaChiTietDichVu: String` | Mã dòng dịch vụ đặt thêm, là khóa chính. |
| Thuộc tính | `MaDatTour: String` | Đơn đặt tour sử dụng dịch vụ. |
| Thuộc tính | `MaDichVuThem: String` | Dịch vụ bổ sung được chọn. |
| Thuộc tính | `SoLuong: Integer` | Số lượng dịch vụ mua thêm. |
| Thuộc tính | `DonGia: Decimal` | Đơn giá được chốt tại thời điểm đặt. |
| Thuộc tính | `ThanhTien: Decimal` | Thành tiền bằng số lượng nhân đơn giá. |
| Phương thức | `ThemDichVuVaoDon(MaDatTour, DanhSachDichVu)` | Lưu dịch vụ khách chọn bên trong nghiệp vụ `DatTour()`. |
| Phương thức | `TinhTongTienTuChiTiet(MaDatTour)` | Tổng hợp tiền vé và dịch vụ gián tiếp bên trong nghiệp vụ đơn đặt tour. |

## 3.4.5.18. VOUCHER

**Bảng 3.77. Mô tả chi tiết thực thể VOUCHER**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaVoucher: String` | Mã định danh voucher, là khóa chính. |
| Thuộc tính | `MaCode: String` | Mã khuyến mãi duy nhất hiển thị cho khách. |
| Thuộc tính | `LoaiUuDai: String` | Hình thức giảm: phần trăm hoặc số tiền. |
| Thuộc tính | `GiaTriGiam: Decimal` | Giá trị giảm tương ứng với loại ưu đãi. |
| Thuộc tính | `MucGiamToiDa: Decimal` | Mức giảm tối đa cho voucher phần trăm. |
| Thuộc tính | `DieuKienApDung: String` | Nội dung điều kiện áp dụng voucher. |
| Thuộc tính | `SoLuotPhatHanh: Integer` | Số lượt voucher có thể phân bổ. |
| Thuộc tính | `SoLuotDaDung: Integer` | Số lượt đã áp dụng thành công. |
| Thuộc tính | `NgayHieuLuc: Date` | Ngày voucher bắt đầu có hiệu lực. |
| Thuộc tính | `NgayHetHan: Date` | Ngày voucher hết hiệu lực. |
| Thuộc tính | `TrangThai: String` | Trạng thái: `SAN_SANG` hoặc `VO_HIEU_HOA`. |
| Phương thức | `TaoVoucher(ThongTinVoucher)` | Tạo chương trình ưu đãi mới. |
| Phương thức | `CapNhatVoucher(MaVoucher, ThongTin)` | Thay đổi nội dung voucher. |
| Phương thức | `VoHieuHoaVoucher(MaVoucher)` | Ngừng sử dụng voucher đã phát hành. |
| Phương thức | `ApVoucher(MaTaiKhoan, MaDatTour, MaVoucher)` | Kiểm tra điều kiện và giảm tiền trên đơn đặt. |
| Phương thức | `DanhSachVoucher()` | Liệt kê voucher phục vụ quản trị. |
| Phương thức | `DanhSachVoucherCoTheDoi()` | Liệt kê voucher khách có thể nhận bằng điểm xanh. |
| Phương thức | `ChiTietVoucher(MaVoucher)` | Lấy thông tin chi tiết một voucher. |

## 3.4.5.19. KHUYENMAI_KH

**Bảng 3.78. Mô tả chi tiết thực thể KHUYENMAI_KH**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaKhachHang: String` | Khách hàng sở hữu voucher, thành phần khóa chính ghép. |
| Thuộc tính | `MaVoucher: String` | Voucher đã phân bổ, thành phần khóa chính ghép. |
| Thuộc tính | `NgayHetHan: Date` | Hạn sử dụng riêng của voucher trong ví khách. |
| Thuộc tính | `NgayNhan: Timestamp` | Thời điểm khách nhận voucher. |
| Thuộc tính | `TrangThai: String` | Trạng thái voucher trong ví khách hàng. |
| Phương thức | `ViVoucher(MaTaiKhoan)` | Liệt kê voucher mà khách đang sở hữu. |
| Phương thức | `PhatHanhChoKhachHang(MaVoucher, MaKhachHang)` | Phân bổ voucher vào ví khách. |
| Phương thức | `ThuHoiVoucher(MaVoucher, MaKhachHang)` | Thu hồi voucher chưa sử dụng. |
| Phương thức | `DanhSachKhachHangDaPhanBo(MaVoucher)` | Liệt kê khách hàng đã được phân bổ một voucher. |

## 3.4.5.20. DATTOUR_UUDAI

**Bảng 3.79. Mô tả chi tiết thực thể DATTOUR_UUDAI**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaDatTour: String` | Đơn đặt được áp ưu đãi, thành phần khóa chính ghép. |
| Thuộc tính | `MaVoucher: String` | Voucher được sử dụng, thành phần khóa chính ghép. |
| Thuộc tính | `SoTienUuDai: Decimal` | Số tiền thực tế được trừ khỏi đơn. |
| Thuộc tính | `NgayApDung: Timestamp` | Thời điểm voucher được áp dụng. |
| Phương thức | `ApUuDaiVaoDon(MaDatTour, MaVoucher)` | Ghi nhận voucher hợp lệ và cập nhật tổng tiền đơn trong nghiệp vụ `ApVoucher()`. |
| Phương thức | `LayUuDaiCuaDon(MaDatTour)` | Tra cứu ưu đãi đã áp khi hiển thị thông tin đơn đặt. |

## 3.4.5.21. GIAODICH

**Bảng 3.80. Mô tả chi tiết thực thể GIAODICH**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaGiaoDich: String` | Mã giao dịch thanh toán hoặc hoàn tiền, là khóa chính. |
| Thuộc tính | `MaDatTour: String` | Đơn đặt liên quan đến giao dịch. |
| Thuộc tính | `LoaiGiaoDich: String` | Loại dòng tiền: `THANH_TOAN` hoặc `HOAN_TIEN`. |
| Thuộc tính | `PhuongThuc: String` | Phương thức thực hiện giao dịch. |
| Thuộc tính | `SoTien: Decimal` | Giá trị giao dịch. |
| Thuộc tính | `MaGDNH: String` | Mã tham chiếu giao dịch ngân hàng hoặc cổng thanh toán. |
| Thuộc tính | `TrangThai: String` | Trạng thái thanh toán hoặc hoàn tiền. |
| Thuộc tính | `NgayThanhToan: Timestamp` | Thời điểm giao dịch hoàn tất. |
| Phương thức | `KhoiTaoThanhToan(MaTaiKhoan, MaDatTour)` | Tạo giao dịch chờ thanh toán cho đơn đặt. |
| Phương thức | `DanhDauThanhToanMaQrHetHan(MaTaiKhoan, MaDatTour)` | Đánh dấu giao dịch mã QR hết thời hạn thanh toán. |
| Phương thức | `DanhDauMaQrHetHanTuDong()` | Tự động rà soát và đánh dấu giao dịch QR hết hạn theo lịch chạy hệ thống. |
| Phương thức | `XacNhanDaChuyenKhoan(MaTaiKhoan, MaDatTour)` | Ghi nhận khách thông báo đã chuyển khoản. |
| Phương thức | `KetQuaThanhToan(MaTaiKhoan, MaDatTour)` | Trả về tình trạng giao dịch của đơn. |
| Phương thức | `TaoGiaoDichHoanTien(MaDatTour)` | Tạo giao dịch hoàn tiền gián tiếp khi yêu cầu hủy được duyệt. |
| Phương thức | `DanhSachChoHoanTien()` | Liệt kê giao dịch hoàn tiền đang chờ kế toán xử lý. |
| Phương thức | `XacNhanHoanTien(MaGiaoDich)` | Xác nhận đã hoàn tiền thành công cho khách hàng. |
| Phương thức | `TuChoiHoanTien(MaGiaoDich)` | Từ chối giao dịch hoàn tiền không hợp lệ. |

## 3.4.5.22. LICHSUTOUR

**Bảng 3.81. Mô tả chi tiết thực thể LICHSUTOUR**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaLichSuTour: String` | Mã lịch sử tham gia, là khóa chính. |
| Thuộc tính | `MaKhachHang: String` | Khách hàng đã tham gia tour. |
| Thuộc tính | `MaTourThucTe: String` | Chuyến đi thực tế đã tham gia. |
| Thuộc tính | `MaChiTietDat: String` | Dòng hành khách nguồn trong đơn đặt. |
| Thuộc tính | `NgayThamGia: Date` | Ngày tham gia tour. |
| Phương thức | `TaoLichSuSauXacNhanDon()` | Tạo lịch sử tham gia gián tiếp khi đơn được xác nhận thành công. |
| Phương thức | `LichSuTour(MaTaiKhoan)` | Tra cứu chuyến đi đã có của khách hàng. |

## 3.4.5.23. PHANCONGTOUR

**Bảng 3.82. Mô tả chi tiết thực thể PHANCONGTOUR**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaPhanCongTour: String` | Mã phân công, là khóa chính. |
| Thuộc tính | `MaTourThucTe: String` | Chuyến được phân công hướng dẫn viên. |
| Thuộc tính | `MaNhanVien: String` | Nhân viên nhận phân công. |
| Thuộc tính | `NgayPhanCong: Timestamp` | Thời điểm tạo phân công. |
| Thuộc tính | `TrangThaiChapNhan: String` | Phản hồi: chờ phản hồi, đã đồng ý hoặc từ chối. |
| Thuộc tính | `NgayPhanHoi: Timestamp` | Thời điểm hướng dẫn viên phản hồi. |
| Phương thức | `TimHuongDanVienKhaDung(MaTourThucTe)` | Tìm hướng dẫn viên có thể nhận chuyến. |
| Phương thức | `PhanCongHuongDanVien(MaTourThucTe, MaNhanVien)` | Giao một chuyến cho hướng dẫn viên. |
| Phương thức | `DongYPhanCong(MaPhanCongTour, MaTaiKhoan)` | Hướng dẫn viên chấp nhận phân công. |
| Phương thức | `TuChoiPhanCong(MaPhanCongTour, MaTaiKhoan)` | Hướng dẫn viên từ chối phân công. |
| Phương thức | `HuyPhanCong(MaPhanCongTour)` | Điều hành hủy phân công đã tạo. |
| Phương thức | `TourCuaToi(MaTaiKhoan)` | Lấy danh sách chuyến được phân công cho hướng dẫn viên đăng nhập. |
| Phương thức | `LichCongTacNhanVien(MaNhanVien)` | Tra cứu lịch phân công của một nhân viên. |

## 3.4.5.24. DIEMDANH

**Bảng 3.83. Mô tả chi tiết thực thể DIEMDANH**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaDiemDanh: String` | Mã bản ghi điểm danh, là khóa chính. |
| Thuộc tính | `MaTourThucTe: String` | Chuyến đang được vận hành. |
| Thuộc tính | `MaKhachHang: String` | Khách có hồ sơ số, nếu là người đặt. |
| Thuộc tính | `MaNguoiDongHanh: String` | Người đồng hành, nếu là khách đi cùng. |
| Thuộc tính | `LoaiKhach: String` | Phân loại đối tượng được điểm danh. |
| Thuộc tính | `MaNhanVien: String` | Hướng dẫn viên thực hiện điểm danh. |
| Thuộc tính | `ThoiGian: Timestamp` | Thời điểm ghi nhận. |
| Thuộc tính | `DiaDiem: String` | Nơi diễn ra điểm danh. |
| Thuộc tính | `TrangThai: String` | `DA_DIEM_DANH`, `CHUA_DIEM_DANH` hoặc `VANG`. |
| Phương thức | `DanhSachDoan(MaTourThucTe)` | Trả về đoàn khách để hướng dẫn viên thao tác. |
| Phương thức | `DiemDanh(MaTourThucTe, YeuCauDiemDanh)` | Ghi nhận trạng thái có mặt của hành khách. |

## 3.4.5.25. HANHDONG

**Bảng 3.84. Mô tả chi tiết thực thể HANHDONG**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaGhiNhanHanhDong: String` | Mã lần ghi nhận hành động, là khóa chính. |
| Thuộc tính | `MaTourThucTe: String` | Chuyến phát sinh hành động xanh. |
| Thuộc tính | `MaKhachHang: String` | Khách hàng được cộng điểm. |
| Thuộc tính | `MaHanhDongXanh: String` | Loại hành động xanh được thực hiện. |
| Thuộc tính | `MaNhanVienXacMinh: String` | Hướng dẫn viên xác minh hành động. |
| Thuộc tính | `ThoiGian: Timestamp` | Thời điểm xác minh. |
| Thuộc tính | `MinhChung: String` | Nội dung hoặc đường dẫn minh chứng. |
| Phương thức | `GhiNhanHanhDong(MaTourThucTe, YeuCau)` | Xác minh một hành động và lưu bản ghi. |
| Phương thức | `CongDiemXanh(MaKhachHang, MaHanhDongXanh)` | Cộng điểm tương ứng vào hồ sơ khách, được thực hiện bên trong nghiệp vụ `GhiNhanHanhDong()`. |

## 3.4.5.26. NHATKYSUCO

**Bảng 3.85. Mô tả chi tiết thực thể NHATKYSUCO**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaNhatKySuCo: String` | Mã báo cáo sự cố, là khóa chính. |
| Thuộc tính | `MaTourThucTe: String` | Chuyến phát sinh sự cố. |
| Thuộc tính | `MaNhanVienBaoCao: String` | Nhân viên báo cáo sự cố. |
| Thuộc tính | `MaKhachHang: String` | Khách hàng liên quan nếu có. |
| Thuộc tính | `MaNguoiDongHanh: String` | Người đồng hành liên quan nếu có. |
| Thuộc tính | `MoTa: String` | Nội dung mô tả sự cố. |
| Thuộc tính | `GiaiPhap: String` | Biện pháp xử lý sự cố. |
| Thuộc tính | `MucDo: String` | Mức độ: `THAP` hoặc `SOS`. |
| Thuộc tính | `LoaiSuCo: String` | Loại sự cố như y tế, thời tiết hoặc phương tiện. |
| Thuộc tính | `ThoiGianBaoCao: Timestamp` | Thời điểm lập báo cáo. |
| Phương thức | `BaoCaoSuCo(MaTourThucTe, YeuCauSuCo)` | Hướng dẫn viên tạo báo cáo trong chuyến đi. |
| Phương thức | `CapNhatSuCo(MaNhatKySuCo, GiaiPhap)` | Bổ sung giải pháp hoặc trạng thái xử lý. |
| Phương thức | `DanhSachSuCo(DieuKien)` | Tra cứu sự cố phục vụ điều hành. |
| Phương thức | `LichSuSuCoCuaHuongDanVien(MucDo, MaTaiKhoan)` | Lấy các sự cố do hướng dẫn viên hiện tại đã báo cáo. |

## 3.4.5.27. CHIPHITHUCTE

**Bảng 3.86. Mô tả chi tiết thực thể CHIPHITHUCTE**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaChiPhiThucTe: String` | Mã khoản chi thực tế, là khóa chính. |
| Thuộc tính | `MaTourThucTe: String` | Tour thực tế phát sinh chi phí. |
| Thuộc tính | `MaNhanVien: String` | Nhân viên kê khai chi phí. |
| Thuộc tính | `DanhMuc: String` | Nội dung hoặc nhóm chi phí. |
| Thuộc tính | `ThanhTien: Decimal` | Số tiền kê khai. |
| Thuộc tính | `HoaDonAnh: String` | Đường dẫn ảnh chứng từ. |
| Thuộc tính | `TrangThaiDuyet: String` | Trạng thái kiểm tra chứng từ. |
| Thuộc tính | `NgayKhai: Timestamp` | Thời điểm lập khoản chi. |
| Phương thức | `KhaiChiPhi(MaTourThucTe, ThongTinChiPhi)` | Hướng dẫn viên khai khoản chi phát sinh. |
| Phương thức | `ChiPhiCuaTour(MaTourThucTe)` | Lấy danh sách chi phí phát sinh của một tour. |
| Phương thức | `LichSuChiPhiCuaHuongDanVien(MaTaiKhoan)` | Tra cứu các khoản chi do hướng dẫn viên đã kê khai. |
| Phương thức | `BoSungChiPhi(MaChiPhi, ThongTin)` | Bổ sung hồ sơ theo yêu cầu xử lý. |
| Phương thức | `DanhSachChiPhiChoXuLy(TrangThai, MaTourThucTe)` | Liệt kê chi phí chờ nhân viên nghiệp vụ xử lý. |
| Phương thức | `DuyetChiPhi(MaChiPhi)` | Duyệt khoản chi hợp lệ. |
| Phương thức | `TuChoiChiPhi(MaChiPhi)` | Từ chối khoản chi không hợp lệ. |
| Phương thức | `YeuCauBoSungChiPhi(MaChiPhi)` | Yêu cầu người kê khai bổ sung chứng từ chi phí. |
| Phương thức | `DanhSachCanhBaoChiPhi(TrangThai, LoaiCanhBao)` | Lập danh sách cảnh báo động từ dữ liệu chi phí. |
| Phương thức | `ChiTietCanhBaoChiPhi(MaCanhBao)` | Xem chi tiết cảnh báo được tính từ một khoản chi. |

## 3.4.5.28. QUYETTOAN

**Bảng 3.87. Mô tả chi tiết thực thể QUYETTOAN**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaQuyetToan: String` | Mã quyết toán, là khóa chính. |
| Thuộc tính | `MaTourThucTe: String` | Tour được quyết toán, duy nhất cho mỗi quyết toán. |
| Thuộc tính | `TongDoanhThu: Decimal` | Tổng doanh thu thanh toán thành công. |
| Thuộc tính | `TongChiPhi: Decimal` | Tổng chi phí đã được duyệt. |
| Thuộc tính | `GiaCamKet: Decimal` | Giá hoặc chi phí cam kết nếu có. |
| Thuộc tính | `LoiNhuan: Decimal` | Chênh lệch giữa doanh thu và chi phí. |
| Thuộc tính | `MaNhanVien: String` | Nhân viên kế toán thực hiện quyết toán. |
| Thuộc tính | `NgayQuyetToan: Timestamp` | Thời điểm quyết toán. |
| Thuộc tính | `TrangThai: String` | Trạng thái hoàn thành quyết toán. |
| Thuộc tính | `GhiChu: String` | Ghi chú nghiệp vụ. |
| Thuộc tính | `HoaDonAnh: String` | Chứng từ tổng hợp đính kèm. |
| Phương thức | `TourCanQuyetToan()` | Liệt kê các tour đủ điều kiện lập quyết toán. |
| Phương thức | `TinhToanQuyetToan(MaTourThucTe)` | Tính doanh thu, chi phí và lợi nhuận dự kiến của tour. |
| Phương thức | `TaoQuyetToan(MaTourThucTe, ThongTin)` | Lập quyết toán cho tour đã hoàn thành. |
| Phương thức | `ChotQuyetToan(MaQuyetToan)` | Xác nhận hoàn tất quyết toán. |
| Phương thức | `DanhSachQuyetToan(TrangThai)` | Tra cứu các quyết toán theo trạng thái. |
| Phương thức | `ChiTietQuyetToan(MaQuyetToan)` | Xem thông tin chi tiết của quyết toán. |
| Phương thức | `YeuCauBoSungQuyetToan(MaQuyetToan, NoiDung)` | Gửi yêu cầu bổ sung hồ sơ quyết toán. |
| Phương thức | `DanhSachCanBoSungCuaHuongDanVien(MaTaiKhoan)` | Liệt kê quyết toán cần hướng dẫn viên bổ sung. |
| Phương thức | `HuongDanVienBoSungQuyetToan(MaQuyetToan, ThongTin)` | Hướng dẫn viên cập nhật chứng từ theo yêu cầu. |
| Phương thức | `BaoCaoDoanhThu(TuNgay, DenNgay)` | Tổng hợp doanh thu từ dữ liệu quyết toán. |

## 3.4.5.29. NHATKYDOIDIEM

**Bảng 3.88. Mô tả chi tiết thực thể NHATKYDOIDIEM**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaNhatKyDoiDiem: String` | Mã lần quy đổi điểm, là khóa chính. |
| Thuộc tính | `MaKhachHang: String` | Khách hàng sử dụng điểm. |
| Thuộc tính | `MaVoucher: String` | Voucher khách nhận sau khi đổi. |
| Thuộc tính | `DiemQuyDoi: Long` | Số điểm xanh đã trừ. |
| Thuộc tính | `NgayQuyDoi: Timestamp` | Thời điểm hoàn tất đổi điểm. |
| Phương thức | `DoiDiem(MaTaiKhoan, MaVoucher)` | Kiểm tra số dư điểm, trao voucher và trừ điểm. |
| Phương thức | `GhiNhatKyDoiDiem(MaKhachHang, MaVoucher, Diem)` | Lưu bản ghi quy đổi gián tiếp bên trong nghiệp vụ `DoiDiem()`. |

## 3.4.5.30. YEUCAUHOTRO

**Bảng 3.89. Mô tả chi tiết thực thể YEUCAUHOTRO**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaYeuCauHoTro: String` | Mã yêu cầu hỗ trợ, là khóa chính. |
| Thuộc tính | `MaDatTour: String` | Đơn đặt liên quan nếu yêu cầu phát sinh từ đơn. |
| Thuộc tính | `MaKhachHang: String` | Khách hàng gửi yêu cầu. |
| Thuộc tính | `LoaiYeuCau: String` | Loại yêu cầu như hỗ trợ, khiếu nại hoặc hủy tour. |
| Thuộc tính | `NoiDung: String` | Nội dung yêu cầu và thông tin bổ sung. |
| Thuộc tính | `TrangThai: String` | Trạng thái trong quy trình xử lý hỗ trợ. |
| Thuộc tính | `MaNhanVienXuLy: String` | Nhân viên tiếp nhận hoặc xử lý yêu cầu. |
| Phương thức | `TaoYeuCau(MaTaiKhoan, NoiDung)` | Khách hàng tạo yêu cầu hỗ trợ mới. |
| Phương thức | `DanhSachYeuCauCuaKhachHang(MaTaiKhoan, LoaiYeuCau)` | Liệt kê yêu cầu do khách hàng hiện tại tạo. |
| Phương thức | `DanhSachCanKhachHangBoSung(MaTaiKhoan)` | Lấy yêu cầu đang chờ khách hàng cung cấp thêm thông tin. |
| Phương thức | `BoSung(MaTaiKhoan, MaYeuCau, NoiDung)` | Khách bổ sung thông tin được yêu cầu. |
| Phương thức | `DanhSachTatCaYeuCau(LoaiYeuCau, TrangThai)` | Nhân viên tra cứu yêu cầu hỗ trợ theo điều kiện. |
| Phương thức | `XuLy(MaYeuCau, KetQua, MaNhanVien)` | Nhân viên cập nhật kết quả xử lý. |
| Phương thức | `YeuCauHuongDanVienGiaiTrinh(MaYeuCau, NoiDung)` | Chuyển yêu cầu sang trạng thái chờ hướng dẫn viên giải trình. |
| Phương thức | `YeuCauKhachHangBoSung(MaYeuCau, NoiDung)` | Chuyển yêu cầu sang trạng thái chờ khách bổ sung. |
| Phương thức | `DanhSachGiaiTrinhCuaHuongDanVien(MaTaiKhoan)` | Liệt kê các yêu cầu hướng dẫn viên phải giải trình. |
| Phương thức | `HuongDanVienCapNhatGiaiTrinh(MaTaiKhoan, MaYeuCau, NoiDung)` | Ghi nhận nội dung giải trình của hướng dẫn viên. |
| Phương thức | `ChiTietYeuCau(MaYeuCau)` | Lấy thông tin chi tiết của yêu cầu hỗ trợ. |
| Phương thức | `YeuCauHuyTour(MaTaiKhoan, MaDatTour)` | Tạo yêu cầu hủy tour và hoàn tiền theo chính sách. |
| Phương thức | `DuyetHuyTour(MaYeuCau, MaNhanVien)` | Duyệt yêu cầu hủy tour và khởi tạo hoàn tiền nếu cần. |
| Phương thức | `TuChoiHuyTour(MaYeuCau, MaNhanVien)` | Từ chối yêu cầu hủy tour. |
| Phương thức | `DanhSachYeuCauHuy(LoaiYeuCau, TrangThai)` | Liệt kê yêu cầu hủy phục vụ xử lý nghiệp vụ. |

## 3.4.5.31. DANHGIAKH

**Bảng 3.90. Mô tả chi tiết thực thể DANHGIAKH**

| Nhóm | Tên | Ý nghĩa |
| --- | --- | --- |
| Thuộc tính | `MaDanhGiaKhachHang: String` | Mã đánh giá của khách, là khóa chính. |
| Thuộc tính | `MaTourThucTe: String` | Tour thực tế được đánh giá. |
| Thuộc tính | `MaKhachHang: String` | Khách hàng gửi đánh giá. |
| Thuộc tính | `SoSao: Integer` | Số sao đánh giá từ 1 đến 5. |
| Thuộc tính | `NhanXet: String` | Nhận xét bằng văn bản của khách. |
| Thuộc tính | `NgayDanhGia: Timestamp` | Thời điểm khách gửi đánh giá. |
| Phương thức | `GuiDanhGia(MaTaiKhoan, ThongTinDanhGia)` | Ghi nhận đánh giá của khách đã tham gia tour. |
| Phương thức | `DanhSachDanhGia(MaTourThucTe)` | Hiển thị đánh giá của một chuyến tour. |
| Phương thức | `TatCaDanhGia()` | Trả về toàn bộ đánh giá phục vụ quản trị. |
| Phương thức | `CapNhatDiemTrungBinhTourMau()` | Tính lại điểm trung bình sản phẩm sau đánh giá. |
| Phương thức | `CapNhatDiemTrungBinhHuongDanVien()` | Tính lại điểm năng lực hướng dẫn viên sau đánh giá. |

## Nghiệp vụ liên thực thể

Các chức năng sau tồn tại tại tầng service/controller nhưng khai thác nhiều thực thể đồng thời, vì vậy không được xem là phương thức riêng của một bảng dữ liệu:

| Tên phương thức | Ý nghĩa | Thực thể dữ liệu liên quan |
| --- | --- | --- |
| `DanhSachKhoDuLieuBaoCao()` | Liệt kê các tập dữ liệu có thể phục vụ phân tích và báo cáo. | `QUYETTOAN`, `DONDATTOUR`, `CHIPHITHUCTE`, `TOURTHUCTE`, `GIAODICH` |
| `LayThongTinKetNoiBaoCao(MaKhoDuLieu)` | Trả về thông tin kết nối nguồn dữ liệu báo cáo theo quyền truy cập. | Nguồn cấu hình báo cáo và `NHATKYHETHONG` |
| `XuatDuLieuBaoCao(YeuCauXuat)` | Xuất dữ liệu theo khoảng thời gian và ghi nhận nhật ký thao tác. | `QUYETTOAN`, `DONDATTOUR`, `CHIPHITHUCTE`, `TOURTHUCTE`, `GIAODICH`, `NHATKYHETHONG` |

Các hàm chuyển đổi dữ liệu trả về như `ChuyenDoiPhanHoi()` (tương ứng các hàm `toResponse()` trong code), hàm sinh mã tự động, hàm tra cứu nội bộ phục vụ xác thực/phân quyền và điểm kiểm tra thử nghiệm không được liệt kê vì không phải phương thức nghiệp vụ tác động hoặc tra cứu một thực thể.

## Mô tả chi tiết các lớp điều khiển

Các lớp điều khiển dưới đây được đặt tên theo gói quản lý trong biểu đồ lớp, tương ứng với các endpoint trong `be/src/main/java/com/digitaltravel/erp/controller`. Một lớp nghiệp vụ trong bảng có thể gom endpoint từ nhiều lớp Java khi chúng phục vụ cùng nhóm use case; tên phương thức được Việt hóa để thống nhất cách trình bày báo cáo.

## 3.4.5.32. QL_TaiKhoan_Controller

**Bảng 3.91. Mô tả chi tiết lớp điều khiển QL_TaiKhoan_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `DangKyKhachHang()` | Tiếp nhận thông tin đăng ký, kiểm tra dữ liệu trùng và tạo tài khoản khách hàng cùng hồ sơ số. |
| Phương thức | `DangNhap()` | Xác thực tên đăng nhập, mật khẩu và trả thông tin phiên đăng nhập hợp lệ. |
| Phương thức | `DoiMatKhau()` | Tiếp nhận yêu cầu đổi mật khẩu của người dùng đang đăng nhập. |
| Phương thức | `KiemTraMatKhau()` | Xác minh mật khẩu hiện tại trước thao tác bảo mật. |
| Phương thức | `QuenMatKhau()` | Tiếp nhận email và tạo yêu cầu đặt lại mật khẩu. |
| Phương thức | `DatLaiMatKhau()` | Cập nhật mật khẩu mới theo mã đặt lại hợp lệ. |
| Phương thức | `DangXuat()` | Kết thúc phiên đăng nhập. |
| Phương thức | `DangKyNhanVien()` | Tạo tài khoản và hồ sơ nhân viên bởi quản trị viên. |

## 3.4.5.33. QL_NhanVien_Controller

**Bảng 3.92. Mô tả chi tiết lớp điều khiển QL_NhanVien_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `DanhSachNhanVien()` | Trả về danh sách nhân viên theo tên, vai trò và trạng thái. |
| Phương thức | `ChiTietNhanVien()` | Trả về hồ sơ chi tiết của một nhân viên. |
| Phương thức | `KhoaTaiKhoanNhanVien()` | Khóa quyền truy cập của nhân viên. |
| Phương thức | `MoKhoaTaiKhoanNhanVien()` | Khôi phục quyền truy cập của nhân viên đã khóa. |
| Phương thức | `GanVaiTroNhanVien()` | Cập nhật vai trò truy cập của nhân viên. |
| Phương thức | `LayHoSoCaNhan()` | Trả về hồ sơ của nhân viên đang đăng nhập. |
| Phương thức | `LayNangLucCuaToi()` | Trả về năng lực của hướng dẫn viên đang đăng nhập. |
| Phương thức | `LayNangLucNhanVien()` | Trả về thông tin năng lực của hướng dẫn viên/nhân viên. |
| Phương thức | `CapNhatNangLucNhanVien()` | Cập nhật ngôn ngữ, chứng chỉ và chuyên môn. |

## 3.4.5.34. QL_NhatKyHeThong_Controller

**Bảng 3.93. Mô tả chi tiết lớp điều khiển QL_NhatKyHeThong_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `XemNhatKyHeThong()` | Lọc và trả về nhật ký thao tác hệ thống cho quản trị viên. |

## 3.4.5.35. QL_TourMau_Controller

**Bảng 3.94. Mô tả chi tiết lớp điều khiển QL_TourMau_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `DanhSachTourMau()` | Tra cứu danh sách tour mẫu theo tiêu đề và thời lượng. |
| Phương thức | `ChiTietTourMau()` | Trả về tour mẫu cùng các dòng lịch trình. |
| Phương thức | `ThemTourMau()` | Tiếp nhận dữ liệu để tạo tour mẫu mới. |
| Phương thức | `CapNhatTourMau()` | Cập nhật thông tin sản phẩm tour mẫu. |
| Phương thức | `XoaTourMau()` | Xóa tour mẫu nếu chưa có chuyến thực tế liên kết. |
| Phương thức | `SaoChepTourMau()` | Tạo bản sao tour mẫu kèm lịch trình. |
| Phương thức | `ThemLichTrinhTour()` | Thêm ngày lịch trình vào tour mẫu. |
| Phương thức | `SuaLichTrinhTour()` | Cập nhật ngày lịch trình đã có. |
| Phương thức | `XoaLichTrinhTour()` | Xóa ngày lịch trình khỏi tour mẫu. |

## 3.4.5.36. QL_TourThucTe_Controller

**Bảng 3.95. Mô tả chi tiết lớp điều khiển QL_TourThucTe_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `DanhSachTourThucTe()` | Tra cứu chuyến tour thực tế nội bộ theo trạng thái, tour mẫu và giá. |
| Phương thức | `ChiTietTourThucTe()` | Trả về chi tiết chuyến thực tế để điều hành quản lý. |
| Phương thức | `KhoiTaoTourThucTe()` | Tạo chuyến khởi hành từ tour mẫu. |
| Phương thức | `CapNhatTourThucTe()` | Cập nhật giá, sức chứa, dịch vụ, hành động xanh hoặc trạng thái chuyến. |
| Phương thức | `XoaTourThucTe()` | Hủy/xóa chuyến chưa phát sinh đơn bị ràng buộc. |
| Phương thức | `DanhSachTourCongKhai()` | Trả danh sách chuyến mở bán cho khách hàng. |
| Phương thức | `ChiTietTourCongKhai()` | Trả chi tiết tour, lịch trình, dịch vụ và hành động xanh để khách xem. |

## 3.4.5.37. DichVu_Controller

**Bảng 3.96. Mô tả chi tiết lớp điều khiển DichVu_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `DanhSachDichVuThem()` | Liệt kê danh mục dịch vụ bổ sung. |
| Phương thức | `ChiTietDichVuThem()` | Xem thông tin của một dịch vụ. |
| Phương thức | `ThemDichVuThem()` | Tạo dịch vụ bổ sung mới. |
| Phương thức | `CapNhatDichVuThem()` | Sửa thông tin dịch vụ bổ sung. |
| Phương thức | `XoaDichVuThem()` | Xóa dịch vụ khỏi danh mục. |
| Phương thức | `DanhSachDichVuTheoTour()` | Trả dịch vụ khả dụng khi khách chọn một chuyến. |

## 3.4.5.38. HD_Xanh_Controller

**Bảng 3.97. Mô tả chi tiết lớp điều khiển HD_Xanh_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `DanhSachHanhDongXanh()` | Liệt kê hành động xanh, có thể lọc theo chuyến tour. |
| Phương thức | `ChiTietHanhDongXanh()` | Xem nội dung và điểm cộng của hành động xanh. |
| Phương thức | `ThemHanhDongXanh()` | Tạo danh mục hành động xanh mới. |
| Phương thức | `CapNhatHanhDongXanh()` | Cập nhật tên hành động hoặc điểm cộng. |
| Phương thức | `XoaHanhDongXanh()` | Xóa hành động xanh khỏi danh mục. |
| Phương thức | `LayHanhDongXanhTheoTour()` | Trả hành động xanh đã cấu hình cho chuyến công khai. |

## 3.4.5.39. QL_HoSoSo_Controller

**Bảng 3.98. Mô tả chi tiết lớp điều khiển QL_HoSoSo_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `LayHoSoSo()` | Lấy hồ sơ số của khách hàng hiện tại. |
| Phương thức | `CapNhatHoSoSo()` | Cập nhật thông tin sức khỏe và dị ứng của khách. |
| Phương thức | `LichSuTour()` | Trả về lịch sử chuyến đi của khách hàng. |
| Phương thức | `TimKiemKhachHang()` | Nhân viên kinh doanh tra cứu hồ sơ khách hàng. |
| Phương thức | `ChiTietKhachHang()` | Nhân viên kinh doanh xem chi tiết một hồ sơ khách hàng. |

## 3.4.5.40. QL_DatTour_Controller

**Bảng 3.99. Mô tả chi tiết lớp điều khiển QL_DatTour_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `DatTour()` | Tạo đơn đặt tour từ thông tin hành khách, dịch vụ và hành động xanh khách chọn. |
| Phương thức | `DanhSachDatTourCuaToi()` | Liệt kê đơn đặt thuộc khách hàng đăng nhập. |
| Phương thức | `ChiTietDatTourCuaToi()` | Xem chi tiết đơn đặt của khách. |
| Phương thức | `HuyDatTour()` | Hủy đơn chưa đi vào quy trình hoàn tiền. |
| Phương thức | `YeuCauHuyTour()` | Gửi yêu cầu hủy đối với đơn cần xử lý chính sách hoàn tiền. |
| Phương thức | `KhoiTaoThanhToan()` | Tạo giao dịch thanh toán cho đơn. |
| Phương thức | `XacNhanDaChuyenKhoan()` | Ghi nhận khách đã thực hiện chuyển khoản. |
| Phương thức | `HetHanThanhToanMaQr()` | Cập nhật phiên thanh toán QR hết hạn. |
| Phương thức | `KetQuaThanhToan()` | Lấy trạng thái thanh toán của đơn. |

## 3.4.5.41. QL_UuDai_Controller

**Bảng 3.100. Mô tả chi tiết lớp điều khiển QL_UuDai_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `XemViVoucher()` | Lấy danh sách voucher khách hàng đang sở hữu. |
| Phương thức | `DanhSachVoucherCoTheDoi()` | Hiển thị các voucher có thể đổi bằng điểm xanh. |
| Phương thức | `ApDungVoucher()` | Áp voucher trong ví vào đơn đặt tour. |
| Phương thức | `DoiDiemLayVoucher()` | Quy đổi điểm xanh thành voucher cho khách. |

## 3.4.5.42. QL_DonHang_Controller

**Bảng 3.101. Mô tả chi tiết lớp điều khiển QL_DonHang_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `TraCuuDonHang()` | Nhân viên kinh doanh tra cứu đơn đặt tour theo trạng thái và chuyến. |
| Phương thức | `XacNhanThanhToanDonHang()` | Duyệt thanh toán và xác nhận đơn hợp lệ. |
| Phương thức | `TuChoiThanhToanDonHang()` | Từ chối thông tin thanh toán không hợp lệ. |

## 3.4.5.43. QL_KhuyenMai_KH_Controller

**Bảng 3.102. Mô tả chi tiết lớp điều khiển QL_KhuyenMai_KH_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `DanhSachVoucher()` | Liệt kê voucher phục vụ quản lý khuyến mãi. |
| Phương thức | `ChiTietVoucher()` | Xem thông tin cấu hình voucher. |
| Phương thức | `TaoVoucher()` | Tạo voucher mới. |
| Phương thức | `CapNhatVoucher()` | Sửa nội dung hoặc điều kiện voucher. |
| Phương thức | `VoHieuHoaVoucher()` | Dừng hiệu lực voucher. |
| Phương thức | `PhatHanhVoucherChoKhachHang()` | Phân phối voucher vào ví khách hàng. |
| Phương thức | `DanhSachKhachHangDaPhanBo()` | Xem những khách hàng đã được nhận voucher. |
| Phương thức | `ThuHoiVoucher()` | Thu hồi voucher đã phân phối nhưng chưa sử dụng. |

## 3.4.5.44. QL_HDV_Controller

**Bảng 3.103. Mô tả chi tiết lớp điều khiển QL_HDV_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `DanhSachTourCanPhanCong()` | Lấy chuyến đang chờ bố trí hướng dẫn viên. |
| Phương thức | `TimHuongDanVienKhaDung()` | Tìm hướng dẫn viên không trùng lịch để nhận chuyến. |
| Phương thức | `PhanCongHuongDanVien()` | Tạo phân công cho hướng dẫn viên đã chọn. |
| Phương thức | `HuyPhanCong()` | Hủy phân công của chuyến. |
| Phương thức | `TourCuaHuongDanVien()` | Lấy danh sách chuyến được giao cho hướng dẫn viên hiện tại. |
| Phương thức | `DongYPhanCong()` | Hướng dẫn viên chấp nhận yêu cầu phân công. |
| Phương thức | `TuChoiPhanCong()` | Hướng dẫn viên từ chối yêu cầu phân công. |
| Phương thức | `LichCongTacCuaToi()` | Hướng dẫn viên xem lịch công tác của tài khoản đang đăng nhập. |
| Phương thức | `LichCongTacNhanVien()` | Tra cứu lịch công tác của hướng dẫn viên. |
| Phương thức | `LayHoSoCaNhan()` | Hướng dẫn viên xem hồ sơ nhân viên gắn với tài khoản đang đăng nhập. |
| Phương thức | `LayNangLucCuaToi()` | Hướng dẫn viên xem hồ sơ năng lực của bản thân. |
| Phương thức | `DanhSachYeuCauGiaiTrinh()` | Lấy các yêu cầu cần hướng dẫn viên giải trình. |
| Phương thức | `CapNhatGiaiTrinh()` | Nhận nội dung giải trình do hướng dẫn viên gửi. |
| Phương thức | `DanhSachQuyetToanCanBoSung()` | Lấy các quyết toán cần hướng dẫn viên bổ sung chứng từ. |
| Phương thức | `BoSungQuyetToan()` | Nhận ghi chú hoặc ảnh hóa đơn bổ sung từ hướng dẫn viên. |

## 3.4.5.45. QL_KhieuNai_Controller

**Bảng 3.104. Mô tả chi tiết lớp điều khiển QL_KhieuNai_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `TaoYeuCauHoTro()` | Khách gửi khiếu nại hoặc yêu cầu hỗ trợ. |
| Phương thức | `DanhSachYeuCauCuaToi()` | Khách xem các yêu cầu đã gửi. |
| Phương thức | `DanhSachYeuCauCanBoSung()` | Khách xem yêu cầu đang cần bổ sung. |
| Phương thức | `BoSungYeuCau()` | Khách cập nhật thêm nội dung cho yêu cầu. |
| Phương thức | `DanhSachYeuCauHoTro()` | Nhân viên tra cứu yêu cầu hỗ trợ/khiếu nại. |
| Phương thức | `XuLyYeuCauHoTro()` | Nhân viên cập nhật phương án giải quyết. |
| Phương thức | `DanhSachYeuCauHuy()` | Nhân viên tra cứu các yêu cầu hủy tour hoặc hoàn tiền. |
| Phương thức | `DuyetHuyTour()` | Duyệt yêu cầu hủy tour và chuyển sang quy trình hoàn tiền nếu cần. |
| Phương thức | `TuChoiHuyTour()` | Từ chối yêu cầu hủy tour không được chấp nhận. |
| Phương thức | `YeuCauHuongDanVienGiaiTrinh()` | Chuyển yêu cầu cho HDV cung cấp giải trình. |
| Phương thức | `YeuCauKhachHangBoSung()` | Yêu cầu khách bổ sung dữ liệu còn thiếu. |
| Phương thức | `DanhSachGiaiTrinhCuaHuongDanVien()` | HDV xem các yêu cầu đang chờ mình giải trình. |
| Phương thức | `CapNhatGiaiTrinhHuongDanVien()` | HDV gửi nội dung giải trình liên quan khiếu nại. |

## 3.4.5.46. QL_Doan_Controller

**Bảng 3.105. Mô tả chi tiết lớp điều khiển QL_Doan_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `XemLichTrinhTour()` | Trả lịch trình chuyến đang phụ trách cho HDV. |
| Phương thức | `DanhSachDoan()` | Trả danh sách thành viên thuộc đoàn đã xác nhận. |
| Phương thức | `DiemDanhKhachHang()` | Lưu trạng thái có mặt/vắng mặt của thành viên đoàn. |
| Phương thức | `XacNhanHanhDongXanh()` | Ghi nhận hành động xanh đã được HDV xác minh cho khách. |

## 3.4.5.47. Nky_SuCo_Controller

**Bảng 3.106. Mô tả chi tiết lớp điều khiển Nky_SuCo_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `DanhSachSuCoTheoTour()` | Xem các sự cố đã báo cáo của chuyến. |
| Phương thức | `LichSuSuCoCuaHuongDanVien()` | Xem lịch sử sự cố do HDV hiện tại lập. |
| Phương thức | `BaoCaoSuCo()` | Tạo báo cáo sự cố phát sinh khi vận hành tour. |
| Phương thức | `CapNhatSuCo()` | Cập nhật giải pháp xử lý của báo cáo sự cố. |

## 3.4.5.48. QL_ChiPhi_Controller

**Bảng 3.107. Mô tả chi tiết lớp điều khiển QL_ChiPhi_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `KhaiChiPhiThucTe()` | HDV tạo khoản chi phát sinh có chứng từ. |
| Phương thức | `ChiPhiCuaTour()` | Xem khoản chi thuộc chuyến tour. |
| Phương thức | `LichSuChiPhiCuaHuongDanVien()` | HDV xem các khoản chi đã kê khai. |
| Phương thức | `BoSungChiPhi()` | HDV cập nhật khoản chi bị yêu cầu bổ sung. |
| Phương thức | `DanhSachChiPhiChoXuLy()` | Kế toán lọc các khoản chi cần phê duyệt. |
| Phương thức | `DuyetChiPhi()` | Kế toán phê duyệt chi phí hợp lệ. |
| Phương thức | `TuChoiChiPhi()` | Kế toán từ chối chi phí. |
| Phương thức | `YeuCauBoSungChiPhi()` | Yêu cầu HDV bổ sung chứng từ chi phí. |
| Phương thức | `DanhSachCanhBaoChiPhi()` | Trả danh sách cảnh báo chi phí bất thường. |
| Phương thức | `ChiTietCanhBaoChiPhi()` | Xem nội dung cảnh báo của khoản chi. |

## 3.4.5.49. QL_QuyetToan_Controller

**Bảng 3.108. Mô tả chi tiết lớp điều khiển QL_QuyetToan_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `TourCanQuyetToan()` | Liệt kê tour cần kế toán quyết toán. |
| Phương thức | `TinhLoiNhuanTour()` | Tính doanh thu, chi phí và lợi nhuận của tour. |
| Phương thức | `TaoQuyetToan()` | Tạo bản quyết toán cho chuyến đã kết thúc. |
| Phương thức | `ChotQuyetToan()` | Hoàn tất quyết toán sau kiểm tra. |
| Phương thức | `YeuCauBoSungQuyetToan()` | Yêu cầu HDV bổ sung chứng từ. |
| Phương thức | `DanhSachQuyetToan()` | Tra cứu bản quyết toán theo trạng thái. |
| Phương thức | `ChiTietQuyetToan()` | Xem nội dung một bản quyết toán. |
| Phương thức | `DanhSachCanBoSungCuaHuongDanVien()` | HDV liệt kê các quyết toán đang được yêu cầu bổ sung chứng từ. |
| Phương thức | `HuongDanVienBoSungQuyetToan()` | HDV gửi ghi chú và ảnh hóa đơn bổ sung cho quyết toán. |
| Phương thức | `DanhSachChoHoanTien()` | Lấy các giao dịch hoàn tiền cần xử lý. |
| Phương thức | `XacNhanHoanTien()` | Xác nhận đã hoàn tiền cho khách. |
| Phương thức | `TuChoiHoanTien()` | Từ chối yêu cầu hoàn tiền. |

## 3.4.5.50. QL_DanhGia_Controller

**Bảng 3.109. Mô tả chi tiết lớp điều khiển QL_DanhGia_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `GuiDanhGia()` | Tiếp nhận đánh giá từ khách đã tham gia chuyến và cập nhật điểm tổng hợp. |
| Phương thức | `DanhSachDanhGiaTour()` | Trả đánh giá hiển thị tại chi tiết tour công khai. |
| Phương thức | `TatCaDanhGia()` | Trả danh sách đánh giá cho nhân viên kinh doanh quản lý. |

## 3.4.5.51. QL_BaoCao_Controller

**Bảng 3.110. Mô tả chi tiết lớp điều khiển QL_BaoCao_Controller**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `BaoCaoDoanhThu()` | Tổng hợp doanh thu trong khoảng ngày yêu cầu. |
| Phương thức | `DanhSachKhoDuLieuBaoCao()` | Liệt kê nguồn dữ liệu có thể dùng cho Power BI. |
| Phương thức | `LayThongTinKetNoiBaoCao()` | Trả thông tin kết nối cho tập dữ liệu được chọn. |
| Phương thức | `XuatDuLieuBaoCao()` | Xuất dữ liệu báo cáo ra tệp phục vụ phân tích. |

## Mô tả chi tiết các lớp giao diện

Các lớp giao diện sau tương ứng các trang React hoặc nhóm màn hình của hệ thống. Phạm vi use case được ghi tại tên bảng để thuận tiện vẽ sơ đồ theo từng gói quản lý.

## 3.4.5.52. QL_TourMau_GUI

**Bảng 3.111. Mô tả chi tiết lớp giao diện QL_TourMau_GUI (UC01-UC06)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiDanhSachTourMau()` | Hiển thị danh sách và bộ lọc tour mẫu trên trang quản lý sản phẩm. |
| Phương thức | `HienThiChiTietTourMau()` | Mở thông tin chi tiết tour mẫu được chọn. |
| Phương thức | `MoFormThemTourMau()` | Hiển thị biểu mẫu tạo tour mẫu. |
| Phương thức | `GuiThongTinThemTourMau()` | Gửi dữ liệu tour mẫu và lịch trình ban đầu để lưu. |
| Phương thức | `MoFormCapNhatTourMau()` | Hiển thị dữ liệu tour mẫu để chỉnh sửa. |
| Phương thức | `XacNhanXoaTourMau()` | Hiển thị xác nhận và gửi thao tác xóa. |
| Phương thức | `SaoChepTourMau()` | Gửi yêu cầu sao chép tour mẫu được chọn. |

## 3.4.5.53. QL_LichTrinhTour_GUI

**Bảng 3.112. Mô tả chi tiết lớp giao diện QL_LichTrinhTour_GUI (UC07-UC09)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiDanhSachLichTrinh()` | Hiển thị các ngày lịch trình thuộc tour mẫu. |
| Phương thức | `ThemNgayLichTrinh()` | Thu thập và gửi thông tin lịch trình mới. |
| Phương thức | `SuaNgayLichTrinh()` | Cho phép cập nhật hoạt động, mô tả và thực đơn của ngày. |
| Phương thức | `XoaNgayLichTrinh()` | Gửi thao tác xóa ngày lịch trình được chọn. |

## 3.4.5.54. QL_TourThucTe_GUI

**Bảng 3.113. Mô tả chi tiết lớp giao diện QL_TourThucTe_GUI (UC10-UC14)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiDanhSachTourThucTe()` | Hiển thị các chuyến và trạng thái vận hành. |
| Phương thức | `MoTrinhKhoiTaoChuyenTour()` | Hiển thị các bước chọn tour mẫu, dịch vụ và hành động xanh. |
| Phương thức | `GuiYeuCauKhoiTaoTour()` | Gửi dữ liệu tạo chuyến khởi hành mới. |
| Phương thức | `HienThiChiTietTourThucTe()` | Xem giá, số chỗ và cấu hình của chuyến. |
| Phương thức | `CapNhatTourThucTe()` | Gửi thay đổi thông tin hoặc trạng thái chuyến. |
| Phương thức | `XacNhanXoaTourThucTe()` | Yêu cầu xóa/hủy chuyến theo điều kiện. |

## 3.4.5.55. DichVu_GUI

**Bảng 3.114. Mô tả chi tiết lớp giao diện DichVu_GUI (UC15-UC19)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiDanhSachDichVu()` | Hiển thị danh mục dịch vụ bổ sung. |
| Phương thức | `MoFormThemDichVu()` | Hiển thị biểu mẫu dịch vụ mới. |
| Phương thức | `CapNhatDichVu()` | Gửi thông tin đã chỉnh sửa của dịch vụ. |
| Phương thức | `XacNhanXoaDichVu()` | Xác nhận xóa dịch vụ được chọn. |
| Phương thức | `ChonDichVuChoTour()` | Cho phép gắn dịch vụ vào tour thực tế hoặc đơn đặt. |

## 3.4.5.56. HD_Xanh_GUI

**Bảng 3.115. Mô tả chi tiết lớp giao diện HD_Xanh_GUI (UC20)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiDanhSachHanhDongXanh()` | Hiển thị các loại hành động và điểm thưởng. |
| Phương thức | `MoFormThemHanhDongXanh()` | Hiển thị form tạo hành động xanh. |
| Phương thức | `CapNhatHanhDongXanh()` | Gửi thông tin chỉnh sửa hành động xanh. |
| Phương thức | `XacNhanXoaHanhDongXanh()` | Xóa hành động khỏi danh mục. |
| Phương thức | `CauHinhHanhDongChoTour()` | Chọn các hành động xanh được áp dụng cho chuyến. |

## 3.4.5.57. QL_HoSoSo_GUI

**Bảng 3.116. Mô tả chi tiết lớp giao diện QL_HoSoSo_GUI (UC21-UC24)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiHoSoSo()` | Hiển thị thông tin hồ sơ, hạng thành viên và điểm xanh của khách. |
| Phương thức | `HienThiLichSuHanhTrinh()` | Hiển thị các chuyến đã đặt hoặc đã tham gia. |
| Phương thức | `MoFormCapNhatHoSo()` | Cho phép khách chỉnh sửa thông tin sức khỏe và dị ứng. |
| Phương thức | `LuuCapNhatHoSo()` | Gửi thông tin hồ sơ đã thay đổi. |
| Phương thức | `HienThiTraCuuKhachHang()` | Hiển thị màn hình nhân viên tìm kiếm và xem hồ sơ khách. |

## 3.4.5.58. QL_DatTour_GUI

**Bảng 3.117. Mô tả chi tiết lớp giao diện QL_DatTour_GUI (UC25-UC29, UC32-UC33)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiDanhSachTourCongKhai()` | Hiển thị chuyến đang mở bán và bộ lọc tìm tour. |
| Phương thức | `HienThiChiTietTour()` | Hiển thị lịch trình, dịch vụ, hành động xanh và đánh giá tour. |
| Phương thức | `MoCuaSoDatTour()` | Mở quy trình đặt tour nhiều bước. |
| Phương thức | `NhapThongTinHanhKhach()` | Nhập người đặt và người đồng hành, có dữ liệu hồ sơ tự điền. |
| Phương thức | `ChonDichVuVaHanhDongXanh()` | Chọn dịch vụ thêm và hành động xanh cho đơn. |
| Phương thức | `HienThiTongKetDonHang()` | Hiển thị số tiền và ưu đãi trước thanh toán. |
| Phương thức | `ChonPhuongThucThanhToan()` | Khởi tạo thanh toán và hiển thị thông tin chuyển khoản/QR. |
| Phương thức | `XacNhanDaChuyenKhoan()` | Gửi xác nhận khách đã thanh toán. |
| Phương thức | `HienThiDanhSachDonDaDat()` | Hiển thị các đơn của khách hàng đăng nhập trong hồ sơ số. |
| Phương thức | `HienThiChiTietDonDaDat()` | Xem chi tiết hành khách, dịch vụ và thanh toán của đơn đã đặt. |
| Phương thức | `HuyDonChuaThanhToan()` | Gửi thao tác hủy đơn trực tiếp khi đơn còn đủ điều kiện hủy. |
| Phương thức | `MoYeuCauHuyTour()` | Hiển thị biểu mẫu hủy tour và số tiền hoàn dự kiến. |
| Phương thức | `HienThiTrangThaiHoanTien()` | Hiển thị tiến trình tiếp nhận, xử lý và hoàn tiền của yêu cầu hủy. |

## 3.4.5.59. QL_UuDai_GUI

**Bảng 3.118. Mô tả chi tiết lớp giao diện QL_UuDai_GUI (UC28, UC30-UC31)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiViUuDai()` | Hiển thị voucher hiện có của khách hàng. |
| Phương thức | `HienThiVoucherCoTheDoi()` | Hiển thị voucher có thể quy đổi bằng điểm xanh. |
| Phương thức | `ApDungVoucherVaoDon()` | Gửi voucher được chọn cho đơn đang đặt. |
| Phương thức | `XacNhanDoiDiem()` | Xác nhận dùng điểm xanh để nhận voucher. |

## 3.4.5.60. QL_DonHang_GUI

**Bảng 3.119. Mô tả chi tiết lớp giao diện QL_DonHang_GUI (UC34)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiDanhSachDonHang()` | Hiển thị các đơn đặt tour cho nhân viên kinh doanh. |
| Phương thức | `TimKiemDonHang()` | Gửi điều kiện lọc đơn hàng. |
| Phương thức | `HienThiChiTietDonHang()` | Mở thông tin đơn lấy từ danh sách đã tải; backend kinh doanh hiện chưa có endpoint chi tiết đơn riêng. |
| Phương thức | `DuyetThanhToan()` | Xác nhận thanh toán của đơn từ màn quản lý. |
| Phương thức | `TuChoiThanhToan()` | Từ chối chứng từ hoặc thông tin thanh toán. |

## 3.4.5.61. QL_DanhGia_GUI

**Bảng 3.120. Mô tả chi tiết lớp giao diện QL_DanhGia_GUI (UC35)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `MoFormDanhGiaChuyenDi()` | Hiển thị biểu mẫu gửi sao và nhận xét sau chuyến đi. |
| Phương thức | `GuiDanhGia()` | Gửi nội dung đánh giá của khách hàng. |
| Phương thức | `HienThiDanhGiaTour()` | Hiển thị đánh giá trên trang chi tiết tour. |

## 3.4.5.62. QL_KhieuNai_GUI

**Bảng 3.121. Mô tả chi tiết lớp giao diện QL_KhieuNai_GUI (UC36, UC39)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `MoFormKhieuNai()` | Khách mở biểu mẫu gửi yêu cầu/khiếu nại từ hồ sơ số. |
| Phương thức | `GuiKhieuNai()` | Gửi nội dung yêu cầu đến hệ thống. |
| Phương thức | `HienThiYeuCauCuaToi()` | Khách xem các yêu cầu hỗ trợ hoặc khiếu nại đã gửi. |
| Phương thức | `HienThiYeuCauCanBoSung()` | Khách xem các yêu cầu đang cần bổ sung nội dung. |
| Phương thức | `GuiBoSungYeuCau()` | Khách gửi thông tin bổ sung cho yêu cầu đã tạo. |
| Phương thức | `HienThiDanhSachKhieuNai()` | Nhân viên xem danh sách yêu cầu hỗ trợ. |
| Phương thức | `MoChiTietKhieuNai()` | Xem nội dung và tiến trình xử lý. |
| Phương thức | `XuLyKhieuNai()` | Gửi kết quả giải quyết khiếu nại. |
| Phương thức | `YeuCauBoSungHoacGiaiTrinh()` | Yêu cầu khách hoặc HDV cung cấp thêm dữ liệu. |

## 3.4.5.63. QL_HDV_GUI

**Bảng 3.122. Mô tả chi tiết lớp giao diện QL_HDV_GUI (UC37-UC38)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiTourCanPhanCong()` | Hiển thị tour đang cần hướng dẫn viên. |
| Phương thức | `MoCuaSoPhanCong()` | Hiển thị danh sách HDV khả dụng cho tour. |
| Phương thức | `XacNhanPhanCong()` | Gửi thông tin phân công HDV đã chọn. |
| Phương thức | `HienThiDanhSachHuongDanVien()` | Hiển thị hồ sơ và lịch công tác của HDV. |
| Phương thức | `HienThiYeuCauPhanCong()` | Trên ứng dụng HDV, hiển thị phân công chờ phản hồi. |
| Phương thức | `DongYNhanTour()` | HDV chấp nhận phân công. |
| Phương thức | `TuChoiNhanTour()` | HDV từ chối phân công. |
| Phương thức | `HienThiYeuCauGiaiTrinh()` | Hiển thị các yêu cầu khiếu nại cần HDV phản hồi. |
| Phương thức | `GuiGiaiTrinh()` | Gửi nội dung giải trình của HDV. |
| Phương thức | `HienThiQuyetToanCanBoSung()` | Hiển thị quyết toán cần HDV bổ sung chứng từ. |
| Phương thức | `GuiBoSungQuyetToan()` | Gửi ghi chú hoặc ảnh hóa đơn bổ sung quyết toán. |

## 3.4.5.64. QL_Doan_GUI

**Bảng 3.123. Mô tả chi tiết lớp giao diện QL_Doan_GUI (UC40-UC42)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiLichTrinhChuyenDi()` | Trên ứng dụng HDV, hiển thị lịch trình tour đang phụ trách. |
| Phương thức | `HienThiDanhSachDoan()` | Hiển thị danh sách khách cùng lưu ý sức khỏe. |
| Phương thức | `BatDauDiemDanh()` | Mở màn hình điểm danh cho chuyến hiện tại. |
| Phương thức | `XacNhanDiemDanh()` | Gửi trạng thái điểm danh của khách hàng. |
| Phương thức | `MoFormXacNhanHanhDongXanh()` | Hiển thị biểu mẫu ghi nhận điểm xanh cho khách. |
| Phương thức | `GuiXacNhanHanhDongXanh()` | Gửi minh chứng và hành động đã xác minh. |

## 3.4.5.65. Nky_SuCo_GUI

**Bảng 3.124. Mô tả chi tiết lớp giao diện Nky_SuCo_GUI (UC43)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiDanhSachSuCo()` | Hiển thị sự cố đã ghi nhận theo chuyến hoặc của HDV. |
| Phương thức | `MoFormBaoCaoSuCo()` | Hiển thị biểu mẫu khai báo sự cố mới. |
| Phương thức | `GuiBaoCaoSuCo()` | Gửi mô tả, mức độ và đối tượng liên quan. |
| Phương thức | `CapNhatGiaiPhapSuCo()` | Bổ sung giải pháp xử lý sự cố. |

## 3.4.5.66. QL_ChiPhi_GUI

**Bảng 3.125. Mô tả chi tiết lớp giao diện QL_ChiPhi_GUI (UC44, UC46-UC47)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiChiPhiCuaHuongDanVien()` | Hiển thị chi phí đã khai trên ứng dụng HDV. |
| Phương thức | `MoFormThemChiPhi()` | Hiển thị biểu mẫu khai khoản chi và ảnh hóa đơn. |
| Phương thức | `LuuChiPhi()` | Gửi khoản chi phát sinh của tour. |
| Phương thức | `BoSungChungTuChiPhi()` | HDV cập nhật khoản chi được yêu cầu bổ sung. |
| Phương thức | `HienThiDanhSachChiPhiChoDuyet()` | Kế toán xem khoản chi đang chờ xử lý. |
| Phương thức | `HienThiCanhBaoChiPhi()` | Hiển thị các khoản chi vượt ngưỡng/cần rà soát. |
| Phương thức | `PheDuyetChiPhi()` | Kế toán phê duyệt khoản chi. |
| Phương thức | `TuChoiChiPhi()` | Kế toán từ chối khoản chi. |
| Phương thức | `YeuCauBoSungChiPhi()` | Gửi yêu cầu HDV bổ sung chứng từ. |

## 3.4.5.67. QL_QuyetToan_GUI

**Bảng 3.126. Mô tả chi tiết lớp giao diện QL_QuyetToan_GUI (UC45, UC48-UC50)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiTourCanQuyetToan()` | Hiển thị chuyến cần quyết toán cho kế toán. |
| Phương thức | `TinhLoiNhuan()` | Yêu cầu tính tổng doanh thu, chi phí và lợi nhuận. |
| Phương thức | `MoCuaSoQuyetToan()` | Hiển thị chi tiết quyết toán của tour. |
| Phương thức | `HoanTatQuyetToan()` | Gửi xác nhận chốt quyết toán. |
| Phương thức | `YeuCauHuongDanVienBoSung()` | Yêu cầu bổ sung chứng từ quyết toán. |
| Phương thức | `HienThiQuyetToanCanBoSungChoHuongDanVien()` | HDV xem quyết toán được yêu cầu bổ sung trên ứng dụng của mình. |
| Phương thức | `GuiBoSungQuyetToan()` | HDV gửi ghi chú và ảnh hóa đơn bổ sung. |
| Phương thức | `HienThiDanhSachHoanTien()` | Hiển thị giao dịch hoàn tiền đang chờ xử lý. |
| Phương thức | `XacNhanHoanTien()` | Ghi nhận hoàn tiền thành công. |
| Phương thức | `TuChoiHoanTien()` | Từ chối xử lý hoàn tiền. |

## 3.4.5.68. QL_BaoCao_GUI

**Bảng 3.127. Mô tả chi tiết lớp giao diện QL_BaoCao_GUI (UC51)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiTongQuanBaoCao()` | Hiển thị màn tổng quan và khu vực kết nối Power BI. |
| Phương thức | `HienThiKhoDuLieu()` | Hiển thị danh sách tập dữ liệu có thể phân tích. |
| Phương thức | `MoCuaSoKetNoiBaoCao()` | Hiển thị thông tin kết nối dữ liệu được chọn. |
| Phương thức | `XuatDuLieuBaoCao()` | Gửi yêu cầu xuất tệp dữ liệu theo phạm vi chọn. |

## 3.4.5.69. QL_KhuyenMai_KH_GUI

**Bảng 3.128. Mô tả chi tiết lớp giao diện QL_KhuyenMai_KH_GUI (UC52-UC54)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiDanhSachVoucher()` | Hiển thị voucher và trạng thái phát hành. |
| Phương thức | `MoFormTaoVoucher()` | Hiển thị biểu mẫu tạo ưu đãi. |
| Phương thức | `LuuVoucher()` | Gửi thông tin tạo hoặc cập nhật voucher. |
| Phương thức | `VoHieuHoaVoucher()` | Gửi thao tác dừng sử dụng voucher. |
| Phương thức | `MoCuaSoPhanPhoiVoucher()` | Hiển thị khách hàng nhận voucher. |
| Phương thức | `PhatHanhVoucher()` | Phân phối voucher cho khách được chọn. |
| Phương thức | `ThuHoiVoucher()` | Thu hồi voucher đã cấp. |

## 3.4.5.70. Login_GUI

**Bảng 3.129. Mô tả chi tiết lớp giao diện Login_GUI (UC55, UC57-UC58)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiTrangDangNhap()` | Hiển thị form nhập tên đăng nhập và mật khẩu. |
| Phương thức | `GuiThongTinDangNhap()` | Gửi thông tin xác thực đến hệ thống. |
| Phương thức | `ThongBaoDangNhapThatBai()` | Hiển thị lỗi khi đăng nhập không hợp lệ. |
| Phương thức | `ChuyenDenManHinhTheoVaiTro()` | Điều hướng người dùng sau khi xác thực thành công. |
| Phương thức | `DangXuat()` | Xóa thông tin phiên và trở lại trang đăng nhập. |

## 3.4.5.71. Register_GUI

**Bảng 3.130. Mô tả chi tiết lớp giao diện Register_GUI (UC56)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiFormDangKy()` | Hiển thị biểu mẫu đăng ký khách hàng. |
| Phương thức | `KiemTraThongTinDangKy()` | Kiểm tra dữ liệu bắt buộc trước khi gửi. |
| Phương thức | `GuiThongTinDangKy()` | Gửi yêu cầu tạo tài khoản khách hàng. |
| Phương thức | `ThongBaoDangKyThanhCong()` | Thông báo và chuyển người dùng sang phiên sử dụng phù hợp. |

## 3.4.5.72. ForgotPwd_GUI

**Bảng 3.131. Mô tả chi tiết lớp giao diện ForgotPwd_GUI (UC59)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiFormKhoiPhuc()` | Hiển thị form nhập email để yêu cầu khôi phục mật khẩu. |
| Phương thức | `GuiYeuCauKhoiPhuc()` | Gửi thông tin quên mật khẩu đến hệ thống. |
| Phương thức | `HienThiTrangNhapMatKhauMoi()` | Hiển thị form nhập mật khẩu mới theo mã đặt lại. |
| Phương thức | `GuiMatKhauMoi()` | Gửi yêu cầu đặt lại mật khẩu. |
| Phương thức | `ThongBaoKhoiPhucThanhCong()` | Thông báo hoàn tất khôi phục và cho phép đăng nhập lại. |
| Phương thức | `ThongBaoKhoiPhucThatBai()` | Hiển thị lỗi khi mã đặt lại hoặc dữ liệu không hợp lệ. |

## 3.4.5.73. ChangePwd_GUI

**Bảng 3.132. Mô tả chi tiết lớp giao diện ChangePwd_GUI (UC60)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiFormDoiMatKhau()` | Hiển thị biểu mẫu mật khẩu hiện tại và mật khẩu mới. |
| Phương thức | `KiemTraMatKhauHienTai()` | Gửi yêu cầu xác minh mật khẩu trước khi đổi. |
| Phương thức | `GuiYeuCauDoiMatKhau()` | Gửi mật khẩu mới đến hệ thống. |
| Phương thức | `ThongBaoDoiMatKhauThanhCong()` | Hiển thị kết quả cập nhật thành công. |

## 3.4.5.74. QL_TaiKhoan_GUI

**Bảng 3.133. Mô tả chi tiết lớp giao diện QL_TaiKhoan_GUI (UC61-UC67)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiDanhSachTaiKhoanNhanVien()` | Hiển thị tài khoản gắn với nhân viên cho quản trị viên. |
| Phương thức | `MoFormTaoTaiKhoanNhanVien()` | Hiển thị form tạo tài khoản nhân viên. |
| Phương thức | `GuiThongTinTaiKhoanNhanVien()` | Gửi dữ liệu tài khoản và vai trò mới. |
| Phương thức | `TimKiemTaiKhoanNhanVien()` | Lọc nhân viên/tài khoản nhân viên theo thông tin yêu cầu. |
| Phương thức | `KhoaTaiKhoan()` | Khóa tài khoản được chọn. |
| Phương thức | `MoKhoaTaiKhoan()` | Mở lại tài khoản bị khóa. |
| Phương thức | `MoCuaSoPhanQuyen()` | Hiển thị vai trò có thể gán. |
| Phương thức | `LuuPhanQuyen()` | Gửi thay đổi vai trò truy cập. |
| Phương thức | `CapNhatNangLucNhanVien()` | Mở và lưu nội dung năng lực nhân viên. |

## 3.4.5.75. QL_NhatKyHeThong_GUI

**Bảng 3.134. Mô tả chi tiết lớp giao diện QL_NhatKyHeThong_GUI (UC68)**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiNhatKyHeThong()` | Hiển thị nhật ký thao tác quản trị. |
| Phương thức | `LocNhatKy()` | Gửi điều kiện lọc theo hành động, đối tượng hoặc thời gian. |

## 3.4.5.76. QL_HoSoCaNhan_HDV_GUI

**Bảng 3.135. Mô tả chi tiết lớp giao diện QL_HoSoCaNhan_HDV_GUI**

| Nhóm | Tên phương thức | Ý nghĩa |
| --- | --- | --- |
| Phương thức | `HienThiHoSoHuongDanVien()` | Hiển thị hồ sơ cá nhân của hướng dẫn viên đang đăng nhập. |
| Phương thức | `HienThiNangLucHuongDanVien()` | Hiển thị ngôn ngữ, chứng chỉ, chuyên môn và đánh giá của hướng dẫn viên. |
| Phương thức | `HienThiLichSuTourPhuTrach()` | Hiển thị các chuyến đã được phân công cho hướng dẫn viên. |
| Phương thức | `KiemTraMatKhauHienTai()` | Xác minh mật khẩu hiện tại trước khi đổi mật khẩu. |
| Phương thức | `DoiMatKhau()` | Gửi mật khẩu mới của hướng dẫn viên đến hệ thống. |

## Danh sách thực thể dữ liệu được mô tả

| STT | Thực thể | Vai trò chính |
| ---: | --- | --- |
| 1 | `VAITRO` | Danh mục quyền hệ thống |
| 2 | `TAIKHOAN` | Xác thực và thông tin chủ tài khoản |
| 3 | `NHATKYHETHONG` | Kiểm toán thao tác quản trị |
| 4 | `HOCHIEUSO` | Hồ sơ khách hàng và điểm xanh |
| 5 | `NHANVIEN` | Hồ sơ nhân sự |
| 6 | `NANGLUCNHANVIEN` | Năng lực hướng dẫn viên |
| 7 | `TOURMAU` | Sản phẩm tour mẫu |
| 8 | `LICHTRINHTOUR` | Lịch trình theo ngày |
| 9 | `DICHVUTHEM` | Danh mục dịch vụ bổ sung |
| 10 | `HANHDONGXANH` | Danh mục hoạt động tích điểm |
| 11 | `TOURTHUCTE` | Chuyến tour được mở bán, vận hành |
| 12 | `DICHVU_TOURTHUCTE` | Dịch vụ áp dụng cho chuyến |
| 13 | `HDX_TOURTHUCTE` | Hành động xanh áp dụng cho chuyến |
| 14 | `DONDATTOUR` | Đơn đặt tour |
| 15 | `DSNGUOIDONGHANH` | Người đi cùng trong đơn |
| 16 | `CHITIETDATTOUR` | Dòng hành khách của đơn |
| 17 | `CHITIETDICHVU` | Dịch vụ mua thêm trong đơn |
| 18 | `VOUCHER` | Chương trình ưu đãi |
| 19 | `KHUYENMAI_KH` | Ví voucher khách hàng |
| 20 | `DATTOUR_UUDAI` | Voucher đã áp vào đơn |
| 21 | `GIAODICH` | Thanh toán và hoàn tiền |
| 22 | `LICHSUTOUR` | Lịch sử tham gia tour |
| 23 | `PHANCONGTOUR` | Phân công hướng dẫn viên |
| 24 | `DIEMDANH` | Điểm danh đoàn khách |
| 25 | `HANHDONG` | Ghi nhận hành động xanh thực tế |
| 26 | `NHATKYSUCO` | Báo cáo sự cố chuyến đi |
| 27 | `CHIPHITHUCTE` | Chi phí vận hành phát sinh |
| 28 | `QUYETTOAN` | Quyết toán tour |
| 29 | `NHATKYDOIDIEM` | Theo dõi đổi điểm voucher |
| 30 | `YEUCAUHOTRO` | Hỗ trợ, khiếu nại và hủy tour |
| 31 | `DANHGIAKH` | Đánh giá sau chuyến đi |
