-- ============================================================
-- SEED DATA v3 DEMO - Bo du lieu demo nghiep vu day du hon
-- Chay sau: KhoiTaoBang.sql -> data_v1.sql -> data_v2.sql
-- Neu schema da tao truoc khi sua unique key CHITIETDATTOUR,
-- chay FixChiTietDatTourUnique.sql truoc file nay.
-- Oracle SQL, chi INSERT, khong trung PK voi data_v1/v2
-- Mat khau mac dinh cho tai khoan moi: password
-- BCrypt(cost=10): $2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK
-- ============================================================

-- ------------------------------------------------------------
-- 1. TAIKHOAN - 2 HDV + 6 khach hang demo
-- ------------------------------------------------------------
INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_HDV05', 'hdv05',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Đỗ Quốc Khánh', '079099000016', DATE '1988-05-14', 'hdv05@digitaltravel.vn', '0900000016',
        'HDV', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_HDV06', 'hdv06',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Mai Thùy Linh', '079099000017', DATE '1994-02-22', 'hdv06@digitaltravel.vn', '0900000017',
        'HDV', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH07', 'khachhang07',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Ngô Minh Anh', '079099000018', DATE '1991-01-19', 'kh07@gmail.com', '0900000018',
        'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH08', 'khachhang08',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Hoàng Gia Hân', '079099000019', DATE '1996-06-07', 'kh08@gmail.com', '0900000019',
        'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH09', 'khachhang09',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Phan Nhật Minh', '079099000020', DATE '1989-10-28', 'kh09@gmail.com', '0900000020',
        'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH10', 'khachhang10',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Vũ Thanh Tâm', '079099000021', DATE '1993-04-03', 'kh10@gmail.com', '0900000021',
        'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH11', 'khachhang11',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Đặng Hải Yến', '079099000022', DATE '1987-12-12', 'kh11@gmail.com', '0900000022',
        'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH12', 'khachhang12',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Trịnh Bảo Châu', '079099000023', DATE '1999-08-30', 'kh12@gmail.com', '0900000023',
        'KHACHHANG', 'HOAT_DONG');

-- ------------------------------------------------------------
-- 2. NHANVIEN, HOCHIEUSO, NANGLUCNHANVIEN
-- ------------------------------------------------------------
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV05', 'TK_HDV05', 'HDV', DATE '2024-05-20', 'HOAT_DONG');

INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV06', 'TK_HDV06', 'HDV', DATE '2024-09-01', 'HOAT_DONG');

INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH007', 'TK_KH07', 'Tiền sử say xe nhẹ, ưu tiên ghế đầu.', 'Không ăn hải sản sống', 'BAC', 1850);

INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH008', 'TK_KH08', 'Cần nhắc uống thuốc huyết áp buổi sáng.', 'Không', 'THANH_VIEN', 120);

INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH009', 'TK_KH09', 'Ăn chay ngày rằm.', 'Dị ứng đậu phộng', 'DONG', 720);

INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH010', 'TK_KH10', 'Ưu tiên lịch trình ít leo dốc.', 'Không', 'VANG', 4200);

INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH011', 'TK_KH11', 'Đi cùng gia đình có trẻ nhỏ.', 'Dị ứng tôm', 'KIM_CUONG', 8200);

INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH012', 'TK_KH12', 'Khách mới, cần tư vấn kỹ chính sách hủy.', 'Không', 'THANH_VIEN', 0);

INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV05', 'NV_HDV05',
        'Tiếng Việt, Tiếng Anh, Tiếng Pháp cơ bản',
        'Chứng chỉ HDV quốc tế, Chứng chỉ sơ cứu du lịch',
        'Biển đảo, nghỉ dưỡng cao cấp, tour gia đình',
        4.8, 44);

INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV06', 'NV_HDV06',
        'Tiếng Việt, Tiếng Anh giao tiếp, Tiếng Thái cơ bản',
        'Chứng chỉ HDV nội địa, Chứng chỉ điều phối đoàn',
        'Trekking nhẹ, miền núi phía Bắc, văn hóa bản địa',
        4.5, 29);

-- ------------------------------------------------------------
-- 3. LICHTRINHTOUR - bo sung tour mau con thieu lich trinh
-- ------------------------------------------------------------
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT003_N1', 'TM003', 1, 'Đón sân bay Phú Quốc - Sunset Sanato', 'Nhận phòng, nghỉ ngơi và ngắm hoàng hôn bên biển.', 'Tối: Hải sản nướng');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT003_N2', 'TM003', 2, 'Nam đảo - Hòn Thơm - cáp treo', 'Khám phá biển đảo, tắm biển và chụp ảnh check-in.', 'Trưa: Buffet đảo | Tối: Bún quậy');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT003_N3', 'TM003', 3, 'VinWonders - Safari', 'Tham quan công viên chủ đề và vườn thú bán hoang dã.', 'Sáng: Buffet khách sạn | Tối: Tự túc Grand World');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT003_N4', 'TM003', 4, 'Làng chài Hàm Ninh - Suối Tranh', 'Trải nghiệm văn hóa địa phương, mua đặc sản.', 'Trưa: Ghẹ Hàm Ninh | Tối: Cơm gia đình');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT003_N5', 'TM003', 5, 'Tự do tắm biển - trả phòng - sân bay', 'Kết thúc tour và tiễn khách ra sân bay.', 'Sáng: Buffet khách sạn');

INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT004_N1', 'TM004', 1, 'Hà Nội - Sapa - bản Cát Cát', 'Di chuyển lên Sapa, nhận phòng và tham quan bản Cát Cát.', 'Tối: Lẩu cá hồi');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT004_N2', 'TM004', 2, 'Fansipan - chợ đêm Sapa', 'Chinh phục Fansipan bằng cáp treo, tối tự do khám phá thị trấn.', 'Trưa: Cơm bản | Tối: Đặc sản Sapa');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT004_N3', 'TM004', 3, 'Bắc Hà - Hà Nội', 'Ghé chợ Bắc Hà, mua đặc sản và về Hà Nội.', 'Sáng: Phở chua | Trưa: Cơm địa phương');

INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT008_N1', 'TM008', 1, 'TP HCM - Côn Đảo - nghĩa trang Hàng Dương', 'Đón sân bay, nhận phòng và tham quan điểm di tích.', 'Tối: Hải sản Côn Đảo');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT008_N2', 'TM008', 2, 'Vườn quốc gia - bãi Đầm Trầu', 'Trekking nhẹ trong vườn quốc gia và tắm biển.', 'Trưa: Cơm phần | Tối: Lẩu cá');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT008_N3', 'TM008', 3, 'Lặn ngắm san hô - trải nghiệm xanh', 'Hoạt động biển, nhặt rác bãi biển và ghi nhận điểm xanh.', 'Trưa: Bento biển | Tối: BBQ');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT008_N4', 'TM008', 4, 'Mua đặc sản - sân bay', 'Tự do mua sắm, trả phòng và ra sân bay.', 'Sáng: Buffet khách sạn');

-- ------------------------------------------------------------
-- 4. TOURTHUCTE - du trang thai demo
-- ------------------------------------------------------------
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT011', 'TM003', DATE '2026-09-05', 6200000, 18, 6, 15, 'MO_BAN');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT012', 'TM004', DATE '2026-06-03', 3400000, 16, 6, 10, 'SAP_DIEN_RA');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT013', 'TM005', DATE '2026-05-22', 4550000, 20, 8, 14, 'DANG_DIEN_RA');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT014', 'TM006', DATE '2026-03-18', 3000000, 25, 10, 0, 'KET_THUC');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT015', 'TM007', DATE '2026-04-10', 1950000, 30, 10, 0, 'DA_QUYET_TOAN');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT016', 'TM008', DATE '2026-10-01', 6600000, 15, 5, 15, 'HUY');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT017', 'TM001', DATE '2026-06-20', 3800000, 25, 10, 25, 'MO_BAN');

-- ------------------------------------------------------------
-- 5. VOUCHER va vi voucher khach hang
-- ------------------------------------------------------------
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai)
VALUES ('VC009', 'FAMILY700', 'SO_TIEN', 700000,
        'Giảm 700.000 VNĐ cho nhóm gia đình từ 2 khách trở lên.',
        120, 1, DATE '2026-04-01', DATE '2026-12-31', 'SAN_SANG');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai)
VALUES ('VC010', 'FLASH12', 'PHAN_TRAM', 12,
        'Flash sale giảm 12% cho tour khởi hành trong 60 ngày.',
        80, 1, DATE '2026-05-01', DATE '2026-06-30', 'SAN_SANG');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai)
VALUES ('VC011', 'GREEN300', 'SO_TIEN', 300000,
        'Voucher đổi từ điểm xanh, khuyến khích du lịch bền vững.',
        300, 2, DATE '2026-01-01', DATE '2026-12-31', 'SAN_SANG');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai)
VALUES ('VC012', 'EXPIRED100', 'SO_TIEN', 100000,
        'Voucher đã hết hạn để demo lọc ví voucher.',
        50, 0, DATE '2026-01-01', DATE '2026-03-31', 'SAN_SANG');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai)
VALUES ('VC013', 'DISABLED15', 'PHAN_TRAM', 15,
        'Voucher đã vô hiệu hóa để demo trạng thái kinh doanh.',
        40, 0, DATE '2026-04-01', DATE '2026-12-31', 'VO_HIEU_HOA');

INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH007', 'VC009', DATE '2026-12-31', TIMESTAMP '2026-05-01 09:00:00', 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH007', 'VC011', DATE '2026-12-31', TIMESTAMP '2026-05-03 10:00:00', 'CO_HIEU_LUC');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH008', 'VC011', DATE '2026-12-31', TIMESTAMP '2026-05-04 10:00:00', 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH008', 'VC012', DATE '2026-03-31', TIMESTAMP '2026-02-01 10:00:00', 'HET_HAN');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH009', 'VC010', DATE '2026-06-30', TIMESTAMP '2026-05-05 10:00:00', 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH009', 'VC011', DATE '2026-12-31', TIMESTAMP '2026-05-08 10:00:00', 'CO_HIEU_LUC');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH010', 'VC009', DATE '2026-12-31', TIMESTAMP '2026-05-06 10:00:00', 'CO_HIEU_LUC');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH011', 'VC011', DATE '2026-12-31', TIMESTAMP '2026-05-07 10:00:00', 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH011', 'VC013', DATE '2026-12-31', TIMESTAMP '2026-05-07 11:00:00', 'DA_THU_HOI');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH012', 'VC009', DATE '2026-12-31', TIMESTAMP '2026-05-08 10:00:00', 'CO_HIEU_LUC');

-- ------------------------------------------------------------
-- 6. DONDATTOUR - du trang thai dat tour / thanh toan / huy
-- ------------------------------------------------------------
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT009', 'KH007', 'TTT011', TIMESTAMP '2026-05-01 08:15:00', 12110000, 'DA_XAC_NHAN', NULL,
        'Gia đình 2 người, ưu tiên phòng tầng thấp.', 'HDX001,HDX009');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu)
VALUES ('DDT010', 'KH008', 'TTT011', TIMESTAMP '2026-05-02 09:20:00', 6200000, 'CHO_XAC_NHAN', TIMESTAMP '2026-05-23 23:59:00',
        'Khách cần xác nhận lịch bay trước khi thanh toán.');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu, HanhDongXanh)
VALUES ('DDT011', 'KH009', 'TTT012', TIMESTAMP '2026-05-03 10:10:00', 9372000, 'DA_XAC_NHAN',
        'Nhóm bạn 3 người, có một khách ăn chay.', 'HDX006');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu)
VALUES ('DDT012', 'KH010', 'TTT012', TIMESTAMP '2026-05-04 11:00:00', 6800000, 'CHO_HUY',
        'Khách yêu cầu hủy do thay đổi lịch công tác, chờ kế toán hoàn tiền.');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu, HanhDongXanh)
VALUES ('DDT013', 'KH011', 'TTT013', TIMESTAMP '2026-05-05 13:30:00', 18720000, 'DA_XAC_NHAN',
        'Gia đình 4 người, cần hỗ trợ trẻ nhỏ.', 'HDX001,HDX003');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu)
VALUES ('DDT014', 'KH012', 'TTT013', TIMESTAMP '2026-05-06 14:00:00', 4550000, 'THANH_TOAN_THAT_BAI',
        'Giao dịch thẻ bị lỗi, khách chưa đặt lại.');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu, HanhDongXanh)
VALUES ('DDT015', 'KH007', 'TTT014', TIMESTAMP '2026-03-01 08:45:00', 9360000, 'DA_XAC_NHAN',
        'Đoàn 3 người đã hoàn thành tour miền Tây.', 'HDX005,HDX010');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu)
VALUES ('DDT016', 'KH008', 'TTT014', TIMESTAMP '2026-03-02 09:00:00', 6000000, 'DA_HUY',
        'Khách hủy trước ngày khởi hành, đã hoàn tiền.');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu)
VALUES ('DDT017', 'KH009', 'TTT015', TIMESTAMP '2026-03-20 10:00:00', 3900000, 'DA_XAC_NHAN',
        'Đặt tour Đà Lạt 2 người, đã kết thúc.');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu, HanhDongXanh)
VALUES ('DDT018', 'KH010', 'TTT015', TIMESTAMP '2026-03-21 10:30:00', 2140000, 'DA_XAC_NHAN',
        'Khách đi một mình, có mua room service.', 'HDX009');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu)
VALUES ('DDT019', 'KH011', 'TTT016', TIMESTAMP '2026-05-09 15:20:00', 13200000, 'DA_HUY',
        'Tour Côn Đảo bị hủy do điều kiện thời tiết, đã hoàn tiền.');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu)
VALUES ('DDT020', 'KH012', 'TTT017', TIMESTAMP '2026-05-10 08:00:00', 3800000, 'HET_HAN_GIU_CHO', TIMESTAMP '2026-05-10 20:00:00',
        'Đơn giữ chỗ quá hạn thanh toán.');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu)
VALUES ('DDT021', 'KH007', 'TTT017', TIMESTAMP '2026-05-11 09:00:00', 7800000, 'CHO_XAC_NHAN', TIMESTAMP '2026-05-24 23:59:00',
        'Đơn mới chờ sales xác nhận.');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu)
VALUES ('DDT022', 'KH008', 'TTT011', TIMESTAMP '2026-05-12 10:15:00', 5900000, 'TU_CHOI_HOAN_TIEN',
        'Khách xin hoàn tiền sau hạn chính sách, kế toán đã từ chối.');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu)
VALUES ('DDT023', 'KH009', 'TTT013', TIMESTAMP '2026-05-13 11:10:00', 9540000, 'DA_XAC_NHAN',
        'Đặt thêm city tour đêm cho 2 người.');
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, NgayDat, TongTien, TrangThai, GhiChu)
VALUES ('DDT024', 'KH010', 'TTT012', TIMESTAMP '2026-05-14 15:30:00', 3400000, 'DA_XAC_NHAN',
        'Khách xác nhận đi một mình, không mua thêm dịch vụ.');

-- ------------------------------------------------------------
-- 7. DSNGUOIDONGHANH va CHITIETDATTOUR
-- ------------------------------------------------------------
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_001', 'DDT009', 'Ngô Hải Đăng', '089199000001', '0911000001', DATE '1988-09-09', 'NAM', 'Ăn ít cay');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_002', 'DDT011', 'Phan Linh Chi', '089199000002', '0911000002', DATE '1992-03-12', 'NU', 'Ăn chay');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_003', 'DDT011', 'Phan Đức Huy', '089199000003', '0911000003', DATE '1990-07-25', 'NAM', 'Không dị ứng');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_004', 'DDT012', 'Vũ Hải Nam', '089199000004', '0911000004', DATE '1991-11-02', 'NAM', 'Cần xuất hóa đơn công ty');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_005', 'DDT013', 'Đặng Gia Bảo', '089199000005', '0911000005', DATE '2016-05-20', 'NAM', 'Trẻ em, cần ghế ngồi riêng');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_006', 'DDT013', 'Đặng Minh Khang', '089199000006', '0911000006', DATE '2014-08-16', 'NAM', 'Trẻ em, dị ứng tôm');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_007', 'DDT013', 'Nguyễn Thu Hằng', '089199000007', '0911000007', DATE '1986-02-02', 'NU', 'Mẹ của khách đặt');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_008', 'DDT015', 'Ngô Minh Quân', '089199000008', '0911000008', DATE '1990-06-18', 'NAM', 'Không dùng đồ nhựa');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_009', 'DDT015', 'Lê Thảo My', '089199000009', '0911000009', DATE '1995-09-23', 'NU', 'Tham gia dọn rác điểm đến');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_010', 'DDT016', 'Hoàng Gia Phúc', '089199000010', '0911000010', DATE '1996-01-01', 'NAM', 'Đã hủy cùng đơn');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_011', 'DDT017', 'Phan Ngọc An', '089199000011', '0911000011', DATE '1993-12-01', 'NU', 'Thích hoạt động ngoài trời');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_012', 'DDT019', 'Đặng Tuấn Kiệt', '089199000012', '0911000012', DATE '1985-04-04', 'NAM', 'Đã hoàn tiền do tour hủy');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_013', 'DDT021', 'Ngô Bảo Nam', '089199000013', '0911000013', DATE '2012-07-07', 'NAM', 'Trẻ em, cần hỗ trợ bữa ăn');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_V3_014', 'DDT023', 'Phan Quốc Việt', '089199000014', '0911000014', DATE '1990-10-10', 'NAM', 'Muốn tham quan ban đêm');

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_001', 'DDT009', 'KH007', 'NGUOI_DAT', 6200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_002', 'DDT009', 'NDH_V3_001', 'NGUOI_DONG_HANH', 6200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_003', 'DDT010', 'KH008', 'NGUOI_DAT', 6200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_004', 'DDT011', 'KH009', 'NGUOI_DAT', 3400000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_005', 'DDT011', 'NDH_V3_002', 'NGUOI_DONG_HANH', 3400000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_006', 'DDT011', 'NDH_V3_003', 'NGUOI_DONG_HANH', 3400000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_007', 'DDT012', 'KH010', 'NGUOI_DAT', 3400000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_008', 'DDT012', 'NDH_V3_004', 'NGUOI_DONG_HANH', 3400000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_009', 'DDT013', 'KH011', 'NGUOI_DAT', 4550000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_010', 'DDT013', 'NDH_V3_005', 'NGUOI_DONG_HANH', 4550000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_011', 'DDT013', 'NDH_V3_006', 'NGUOI_DONG_HANH', 4550000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_012', 'DDT013', 'NDH_V3_007', 'NGUOI_DONG_HANH', 4550000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_013', 'DDT014', 'KH012', 'NGUOI_DAT', 4550000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_014', 'DDT015', 'KH007', 'NGUOI_DAT', 3000000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_015', 'DDT015', 'NDH_V3_008', 'NGUOI_DONG_HANH', 3000000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_016', 'DDT015', 'NDH_V3_009', 'NGUOI_DONG_HANH', 3000000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_017', 'DDT016', 'KH008', 'NGUOI_DAT', 3000000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_018', 'DDT016', 'NDH_V3_010', 'NGUOI_DONG_HANH', 3000000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_019', 'DDT017', 'KH009', 'NGUOI_DAT', 1950000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_020', 'DDT017', 'NDH_V3_011', 'NGUOI_DONG_HANH', 1950000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_021', 'DDT018', 'KH010', 'NGUOI_DAT', 1950000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_022', 'DDT019', 'KH011', 'NGUOI_DAT', 6600000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_023', 'DDT019', 'NDH_V3_012', 'NGUOI_DONG_HANH', 6600000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_024', 'DDT020', 'KH012', 'NGUOI_DAT', 3800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_025', 'DDT021', 'KH007', 'NGUOI_DAT', 3800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_026', 'DDT021', 'NDH_V3_013', 'NGUOI_DONG_HANH', 3800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_027', 'DDT022', 'KH008', 'NGUOI_DAT', 6200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_028', 'DDT023', 'KH009', 'NGUOI_DAT', 4550000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_029', 'DDT023', 'NDH_V3_014', 'NGUOI_DONG_HANH', 4550000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_V3_030', 'DDT024', 'KH010', 'NGUOI_DAT', 3400000);

-- ------------------------------------------------------------
-- 8. CHITIETDICHVU, DATTOUR_UUDAI, GIAODICH
-- ------------------------------------------------------------
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_V3_001', 'DDT009', 'DV002', 2, 80000, 160000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_V3_002', 'DDT009', 'DV003', 1, 250000, 250000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_V3_003', 'DDT011', 'DV001', 3, 150000, 450000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_V3_004', 'DDT013', 'DV008', 1, 500000, 500000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_V3_005', 'DDT013', 'DV002', 4, 80000, 320000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_V3_006', 'DDT015', 'DV004', 3, 120000, 360000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_V3_007', 'DDT018', 'DV009', 2, 95000, 190000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_V3_008', 'DDT021', 'DV012', 1, 200000, 200000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_V3_009', 'DDT023', 'DV010', 2, 220000, 440000);

INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai, NgayApDung) VALUES ('DDT009', 'VC009', 700000, TIMESTAMP '2026-05-01 08:20:00');
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai, NgayApDung) VALUES ('DDT011', 'VC010', 1278000, TIMESTAMP '2026-05-03 10:15:00');
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai, NgayApDung) VALUES ('DDT013', 'VC011', 300000, TIMESTAMP '2026-05-05 13:35:00');
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai, NgayApDung) VALUES ('DDT022', 'VC011', 300000, TIMESTAMP '2026-05-12 10:20:00');

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_001', 'DDT009', 'THANH_TOAN', 'THE_VISA', 12110000, 'VISA_V3_001', 'THANH_CONG', TIMESTAMP '2026-05-01 08:25:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, TrangThai) VALUES ('GD_V3_002', 'DDT010', 'THANH_TOAN', 'CHUYEN_KHOAN', 6200000, 'CHO_THANH_TOAN');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_003', 'DDT011', 'THANH_TOAN', 'THE_ATM', 9372000, 'ATM_V3_003', 'THANH_CONG', TIMESTAMP '2026-05-03 10:20:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_004', 'DDT012', 'THANH_TOAN', 'CHUYEN_KHOAN', 6800000, 'BANK_V3_004', 'THANH_CONG', TIMESTAMP '2026-05-04 11:10:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, TrangThai) VALUES ('GD_V3_005', 'DDT012', 'HOAN_TIEN', 'CHUYEN_KHOAN', 6800000, 'CHO_THANH_TOAN');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_006', 'DDT013', 'THANH_TOAN', 'THE_VISA', 18720000, 'VISA_V3_006', 'THANH_CONG', TIMESTAMP '2026-05-05 13:45:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_007', 'DDT014', 'THANH_TOAN', 'THE_VISA', 4550000, 'VISA_V3_FAIL', 'THAT_BAI', TIMESTAMP '2026-05-06 14:05:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_008', 'DDT015', 'THANH_TOAN', 'CHUYEN_KHOAN', 9360000, 'BANK_V3_008', 'THANH_CONG', TIMESTAMP '2026-03-01 09:00:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_009', 'DDT016', 'THANH_TOAN', 'THE_ATM', 6000000, 'ATM_V3_009', 'THANH_CONG', TIMESTAMP '2026-03-02 09:10:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_010', 'DDT016', 'HOAN_TIEN', 'CHUYEN_KHOAN', 6000000, 'RF_V3_010', 'DA_HOAN_TIEN', TIMESTAMP '2026-03-05 10:00:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_011', 'DDT017', 'THANH_TOAN', 'CHUYEN_KHOAN', 3900000, 'BANK_V3_011', 'THANH_CONG', TIMESTAMP '2026-03-20 10:15:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_012', 'DDT018', 'THANH_TOAN', 'THE_VISA', 2140000, 'VISA_V3_012', 'THANH_CONG', TIMESTAMP '2026-03-21 10:45:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_013', 'DDT019', 'THANH_TOAN', 'CHUYEN_KHOAN', 13200000, 'BANK_V3_013', 'THANH_CONG', TIMESTAMP '2026-05-09 15:30:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_014', 'DDT019', 'HOAN_TIEN', 'CHUYEN_KHOAN', 13200000, 'RF_V3_014', 'DA_HOAN_TIEN', TIMESTAMP '2026-05-12 09:00:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, TrangThai) VALUES ('GD_V3_015', 'DDT020', 'THANH_TOAN', 'MOCK', 3800000, 'CHO_THANH_TOAN');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, TrangThai) VALUES ('GD_V3_016', 'DDT021', 'THANH_TOAN', 'MOCK', 7800000, 'CHO_THANH_TOAN');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_017', 'DDT022', 'THANH_TOAN', 'THE_VISA', 5900000, 'VISA_V3_017', 'THANH_CONG', TIMESTAMP '2026-05-12 10:30:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_018', 'DDT022', 'HOAN_TIEN', 'CHUYEN_KHOAN', 5900000, 'RF_V3_FAIL', 'THAT_BAI', TIMESTAMP '2026-05-13 09:00:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_019', 'DDT023', 'THANH_TOAN', 'THE_ATM', 9540000, 'ATM_V3_019', 'THANH_CONG', TIMESTAMP '2026-05-13 11:20:00');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_V3_020', 'DDT024', 'THANH_TOAN', 'CHUYEN_KHOAN', 3400000, 'BANK_V3_020', 'THANH_CONG', TIMESTAMP '2026-05-14 15:45:00');

-- ------------------------------------------------------------
-- 9. PHANCONGTOUR, LICHSUTOUR, DIEMDANH, HANHDONG
-- ------------------------------------------------------------
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong) VALUES ('PCT011', 'TTT011', 'NV_HDV05', TIMESTAMP '2026-05-01 09:00:00');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong) VALUES ('PCT012', 'TTT012', 'NV_HDV06', TIMESTAMP '2026-05-02 09:00:00');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong) VALUES ('PCT013', 'TTT013', 'NV_HDV03', TIMESTAMP '2026-05-10 09:00:00');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong) VALUES ('PCT014', 'TTT014', 'NV_HDV04', TIMESTAMP '2026-03-05 09:00:00');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong) VALUES ('PCT015', 'TTT015', 'NV_HDV05', TIMESTAMP '2026-03-25 09:00:00');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong) VALUES ('PCT016', 'TTT016', 'NV_HDV06', TIMESTAMP '2026-05-08 09:00:00');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong) VALUES ('PCT017', 'TTT017', 'NV_HDV01', TIMESTAMP '2026-05-11 09:00:00');

INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia) VALUES ('LS_V3_001', 'KH007', 'TTT014', 'CTDT_V3_014', DATE '2026-03-18');
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia) VALUES ('LS_V3_002', 'KH009', 'TTT015', 'CTDT_V3_019', DATE '2026-04-10');
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia) VALUES ('LS_V3_003', 'KH010', 'TTT015', 'CTDT_V3_021', DATE '2026-04-10');

INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_001', 'TTT013', 'KH011', 'NGUOI_DAT', 'NV_HDV03', TIMESTAMP '2026-05-22 07:15:00', 'Ga Huế', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_002', 'TTT013', 'NDH_V3_005', 'NGUOI_DONG_HANH', 'NV_HDV03', TIMESTAMP '2026-05-22 07:16:00', 'Ga Huế', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_003', 'TTT013', 'NDH_V3_006', 'NGUOI_DONG_HANH', 'NV_HDV03', TIMESTAMP '2026-05-22 07:18:00', 'Ga Huế', 'VANG');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_004', 'TTT013', 'NDH_V3_007', 'NGUOI_DONG_HANH', 'NV_HDV03', TIMESTAMP '2026-05-22 07:19:00', 'Ga Huế', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_005', 'TTT013', 'KH009', 'NGUOI_DAT', 'NV_HDV03', TIMESTAMP '2026-05-22 07:25:00', 'Ga Huế', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_006', 'TTT013', 'NDH_V3_014', 'NGUOI_DONG_HANH', 'NV_HDV03', TIMESTAMP '2026-05-22 07:26:00', 'Ga Huế', 'CHUA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_007', 'TTT014', 'KH007', 'NGUOI_DAT', 'NV_HDV04', TIMESTAMP '2026-03-18 06:45:00', 'Bến Ninh Kiều', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_008', 'TTT014', 'NDH_V3_008', 'NGUOI_DONG_HANH', 'NV_HDV04', TIMESTAMP '2026-03-18 06:46:00', 'Bến Ninh Kiều', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_009', 'TTT014', 'NDH_V3_009', 'NGUOI_DONG_HANH', 'NV_HDV04', TIMESTAMP '2026-03-18 06:47:00', 'Bến Ninh Kiều', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_010', 'TTT015', 'KH009', 'NGUOI_DAT', 'NV_HDV05', TIMESTAMP '2026-04-10 08:00:00', 'Sân bay Liên Khương', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_011', 'TTT015', 'NDH_V3_011', 'NGUOI_DONG_HANH', 'NV_HDV05', TIMESTAMP '2026-04-10 08:02:00', 'Sân bay Liên Khương', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai) VALUES ('DD_V3_012', 'TTT015', 'KH010', 'NGUOI_DAT', 'NV_HDV05', TIMESTAMP '2026-04-10 08:05:00', 'Sân bay Liên Khương', 'DA_DIEM_DANH');

INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD_V3_001', 'TTT013', 'KH011', 'HDX001', 'NV_HDV03', TIMESTAMP '2026-05-22 09:20:00', 'Khách dùng bình nước cá nhân khi tham quan Đại Nội.');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD_V3_002', 'TTT013', 'KH011', 'HDX003', 'NV_HDV03', TIMESTAMP '2026-05-22 16:30:00', 'Gia đình tham gia nhặt rác tại điểm dừng chân.');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD_V3_003', 'TTT013', 'KH009', 'HDX006', 'NV_HDV03', TIMESTAMP '2026-05-22 17:00:00', 'Khách dùng túi vải mua đặc sản địa phương.');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD_V3_004', 'TTT014', 'KH007', 'HDX005', 'NV_HDV04', TIMESTAMP '2026-03-19 08:00:00', 'Khách mượn xe đạp tham quan làng nghề.');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD_V3_005', 'TTT014', 'KH007', 'HDX010', 'NV_HDV04', TIMESTAMP '2026-03-19 15:30:00', 'Khách mua sản phẩm thủ công địa phương.');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD_V3_006', 'TTT015', 'KH009', 'HDX009', 'NV_HDV05', TIMESTAMP '2026-04-11 09:00:00', 'Khách đăng ký eco room tại khách sạn.');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD_V3_007', 'TTT015', 'KH010', 'HDX002', 'NV_HDV05', TIMESTAMP '2026-04-11 11:00:00', 'Khách từ chối đồ nhựa dùng một lần.');

-- ------------------------------------------------------------
-- 10. NHATKYSUCO, CHIPHITHUCTE, QUYETTOAN
-- ------------------------------------------------------------
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('NKSC_V3_001', 'TTT013', 'NV_HDV03',
        'Một trẻ em trong đoàn bị sốt cao sau khi đến Huế.',
        'Đưa khách đến phòng y tế gần nhất, liên hệ gia đình và điều hành theo dõi.',
        'SOS', 'Y_TE', TIMESTAMP '2026-05-22 11:10:00');
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('NKSC_V3_002', 'TTT013', 'NV_HDV03',
        'Mưa lớn làm chậm lịch trình tham quan Đại Nội 30 phút.',
        'Điều chỉnh thứ tự điểm tham quan, ưu tiên điểm trong nhà.',
        'THAP', 'THOI_TIET', TIMESTAMP '2026-05-22 14:00:00');
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('NKSC_V3_003', 'TTT014', 'NV_HDV04',
        'Thuyền chợ nổi khởi hành muộn do kẹt bến.',
        'Đổi sang thuyền dự phòng, lịch trình trễ 20 phút.',
        'THAP', 'PHUONG_TIEN', TIMESTAMP '2026-03-18 08:30:00');
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('NKSC_V3_004', 'TTT015', 'NV_HDV05',
        'Nhà hàng thay đổi thực đơn do thiếu nguyên liệu.',
        'Thỏa thuận món thay thế tương đương và giảm chi phí phát sinh.',
        'THAP', 'AN_UONG', TIMESTAMP '2026-04-10 19:30:00');
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('NKSC_V3_005', 'TTT016', 'NV_HDV06',
        'Dự báo thời tiết xấu kéo dài, không đảm bảo an toàn vận hành tour Côn Đảo.',
        'Điều hành quyết định hủy tour và hoàn tiền cho khách.',
        'SOS', 'THOI_TIET', TIMESTAMP '2026-05-09 08:00:00');

INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CPTT_V3_001', 'TTT014', 'NV_HDV04', 'Thuê thuyền dự phòng chợ nổi', 700000, 'https://example.com/hoa-don/thuyen-du-phong.jpg', 'DA_DUYET', TIMESTAMP '2026-03-18 09:00:00');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CPTT_V3_002', 'TTT014', 'NV_HDV04', 'Nước uống và khăn lạnh cho đoàn', 400000, 'https://example.com/hoa-don/nuoc-uong.jpg', 'DA_DUYET', TIMESTAMP '2026-03-18 10:00:00');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CPTT_V3_003', 'TTT014', 'NV_HDV04', 'Chi phí mua đặc sản vượt định mức', 950000, 'https://example.com/hoa-don/dac-san.jpg', 'TU_CHOI', TIMESTAMP '2026-03-19 16:00:00');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CPTT_V3_004', 'TTT015', 'NV_HDV05', 'Bù chênh lệch thực đơn nhà hàng', 650000, 'https://example.com/hoa-don/bu-thuc-don.jpg', 'DA_DUYET', TIMESTAMP '2026-04-10 20:00:00');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CPTT_V3_005', 'TTT015', 'NV_HDV05', 'Vé xe điện nội khu phát sinh', 250000, 'https://example.com/hoa-don/xe-dien.jpg', 'DA_DUYET', TIMESTAMP '2026-04-11 10:00:00');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CPTT_V3_006', 'TTT013', 'NV_HDV03', 'Chi phí y tế khẩn cấp cho trẻ em', 320000, 'https://example.com/hoa-don/y-te.jpg', 'CHO_DUYET', TIMESTAMP '2026-05-22 12:00:00');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CPTT_V3_007', 'TTT013', 'NV_HDV03', 'Phụ phí đổi điểm tham quan do mưa', 450000, NULL, 'YEU_CAU_BO_SUNG', TIMESTAMP '2026-05-22 15:00:00');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CPTT_V3_008', 'TTT016', 'NV_HDV06', 'Phí hủy dịch vụ vận chuyển do thời tiết', 1200000, 'https://example.com/hoa-don/huy-xe.jpg', 'CHO_DUYET', TIMESTAMP '2026-05-09 09:00:00');

INSERT INTO QUYETTOAN (MaQuyetToan, MaTourThucTe, TongDoanhThu, TongChiPhi, GiaCamKet, LoiNhuan, MaNhanVien, NgayQuyetToan, TrangThai, GhiChu)
VALUES ('QT003', 'TTT014', 9360000, 1100000, 1500000, 8260000, 'NV_KT01', TIMESTAMP '2026-03-25 09:00:00', 'CHUA_QUYET_TOAN',
        'Nháp quyết toán tour miền Tây, chờ kiểm tra chi phí bị từ chối.');

INSERT INTO QUYETTOAN (MaQuyetToan, MaTourThucTe, TongDoanhThu, TongChiPhi, GiaCamKet, LoiNhuan, MaNhanVien, NgayQuyetToan, TrangThai, GhiChu)
VALUES ('QT004', 'TTT015', 6040000, 900000, 1000000, 5140000, 'NV_KT01', TIMESTAMP '2026-04-18 09:30:00', 'DA_QUYET_TOAN',
        'Tour Đà Lạt đã quyết toán, lợi nhuận đạt kỳ vọng.');

-- ------------------------------------------------------------
-- 11. NHATKYDOIDIEM, YEUCAUHOTRO, DANHGIAKH, NHATKYHETHONG
-- ------------------------------------------------------------
INSERT INTO NHATKYDOIDIEM (MaNhatKyDoiDiem, MaKhachHang, MaVoucher, DiemQuyDoi, NgayQuyDoi)
VALUES ('NKDD_V3_001', 'KH007', 'VC011', 300, TIMESTAMP '2026-05-03 10:00:00');
INSERT INTO NHATKYDOIDIEM (MaNhatKyDoiDiem, MaKhachHang, MaVoucher, DiemQuyDoi, NgayQuyDoi)
VALUES ('NKDD_V3_002', 'KH009', 'VC011', 300, TIMESTAMP '2026-05-08 10:00:00');
INSERT INTO NHATKYDOIDIEM (MaNhatKyDoiDiem, MaKhachHang, MaVoucher, DiemQuyDoi, NgayQuyDoi)
VALUES ('NKDD_V3_003', 'KH011', 'VC011', 300, TIMESTAMP '2026-05-07 10:00:00');

INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT006', 'DDT012', 'KH010', 'HUY_TOUR', 'Tôi cần hủy tour Sapa do trùng lịch công tác, mong được hoàn tiền.', 'CHO_GIAI_TRINH', 'NV_SALES01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT007', 'DDT014', 'KH012', 'THANH_TOAN', 'Thanh toán thẻ bị lỗi, tôi muốn được hỗ trợ tạo lại giao dịch.', 'CHUA_XU_LY', NULL);
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT008', 'DDT013', 'KH011', 'Y_TE', 'Con tôi bị sốt trong ngày đầu tour, cần xác nhận chi phí y tế phát sinh.', 'DA_XU_LY', 'NV_SALES02');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT009', 'DDT021', 'KH007', 'TU_VAN_TOUR', 'Tôi cần xác nhận phòng phù hợp cho gia đình có trẻ em.', 'CHO_BO_SUNG', 'NV_SALES01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT010', 'DDT022', 'KH008', 'HOAN_TIEN', 'Tôi yêu cầu hoàn tiền dù đã quá hạn chính sách.', 'TU_CHOI', 'NV_SALES02');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT011', 'DDT019', 'KH011', 'HUY_TOUR', 'Tour Côn Đảo bị hủy, vui lòng xác nhận hoàn tiền cho gia đình tôi.', 'DA_XU_LY', 'NV_SALES01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT012', NULL, 'KH012', 'TU_VAN_TOUR', 'Tôi muốn tìm tour biển đảo phù hợp ngân sách 6 triệu.', 'CHUA_XU_LY', NULL);

INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG004', 'TTT014', 'KH007', 5, 'Tour miền Tây thân thiện, HDV hỗ trợ tốt và lịch trình nhẹ nhàng.', TIMESTAMP '2026-03-22 20:00:00');
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG005', 'TTT015', 'KH009', 4, 'Đà Lạt đẹp, lịch trình hợp lý. Bữa tối ngày đầu có thay đổi nhưng được xử lý ổn.', TIMESTAMP '2026-04-13 21:00:00');
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG006', 'TTT015', 'KH010', 3, 'Tour ổn nhưng cần thông báo sớm hơn khi đổi thực đơn.', TIMESTAMP '2026-04-13 21:15:00');

INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_V3_001', 'TK_ADMIN01', 'THEM', 'TAIKHOAN', 'TK_KH07', TIMESTAMP '2026-05-01 08:00:00');
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_V3_002', 'TK_ADMIN01', 'THEM', 'TAIKHOAN', 'TK_HDV05', TIMESTAMP '2026-05-01 08:05:00');
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_V3_003', 'TK_MGR01', 'THEM', 'TOURTHUCTE', 'TTT013', TIMESTAMP '2026-05-10 09:00:00');
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_V3_004', 'TK_MGR01', 'THEM', 'PHANCONGTOUR', 'PCT013', TIMESTAMP '2026-05-10 09:05:00');
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_V3_005', 'TK_KH07', 'THEM', 'DONDATTOUR', 'DDT009', TIMESTAMP '2026-05-01 08:15:00');
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_V3_006', 'TK_SALES01', 'CAP_NHAT', 'DONDATTOUR', 'DDT009', TIMESTAMP '2026-05-01 08:30:00');
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_V3_007', 'TK_HDV03', 'THEM', 'NHATKYSUCO', 'NKSC_V3_001', TIMESTAMP '2026-05-22 11:10:00');
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_V3_008', 'TK_KT01', 'CAP_NHAT', 'CHIPHITHUCTE', 'CPTT_V3_004', TIMESTAMP '2026-04-12 09:00:00');
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_V3_009', 'TK_KT01', 'THEM', 'QUYETTOAN', 'QT004', TIMESTAMP '2026-04-18 09:30:00');
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_V3_010', 'TK_SALES02', 'CAP_NHAT', 'YEUCAUHOTRO', 'YCHT008', TIMESTAMP '2026-05-22 16:00:00');

COMMIT;
-- ============================================================
-- END SEED DATA v3 DEMO
-- ============================================================
