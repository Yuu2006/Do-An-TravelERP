# Danh sách thuộc tính và phương thức theo lớp

Tài liệu này được rút gọn từ `mo_ta_chi_tiet_thuc_the.md`. Kiểu dữ liệu thuộc tính sử dụng đúng khai báo Oracle trong `be/src/main/resources/db/KhoiTaoBang.sql`; tên phương thức được trình bày bằng tiếng Việt theo tài liệu mô tả chi tiết.

## I. Thực thể dữ liệu

### VAITRO
- `MaVaiTro: VARCHAR2(50)`
- `TenHienThi: VARCHAR2(100)`

+ `GanVaiTroChoNhanVien(MaNhanVien, MaVaiTro)`

### TAIKHOAN
- `MaTaiKhoan: VARCHAR2(50)`
- `TenDangNhap: VARCHAR2(100)`
- `MatKhau: VARCHAR2(255)`
- `HoTen: VARCHAR2(200)`
- `CCCD: VARCHAR2(20)`
- `NgaySinh: DATE`
- `Email: VARCHAR2(200)`
- `SoDienThoai: VARCHAR2(20)`
- `VaiTro: VARCHAR2(50)`
- `TrangThai: VARCHAR2(20)`

+ `DangNhap(TenDangNhap, MatKhau)`
+ `DangKy(ThongTinTaiKhoan)`
+ `DangKyNhanVien(ThongTinNhanVien)`
+ `DoiMatKhau(MaTaiKhoan, MatKhauMoi)`
+ `KiemTraMatKhau(MaTaiKhoan, MatKhau)`
+ `QuenMatKhau(Email)`
+ `DatLaiMatKhau(ThongTinDatLai)`
+ `DangXuat()`
+ `KhoaTaiKhoan(MaNhanVien)`
+ `MoKhoaTaiKhoan(MaNhanVien)`

### NHATKYHETHONG
- `MaNhatKyHeThong: VARCHAR2(50)`
- `MaTaiKhoan: VARCHAR2(50)`
- `HanhDong: VARCHAR2(100)`
- `DoiTuong: VARCHAR2(100)`
- `MaDoiTuong: VARCHAR2(50)`
- `ThoiGian: TIMESTAMP`

+ `GhiNhan(MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong)`
+ `TimKiem(TuNgay, DenNgay, HanhDong, DoiTuong)`

### HOCHIEUSO
- `MaKhachHang: VARCHAR2(50)`
- `MaTaiKhoan: VARCHAR2(50)`
- `GhiChuYTe: CLOB`
- `DiUng: VARCHAR2(1000)`
- `HangThanhVien: VARCHAR2(20)`
- `DiemXanh: NUMBER(15)`

+ `LayHoSo(MaTaiKhoan)`
+ `CapNhatHoSo(MaTaiKhoan, ThongTinHoSo)`
+ `LichSuTour(MaTaiKhoan)`
+ `TimKiemKhachHang(HoTen, Email, SoDienThoai)`
+ `ChiTietKhachHang(MaKhachHang)`
+ `CapNhatDiemXanh(MaKhachHang, SoDiem)`

### NHANVIEN
- `MaNhanVien: VARCHAR2(50)`
- `MaTaiKhoan: VARCHAR2(50)`
- `LoaiNhanVien: VARCHAR2(50)`
- `NgayVaoLam: DATE`
- `TrangThaiLamViec: VARCHAR2(20)`

+ `DangKyNhanVien(ThongTinNhanVien)`
+ `TimKiemNhanVien(HoTen, MaVaiTro, TrangThai)`
+ `ChiTietNhanVien(MaNhanVien)`
+ `KhoaTaiKhoan(MaNhanVien)`
+ `MoKhoaTaiKhoan(MaNhanVien)`
+ `GanVaiTro(MaNhanVien, MaVaiTro)`
+ `LayHoSoCaNhan(MaTaiKhoan)`

### NANGLUCNHANVIEN
- `MaNangLucNhanVien: VARCHAR2(50)`
- `MaNhanVien: VARCHAR2(50)`
- `NgonNgu: VARCHAR2(200)`
- `ChungChi: VARCHAR2(500)`
- `ChuyenMon: VARCHAR2(500)`
- `DanhGia: NUMBER(3,2)`
- `SoDanhGia: NUMBER(10)`

+ `LayNangLuc(MaNhanVien)`
+ `CapNhatNangLuc(MaNhanVien, ThongTin)`
+ `CapNhatDanhGiaHuongDanVien()`

### TOURMAU
- `MaTourMau: VARCHAR2(50)`
- `TieuDe: VARCHAR2(500)`
- `MoTa: CLOB`
- `ThoiLuong: NUMBER(5)`
- `GiaSan: NUMBER(18,2)`
- `DanhGia: NUMBER(3,2)`
- `SoDanhGia: NUMBER(10)`

+ `DanhSachTourMau(TieuDe, ThoiLuongToiThieu, ThoiLuongToiDa)`
+ `ChiTietTourMau(MaTourMau)`
+ `TaoMoiTourMau(ThongTinTour)`
+ `CapNhatTourMau(MaTourMau, ThongTinTour)`
+ `XoaTourMau(MaTourMau)`
+ `SaoChepTourMau(MaTourMau)`

### LICHTRINHTOUR
- `MaLichTrinhTour: VARCHAR2(50)`
- `MaTourMau: VARCHAR2(50)`
- `NgayThu: NUMBER(3)`
- `HoatDong: VARCHAR2(1000)`
- `MoTa: CLOB`
- `ThucDon: VARCHAR2(1000)`

+ `LayLichTrinhTour(MaTourThucTe)`
+ `ThemLichTrinh(MaTourMau, ThongTinLichTrinh)`
+ `SuaLichTrinh(MaTourMau, MaLichTrinh, ThongTin)`
+ `XoaLichTrinh(MaTourMau, MaLichTrinh)`

### DICHVUTHEM
- `MaDichVuThem: VARCHAR2(50)`
- `Ten: VARCHAR2(200)`
- `DonViTinh: VARCHAR2(100)`
- `DonGia: NUMBER(18,2)`

+ `DanhSachDichVu()`
+ `DanhSachDichVuTheoTour(MaTourThucTe)`
+ `ChiTietDichVu(MaDichVuThem)`
+ `TaoMoiDichVu(ThongTinDichVu)`
+ `CapNhatDichVu(MaDichVuThem, ThongTin)`
+ `XoaDichVu(MaDichVuThem)`

### HANHDONGXANH
- `MaHanhDongXanh: VARCHAR2(50)`
- `TenHanhDong: VARCHAR2(200)`
- `DiemCong: NUMBER(10)`

+ `DanhSachHanhDongXanh(MaTourThucTe)`
+ `ChiTietHanhDongXanh(MaHanhDongXanh)`
+ `TaoMoiHanhDongXanh(ThongTinHanhDong)`
+ `CapNhatHanhDongXanh(MaHanhDongXanh, ThongTin)`
+ `XoaHanhDongXanh(MaHanhDongXanh)`

### TOURTHUCTE
- `MaTourThucTe: VARCHAR2(50)`
- `MaTourMau: VARCHAR2(50)`
- `NgayKhoiHanh: DATE`
- `GiaHienHanh: NUMBER(18,2)`
- `SoKhachToiDa: NUMBER(5)`
- `SoKhachToiThieu: NUMBER(5)`
- `ChoConLai: NUMBER(5)`
- `TrangThai: VARCHAR2(20)`

+ `DanhSachTourThucTe(TrangThai, MaTourMau)`
+ `DanhSachTourCongKhai(KhoangGia, ThoiLuong)`
+ `DanhSachTourCanPhanCong()`
+ `ChiTietTourThucTe(MaTourThucTe)`
+ `ChiTietTourCongKhai(MaTourThucTe)`
+ `TaoMoiTourThucTe(ThongTinKhoiHanh)`
+ `CapNhatTourThucTe(MaTourThucTe, ThongTin)`
+ `XoaTourThucTe(MaTourThucTe)`
+ `CapNhatGiaDong()`

### DICHVU_TOURTHUCTE
- `MaTourThucTe: VARCHAR2(50)`
- `MaDichVuThem: VARCHAR2(50)`

+ `GanDichVuChoTour(MaTourThucTe, DanhSachDichVu)`
+ `LayDichVuCuaTour(MaTourThucTe)`

### HDX_TOURTHUCTE
- `MaTourThucTe: VARCHAR2(50)`
- `MaHanhDongXanh: VARCHAR2(50)`

+ `GanHanhDongXanhChoTour(MaTourThucTe, DanhSachHanhDongXanh)`
+ `LayHanhDongXanhCuaTour(MaTourThucTe)`

### DONDATTOUR
- `MaDatTour: VARCHAR2(50)`
- `MaTourThucTe: VARCHAR2(50)`
- `MaKhachHang: VARCHAR2(50)`
- `NgayDat: TIMESTAMP`
- `TongTien: NUMBER(18,2)`
- `TrangThai: VARCHAR2(30)`
- `ThoiGianHetHan: TIMESTAMP`
- `GhiChu: VARCHAR2(2000)`
- `HanhDongXanh: VARCHAR2(1000)`

+ `DatTour(MaTaiKhoan, YeuCauDatTour)`
+ `DanhSachCuaToi(MaTaiKhoan)`
+ `ChiTietDonCuaToi(MaTaiKhoan, MaDatTour)`
+ `HuyDatTour(MaTaiKhoan, MaDatTour)`
+ `DanhSachTatCaDon(TrangThai, MaTourThucTe)`
+ `XacNhanDon(MaDatTour)`
+ `TuChoiThanhToan(MaDatTour)`
+ `HuyDonHetHan()`

### DSNGUOIDONGHANH
- `MaNguoiDongHanh: VARCHAR2(50)`
- `MaDatTour: VARCHAR2(50)`
- `HoTen: VARCHAR2(200)`
- `CCCD: VARCHAR2(20)`
- `SoDienThoai: VARCHAR2(20)`
- `NgaySinh: DATE`
- `GioiTinh: VARCHAR2(20)`
- `GhiChu: VARCHAR2(1000)`

+ `ThemNguoiDongHanh(MaDatTour, ThongTin)`
+ `LayDanhSachNguoiDongHanh(MaDatTour)`

### CHITIETDATTOUR
- `MaChiTietDat: VARCHAR2(50)`
- `MaDatTour: VARCHAR2(50)`
- `MaKhachHang: VARCHAR2(50)`
- `MaNguoiDongHanh: VARCHAR2(50)`
- `LoaiKhach: VARCHAR2(30)`
- `GiaTaiThoiDiemDat: NUMBER(18,2)`

+ `TaoChiTietDatTour(MaDatTour, DanhSachKhach)`
+ `LayChiTietDatTour(MaDatTour)`

### CHITIETDICHVU
- `MaChiTietDichVu: VARCHAR2(50)`
- `MaDatTour: VARCHAR2(50)`
- `MaDichVuThem: VARCHAR2(50)`
- `SoLuong: NUMBER(10)`
- `DonGia: NUMBER(18,2)`
- `ThanhTien: NUMBER(18,2)`

+ `ThemDichVuVaoDon(MaDatTour, DanhSachDichVu)`
+ `TinhTongTienTuChiTiet(MaDatTour)`

### VOUCHER
- `MaVoucher: VARCHAR2(50)`
- `MaCode: VARCHAR2(50)`
- `LoaiUuDai: VARCHAR2(20)`
- `GiaTriGiam: NUMBER(18,2)`
- `MucGiamToiDa: NUMBER(18,2)`
- `DieuKienApDung: VARCHAR2(2000)`
- `SoLuotPhatHanh: NUMBER(10)`
- `SoLuotDaDung: NUMBER(10)`
- `NgayHieuLuc: DATE`
- `NgayHetHan: DATE`
- `TrangThai: VARCHAR2(20)`

+ `TaoVoucher(ThongTinVoucher)`
+ `CapNhatVoucher(MaVoucher, ThongTin)`
+ `VoHieuHoaVoucher(MaVoucher)`
+ `ApVoucher(MaTaiKhoan, MaDatTour, MaVoucher)`
+ `DanhSachVoucher()`
+ `DanhSachVoucherCoTheDoi()`
+ `ChiTietVoucher(MaVoucher)`

### KHUYENMAI_KH
- `MaKhachHang: VARCHAR2(50)`
- `MaVoucher: VARCHAR2(50)`
- `NgayHetHan: DATE`
- `NgayNhan: TIMESTAMP`
- `TrangThai: VARCHAR2(20)`

+ `ViVoucher(MaTaiKhoan)`
+ `PhatHanhChoKhachHang(MaVoucher, MaKhachHang)`
+ `ThuHoiVoucher(MaVoucher, MaKhachHang)`
+ `DanhSachKhachHangDaPhanBo(MaVoucher)`

### DATTOUR_UUDAI
- `MaDatTour: VARCHAR2(50)`
- `MaVoucher: VARCHAR2(50)`
- `SoTienUuDai: NUMBER(18,2)`
- `NgayApDung: TIMESTAMP`

+ `ApUuDaiVaoDon(MaDatTour, MaVoucher)`
+ `LayUuDaiCuaDon(MaDatTour)`

### GIAODICH
- `MaGiaoDich: VARCHAR2(50)`
- `MaDatTour: VARCHAR2(50)`
- `LoaiGiaoDich: VARCHAR2(50)`
- `PhuongThuc: VARCHAR2(50)`
- `SoTien: NUMBER(18,2)`
- `MaGDNH: VARCHAR2(200)`
- `TrangThai: VARCHAR2(30)`
- `NgayThanhToan: TIMESTAMP`

+ `KhoiTaoThanhToan(MaTaiKhoan, MaDatTour)`
+ `DanhDauThanhToanMaQrHetHan(MaTaiKhoan, MaDatTour)`
+ `DanhDauMaQrHetHanTuDong()`
+ `XacNhanDaChuyenKhoan(MaTaiKhoan, MaDatTour)`
+ `KetQuaThanhToan(MaTaiKhoan, MaDatTour)`
+ `TaoGiaoDichHoanTien(MaDatTour)`
+ `DanhSachChoHoanTien()`
+ `XacNhanHoanTien(MaGiaoDich)`
+ `TuChoiHoanTien(MaGiaoDich)`

### LICHSUTOUR
- `MaLichSuTour: VARCHAR2(50)`
- `MaKhachHang: VARCHAR2(50)`
- `MaTourThucTe: VARCHAR2(50)`
- `MaChiTietDat: VARCHAR2(50)`
- `NgayThamGia: DATE`

+ `TaoLichSuSauXacNhanDon()`
+ `LichSuTour(MaTaiKhoan)`

### PHANCONGTOUR
- `MaPhanCongTour: VARCHAR2(50)`
- `MaTourThucTe: VARCHAR2(50)`
- `MaNhanVien: VARCHAR2(50)`
- `NgayPhanCong: TIMESTAMP`
- `TrangThaiChapNhan: VARCHAR2(30)`
- `NgayPhanHoi: TIMESTAMP`

+ `TimHuongDanVienKhaDung(MaTourThucTe)`
+ `PhanCongHuongDanVien(MaTourThucTe, MaNhanVien)`
+ `DongYPhanCong(MaPhanCongTour, MaTaiKhoan)`
+ `TuChoiPhanCong(MaPhanCongTour, MaTaiKhoan)`
+ `HuyPhanCong(MaPhanCongTour)`
+ `TourCuaToi(MaTaiKhoan)`
+ `LichCongTacNhanVien(MaNhanVien)`

### DIEMDANH
- `MaDiemDanh: VARCHAR2(50)`
- `MaTourThucTe: VARCHAR2(50)`
- `MaKhachHang: VARCHAR2(50)`
- `MaNguoiDongHanh: VARCHAR2(50)`
- `LoaiKhach: VARCHAR2(30)`
- `MaNhanVien: VARCHAR2(50)`
- `ThoiGian: TIMESTAMP`
- `DiaDiem: VARCHAR2(500)`
- `TrangThai: VARCHAR2(30)`

+ `DanhSachDoan(MaTourThucTe)`
+ `DiemDanh(MaTourThucTe, YeuCauDiemDanh)`

### HANHDONG
- `MaGhiNhanHanhDong: VARCHAR2(50)`
- `MaTourThucTe: VARCHAR2(50)`
- `MaKhachHang: VARCHAR2(50)`
- `MaHanhDongXanh: VARCHAR2(50)`
- `MaNhanVienXacMinh: VARCHAR2(50)`
- `ThoiGian: TIMESTAMP`
- `MinhChung: VARCHAR2(1000)`

+ `GhiNhanHanhDong(MaTourThucTe, YeuCau)`
+ `CongDiemXanh(MaKhachHang, MaHanhDongXanh)`

### NHATKYSUCO
- `MaNhatKySuCo: VARCHAR2(50)`
- `MaTourThucTe: VARCHAR2(50)`
- `MaNhanVienBaoCao: VARCHAR2(50)`
- `MaKhachHang: VARCHAR2(50)`
- `MaNguoiDongHanh: VARCHAR2(50)`
- `MoTa: CLOB`
- `GiaiPhap: CLOB`
- `MucDo: VARCHAR2(20)`
- `LoaiSuCo: VARCHAR2(30)`
- `ThoiGianBaoCao: TIMESTAMP`

+ `BaoCaoSuCo(MaTourThucTe, YeuCauSuCo)`
+ `CapNhatSuCo(MaNhatKySuCo, GiaiPhap)`
+ `DanhSachSuCo(DieuKien)`
+ `LichSuSuCoCuaHuongDanVien(MucDo, MaTaiKhoan)`

### CHIPHITHUCTE
- `MaChiPhiThucTe: VARCHAR2(50)`
- `MaTourThucTe: VARCHAR2(50)`
- `MaNhanVien: VARCHAR2(50)`
- `DanhMuc: VARCHAR2(200)`
- `ThanhTien: NUMBER(18,2)`
- `HoaDonAnh: VARCHAR2(1000)`
- `TrangThaiDuyet: VARCHAR2(20)`
- `NgayKhai: TIMESTAMP`

+ `KhaiChiPhi(MaTourThucTe, ThongTinChiPhi)`
+ `ChiPhiCuaTour(MaTourThucTe)`
+ `LichSuChiPhiCuaHuongDanVien(MaTaiKhoan)`
+ `BoSungChiPhi(MaChiPhi, ThongTin)`
+ `DanhSachChiPhiChoXuLy(TrangThai, MaTourThucTe)`
+ `DuyetChiPhi(MaChiPhi)`
+ `TuChoiChiPhi(MaChiPhi)`
+ `YeuCauBoSungChiPhi(MaChiPhi)`
+ `DanhSachCanhBaoChiPhi(TrangThai, LoaiCanhBao)`
+ `ChiTietCanhBaoChiPhi(MaCanhBao)`

### QUYETTOAN
- `MaQuyetToan: VARCHAR2(50)`
- `MaTourThucTe: VARCHAR2(50)`
- `TongDoanhThu: NUMBER(18,2)`
- `TongChiPhi: NUMBER(18,2)`
- `GiaCamKet: NUMBER(18,2)`
- `LoiNhuan: NUMBER(18,2)`
- `MaNhanVien: VARCHAR2(50)`
- `NgayQuyetToan: TIMESTAMP`
- `TrangThai: VARCHAR2(20)`
- `GhiChu: CLOB`
- `HoaDonAnh: VARCHAR2(1000)`

+ `TourCanQuyetToan()`
+ `TinhToanQuyetToan(MaTourThucTe)`
+ `TaoQuyetToan(MaTourThucTe, ThongTin)`
+ `ChotQuyetToan(MaQuyetToan)`
+ `DanhSachQuyetToan(TrangThai)`
+ `ChiTietQuyetToan(MaQuyetToan)`
+ `YeuCauBoSungQuyetToan(MaQuyetToan, NoiDung)`
+ `DanhSachCanBoSungCuaHuongDanVien(MaTaiKhoan)`
+ `HuongDanVienBoSungQuyetToan(MaQuyetToan, ThongTin)`
+ `BaoCaoDoanhThu(TuNgay, DenNgay)`

### NHATKYDOIDIEM
- `MaNhatKyDoiDiem: VARCHAR2(50)`
- `MaKhachHang: VARCHAR2(50)`
- `MaVoucher: VARCHAR2(50)`
- `DiemQuyDoi: NUMBER(15)`
- `NgayQuyDoi: TIMESTAMP`

+ `DoiDiem(MaTaiKhoan, MaVoucher)`
+ `GhiNhatKyDoiDiem(MaKhachHang, MaVoucher, Diem)`

### YEUCAUHOTRO
- `MaYeuCauHoTro: VARCHAR2(50)`
- `MaDatTour: VARCHAR2(50)`
- `MaKhachHang: VARCHAR2(50)`
- `LoaiYeuCau: VARCHAR2(100)`
- `NoiDung: CLOB`
- `TrangThai: VARCHAR2(20)`
- `MaNhanVienXuLy: VARCHAR2(50)`

+ `TaoYeuCau(MaTaiKhoan, NoiDung)`
+ `DanhSachYeuCauCuaKhachHang(MaTaiKhoan, LoaiYeuCau)`
+ `DanhSachCanKhachHangBoSung(MaTaiKhoan)`
+ `BoSung(MaTaiKhoan, MaYeuCau, NoiDung)`
+ `DanhSachTatCaYeuCau(LoaiYeuCau, TrangThai)`
+ `XuLy(MaYeuCau, KetQua, MaNhanVien)`
+ `YeuCauHuongDanVienGiaiTrinh(MaYeuCau, NoiDung)`
+ `YeuCauKhachHangBoSung(MaYeuCau, NoiDung)`
+ `DanhSachGiaiTrinhCuaHuongDanVien(MaTaiKhoan)`
+ `HuongDanVienCapNhatGiaiTrinh(MaTaiKhoan, MaYeuCau, NoiDung)`
+ `ChiTietYeuCau(MaYeuCau)`
+ `YeuCauHuyTour(MaTaiKhoan, MaDatTour)`
+ `DuyetHuyTour(MaYeuCau, MaNhanVien)`
+ `TuChoiHuyTour(MaYeuCau, MaNhanVien)`
+ `DanhSachYeuCauHuy(LoaiYeuCau, TrangThai)`

### DANHGIAKH
- `MaDanhGiaKhachHang: VARCHAR2(50)`
- `MaTourThucTe: VARCHAR2(50)`
- `MaKhachHang: VARCHAR2(50)`
- `SoSao: NUMBER(1)`
- `NhanXet: CLOB`
- `NgayDanhGia: TIMESTAMP`

+ `GuiDanhGia(MaTaiKhoan, ThongTinDanhGia)`
+ `DanhSachDanhGia(MaTourThucTe)`
+ `TatCaDanhGia()`
+ `CapNhatDiemTrungBinhTourMau()`
+ `CapNhatDiemTrungBinhHuongDanVien()`

## II. Lớp điều khiển

### QL_TaiKhoan_Controller
+ `DangKyKhachHang()`
+ `DangNhap()`
+ `DoiMatKhau()`
+ `KiemTraMatKhau()`
+ `QuenMatKhau()`
+ `DatLaiMatKhau()`
+ `DangXuat()`
+ `DangKyNhanVien()`

### QL_NhanVien_Controller
+ `DanhSachNhanVien()`
+ `ChiTietNhanVien()`
+ `KhoaTaiKhoanNhanVien()`
+ `MoKhoaTaiKhoanNhanVien()`
+ `GanVaiTroNhanVien()`
+ `LayHoSoCaNhan()`
+ `LayNangLucCuaToi()`
+ `LayNangLucNhanVien()`
+ `CapNhatNangLucNhanVien()`

### QL_NhatKyHeThong_Controller
+ `XemNhatKyHeThong()`

### QL_TourMau_Controller
+ `DanhSachTourMau()`
+ `ChiTietTourMau()`
+ `ThemTourMau()`
+ `CapNhatTourMau()`
+ `XoaTourMau()`
+ `SaoChepTourMau()`
+ `ThemLichTrinhTour()`
+ `SuaLichTrinhTour()`
+ `XoaLichTrinhTour()`

### QL_TourThucTe_Controller
+ `DanhSachTourThucTe()`
+ `ChiTietTourThucTe()`
+ `KhoiTaoTourThucTe()`
+ `CapNhatTourThucTe()`
+ `XoaTourThucTe()`
+ `DanhSachTourCongKhai()`
+ `ChiTietTourCongKhai()`

### DichVu_Controller
+ `DanhSachDichVuThem()`
+ `ChiTietDichVuThem()`
+ `ThemDichVuThem()`
+ `CapNhatDichVuThem()`
+ `XoaDichVuThem()`
+ `DanhSachDichVuTheoTour()`

### HD_Xanh_Controller
+ `DanhSachHanhDongXanh()`
+ `ChiTietHanhDongXanh()`
+ `ThemHanhDongXanh()`
+ `CapNhatHanhDongXanh()`
+ `XoaHanhDongXanh()`
+ `LayHanhDongXanhTheoTour()`

### QL_HoSoSo_Controller
+ `LayHoSoSo()`
+ `CapNhatHoSoSo()`
+ `LichSuTour()`
+ `TimKiemKhachHang()`
+ `ChiTietKhachHang()`

### QL_DatTour_Controller
+ `DatTour()`
+ `DanhSachDatTourCuaToi()`
+ `ChiTietDatTourCuaToi()`
+ `HuyDatTour()`
+ `YeuCauHuyTour()`
+ `KhoiTaoThanhToan()`
+ `XacNhanDaChuyenKhoan()`
+ `HetHanThanhToanMaQr()`
+ `KetQuaThanhToan()`

### QL_UuDai_Controller
+ `XemViVoucher()`
+ `DanhSachVoucherCoTheDoi()`
+ `ApDungVoucher()`
+ `DoiDiemLayVoucher()`

### QL_DonHang_Controller
+ `TraCuuDonHang()`
+ `XacNhanThanhToanDonHang()`
+ `TuChoiThanhToanDonHang()`

### QL_KhuyenMai_KH_Controller
+ `DanhSachVoucher()`
+ `ChiTietVoucher()`
+ `TaoVoucher()`
+ `CapNhatVoucher()`
+ `VoHieuHoaVoucher()`
+ `PhatHanhVoucherChoKhachHang()`
+ `DanhSachKhachHangDaPhanBo()`
+ `ThuHoiVoucher()`

### QL_HDV_Controller
+ `DanhSachTourCanPhanCong()`
+ `TimHuongDanVienKhaDung()`
+ `PhanCongHuongDanVien()`
+ `HuyPhanCong()`
+ `TourCuaHuongDanVien()`
+ `DongYPhanCong()`
+ `TuChoiPhanCong()`
+ `LichCongTacCuaToi()`
+ `LichCongTacNhanVien()`
+ `LayHoSoCaNhan()`
+ `LayNangLucCuaToi()`
+ `DanhSachYeuCauGiaiTrinh()`
+ `CapNhatGiaiTrinh()`
+ `DanhSachQuyetToanCanBoSung()`
+ `BoSungQuyetToan()`

### QL_KhieuNai_Controller
+ `TaoYeuCauHoTro()`
+ `DanhSachYeuCauCuaToi()`
+ `DanhSachYeuCauCanBoSung()`
+ `BoSungYeuCau()`
+ `DanhSachYeuCauHoTro()`
+ `XuLyYeuCauHoTro()`
+ `DanhSachYeuCauHuy()`
+ `DuyetHuyTour()`
+ `TuChoiHuyTour()`
+ `YeuCauHuongDanVienGiaiTrinh()`
+ `YeuCauKhachHangBoSung()`
+ `DanhSachGiaiTrinhCuaHuongDanVien()`
+ `CapNhatGiaiTrinhHuongDanVien()`

### QL_Doan_Controller
+ `XemLichTrinhTour()`
+ `DanhSachDoan()`
+ `DiemDanhKhachHang()`
+ `XacNhanHanhDongXanh()`

### Nky_SuCo_Controller
+ `DanhSachSuCoTheoTour()`
+ `LichSuSuCoCuaHuongDanVien()`
+ `BaoCaoSuCo()`
+ `CapNhatSuCo()`

### QL_ChiPhi_Controller
+ `KhaiChiPhiThucTe()`
+ `ChiPhiCuaTour()`
+ `LichSuChiPhiCuaHuongDanVien()`
+ `BoSungChiPhi()`
+ `DanhSachChiPhiChoXuLy()`
+ `DuyetChiPhi()`
+ `TuChoiChiPhi()`
+ `YeuCauBoSungChiPhi()`
+ `DanhSachCanhBaoChiPhi()`
+ `ChiTietCanhBaoChiPhi()`

### QL_QuyetToan_Controller
+ `TourCanQuyetToan()`
+ `TinhLoiNhuanTour()`
+ `TaoQuyetToan()`
+ `ChotQuyetToan()`
+ `YeuCauBoSungQuyetToan()`
+ `DanhSachQuyetToan()`
+ `ChiTietQuyetToan()`
+ `DanhSachCanBoSungCuaHuongDanVien()`
+ `HuongDanVienBoSungQuyetToan()`
+ `DanhSachChoHoanTien()`
+ `XacNhanHoanTien()`
+ `TuChoiHoanTien()`

### QL_DanhGia_Controller
+ `GuiDanhGia()`
+ `DanhSachDanhGiaTour()`
+ `TatCaDanhGia()`

### QL_BaoCao_Controller
+ `BaoCaoDoanhThu()`
+ `DanhSachKhoDuLieuBaoCao()`
+ `LayThongTinKetNoiBaoCao()`
+ `XuatDuLieuBaoCao()`

## III. Lớp giao diện

### QL_TourMau_GUI
+ `HienThiDanhSachTourMau()`
+ `HienThiChiTietTourMau()`
+ `MoFormThemTourMau()`
+ `GuiThongTinThemTourMau()`
+ `MoFormCapNhatTourMau()`
+ `XacNhanXoaTourMau()`
+ `SaoChepTourMau()`

### QL_LichTrinhTour_GUI
+ `HienThiDanhSachLichTrinh()`
+ `ThemNgayLichTrinh()`
+ `SuaNgayLichTrinh()`
+ `XoaNgayLichTrinh()`

### QL_TourThucTe_GUI
+ `HienThiDanhSachTourThucTe()`
+ `MoTrinhKhoiTaoChuyenTour()`
+ `GuiYeuCauKhoiTaoTour()`
+ `HienThiChiTietTourThucTe()`
+ `CapNhatTourThucTe()`
+ `XacNhanXoaTourThucTe()`

### DichVu_GUI
+ `HienThiDanhSachDichVu()`
+ `MoFormThemDichVu()`
+ `CapNhatDichVu()`
+ `XacNhanXoaDichVu()`
+ `ChonDichVuChoTour()`

### HD_Xanh_GUI
+ `HienThiDanhSachHanhDongXanh()`
+ `MoFormThemHanhDongXanh()`
+ `CapNhatHanhDongXanh()`
+ `XacNhanXoaHanhDongXanh()`
+ `CauHinhHanhDongChoTour()`

### QL_HoSoSo_GUI
+ `HienThiHoSoSo()`
+ `HienThiLichSuHanhTrinh()`
+ `MoFormCapNhatHoSo()`
+ `LuuCapNhatHoSo()`
+ `HienThiTraCuuKhachHang()`

### QL_DatTour_GUI
+ `HienThiDanhSachTourCongKhai()`
+ `HienThiChiTietTour()`
+ `MoCuaSoDatTour()`
+ `NhapThongTinHanhKhach()`
+ `ChonDichVuVaHanhDongXanh()`
+ `HienThiTongKetDonHang()`
+ `ChonPhuongThucThanhToan()`
+ `XacNhanDaChuyenKhoan()`
+ `HienThiDanhSachDonDaDat()`
+ `HienThiChiTietDonDaDat()`
+ `HuyDonChuaThanhToan()`
+ `MoYeuCauHuyTour()`
+ `HienThiTrangThaiHoanTien()`

### QL_UuDai_GUI
+ `HienThiViUuDai()`
+ `HienThiVoucherCoTheDoi()`
+ `ApDungVoucherVaoDon()`
+ `XacNhanDoiDiem()`

### QL_DonHang_GUI
+ `HienThiDanhSachDonHang()`
+ `TimKiemDonHang()`
+ `HienThiChiTietDonHang()`
+ `DuyetThanhToan()`
+ `TuChoiThanhToan()`

### QL_DanhGia_GUI
+ `MoFormDanhGiaChuyenDi()`
+ `GuiDanhGia()`
+ `HienThiDanhGiaTour()`

### QL_KhieuNai_GUI
+ `MoFormKhieuNai()`
+ `GuiKhieuNai()`
+ `HienThiYeuCauCuaToi()`
+ `HienThiYeuCauCanBoSung()`
+ `GuiBoSungYeuCau()`
+ `HienThiDanhSachKhieuNai()`
+ `MoChiTietKhieuNai()`
+ `XuLyKhieuNai()`
+ `YeuCauBoSungHoacGiaiTrinh()`

### QL_HDV_GUI
+ `HienThiTourCanPhanCong()`
+ `MoCuaSoPhanCong()`
+ `XacNhanPhanCong()`
+ `HienThiDanhSachHuongDanVien()`
+ `HienThiYeuCauPhanCong()`
+ `DongYNhanTour()`
+ `TuChoiNhanTour()`
+ `HienThiYeuCauGiaiTrinh()`
+ `GuiGiaiTrinh()`
+ `HienThiQuyetToanCanBoSung()`
+ `GuiBoSungQuyetToan()`

### QL_Doan_GUI
+ `HienThiLichTrinhChuyenDi()`
+ `HienThiDanhSachDoan()`
+ `BatDauDiemDanh()`
+ `XacNhanDiemDanh()`
+ `MoFormXacNhanHanhDongXanh()`
+ `GuiXacNhanHanhDongXanh()`

### Nky_SuCo_GUI
+ `HienThiDanhSachSuCo()`
+ `MoFormBaoCaoSuCo()`
+ `GuiBaoCaoSuCo()`
+ `CapNhatGiaiPhapSuCo()`

### QL_ChiPhi_GUI
+ `HienThiChiPhiCuaHuongDanVien()`
+ `MoFormThemChiPhi()`
+ `LuuChiPhi()`
+ `BoSungChungTuChiPhi()`
+ `HienThiDanhSachChiPhiChoDuyet()`
+ `HienThiCanhBaoChiPhi()`
+ `PheDuyetChiPhi()`
+ `TuChoiChiPhi()`
+ `YeuCauBoSungChiPhi()`

### QL_QuyetToan_GUI
+ `HienThiTourCanQuyetToan()`
+ `TinhLoiNhuan()`
+ `MoCuaSoQuyetToan()`
+ `HoanTatQuyetToan()`
+ `YeuCauHuongDanVienBoSung()`
+ `HienThiQuyetToanCanBoSungChoHuongDanVien()`
+ `GuiBoSungQuyetToan()`
+ `HienThiDanhSachHoanTien()`
+ `XacNhanHoanTien()`
+ `TuChoiHoanTien()`

### QL_BaoCao_GUI
+ `HienThiTongQuanBaoCao()`
+ `HienThiKhoDuLieu()`
+ `MoCuaSoKetNoiBaoCao()`
+ `XuatDuLieuBaoCao()`

### QL_KhuyenMai_KH_GUI
+ `HienThiDanhSachVoucher()`
+ `MoFormTaoVoucher()`
+ `LuuVoucher()`
+ `VoHieuHoaVoucher()`
+ `MoCuaSoPhanPhoiVoucher()`
+ `PhatHanhVoucher()`
+ `ThuHoiVoucher()`

### Login_GUI
+ `HienThiTrangDangNhap()`
+ `GuiThongTinDangNhap()`
+ `ThongBaoDangNhapThatBai()`
+ `ChuyenDenManHinhTheoVaiTro()`
+ `DangXuat()`

### Register_GUI
+ `HienThiFormDangKy()`
+ `KiemTraThongTinDangKy()`
+ `GuiThongTinDangKy()`
+ `ThongBaoDangKyThanhCong()`

### ForgotPwd_GUI
+ `HienThiFormKhoiPhuc()`
+ `GuiYeuCauKhoiPhuc()`
+ `HienThiTrangNhapMatKhauMoi()`
+ `GuiMatKhauMoi()`
+ `ThongBaoKhoiPhucThanhCong()`
+ `ThongBaoKhoiPhucThatBai()`

### ChangePwd_GUI
+ `HienThiFormDoiMatKhau()`
+ `KiemTraMatKhauHienTai()`
+ `GuiYeuCauDoiMatKhau()`
+ `ThongBaoDoiMatKhauThanhCong()`

### QL_TaiKhoan_GUI
+ `HienThiDanhSachTaiKhoanNhanVien()`
+ `MoFormTaoTaiKhoanNhanVien()`
+ `GuiThongTinTaiKhoanNhanVien()`
+ `TimKiemTaiKhoanNhanVien()`
+ `KhoaTaiKhoan()`
+ `MoKhoaTaiKhoan()`
+ `MoCuaSoPhanQuyen()`
+ `LuuPhanQuyen()`
+ `CapNhatNangLucNhanVien()`

### QL_NhatKyHeThong_GUI
+ `HienThiNhatKyHeThong()`
+ `LocNhatKy()`

### QL_HoSoCaNhan_HDV_GUI
+ `HienThiHoSoHuongDanVien()`
+ `HienThiNangLucHuongDanVien()`
+ `HienThiLichSuTourPhuTrach()`
+ `KiemTraMatKhauHienTai()`
+ `DoiMatKhau()`
