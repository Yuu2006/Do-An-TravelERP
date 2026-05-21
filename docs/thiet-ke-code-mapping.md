# Mapping phương thức thiết kế sang code thực tế

Tài liệu này dùng cho báo cáo đồ án: API controller được giữ nguyên để không ảnh hưởng frontend/Postman/Swagger. Các bước nhỏ như kiểm tra dữ liệu, xử lý tạo mới, lưu DB, ghi nhật ký được triển khai trong service hoặc repository.

## Nguyên tắc triển khai

| Nhóm phương thức trong thiết kế | Cách cài đặt thực tế |
|---|---|
| `Lay...`, `TraCuu...`, `TimKiem...` | Controller gọi service; service gọi repository `find...`, `timKiem...` hoặc `findAll()` |
| `KiemTra...` | Method private trong service hoặc validate ngay trong use-case service |
| `Tao...`, `XuLy...` | Method service tạo entity, set dữ liệu nghiệp vụ rồi gọi repository `save()` |
| `Luu...` | Repository `save()` hoặc method service bao quanh bước lưu |
| `PhatSinhMa...` | `MaTuDongService` hoặc UUID theo từng nghiệp vụ |
| `GuiThongBao...` | Chưa có module thông báo riêng; tách placeholder/TODO ở service khi cần |

## Use-case báo cáo sự cố

| Phương thức thiết kế | Cài đặt thực tế | Ghi chú |
|---|---|---|
| `NKy_SuCo_Controller.xuLyTaoSuCoMoi()` | `VanHanhController.baoCaoSuCo()` gọi `VanHanhService.baoCaoSuCo()` | Controller giữ nguyên endpoint `/api/huong-dan-vien/tour/{maTour}/su-co` |
| `kiemTraHopLeDuLieu(thongTinSuCo)` | `VanHanhService.kiemTraHopLeDuLieuSuCo()` | Kiểm tra mô tả, chuẩn hóa mức độ, kiểm tra tour tồn tại |
| `xuLyTaoSuCoMoi(thongTinSuCo)` | `VanHanhService.xuLyTaoSuCoMoi()` | Tạo `NhatKySuCo` và lưu bằng `NhatKySuCoRepository.save()` |
| `guiCanhBaoDenQuanLy(maSuCo, mucDo)` | `VanHanhService.guiCanhBaoDenQuanLyNeuCan()` | Đã tách bước; hiện là TODO vì chưa có module thông báo |
| `truyXuatDanhSachSuCo()` | `VanHanhService.danhSachSuCo()`, `NhatKySuCoRepository.findByMaTour()` | Lấy danh sách sự cố theo tour và mức độ |

## Use-case đặt tour

| Phương thức thiết kế | Cài đặt thực tế | Ghi chú |
|---|---|---|
| `QL_DatTour_Controller.TaoDonDatTour()` | `KhachHangController.datTour()` gọi `DatTourService.datTour()` | API không đổi |
| `LayThongTinHoChieuSo()` | `HoChieuSoRepository.findByMaTaiKhoan()` trong `DatTourService.datTour()` | Lấy hồ sơ khách đang đăng nhập |
| `KiemTraSoChoTrong()` | `DatTourService.kiemTraDieuKienDatTour()` | Kiểm tra tour mở bán và còn đủ chỗ |
| `LayThongTinChiTietTour()` | `TourThucTeRepository.findById()` trong `kiemTraDieuKienDatTour()` | Lấy tour thực tế cần đặt |
| `LayDanhSachDichVuThemCuaTour()` | `DichVuThemRepository.findById()` trong `taoChiTietDichVuTam()` | Hiện kiểm tra từng dịch vụ được chọn |
| `TinhTongTienDonHang()` | `DatTourService.tinhTongTienDonHang()` | Tính tiền tour + dịch vụ thêm |
| `TaoChiTietDichVu()` | `DatTourService.taoChiTietDichVuTam()` và `luuChiTietDichVu()` | Tách bước tạo tạm và lưu sau khi có đơn |
| `TaoChiTietDatTour()` | Trong `DatTourService.datTour()` | Tạo chi tiết người đặt và người đồng hành |
| `TamKhoaCho()` | `TourThucTeRepository.findByIdForUpdate()` | Có repository hỗ trợ khóa bi quan; luồng đặt hiện chưa trừ chỗ ngay, chỉ trừ sau thanh toán |
| `GuiThongBaoXacNhan()` | Chưa có | Nên bổ sung sau khi có module thông báo |

## Use-case đổi điểm lấy voucher

| Phương thức thiết kế | Cài đặt thực tế | Ghi chú |
|---|---|---|
| `QL_UuDai_Controller.ThucHienDoiVoucher()` | `VoucherController.doiDiem()` gọi `VoucherService.doiDiem()` | API không đổi |
| `LayDiemXanhHienTai()` | `HoChieuSoRepository.findByMaTaiKhoan()` trong `VoucherService.doiDiem()` | Lấy điểm xanh từ hồ sơ khách hàng |
| `LayDanhSachVoucherTrongKho()` | `VoucherRepository.findAllActive()` | Có repository tìm voucher active, chưa mở endpoint riêng |
| `KiemTraDuDiemDoiVoucher()` | `VoucherService.kiemTraDuDiemDoiVoucher()` | Kiểm tra điểm xanh đủ để đổi |
| `ThucHienDoiVoucher()` | `VoucherService.doiDiem()` | Điều phối toàn bộ luồng đổi điểm |
| `CapNhatDiemXanhSauKhiDoi()` | `VoucherService.capNhatDiemXanhSauKhiDoi()` | Trừ điểm và lưu `HoChieuSo` |
| `ThemVoucherVaoViKhachHang()` | `VoucherService.themVoucherVaoViKhachHang()` | Tạo `KhuyenMaiKh` trong ví khách hàng |
| `GhiNhatKyDoiDiem()` | `VoucherService.ghiNhatKyDoiDiem()` | Lưu `NhatKyDoiDiem` |

## Use-case khuyến mãi/voucher quản trị

| Phương thức thiết kế | Cài đặt thực tế | Ghi chú |
|---|---|---|
| `QL_KhuyenMai_Controller.LayDanhSachVoucherTheoTieuChi()` | `VoucherAdminController.danhSach()`, `VoucherService.danhSach()`, `VoucherRepository.timKiem()` | Danh sách voucher cho kinh doanh |
| `TaoVoucherMoi()` | `VoucherAdminController.taoVoucher()`, `VoucherService.taoVoucher()` | Tạo voucher mới |
| `KiemTraDuLieuVoucher()` | Trong `VoucherService.taoVoucher()` và `capNhatVoucher()` | Kiểm tra mã code, phần trăm giảm, ngày hiệu lực |
| `PhanPhoiVoucherDenKhach()` | `VoucherAdminController.phatHanh()`, `VoucherService.phatHanhChoKhachHang()` | Phát hành voucher cho khách |
| `ThuHoiVoucher()` | `VoucherAdminController.thuHoi()`, `VoucherService.thuHoiVoucher()` | Thu hồi voucher trong ví khách |
| `CapNhatTrangThaiVoucher()` | `VoucherService.voHieuHoaVoucher()` | Vô hiệu hóa voucher |

## Use-case quyết toán/chi phí

| Phương thức thiết kế | Cài đặt thực tế | Ghi chú |
|---|---|---|
| `QL_ChiPhi_Controller.truyXuatDanhSachChiPhi()` | `VanHanhService.chiPhiCuaTour()` | Lấy chi phí theo tour |
| `kiemTraHopLeDuLieuChiPhi()` | Trong `VanHanhService.khaiChiPhi()` | Validate request bằng annotation và kiểm tra entity liên quan |
| `xuLyThemChiPhiThucTe()` | `VanHanhService.khaiChiPhi()` | Tạo `ChiPhiThucTe` trạng thái `CHO_DUYET` |
| `pheDuyetKhoanChi()` | `VanHanhService.duyetChiPhi()` | Đổi trạng thái sang `DA_DUYET` |
| `tuChoiKhoanChiKemLyDo()` | `VanHanhService.tuChoiChiPhi()` | Đổi trạng thái sang `TU_CHOI`; hiện chưa lưu lý do riêng |
| `yeuCauBoSungKhoanChi()` | `VanHanhService.yeuCauBoSungChiPhi()` | Đổi trạng thái sang `YEU_CAU_BO_SUNG` |
| `kiemTraVaDanhDauChiPhiViPham()` | `VanHanhService.danhSachCanhBaoChiPhi()`, `taoCanhBaoDong()` | Sinh cảnh báo động từ chi phí thực tế |
| `xuLyQuyetToanTour()` | `QuyetToanService.taoQuyetToan()`, `chotQuyetToan()` | Tạo bản nháp và chốt quyết toán |
| `truyXuatYeuCauHoanTien()` | `QuyetToanService.danhSachChoHoanTien()` | Lấy giao dịch chờ hoàn tiền |
| `xuLyXacNhanHoanTien()` | `QuyetToanService.xacNhanHoanTien()` | Xác nhận hoàn tiền và cập nhật đơn/tour |
| `xuLyTuChoiHoanTien()` | `QuyetToanService.tuChoiHoanTien()` | Từ chối hoàn tiền |

## Các phần chưa cài đặt rõ

| Nhóm | Ghi chú |
|---|---|
| OTP/xác thực mã | Chưa có module OTP/email thực tế; reset mật khẩu đang dùng reset token |
| Thông báo | Chưa có service gửi thông báo/email/push; các bước `GuiThongBao...` nên để TODO hoặc bổ sung module riêng |
| Export báo cáo | Chưa có endpoint xuất file hoặc chuyển đổi định dạng báo cáo |
| Cấu hình hành động xanh theo tour | Hiện quản lý danh mục `HanhDongXanh` chung và ghi nhận hành động trong tour; chưa có bảng cấu hình riêng theo tour |
