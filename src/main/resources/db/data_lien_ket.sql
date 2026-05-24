-- ============================================================
-- SEED DATA LIEN KET - Tour, khach hang, HDV, dieu hanh
-- Chay sau:
--   @src/main/resources/db/KhoiTaoBang.sql
--   @src/main/resources/db/data_v1.sql
--
-- Ghi chu nghiep vu:
-- - TOURTHUCTE khong co FK truc tiep den nhan vien dieu hanh.
-- - Seed nay the hien nguoi dieu hanh bang NHATKYHETHONG:
--   TK_MGR01 / NV_MGR01 ghi nhan THEM/CAP_NHAT tren tung TOURTHUCTE.
-- - Ten TOURMAU dung dinh dang: Dia diem - tieu de.
-- ============================================================

-- ------------------------------------------------------------
-- 0. RESET DU LIEU LIEN KET NEU CHAY LAI SCRIPT
-- ------------------------------------------------------------
UPDATE TOURTHUCTE
SET TrangThai = 'KET_THUC'
WHERE MaTourThucTe LIKE 'TTT_%'
  AND TrangThai = 'DA_QUYET_TOAN';

DELETE FROM DANHGIAKH        WHERE MaDanhGiaKhachHang LIKE 'DG_%';
DELETE FROM YEUCAUHOTRO      WHERE MaYeuCauHoTro LIKE 'YCHT_%' OR MaDatTour LIKE 'DDT_%';
DELETE FROM NHATKYDOIDIEM    WHERE MaNhatKyDoiDiem LIKE 'NKDD_%';
DELETE FROM QUYETTOAN        WHERE MaQuyetToan LIKE 'QT_%';
DELETE FROM CHIPHITHUCTE     WHERE MaChiPhiThucTe LIKE 'CP_%';
DELETE FROM NHATKYSUCO       WHERE MaNhatKySuCo LIKE 'SC_%';
DELETE FROM HANHDONG         WHERE MaGhiNhanHanhDong LIKE 'HD_%';
DELETE FROM DIEMDANH         WHERE MaDiemDanh LIKE 'DD_%';
DELETE FROM PHANCONGTOUR     WHERE MaPhanCongTour LIKE 'PC_%';
DELETE FROM LICHSUTOUR       WHERE MaLichSuTour LIKE 'LST_%';
DELETE FROM GIAODICH         WHERE MaGiaoDich LIKE 'GD_%';
DELETE FROM DATTOUR_UUDAI    WHERE MaDatTour LIKE 'DDT_%' OR MaVoucher LIKE 'VC_%';
DELETE FROM KHUYENMAI_KH     WHERE MaKhachHang LIKE 'KH_%' OR MaVoucher LIKE 'VC_%';
DELETE FROM VOUCHER          WHERE MaVoucher LIKE 'VC_%';
DELETE FROM CHITIETDICHVU    WHERE MaChiTietDichVu LIKE 'CTDV_%';
DELETE FROM CHITIETDATTOUR   WHERE MaChiTietDat LIKE 'CTDT_%';
DELETE FROM DSNGUOIDONGHANH  WHERE MaNguoiDongHanh LIKE 'NDH_%';
DELETE FROM DONDATTOUR       WHERE MaDatTour LIKE 'DDT_%';
DELETE FROM HDX_TOURTHUCTE   WHERE MaTourThucTe LIKE 'TTT_%' OR MaHanhDongXanh LIKE 'HDX_%';
DELETE FROM DICHVU_TOURTHUCTE WHERE MaTourThucTe LIKE 'TTT_%' OR MaDichVuThem LIKE 'DVT_%';
DELETE FROM TOURTHUCTE       WHERE MaTourThucTe LIKE 'TTT_%';
DELETE FROM LICHTRINHTOUR    WHERE MaLichTrinhTour LIKE 'LTT_%';
DELETE FROM TOURMAU          WHERE MaTourMau LIKE 'TM_%';
DELETE FROM HANHDONGXANH     WHERE MaHanhDongXanh LIKE 'HDX_%';
DELETE FROM DICHVUTHEM       WHERE MaDichVuThem LIKE 'DVT_%';
DELETE FROM NANGLUCNHANVIEN  WHERE MaNangLucNhanVien LIKE 'NL_%';
DELETE FROM NHATKYHETHONG    WHERE MaNhatKyHeThong LIKE 'NKHT_%';
DELETE FROM HOCHIEUSO        WHERE MaKhachHang LIKE 'KH_%';
DELETE FROM TAIKHOAN         WHERE MaTaiKhoan LIKE 'TK_KH_%';

-- ------------------------------------------------------------
-- 1. NANG LUC HDV VA KHACH HANG
-- ------------------------------------------------------------
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV01', 'NV_HDV01', 'Tieng Viet, Tieng Anh', 'The HDV noi dia; So cap cuu co ban', 'Tay Bac, trekking, tour xanh', 4.80, 126);

INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV02', 'NV_HDV02', 'Tieng Viet, Tieng Anh, Tieng Han', 'The HDV quoc te', 'Bien dao, di san mien Trung, gia dinh', 4.70, 98);

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_01', 'khach01', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Tran Minh Khoa', '079199000101', DATE '1995-02-14', 'khach01@digitaltravel.vn', '0911000101', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_02', 'khach02', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Pham Ngoc Linh', '079199000102', DATE '1997-08-20', 'khach02@digitaltravel.vn', '0911000102', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_03', 'khach03', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Le Thu Ha', '079199000103', DATE '1992-11-03', 'khach03@digitaltravel.vn', '0911000103', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_04', 'khach04', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyen Bao Chau', '079199000104', DATE '1989-05-09', 'khach04@digitaltravel.vn', '0911000104', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_05', 'khach05', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Do Quang Huy', '079199000105', DATE '1986-12-25', 'khach05@digitaltravel.vn', '0911000105', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_06', 'khach06', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Bui Anh Thu', '079199000106', DATE '1999-04-18', 'khach06@digitaltravel.vn', '0911000106', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_07', 'khach07', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Hoang Viet Anh', '079199000107', DATE '1991-01-16', 'khach07@digitaltravel.vn', '0911000107', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_08', 'khach08', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Vu Khanh Vy', '079199000108', DATE '1994-09-27', 'khach08@digitaltravel.vn', '0911000108', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_09', 'khach09', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Dang Gia Han', '079199000109', DATE '1988-03-30', 'khach09@digitaltravel.vn', '0911000109', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_10', 'khach10', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Mai Phuong Nhi', '079199000110', DATE '1996-06-12', 'khach10@digitaltravel.vn', '0911000110', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_11', 'khach11', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Cao Minh Tri', '079199000111', DATE '1984-10-08', 'khach11@digitaltravel.vn', '0911000111', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_12', 'khach12', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Trinh My Duyen', '079199000112', DATE '1998-07-07', 'khach12@digitaltravel.vn', '0911000112', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_13', 'khach13', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyen Duc Long', '079199000113', DATE '1985-09-19', 'khach13@digitaltravel.vn', '0911000113', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_14', 'khach14', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Lam Tue Minh', '079199000114', DATE '1990-02-28', 'khach14@digitaltravel.vn', '0911000114', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_15', 'khach15', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Phan Gia Bao', '079199000115', DATE '1993-12-02', 'khach15@digitaltravel.vn', '0911000115', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_01', 'TK_KH_01', 'An chay vao buoi toi', 'Hai san', 'DONG', 650);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_02', 'TK_KH_02', 'Di cung gia dinh co tre em', NULL, 'BAC', 2400);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_03', 'TK_KH_03', NULL, 'Dau phong', 'THANH_VIEN', 200);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_04', 'TK_KH_04', 'Can phong tang thap', NULL, 'VANG', 5600);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_05', 'TK_KH_05', NULL, NULL, 'KIM_CUONG', 10200);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_06', 'TK_KH_06', 'Can xac nhan dich vu dua don san bay', NULL, 'DONG', 850);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_07', 'TK_KH_07', 'Uu tien phong khong hut thuoc', NULL, 'THANH_VIEN', 120);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_08', 'TK_KH_08', 'Di cung nguoi cao tuoi', 'Sua bo', 'DONG', 780);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_09', 'TK_KH_09', 'Can xuat hoa don cong ty', NULL, 'BAC', 3100);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_10', 'TK_KH_10', NULL, 'Hai san co vo', 'VANG', 6200);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_11', 'TK_KH_11', 'Can lich trinh it leo doc', NULL, 'KIM_CUONG', 11800);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_12', 'TK_KH_12', 'An chay truong', NULL, 'BAC', 2800);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_13', 'TK_KH_13', 'Can phong yen tinh de lam viec tu xa', NULL, 'VANG', 7100);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_14', 'TK_KH_14', 'Di cung tre nho duoi 6 tuoi', 'Trung ga', 'DONG', 950);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_15', 'TK_KH_15', NULL, 'Phan hoa', 'THANH_VIEN', 320);

-- ------------------------------------------------------------
-- 2. DANH MUC TOUR, DICH VU, HANH DONG XANH
-- ------------------------------------------------------------
INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_SAPA', 'Sa Pa - Săn mây Fansipan và bản Cát Cát',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan Fansipan và bản Cát Cát
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 3, 4500000, 4.70, 86);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_DANANG', 'Đà Nẵng - Di sản miền Trung xanh',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan Sơn Trà, Hội An và Mỹ Sơn
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 4, 6200000, 4.60, 73);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_DALAT', 'Đà Lạt - Rừng thông và nông trại xanh',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan nông trại xanh và các điểm trong lịch trình
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 3, 3900000, 4.50, 64);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_NINHBINH', 'Ninh Bình - Tràng An và chùa Bái Đính',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan Tràng An, Hoa Lư và chùa Bái Đính
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 2, 2800000, 4.80, 112);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_PHUQUOC', 'Phú Quốc - Biển xanh và hoàng hôn Nam Đảo',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan Nam Đảo và các điểm trong lịch trình
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 4, 7600000, 4.40, 59);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_HUE', 'Huế - Kinh thành và ẩm thực cố đô',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan Đại Nội, lăng tẩm và làng nghề
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 3, 4100000, 4.65, 91);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_HAGIANG', 'Hà Giang - Cung đường đá và chợ phiên',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan cao nguyên đá và các điểm chợ phiên
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 4, 5900000, 4.30, 41);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_HALONG', 'Hạ Long - Du thuyền vịnh xanh',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan Vịnh Hạ Long và Cát Bà
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 3, 5600000, 4.55, 67);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_CANTHO', 'Cần Thơ - Chợ nổi và miệt vườn sông nước',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan chợ nổi Cái Răng và miệt vườn
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 3, 3500000, 4.75, 88);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_CONDAO', 'Côn Đảo - Biển hoang sơ và ký ức lịch sử',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan Côn Đảo, di tích lịch sử và bãi biển
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 4, 8300000, 4.60, 52);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_MOCCHAU', 'Mộc Châu - Đồi chè và mùa hoa cao nguyên',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan đồi chè, nông trại và điểm mùa hoa
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 2, 2600000, 4.50, 74);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_QUYNHON', 'Quy Nhơn - Kỳ Co Eo Gió và làng chài',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan Kỳ Co, Eo Gió và làng chài
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 3, 5200000, 4.68, 81);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_HOIAN', 'Hội An - Phố cổ và làng rau Trà Quế',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan phố cổ Hội An và làng rau Trà Quế
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 3, 4400000, 4.72, 93);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_BUONMATHUOT', 'Buôn Ma Thuột - Cà phê và thác Dray Nur',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan bảo tàng cà phê, Buôn Đôn và thác Dray Nur
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 3, 4000000, 4.65, 80);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_PULUONG', 'Pù Luông - Ruộng bậc thang và bản làng',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan Pù Luông, bản làng và ruộng bậc thang
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 2, 3200000, 4.63, 76);

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_MUINE', 'Mũi Né - Đồi cát và biển xanh Phan Thiết',
        'Bao gồm:
- Xe đưa đón theo chương trình
- Vé tham quan đồi cát, làng chài Mũi Né và các điểm biển
- Lưu trú và bữa ăn theo lịch trình
- Hướng dẫn viên du lịch
Không bao gồm:
- Chi phí cá nhân
- Đồ uống ngoài chương trình
- VAT
- Tips cho hướng dẫn viên và tài xế', 3, 4700000, 4.42, 69);

INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_SAPA_01', 'TM_SAPA', 1, 'Hà Nội - Sa Pa - Cát Cát', 'Di chuyển, nhận phòng, tham quan bản Cát Cát.', 'Cơm lam, gà đồi');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_SAPA_02', 'TM_SAPA', 2, 'Fansipan - Chợ đêm Sa Pa', 'Săn mây Fansipan và tự do khám phá thị trấn.', 'Lẩu cá tầm');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_SAPA_03', 'TM_SAPA', 3, 'Tả Van - Hà Nội', 'Tham quan Tả Van, ăn trưa và về lại Hà Nội.', 'Cơm rang, đặc sản');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_DANANG_01', 'TM_DANANG', 1, 'Đà Nẵng - Sơn Trà', 'Đón khách, tham quan bán đảo Sơn Trà.', 'Hải sản địa phương');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_DANANG_02', 'TM_DANANG', 2, 'Hội An', 'Tham quan phố cổ, ăn trưa đặc sản.', 'Cao lầu, mì Quảng');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_DANANG_03', 'TM_DANANG', 3, 'Bà Nà Hills', 'Tham quan Bà Nà Hills, cầu Vàng.', 'Buffet');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_DANANG_04', 'TM_DANANG', 4, 'Mua sắm - Tiễn khách', 'Mua sắm đặc sản, tiễn khách ra sân bay.', 'Hải sản nhẹ');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_DALAT_01', 'TM_DALAT', 1, 'Nông trại hữu cơ', 'Làm quen lịch trình xanh và thu hoạch rau sạch.', 'Rau củ cao nguyên');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_DALAT_02', 'TM_DALAT', 2, 'Đồi chè Cầu Đất', 'Ngắm bình minh, tham quan xưởng chè.', 'Lẩu thả');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_DALAT_03', 'TM_DALAT', 3, 'Làng hoa Vạn Thành', 'Tham quan làng hoa, xe đưa khách về.', 'Cơm niêu');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_NB_01', 'TM_NINHBINH', 1, 'Tràng An - Hoa Lư', 'Đi thuyền tham quan Tràng An, thăm cố đô Hoa Lư.', 'Dê núi, cơm cháy');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_NB_02', 'TM_NINHBINH', 2, 'Chùa Bái Đính', 'Tham quan chùa Bái Đính, kết thúc chương trình.', 'Cơm chay');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HUE_01', 'TM_HUE', 1, 'Kinh thành Huế', 'Tham quan Đại Nội và nghe ca Huế trên sông Hương.', 'Bún bò Huế');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HUE_02', 'TM_HUE', 2, 'Lăng tẩm', 'Tham quan lăng Tự Đức, Khải Định.', 'Bánh bèo nậm lọc');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HUE_03', 'TM_HUE', 3, 'Chợ Đông Ba', 'Mua sắm đặc sản, tiễn khách ra ga/sân bay.', 'Bún thịt nướng');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HALONG_01', 'TM_HALONG', 1, 'Hà Nội - Hạ Long - Du thuyền', 'Nhận phòng trên du thuyền và ngắm hoàng hôn trên vịnh.', 'Hải sản trên tàu');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_CANTHO_01', 'TM_CANTHO', 1, 'Cần Thơ - Bến Ninh Kiều', 'Đón khách và tham quan bến Ninh Kiều buổi tối.', 'Lẩu mắm miền Tây');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_CONDAO_01', 'TM_CONDAO', 1, 'Côn Đảo - Bãi Đầm Trầu', 'Nhận phòng, nghỉ biển và hướng dẫn quy tắc bảo vệ môi trường biển.', 'Hải sản địa phương');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_MOCCHAU_01', 'TM_MOCCHAU', 1, 'Đồi chè trái tim', 'Tham quan đồi chè, cầu kính và nông trại bò sữa.', 'Bê chao, rau cải mèo');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_QUYNHON_01', 'TM_QUYNHON', 1, 'Kỳ Co - Eo Gió', 'Đi canoe ra Kỳ Co, tham quan Eo Gió và làng chài Nhơn Lý.', 'Bún chả cá Quy Nhơn');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HOIAN_01', 'TM_HOIAN', 1, 'Phố cổ Hội An - Trà Quế', 'Tham quan phố cổ và lớp nấu ăn tại làng rau Trà Quế.', 'Cao lầu, bánh vạc');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_BMT_01', 'TM_BUONMATHUOT', 1, 'Bảo tàng cà phê - Buôn Đôn', 'Trải nghiệm văn hóa cà phê và không gian Tây Nguyên.', 'Gà nướng cơm lam');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_PULUONG_01', 'TM_PULUONG', 1, 'Bản Đôn - Ruộng bậc thang', 'Đi bộ nhẹ quanh bản, ngắm hoàng hôn trên thung lũng.', 'Vịt Cổ Lũng, rau rừng');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_MUINE_01', 'TM_MUINE', 1, 'Đồi cát bay - Làng chài Mũi Né', 'Tham quan đồi cát, làng chài và nghỉ biển buổi chiều.', 'Lẩu thả Phan Thiết');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_QUYNHON_01', 'TM_QUYNHON', 1, 'Kỳ Co - Eo Gió', 'Đi canoe ra Kỳ Co, tham quan Eo Gió và làng chài Nhơn Lý.', 'Bún chả cá Quy Nhơn');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HOIAN_01', 'TM_HOIAN', 1, 'Phố cổ Hội An - Trà Quế', 'Tham quan phố cổ và lớp nấu ăn tại làng rau Trà Quế.', 'Cao lầu, bánh vạc');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_BMT_01', 'TM_BUONMATHUOT', 1, 'Bảo tàng cà phê - Buôn Đôn', 'Trải nghiệm văn hóa cà phê và không gian Tây Nguyên.', 'Gà nướng cơm lam');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_PULUONG_01', 'TM_PULUONG', 1, 'Bản Đôn - Ruộng bậc thang', 'Đi bộ nhẹ quanh bản, ngắm hoàng hôn trên thung lũng.', 'Vịt Cổ Lũng, rau rừng');

INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia)
VALUES ('DVT_SINGLE', 'Phụ thu phòng đơn', 'Phòng/đêm', 650000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia)
VALUES ('DVT_AIRPORT', 'Đưa đón sân bay riêng', 'Lượt', 350000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia)
VALUES ('DVT_DINNER', 'Bữa tối đặc sản nâng cấp', 'Suất', 280000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia)
VALUES ('DVT_INSURANCE', 'Bảo hiểm du lịch mở rộng', 'Người', 120000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia)
VALUES ('DVT_PHOTO', 'Gói chụp ảnh hành trình', 'Gói', 900000);

INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong)
VALUES ('HDX_BOTTLE', 'Mang bình nước cá nhân trong tour', 80);
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong)
VALUES ('HDX_CLEANUP', 'Tham gia nhặt rác tại điểm tham quan', 150);
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong)
VALUES ('HDX_EBILL', 'Đồng ý nhận hóa đơn điện tử', 50);
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong)
VALUES ('HDX_TREE', 'Đóng góp trồng cây tại điểm đến', 200);
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong)
VALUES ('HDX_LOCAL', 'Sử dụng sản phẩm địa phương thay đồ nhựa dùng một lần', 100);

-- ------------------------------------------------------------
-- 3. TOUR THUC TE - DU 7 TRANG THAI TOUR
-- ------------------------------------------------------------
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_CKH', 'TM_HAGIANG', TRUNC(SYSDATE) + 90, 6100000, 18, 6, 18, 'CHO_KICH_HOAT');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_MB', 'TM_SAPA', TRUNC(SYSDATE) + 45, 4800000, 20, 8, 20, 'MO_BAN');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_SDR', 'TM_DANANG', TRUNC(SYSDATE) + 12, 6500000, 24, 10, 24, 'MO_BAN');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_DDR', 'TM_DALAT', TRUNC(SYSDATE) - 1, 4200000, 16, 6, 16, 'MO_BAN');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_KT', 'TM_NINHBINH', TRUNC(SYSDATE) - 10, 3000000, 30, 12, 30, 'MO_BAN');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HUY', 'TM_PHUQUOC', TRUNC(SYSDATE) + 75, 7900000, 18, 8, 18, 'MO_BAN');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_QT', 'TM_HUE', TRUNC(SYSDATE) - 20, 4300000, 22, 8, 22, 'MO_BAN');

INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_MB', 'DVT_SINGLE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_MB', 'DVT_AIRPORT');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_SDR', 'DVT_DINNER');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_DDR', 'DVT_AIRPORT');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HUY', 'DVT_SINGLE');

INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_DDR', 'HDX_BOTTLE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_DDR', 'HDX_CLEANUP');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_MB', 'HDX_EBILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_QT', 'HDX_EBILL');

-- HDV phu trach tung tour. Dieu hanh theo doi bang NHATKYHETHONG o cuoi script.
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_CKH_HDV02', 'TTT_CKH', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '10' DAY, 'DA_DONG_Y');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_MB_HDV01', 'TTT_MB', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '8' DAY, 'DA_DONG_Y');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_SDR_HDV02', 'TTT_SDR', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '7' DAY, 'DA_DONG_Y');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_DDR_HDV01', 'TTT_DDR', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '6' DAY, 'DA_DONG_Y');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_KT_HDV02', 'TTT_KT', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '5' DAY, 'DA_DONG_Y');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_HUY_HDV02', 'TTT_HUY', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '4' DAY, 'DA_DONG_Y');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_QT_HDV01', 'TTT_QT', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '3' DAY, 'DA_DONG_Y');

-- ------------------------------------------------------------
-- 4. VOUCHER VA VI KHUYEN MAI
-- ------------------------------------------------------------
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai)
VALUES ('VC_EARLY10', 'EARLY-10', 'PHAN_TRAM', 10, 'Giam 10% cho don dat som', 100, 0, TRUNC(SYSDATE) - 30, TRUNC(SYSDATE) + 120, 'SAN_SANG');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai)
VALUES ('VC_GREEN500', 'GREEN-500', 'SO_TIEN', 500000, 'Doi diem xanh lay voucher 500000 VND', 50, 0, TRUNC(SYSDATE) - 15, TRUNC(SYSDATE) + 90, 'SAN_SANG');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai)
VALUES ('VC_EXPIRED', 'EXPIRED', 'SO_TIEN', 300000, 'Voucher het han de minh hoa trang thai', 10, 0, TRUNC(SYSDATE) - 90, TRUNC(SYSDATE) - 10, 'VO_HIEU_HOA');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai)
VALUES ('VC_FAMILY700', 'FAMILY-700', 'SO_TIEN', 700000, 'Giam cho nhom gia dinh tu 3 khach tro len', 80, 0, TRUNC(SYSDATE) - 20, TRUNC(SYSDATE) + 150, 'SAN_SANG');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai)
VALUES ('VC_MEMBER15', 'MEMBER-15', 'PHAN_TRAM', 15, 'Uu dai 15% cho thanh vien hang vang tro len', 60, 0, TRUNC(SYSDATE) - 10, TRUNC(SYSDATE) + 120, 'SAN_SANG');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai)
VALUES ('VC_DIEMXANH800', 'DIEMXANH-800', 'SO_TIEN', 800000, 'Quy doi 800 diem xanh khi dat tour', 40, 0, TRUNC(SYSDATE) - 5, TRUNC(SYSDATE) + 120, 'SAN_SANG');

INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH_01', 'VC_EARLY10', TRUNC(SYSDATE) + 60, SYSTIMESTAMP - INTERVAL '12' DAY, 'CO_HIEU_LUC');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH_02', 'VC_GREEN500', TRUNC(SYSDATE) + 45, SYSTIMESTAMP - INTERVAL '10' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH_02', 'VC_EARLY10', TRUNC(SYSDATE) + 60, SYSTIMESTAMP - INTERVAL '25' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH_03', 'VC_EARLY10', TRUNC(SYSDATE) + 60, SYSTIMESTAMP - INTERVAL '8' DAY, 'DA_THU_HOI');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH_04', 'VC_EXPIRED', TRUNC(SYSDATE) - 1, SYSTIMESTAMP - INTERVAL '40' DAY, 'HET_HAN');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH_12', 'VC_FAMILY700', TRUNC(SYSDATE) + 90, SYSTIMESTAMP - INTERVAL '3' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH_13', 'VC_MEMBER15', TRUNC(SYSDATE) + 80, SYSTIMESTAMP - INTERVAL '4' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH_14', 'VC_FAMILY700', TRUNC(SYSDATE) + 90, SYSTIMESTAMP - INTERVAL '2' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai)
VALUES ('KH_05', 'VC_DIEMXANH800', TRUNC(SYSDATE) + 90, SYSTIMESTAMP - INTERVAL '6' HOUR, 'DA_SU_DUNG');

-- ------------------------------------------------------------
-- 5. DON DAT TOUR - DU 7 TRANG THAI DON DAT
-- ------------------------------------------------------------
-- Fix trigger TRG_KT_TOUR_MO_BAN de ho tro viec insert du lieu qua khu
CREATE OR REPLACE TRIGGER TRG_KT_TOUR_MO_BAN
BEFORE INSERT ON DONDATTOUR
FOR EACH ROW
DECLARE
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_Count
    FROM TOURTHUCTE
    WHERE MaTourThucTe = :NEW.MaTourThucTe
      AND TrangThai = 'MO_BAN'
      AND NgayKhoiHanh > :NEW.NgayDat;

    IF v_Count = 0 THEN
        RAISE_APPLICATION_ERROR(-20007, 'Chi duoc dat tour dang MO_BAN va chua khoi hanh');
    END IF;
END;
/

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_CHO_XN', 'TTT_MB', 'KH_01', SYSTIMESTAMP - INTERVAL '1' DAY, 10250000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Cho khach xac nhan thanh toan', 'HDX_EBILL:1');

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_DA_XN', 'TTT_MB', 'KH_02', SYSTIMESTAMP - INTERVAL '2' DAY, 14250000, 'DA_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Ap dung voucher VC_GREEN500: tam tinh 14.750.000, giam 500.000, tong sau giam 14.250.000. Don da thanh toan du, trigger se chuyen DA_XAC_NHAN.', 'HDX_EBILL:1');

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_HET_HAN', 'TTT_MB', 'KH_03', SYSTIMESTAMP - INTERVAL '3' DAY, 4800000, 'HET_HAN_GIU_CHO',
        SYSTIMESTAMP - INTERVAL '2' DAY, 'Khach khong thanh toan trong thoi gian giu cho', NULL);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_CHO_HUY', 'TTT_SDR', 'KH_04', SYSTIMESTAMP - INTERVAL '4' DAY, 6500000, 'CHO_HUY',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Khach gui yeu cau huy, doi dieu hanh xu ly', NULL);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_TU_CHOI_HT', 'TTT_SDR', 'KH_05', SYSTIMESTAMP - INTERVAL '4' DAY, 6500000, 'TU_CHOI_HOAN_TIEN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Qua han hoan tien theo chinh sach', NULL);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_TT_FAIL', 'TTT_SDR', 'KH_06', SYSTIMESTAMP - INTERVAL '1' DAY, 6500000, 'THANH_TOAN_THAT_BAI',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Ngan hang tra ve that bai', NULL);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_DANG_DIEN_RA', 'TTT_DDR', 'KH_01', SYSTIMESTAMP - INTERVAL '5' DAY, 8400000, 'DA_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Don cho tour dang dien ra', 'HDX_BOTTLE:1,HDX_CLEANUP:1');

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_KET_THUC', 'TTT_KT', 'KH_04', SYSTIMESTAMP - INTERVAL '15' DAY, 6000000, 'DA_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Don da hoan thanh tour va du dieu kien danh gia', NULL);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_HUY', 'TTT_HUY', 'KH_05', SYSTIMESTAMP - INTERVAL '7' DAY, 15800000, 'DA_HUY',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Don se bi huy tu dong khi tour bi huy', NULL);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_QUYET_TOAN', 'TTT_QT', 'KH_02', SYSTIMESTAMP - INTERVAL '25' DAY, 8300000, 'DA_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Ap dung voucher VC_EARLY10: tien tour 8.600.000, dich vu 560.000, giam 860.000, tong sau giam 8.300.000. Don thuoc tour da quyet toan.', 'HDX_EBILL:1');

-- Don dat tour 5 nguoi cho tour Da Nang
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_5_PEOPLE', 'TTT_SDR', 'KH_03', SYSTIMESTAMP - INTERVAL '3' DAY, 32500000, 'DA_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Don dat 5 nguoi (1 khach, 4 dong hanh).', 'HDX_BOTTLE:1');

-- Nguoi dong hanh
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_CHO_XN_01', 'DDT_CHO_XN', 'Tran Gia Bao', '079299000201', '0922000201', DATE '2014-07-11', 'NAM', 'Tre em di cung gia dinh');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_DA_XN_01', 'DDT_DA_XN', 'Pham Minh Quan', '079299000202', '0922000202', DATE '1994-03-02', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_DA_XN_02', 'DDT_DA_XN', 'Pham Tue Nhi', '079299000203', '0922000203', DATE '2018-10-05', 'NU', 'Tre em');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_DDR_01', 'DDT_DANG_DIEN_RA', 'Tran My Anh', '079299000204', '0922000204', DATE '1998-01-19', 'NU', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_KT_01', 'DDT_KET_THUC', 'Nguyen Minh Tam', '079299000205', '0922000205', DATE '1988-09-30', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_HUY_01', 'DDT_HUY', 'Do Minh Nhat', '079299000206', '0922000206', DATE '1985-06-06', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_QT_01', 'DDT_QUYET_TOAN', 'Pham Mai Chi', '079299000207', '0922000207', DATE '1996-04-22', 'NU', NULL);

-- Nguoi dong hanh cho don 5 nguoi
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_5P_01', 'DDT_5_PEOPLE', 'Le Minh', '079299000301', '0922000301', DATE '1990-01-01', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_5P_02', 'DDT_5_PEOPLE', 'Le Hoa', '079299000302', '0922000302', DATE '1992-02-02', 'NU', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_5P_03', 'DDT_5_PEOPLE', 'Le An', '079299000303', '0922000303', DATE '2015-03-03', 'NAM', 'Tre em');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_5P_04', 'DDT_5_PEOPLE', 'Le Binh', '079299000304', '0922000304', DATE '2018-04-04', 'NAM', 'Tre em');

-- Chi tiet hanh khach
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CHO_XN_KH', 'DDT_CHO_XN', 'KH_01', NULL, 'NGUOI_DAT', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CHO_XN_NDH1', 'DDT_CHO_XN', NULL, 'NDH_CHO_XN_01', 'NGUOI_DONG_HANH', 4800000);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_DA_XN_KH', 'DDT_DA_XN', 'KH_02', NULL, 'NGUOI_DAT', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_DA_XN_NDH1', 'DDT_DA_XN', NULL, 'NDH_DA_XN_01', 'NGUOI_DONG_HANH', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_DA_XN_NDH2', 'DDT_DA_XN', NULL, 'NDH_DA_XN_02', 'NGUOI_DONG_HANH', 4800000);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HET_HAN_KH', 'DDT_HET_HAN', 'KH_03', NULL, 'NGUOI_DAT', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CHO_HUY_KH', 'DDT_CHO_HUY', 'KH_04', NULL, 'NGUOI_DAT', 6500000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_TU_CHOI_KH', 'DDT_TU_CHOI_HT', 'KH_05', NULL, 'NGUOI_DAT', 6500000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_TT_FAIL_KH', 'DDT_TT_FAIL', 'KH_06', NULL, 'NGUOI_DAT', 6500000);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_DDR_KH', 'DDT_DANG_DIEN_RA', 'KH_01', NULL, 'NGUOI_DAT', 4200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_DDR_NDH1', 'DDT_DANG_DIEN_RA', NULL, 'NDH_DDR_01', 'NGUOI_DONG_HANH', 4200000);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_KT_KH', 'DDT_KET_THUC', 'KH_04', NULL, 'NGUOI_DAT', 3000000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_KT_NDH1', 'DDT_KET_THUC', NULL, 'NDH_KT_01', 'NGUOI_DONG_HANH', 3000000);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HUY_KH', 'DDT_HUY', 'KH_05', NULL, 'NGUOI_DAT', 7900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HUY_NDH1', 'DDT_HUY', NULL, 'NDH_HUY_01', 'NGUOI_DONG_HANH', 7900000);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_QT_KH', 'DDT_QUYET_TOAN', 'KH_02', NULL, 'NGUOI_DAT', 4300000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_QT_NDH1', 'DDT_QUYET_TOAN', NULL, 'NDH_QT_01', 'NGUOI_DONG_HANH', 4300000);

-- Chi tiet dat tour cho don 5 nguoi (Gia Da Nang: 6500000)
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_5P_KH', 'DDT_5_PEOPLE', 'KH_03', NULL, 'NGUOI_DAT', 6500000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_5P_NDH1', 'DDT_5_PEOPLE', NULL, 'NDH_5P_01', 'NGUOI_DONG_HANH', 6500000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_5P_NDH2', 'DDT_5_PEOPLE', NULL, 'NDH_5P_02', 'NGUOI_DONG_HANH', 6500000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_5P_NDH3', 'DDT_5_PEOPLE', NULL, 'NDH_5P_03', 'NGUOI_DONG_HANH', 6500000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_5P_NDH4', 'DDT_5_PEOPLE', NULL, 'NDH_5P_04', 'NGUOI_DONG_HANH', 6500000);

-- Dich vu trong don
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_CHO_XN_SINGLE', 'DDT_CHO_XN', 'DVT_SINGLE', 1, 650000, 650000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_DA_XN_AIRPORT', 'DDT_DA_XN', 'DVT_AIRPORT', 1, 350000, 350000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_QT_DINNER', 'DDT_QUYET_TOAN', 'DVT_DINNER', 2, 280000, 560000);

-- Uu dai ap dung vao don, trigger se tang SoLuotDaDung cua voucher.
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai)
VALUES ('DDT_DA_XN', 'VC_GREEN500', 500000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai)
VALUES ('DDT_QUYET_TOAN', 'VC_EARLY10', 860000);

-- Giao dich thanh toan/refund - du 4 trang thai giao dich.
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_DA_XN_PAY', 'DDT_DA_XN', 'THANH_TOAN', 'CHUYEN_KHOAN', 14250000, 'BANK-001', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_DDR_PAY', 'DDT_DANG_DIEN_RA', 'THANH_TOAN', 'THE_NOI_DIA', 8400000, 'BANK-002', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '4' DAY);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_KT_PAY', 'DDT_KET_THUC', 'THANH_TOAN', 'CHUYEN_KHOAN', 6000000, 'BANK-003', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '14' DAY);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HUY_PAY', 'DDT_HUY', 'THANH_TOAN', 'CHUYEN_KHOAN', 15800000, 'BANK-004', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '6' DAY);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_QT_PAY', 'DDT_QUYET_TOAN', 'THANH_TOAN', 'THE_QUOC_TE', 8300000, 'BANK-005', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '24' DAY);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_CHO_TT', 'DDT_CHO_XN', 'THANH_TOAN', 'CHUYEN_KHOAN', 10250000, 'BANK-006', 'CHO_THANH_TOAN', NULL);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_TT_FAIL', 'DDT_TT_FAIL', 'THANH_TOAN', 'THE_NOI_DIA', 6500000, 'BANK-007', 'THAT_BAI', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_REFUND_DONE', 'DDT_TU_CHOI_HT', 'HOAN_TIEN', 'HE_THONG', 0, 'BANK-008', 'DA_HOAN_TIEN', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_5P_PAY', 'DDT_5_PEOPLE', 'THANH_TOAN', 'CHUYEN_KHOAN', 32500000, 'BANK-5P', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

-- ------------------------------------------------------------
-- 6. VAN HANH TOUR DANG DIEN RA, KET THUC, HUY, QUYET TOAN
-- ------------------------------------------------------------
UPDATE TOURTHUCTE
SET NgayKhoiHanh = TRUNC(SYSDATE) - 1,
    TrangThai = 'DANG_DIEN_RA'
WHERE MaTourThucTe = 'TTT_DDR';

UPDATE TOURTHUCTE
SET NgayKhoiHanh = TRUNC(SYSDATE) - 15,
    TrangThai = 'KET_THUC'
WHERE MaTourThucTe = 'TTT_KT';

UPDATE TOURTHUCTE
SET NgayKhoiHanh = TRUNC(SYSDATE) - 30,
    TrangThai = 'DA_QUYET_TOAN'
WHERE MaTourThucTe = 'TTT_QT';

INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai)
VALUES ('DD_DDR_KH_OK', 'TTT_DDR', 'KH_01', NULL, 'NGUOI_DAT', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '2' HOUR, 'Quang truong Lam Vien', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai)
VALUES ('DD_DDR_NDH_WAIT', 'TTT_DDR', NULL, 'NDH_DDR_01', 'NGUOI_DONG_HANH', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '90' MINUTE, 'Quang truong Lam Vien', 'CHUA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai)
VALUES ('DD_DDR_NDH_ABS', 'TTT_DDR', NULL, 'NDH_DDR_01', 'NGUOI_DONG_HANH', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '1' HOUR, 'Nong trai Da Lat', 'VANG');

INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD_DDR_BOTTLE', 'TTT_DDR', 'KH_01', 'HDX_BOTTLE', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '1' HOUR,
        'Anh check-in voi binh nuoc ca nhan');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD_DDR_CLEANUP', 'TTT_DDR', 'KH_01', 'HDX_CLEANUP', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '30' MINUTE,
        'HDV xac nhan khach tham gia nhat rac tai diem tham quan');

INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_DDR_WEATHER', 'TTT_DDR', 'NV_HDV01', 'Mua lon bat ngo tai diem tham quan.',
        'Doi lich tham quan trong nha va cap ao mua cho khach.', 'THAP', 'THOI_TIET', SYSTIMESTAMP - INTERVAL '20' MINUTE);
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_DDR_MEDICAL', 'TTT_DDR', 'NV_HDV01', 'Khach bi say xe can theo doi.',
        'Sap xep ghe dau xe, cap nuoc am va theo doi suc khoe.', 'SOS', 'Y_TE', SYSTIMESTAMP - INTERVAL '10' MINUTE);

INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_DDR_APPROVED', 'TTT_DDR', 'NV_HDV01', 'Ao mua du phong', 320000, 'https://seed.local/hoa-don/ao-mua.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '1' HOUR);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_DDR_PENDING', 'TTT_DDR', 'NV_HDV01', 'Nuoc uong bo sung', 180000, 'https://seed.local/hoa-don/nuoc.jpg', 'CHO_DUYET', SYSTIMESTAMP - INTERVAL '30' MINUTE);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_DDR_REJECT', 'TTT_DDR', 'NV_HDV01', 'Phu phi khong hop le', 90000, NULL, 'TU_CHOI', SYSTIMESTAMP - INTERVAL '20' MINUTE);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_DDR_NEED_MORE', 'TTT_DDR', 'NV_HDV01', 'Ve gui xe', 120000, NULL, 'YEU_CAU_BO_SUNG', SYSTIMESTAMP - INTERVAL '10' MINUTE);

UPDATE TOURTHUCTE
SET NgayKhoiHanh = TRUNC(SYSDATE) - 7,
    TrangThai = 'KET_THUC'
WHERE MaTourThucTe = 'TTT_KT';

INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_KT_KH04', 'KH_04', 'TTT_KT', 'CTDT_KT_KH', TRUNC(SYSDATE) - 7);

INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_KT_KH04', 'TTT_KT', 'KH_04', 5, 'Lich trinh gon, HDV cham soc tot va giai thich ro ve Trang An.', SYSTIMESTAMP - INTERVAL '2' DAY);

UPDATE TOURTHUCTE
SET TrangThai = 'HUY'
WHERE MaTourThucTe = 'TTT_HUY';

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HUY_REFUND_WAIT', 'DDT_HUY', 'HOAN_TIEN', 'HE_THONG', 14220000, 'BANK-009', 'CHO_THANH_TOAN', NULL);

UPDATE TOURTHUCTE
SET NgayKhoiHanh = TRUNC(SYSDATE) - 24,
    TrangThai = 'KET_THUC'
WHERE MaTourThucTe = 'TTT_QT';

INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_QT_KH02', 'KH_02', 'TTT_QT', 'CTDT_QT_KH', TRUNC(SYSDATE) - 24);

INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_QT_HOTEL', 'TTT_QT', 'NV_HDV01', 'Khach san Hue 2 dem', 4800000, 'https://seed.local/hoa-don/hue-hotel.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '20' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_QT_BUS', 'TTT_QT', 'NV_HDV01', 'Xe du lich Hue', 2600000, 'https://seed.local/hoa-don/hue-bus.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '20' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_QT_TICKET', 'TTT_QT', 'NV_HDV01', 'Ve tham quan Dai Noi', 900000, 'https://seed.local/hoa-don/hue-ticket.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '19' DAY);

INSERT INTO QUYETTOAN (MaQuyetToan, MaTourThucTe, TongDoanhThu, TongChiPhi, GiaCamKet, LoiNhuan, MaNhanVien, NgayQuyetToan, TrangThai, GhiChu)
VALUES ('QT_HUE_DONE', 'TTT_QT', 0, 0, 11000000, 0, 'NV_KT01', SYSTIMESTAMP - INTERVAL '18' DAY, 'DA_QUYET_TOAN',
        'Trigger tinh lai TongDoanhThu, TongChiPhi, LoiNhuan va chot tour DA_QUYET_TOAN.');

-- ------------------------------------------------------------
-- 6B. 5 BO DATA BO SUNG DE MINH HOA TOAN DIEN HON
-- ------------------------------------------------------------
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HALONG', 'TM_HALONG', TRUNC(SYSDATE) + 130, 5900000, 26, 10, 26, 'MO_BAN');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_CANTHO', 'TM_CANTHO', TRUNC(SYSDATE) + 135, 3700000, 28, 12, 28, 'MO_BAN');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_CONDAO', 'TM_CONDAO', TRUNC(SYSDATE) + 145, 8600000, 18, 8, 18, 'MO_BAN');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_MOCCHAU', 'TM_MOCCHAU', TRUNC(SYSDATE) + 150, 2800000, 24, 10, 24, 'MO_BAN');

INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_QUYNHON', 'TM_QUYNHON', TRUNC(SYSDATE) + 160, 5500000, 22, 8, 22, 'MO_BAN');

INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HALONG', 'DVT_INSURANCE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HALONG', 'DVT_PHOTO');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_CANTHO', 'DVT_DINNER');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_CONDAO', 'DVT_INSURANCE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_MOCCHAU', 'DVT_PHOTO');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_QUYNHON', 'DVT_AIRPORT');

INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HALONG', 'HDX_EBILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_CANTHO', 'HDX_LOCAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_CONDAO', 'HDX_CLEANUP');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_MOCCHAU', 'HDX_TREE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_QUYNHON', 'HDX_BOTTLE');

INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_HALONG_HDV02', 'TTT_HALONG', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '2' DAY, 'DA_DONG_Y');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_CANTHO_HDV01', 'TTT_CANTHO', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '2' DAY, 'DA_DONG_Y');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_CONDAO_HDV02', 'TTT_CONDAO', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '2' DAY, 'DA_DONG_Y');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_MOCCHAU_HDV01', 'TTT_MOCCHAU', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '2' DAY, 'DA_DONG_Y');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_QUYNHON_HDV02', 'TTT_QUYNHON', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '2' DAY, 'DA_DONG_Y');

-- Goi 1: Ha Long - tour dang mo ban, co don cho thanh toan va don da xac nhan.
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_HALONG_CHO', 'TTT_HALONG', 'KH_07', SYSTIMESTAMP - INTERVAL '1' DAY, 11920000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Khach dang giu cho du thuyen Ha Long.', 'HDX_EBILL:1');
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_HALONG_OK', 'TTT_HALONG', 'KH_08', SYSTIMESTAMP - INTERVAL '2' DAY, 18600000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Nhom gia dinh da thanh toan du.', 'HDX_EBILL:1');
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_HALONG_TRE_EM', 'TTT_HALONG', 'KH_15', SYSTIMESTAMP - INTERVAL '6' HOUR, 8970000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Don co tre em duoi 10 tuoi di kem.', 'HDX_EBILL:1');

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_HALONG_CHO_01', 'DDT_HALONG_CHO', 'Hoang Minh Duc', '079299000208', '0922000208', DATE '1990-02-21', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_HALONG_OK_01', 'DDT_HALONG_OK', 'Vu Thanh Son', '079299000209', '0922000209', DATE '1962-08-14', 'NAM', 'Nguoi cao tuoi');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_HALONG_OK_02', 'DDT_HALONG_OK', 'Vu Minh Anh', '079299000210', '0922000210', DATE '2012-12-01', 'NU', 'Tre em');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_HALONG_TRE_EM_01', 'DDT_HALONG_TRE_EM', 'Phan Minh Khang', '079299000220', '0922000220',
        ADD_MONTHS(TRUNC(SYSDATE), -84), 'NAM', 'Tre em duoi 10 tuoi');

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HALONG_CHO_KH', 'DDT_HALONG_CHO', 'KH_07', NULL, 'NGUOI_DAT', 5900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HALONG_CHO_NDH1', 'DDT_HALONG_CHO', NULL, 'NDH_HALONG_CHO_01', 'NGUOI_DONG_HANH', 5900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HALONG_OK_KH', 'DDT_HALONG_OK', 'KH_08', NULL, 'NGUOI_DAT', 5900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HALONG_OK_NDH1', 'DDT_HALONG_OK', NULL, 'NDH_HALONG_OK_01', 'NGUOI_DONG_HANH', 5900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HALONG_OK_NDH2', 'DDT_HALONG_OK', NULL, 'NDH_HALONG_OK_02', 'NGUOI_DONG_HANH', 5900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HALONG_TRE_EM_KH', 'DDT_HALONG_TRE_EM', 'KH_15', NULL, 'NGUOI_DAT', 5900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HALONG_TRE_EM_NDH1', 'DDT_HALONG_TRE_EM', NULL, 'NDH_HALONG_TRE_EM_01', 'NGUOI_DONG_HANH', 2950000);

INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_HALONG_CHO_INS', 'DDT_HALONG_CHO', 'DVT_INSURANCE', 1, 120000, 120000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_HALONG_OK_PHOTO', 'DDT_HALONG_OK', 'DVT_PHOTO', 1, 900000, 900000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_HALONG_TRE_EM_INS', 'DDT_HALONG_TRE_EM', 'DVT_INSURANCE', 1, 120000, 120000);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HALONG_CHO', 'DDT_HALONG_CHO', 'THANH_TOAN', 'CHUYEN_KHOAN', 11920000, 'BANK-010', 'CHO_THANH_TOAN', NULL);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HALONG_OK', 'DDT_HALONG_OK', 'THANH_TOAN', 'THE_QUOC_TE', 18600000, 'BANK-011', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HALONG_TRE_EM_PAY', 'DDT_HALONG_TRE_EM', 'THANH_TOAN', 'CHUYEN_KHOAN', 8970000, 'BANK-025', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '5' HOUR);

-- Goi 2: Can Tho - sap dien ra, khach cong ty da thanh toan va co yeu cau hoa don.
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_CANTHO_OK', 'TTT_CANTHO', 'KH_09', SYSTIMESTAMP - INTERVAL '3' DAY, 7680000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Khach can hoa don cong ty sau thanh toan.', 'HDX_LOCAL:1');

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_CANTHO_01', 'DDT_CANTHO_OK', 'Dang Minh Tue', '079299000211', '0922000211', DATE '1987-05-18', 'NAM', NULL);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KH', 'DDT_CANTHO_OK', 'KH_09', NULL, 'NGUOI_DAT', 3700000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_NDH1', 'DDT_CANTHO_OK', NULL, 'NDH_CANTHO_01', 'NGUOI_DONG_HANH', 3700000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_CANTHO_DINNER', 'DDT_CANTHO_OK', 'DVT_DINNER', 1, 280000, 280000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_CANTHO_OK', 'DDT_CANTHO_OK', 'THANH_TOAN', 'CHUYEN_KHOAN', 7680000, 'BANK-012', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '2' DAY);

UPDATE TOURTHUCTE
SET TrangThai = 'SAP_DIEN_RA'
WHERE MaTourThucTe = 'TTT_CANTHO';

-- Goi 3: Con Dao - dang dien ra, co diem danh, hanh dong xanh va su co phuong tien.
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_CONDAO_OK', 'TTT_CONDAO', 'KH_10', SYSTIMESTAMP - INTERVAL '5' DAY, 17320000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Khach di bien dao, co di ung hai san co vo.', 'HDX_CLEANUP:1');

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_CONDAO_01', 'DDT_CONDAO_OK', 'Mai Bao Nam', '079299000212', '0922000212', DATE '1993-11-23', 'NAM', NULL);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CONDAO_KH', 'DDT_CONDAO_OK', 'KH_10', NULL, 'NGUOI_DAT', 8600000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CONDAO_NDH1', 'DDT_CONDAO_OK', NULL, 'NDH_CONDAO_01', 'NGUOI_DONG_HANH', 8600000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_CONDAO_INS', 'DDT_CONDAO_OK', 'DVT_INSURANCE', 1, 120000, 120000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_CONDAO_OK', 'DDT_CONDAO_OK', 'THANH_TOAN', 'THE_NOI_DIA', 17320000, 'BANK-013', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '4' DAY);

UPDATE TOURTHUCTE
SET NgayKhoiHanh = TRUNC(SYSDATE),
    TrangThai = 'DANG_DIEN_RA'
WHERE MaTourThucTe = 'TTT_CONDAO';

INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai)
VALUES ('DD_CONDAO_KH_OK', 'TTT_CONDAO', 'KH_10', NULL, 'NGUOI_DAT', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '3' HOUR, 'San bay Con Dao', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai)
VALUES ('DD_CONDAO_NDH_OK', 'TTT_CONDAO', NULL, 'NDH_CONDAO_01', 'NGUOI_DONG_HANH', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '3' HOUR, 'San bay Con Dao', 'DA_DIEM_DANH');

INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD_CONDAO_CLEANUP', 'TTT_CONDAO', 'KH_10', 'HDX_CLEANUP', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '1' HOUR,
        'Anh nhom khach thu gom rac tren bai bien');
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_CONDAO_TRANSPORT', 'TTT_CONDAO', 'NV_HDV02', 'Xe dua don cham 20 phut do thoi tiet.',
        'Thong bao khach, dieu xe du phong va doi lich tham quan nhe.', 'THAP', 'PHUONG_TIEN', SYSTIMESTAMP - INTERVAL '40' MINUTE);

-- Goi 4: Moc Chau - da ket thuc, co lich su va danh gia tu khach hang.
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_MOCCHAU_OK', 'TTT_MOCCHAU', 'KH_11', SYSTIMESTAMP - INTERVAL '20' DAY, 6500000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Khach can lich trinh it leo doc.', 'HDX_TREE:1');

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_MOCCHAU_01', 'DDT_MOCCHAU_OK', 'Cao Bao Ngoc', '079299000213', '0922000213', DATE '1986-02-09', 'NU', NULL);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_MOCCHAU_KH', 'DDT_MOCCHAU_OK', 'KH_11', NULL, 'NGUOI_DAT', 2800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_MOCCHAU_NDH1', 'DDT_MOCCHAU_OK', NULL, 'NDH_MOCCHAU_01', 'NGUOI_DONG_HANH', 2800000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_MOCCHAU_PHOTO', 'DDT_MOCCHAU_OK', 'DVT_PHOTO', 1, 900000, 900000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_MOCCHAU_OK', 'DDT_MOCCHAU_OK', 'THANH_TOAN', 'CHUYEN_KHOAN', 6500000, 'BANK-014', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '19' DAY);

UPDATE TOURTHUCTE
SET NgayKhoiHanh = TRUNC(SYSDATE) - 12,
    TrangThai = 'KET_THUC'
WHERE MaTourThucTe = 'TTT_MOCCHAU';

INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_MOCCHAU_KH11', 'KH_11', 'TTT_MOCCHAU', 'CTDT_MOCCHAU_KH', TRUNC(SYSDATE) - 12);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_MOCCHAU_KH11', 'TTT_MOCCHAU', 'KH_11', 4, 'Canh dep, lich trinh hop ly cho nguoi khong muon di bo qua nhieu.', SYSTIMESTAMP - INTERVAL '5' DAY);

-- Goi 5: Quy Nhon - tour bi huy, don da thanh toan se sinh ho tro hoan tien.
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_QUYNHON_HUY', 'TTT_QUYNHON', 'KH_07', SYSTIMESTAMP - INTERVAL '6' DAY, 11350000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Tour du kien huy do dieu kien thoi tiet bien.', 'HDX_BOTTLE:1');

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_QUYNHON_01', 'DDT_QUYNHON_HUY', 'Hoang Bao Tram', '079299000214', '0922000214', DATE '1992-04-04', 'NU', NULL);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_QUYNHON_KH', 'DDT_QUYNHON_HUY', 'KH_07', NULL, 'NGUOI_DAT', 5500000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_QUYNHON_NDH1', 'DDT_QUYNHON_HUY', NULL, 'NDH_QUYNHON_01', 'NGUOI_DONG_HANH', 5500000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_QUYNHON_AIRPORT', 'DDT_QUYNHON_HUY', 'DVT_AIRPORT', 1, 350000, 350000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_QUYNHON_PAY', 'DDT_QUYNHON_HUY', 'THANH_TOAN', 'CHUYEN_KHOAN', 11350000, 'BANK-015', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '5' DAY);

UPDATE TOURTHUCTE
SET TrangThai = 'HUY'
WHERE MaTourThucTe = 'TTT_QUYNHON';

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_QUYNHON_REFUND', 'DDT_QUYNHON_HUY', 'HOAN_TIEN', 'HE_THONG', 10215000, 'BANK-016', 'CHO_THANH_TOAN', NULL);

-- Goi 6: Hoi An - mo ban, nhom gia dinh giu cho va chua thanh toan.
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HOIAN', 'TM_HOIAN', TRUNC(SYSDATE) + 172, 4600000, 24, 8, 24, 'MO_BAN');

INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HOIAN', 'DVT_DINNER');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HOIAN', 'HDX_LOCAL');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_HOIAN_HDV01', 'TTT_HOIAN', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '1' DAY, 'DA_DONG_Y');

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_HOIAN_CHO', 'TTT_HOIAN', 'KH_12', SYSTIMESTAMP - INTERVAL '8' HOUR, 14640000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Gia dinh dang giu cho tour Hoi An.', 'HDX_LOCAL:1');

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_HOIAN_01', 'DDT_HOIAN_CHO', 'Trinh Bao Khanh', '079299000215', '0922000215', DATE '1991-10-10', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_HOIAN_02', 'DDT_HOIAN_CHO', 'Trinh Minh An', '079299000216', '0922000216', DATE '2017-05-12', 'NU', 'Tre em');

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HOIAN_KH', 'DDT_HOIAN_CHO', 'KH_12', NULL, 'NGUOI_DAT', 4600000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HOIAN_NDH1', 'DDT_HOIAN_CHO', NULL, 'NDH_HOIAN_01', 'NGUOI_DONG_HANH', 4600000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HOIAN_NDH2', 'DDT_HOIAN_CHO', NULL, 'NDH_HOIAN_02', 'NGUOI_DONG_HANH', 4600000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_HOIAN_DINNER', 'DDT_HOIAN_CHO', 'DVT_DINNER', 3, 280000, 840000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HOIAN_CHO', 'DDT_HOIAN_CHO', 'THANH_TOAN', 'CHUYEN_KHOAN', 14640000, 'BANK-017', 'CHO_THANH_TOAN', NULL);

-- Don dat tour co su dung voucher FAMILY-700.
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_HOIAN_VOUCHER', 'TTT_HOIAN', 'KH_12', SYSTIMESTAMP - INTERVAL '4' HOUR, 9060000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Ap dung voucher VC_FAMILY700: tien tour 9.200.000, dich vu 560.000, giam 700.000, tong sau giam 9.060.000.', 'HDX_LOCAL:1');

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_HOIAN_VOUCHER_01', 'DDT_HOIAN_VOUCHER', 'Trinh Hoang Phuc', '079299000219', '0922000219', DATE '1995-01-24', 'NAM', NULL);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HOIAN_VOUCHER_KH', 'DDT_HOIAN_VOUCHER', 'KH_12', NULL, 'NGUOI_DAT', 4600000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HOIAN_VOUCHER_NDH1', 'DDT_HOIAN_VOUCHER', NULL, 'NDH_HOIAN_VOUCHER_01', 'NGUOI_DONG_HANH', 4600000);

INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_HOIAN_VOUCHER_DINNER', 'DDT_HOIAN_VOUCHER', 'DVT_DINNER', 2, 280000, 560000);

INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai)
VALUES ('DDT_HOIAN_VOUCHER', 'VC_FAMILY700', 700000);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HOIAN_VOUCHER_PAY', 'DDT_HOIAN_VOUCHER', 'THANH_TOAN', 'CHUYEN_KHOAN', 9060000, 'BANK-024', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '3' HOUR);

-- Goi 7: Buon Ma Thuot - sap dien ra, thanh vien vang da dung voucher phan tram.
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_BUONMATHUOT', 'TM_BUONMATHUOT', TRUNC(SYSDATE) + 180, 4100000, 20, 8, 20, 'MO_BAN');

INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_BUONMATHUOT', 'DVT_INSURANCE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_BUONMATHUOT', 'HDX_EBILL');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_BUONMATHUOT_HDV02', 'TTT_BUONMATHUOT', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '1' DAY, 'DA_DONG_Y');

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_BUONMATHUOT_OK', 'TTT_BUONMATHUOT', 'KH_13', SYSTIMESTAMP - INTERVAL '2' DAY, 7174000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Ap dung voucher VC_MEMBER15: tam tinh 8.440.000, giam 1.266.000, tong sau giam 7.174.000. Khach hang vang su dung uu dai thanh vien.', 'HDX_EBILL:1');

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_BUONMATHUOT_01', 'DDT_BUONMATHUOT_OK', 'Nguyen Hoai Nam', '079299000217', '0922000217', DATE '1984-06-17', 'NAM', NULL);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_BUONMATHUOT_KH', 'DDT_BUONMATHUOT_OK', 'KH_13', NULL, 'NGUOI_DAT', 4100000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_BUONMATHUOT_NDH1', 'DDT_BUONMATHUOT_OK', NULL, 'NDH_BUONMATHUOT_01', 'NGUOI_DONG_HANH', 4100000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_BUONMATHUOT_INS', 'DDT_BUONMATHUOT_OK', 'DVT_INSURANCE', 2, 120000, 240000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai)
VALUES ('DDT_BUONMATHUOT_OK', 'VC_MEMBER15', 1266000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_BUONMATHUOT_OK', 'DDT_BUONMATHUOT_OK', 'THANH_TOAN', 'THE_QUOC_TE', 7174000, 'BANK-018', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

UPDATE TOURTHUCTE
SET TrangThai = 'SAP_DIEN_RA'
WHERE MaTourThucTe = 'TTT_BUONMATHUOT';

-- Goi 8: Pu Luong - da ket thuc, voucher so tien va danh gia sau tour.
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_PULUONG', 'TM_PULUONG', TRUNC(SYSDATE) + 185, 3300000, 18, 6, 18, 'MO_BAN');

INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_PULUONG', 'DVT_PHOTO');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_PULUONG', 'HDX_TREE');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_PULUONG_HDV02', 'TTT_PULUONG', 'NV_HDV02', SYSTIMESTAMP - INTERVAL '1' DAY, 'DA_DONG_Y');

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_PULUONG_OK', 'TTT_PULUONG', 'KH_14', SYSTIMESTAMP - INTERVAL '28' DAY, 6800000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Ap dung voucher VC_FAMILY700: tam tinh 7.500.000, giam 700.000, tong sau giam 6.800.000. Gia dinh da di tour Pu Luong.', 'HDX_TREE:1');

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_PULUONG_01', 'DDT_PULUONG_OK', 'Lam Gia Han', '079299000218', '0922000218', DATE '2019-03-15', 'NU', 'Tre em duoi 6 tuoi');

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_PULUONG_KH', 'DDT_PULUONG_OK', 'KH_14', NULL, 'NGUOI_DAT', 3300000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_PULUONG_NDH1', 'DDT_PULUONG_OK', NULL, 'NDH_PULUONG_01', 'NGUOI_DONG_HANH', 3300000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_PULUONG_PHOTO', 'DDT_PULUONG_OK', 'DVT_PHOTO', 1, 900000, 900000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai)
VALUES ('DDT_PULUONG_OK', 'VC_FAMILY700', 700000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_PULUONG_OK', 'DDT_PULUONG_OK', 'THANH_TOAN', 'CHUYEN_KHOAN', 6800000, 'BANK-019', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '27' DAY);

UPDATE TOURTHUCTE
SET NgayKhoiHanh = TRUNC(SYSDATE) - 18,
    TrangThai = 'KET_THUC'
WHERE MaTourThucTe = 'TTT_PULUONG';

INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_PULUONG_KH14', 'KH_14', 'TTT_PULUONG', 'CTDT_PULUONG_KH', TRUNC(SYSDATE) - 18);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_PULUONG_KH14', 'TTT_PULUONG', 'KH_14', 5, 'Homestay sach, HDV chu dao va lich trinh phu hop gia dinh co tre nho.', SYSTIMESTAMP - INTERVAL '8' DAY);

-- Goi 9: Mui Ne - mo ban, mot thanh toan that bai can kinh doanh ho tro lai.
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_MUINE', 'TM_MUINE', TRUNC(SYSDATE) + 190, 4900000, 26, 10, 26, 'MO_BAN');

INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_MUINE', 'DVT_AIRPORT');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_MUINE', 'HDX_BOTTLE');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan)
VALUES ('PC_MUINE_HDV01', 'TTT_MUINE', 'NV_HDV01', SYSTIMESTAMP - INTERVAL '1' DAY, 'DA_DONG_Y');

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_MUINE_FAIL', 'TTT_MUINE', 'KH_15', SYSTIMESTAMP - INTERVAL '6' HOUR, 5250000, 'THANH_TOAN_THAT_BAI',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Thanh toan khong thanh cong, can lien he lai khach.', 'HDX_BOTTLE:1');
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_MUINE_DIEMXANH', 'TTT_MUINE', 'KH_05', SYSTIMESTAMP - INTERVAL '4' HOUR, 4450000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Su dung 800 diem xanh luc dat tour qua voucher VC_DIEMXANH800: tien tour 4.900.000, dich vu 350.000, giam 800.000, tong sau giam 4.450.000.', 'HDX_BOTTLE:1');

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_MUINE_KH', 'DDT_MUINE_FAIL', 'KH_15', NULL, 'NGUOI_DAT', 4900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_MUINE_DIEMXANH_KH', 'DDT_MUINE_DIEMXANH', 'KH_05', NULL, 'NGUOI_DAT', 4900000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_MUINE_AIRPORT', 'DDT_MUINE_FAIL', 'DVT_AIRPORT', 1, 350000, 350000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_MUINE_DIEMXANH_AIRPORT', 'DDT_MUINE_DIEMXANH', 'DVT_AIRPORT', 1, 350000, 350000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai)
VALUES ('DDT_MUINE_DIEMXANH', 'VC_DIEMXANH800', 800000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_MUINE_FAIL', 'DDT_MUINE_FAIL', 'THANH_TOAN', 'THE_NOI_DIA', 5250000, 'BANK-020', 'THAT_BAI', SYSTIMESTAMP - INTERVAL '5' HOUR);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_MUINE_DIEMXANH_PAY', 'DDT_MUINE_DIEMXANH', 'THANH_TOAN', 'VI_DIEN_TU', 4450000, 'BANK-026', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '3' HOUR);

-- Cac don van CHO_XAC_NHAN du da co giao dich THANH_CONG mot phan.
-- Trigger chi chuyen DA_XAC_NHAN khi tong thanh toan thanh cong >= TongTien.
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_CHO_XN_COC', 'DDT_CHO_XN', 'THANH_TOAN', 'CHUYEN_KHOAN', 2000000, 'BANK-021', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '2' HOUR);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HALONG_COC', 'DDT_HALONG_CHO', 'THANH_TOAN', 'THE_NOI_DIA', 3000000, 'BANK-022', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '3' HOUR);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HOIAN_COC', 'DDT_HOIAN_CHO', 'THANH_TOAN', 'VI_DIEN_TU', 4500000, 'BANK-023', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '4' HOUR);

-- Cap nhat tour Da Nang sang SAP_DIEN_RA sau khi da seed cac don dat phu hop.
UPDATE TOURTHUCTE
SET TrangThai = 'SAP_DIEN_RA'
WHERE MaTourThucTe = 'TTT_SDR';

-- Recalculate ChoConLai sau cac thay doi trang thai don/tour do trigger chi lang nghe CHITIETDATTOUR.
UPDATE CHITIETDATTOUR
SET MaDatTour = MaDatTour
WHERE MaChiTietDat LIKE 'CTDT_%';

-- ------------------------------------------------------------
-- 7. HO TRO, DOI DIEM, NHAT KY DIEU HANH
-- ------------------------------------------------------------
INSERT INTO NHATKYDOIDIEM (MaNhatKyDoiDiem, MaKhachHang, MaVoucher, DiemQuyDoi, NgayQuyDoi)
VALUES ('NKDD_KH05_GREEN', 'KH_05', 'VC_GREEN500', 500, SYSTIMESTAMP - INTERVAL '9' DAY);
INSERT INTO NHATKYDOIDIEM (MaNhatKyDoiDiem, MaKhachHang, MaVoucher, DiemQuyDoi, NgayQuyDoi)
VALUES ('NKDD_KH05_BOOKING', 'KH_05', 'VC_DIEMXANH800', 800, SYSTIMESTAMP - INTERVAL '4' HOUR);

INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT_CHO_BS', 'DDT_CHO_HUY', 'KH_04', 'HUY_TOUR', 'Khach can bo sung ly do huy va xac nhan phi huy.', 'CHO_BO_SUNG', 'NV_MGR01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT_CHO_GT', 'DDT_TT_FAIL', 'KH_06', 'THANH_TOAN', 'Can giai trinh ket qua doi soat voi ngan hang.', 'CHO_GIAI_TRINH', 'NV_SALES01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT_DA_XL', 'DDT_DA_XN', 'KH_02', 'DOI_DICH_VU', 'Da xac nhan dich vu dua don san bay rieng.', 'DA_XU_LY', 'NV_MGR01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT_TU_CHOI', 'DDT_TU_CHOI_HT', 'KH_05', 'HOAN_TIEN', 'Tu choi hoan tien do khong dat dieu kien chinh sach.', 'TU_CHOI', 'NV_KT01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT_CANTHO_INVOICE', 'DDT_CANTHO_OK', 'KH_09', 'HOA_DON', 'Khach yeu cau xuat hoa don cong ty cho tour Can Tho.', 'CHUA_XU_LY', 'NV_KT01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT_HALONG_SERVICE', 'DDT_HALONG_OK', 'KH_08', 'DICH_VU_THEM', 'Xac nhan lai goi chup anh hanh trinh tren du thuyen.', 'DA_XU_LY', 'NV_MGR01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT_HOIAN_MEAL', 'DDT_HOIAN_CHO', 'KH_12', 'AN_UONG', 'Khach can xac nhan thuc don chay cho ca gia dinh.', 'CHO_BO_SUNG', 'NV_MGR01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT_MUINE_PAYMENT', 'DDT_MUINE_FAIL', 'KH_15', 'THANH_TOAN', 'Thanh toan the noi dia that bai, can kinh doanh lien he huong dan lai.', 'CHUA_XU_LY', 'NV_SALES01');

INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_CKH_DH', 'TK_MGR01', 'THEM', 'TOURTHUCTE_DIEU_HANH', 'TTT_CKH', SYSTIMESTAMP - INTERVAL '10' DAY);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_MB_DH', 'TK_MGR01', 'THEM', 'TOURTHUCTE_DIEU_HANH', 'TTT_MB', SYSTIMESTAMP - INTERVAL '8' DAY);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_SDR_DH', 'TK_MGR01', 'CAP_NHAT', 'TOURTHUCTE_DIEU_HANH', 'TTT_SDR', SYSTIMESTAMP - INTERVAL '7' DAY);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_DDR_DH', 'TK_MGR01', 'CAP_NHAT', 'TOURTHUCTE_DIEU_HANH', 'TTT_DDR', SYSTIMESTAMP - INTERVAL '6' DAY);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_KT_DH', 'TK_MGR01', 'CAP_NHAT', 'TOURTHUCTE_DIEU_HANH', 'TTT_KT', SYSTIMESTAMP - INTERVAL '5' DAY);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_HUY_DH', 'TK_MGR01', 'CAP_NHAT', 'TOURTHUCTE_DIEU_HANH', 'TTT_HUY', SYSTIMESTAMP - INTERVAL '4' DAY);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_QT_DH', 'TK_MGR01', 'CAP_NHAT', 'TOURTHUCTE_DIEU_HANH', 'TTT_QT', SYSTIMESTAMP - INTERVAL '3' DAY);

-- Nhat ky cua nhan vien Sales khi tao / cap nhat Don Dat Tour
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_DDT_MB_THEM', 'TK_SALES01', 'THEM', 'DONDATTOUR_SALES', 'DDT_CHO_XN', SYSTIMESTAMP - INTERVAL '1' DAY);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_DDT_MB_CN', 'TK_SALES01', 'CAP_NHAT', 'DONDATTOUR_SALES', 'DDT_DA_XN', SYSTIMESTAMP - INTERVAL '2' DAY);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_DDT_SDR_HUY', 'TK_SALES01', 'CAP_NHAT', 'DONDATTOUR_SALES', 'DDT_CHO_HUY', SYSTIMESTAMP - INTERVAL '4' DAY);

-- Nhat ky cua HDV khi tao Chi Phi Thuc Te trong luc di tour
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_CP_DDR_THEM1', 'TK_HDV01', 'THEM', 'CHIPHITHUCTE_HDV', 'CP_DDR_APPROVED', SYSTIMESTAMP - INTERVAL '1' HOUR);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_CP_DDR_THEM2', 'TK_HDV01', 'THEM', 'CHIPHITHUCTE_HDV', 'CP_DDR_PENDING', SYSTIMESTAMP - INTERVAL '30' MINUTE);

-- Nhat ky cua Ke Toan khi duyet Chi Phi va lam Quyet Toan cho tour Da Quyet Toan
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_CP_QT_DUYET1', 'TK_KT01', 'CAP_NHAT', 'CHIPHITHUCTE_KETOAN', 'CP_QT_HOTEL', SYSTIMESTAMP - INTERVAL '19' DAY);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_CP_QT_DUYET2', 'TK_KT01', 'CAP_NHAT', 'CHIPHITHUCTE_KETOAN', 'CP_QT_BUS', SYSTIMESTAMP - INTERVAL '19' DAY);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_QT_HUE_THEM', 'TK_KT01', 'THEM', 'QUYETTOAN_KETOAN', 'QT_HUE_DONE', SYSTIMESTAMP - INTERVAL '18' DAY);
-- Cap nhat lai TrangThai cho TOURTHUCTE sau khi da them DONDATTOUR (de thoa man trigger MO_BAN)
UPDATE TOURTHUCTE SET TrangThai = 'SAP_DIEN_RA' WHERE MaTourThucTe = 'TTT_SDR';
UPDATE TOURTHUCTE SET TrangThai = 'DANG_DIEN_RA' WHERE MaTourThucTe = 'TTT_DDR';
UPDATE TOURTHUCTE SET TrangThai = 'KET_THUC' WHERE MaTourThucTe = 'TTT_KT';
UPDATE TOURTHUCTE SET TrangThai = 'HUY' WHERE MaTourThucTe = 'TTT_HUY';
UPDATE TOURTHUCTE SET TrangThai = 'DA_QUYET_TOAN' WHERE MaTourThucTe = 'TTT_QT';

-- Bo qua insert LICHSUTOUR vi da duoc insert o tren.
-- Tam thoi bypass ham kiem tra de insert du lieu mau
CREATE OR REPLACE FUNCTION FN_CHECK_CAN_DANH_GIA (
    p_MaTourThucTe IN VARCHAR2,
    p_MaKhachHang  IN VARCHAR2
) RETURN VARCHAR2
IS
BEGIN
    RETURN 'YES';
END;
/

INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_NB_01', 'TTT_KT', 'KH_04', 5, 'Canh rat dep va HDV nhiet tinh.', SYSTIMESTAMP - INTERVAL '2' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_HUE_01', 'TTT_QT', 'KH_02', 4, 'Do an ngon nhung thoi tiet hoi suong mu.', SYSTIMESTAMP - INTERVAL '5' DAY);

-- ============================================================
-- BO SUNG: KHACH HANG DAT TOUR DANG MO BAN (KEM THANH TOAN)
-- ============================================================
-- Dat tour cho Hoi An
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan)
VALUES ('DDT_HA_NEW', 'TTT_HOIAN', 'KH_09', SYSTIMESTAMP - INTERVAL '2' DAY, 11960000, 'DA_XAC_NHAN', SYSTIMESTAMP);

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_HA_NEW_01', 'DDT_HA_NEW', 'Nguyen Van Binh', '079299000301', '0922000301', DATE '1995-05-15', 'NAM', NULL);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HA_NEW_KH', 'DDT_HA_NEW', 'KH_09', NULL, 'NGUOI_DAT', 5980000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HA_NEW_NDH', 'DDT_HA_NEW', NULL, 'NDH_HA_NEW_01', 'NGUOI_DONG_HANH', 5980000);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HA_NEW', 'DDT_HA_NEW', 'THANH_TOAN', 'THE_TIN_DUNG', 11960000, 'BANK-HA-NEW', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

-- Dat tour cho Mui Ne
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan)
VALUES ('DDT_MN_NEW', 'TTT_MUINE', 'KH_10', SYSTIMESTAMP - INTERVAL '1' DAY, 5910000, 'DA_XAC_NHAN', SYSTIMESTAMP);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_MN_NEW_KH', 'DDT_MN_NEW', 'KH_10', NULL, 'NGUOI_DAT', 5910000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_MN_NEW', 'DDT_MN_NEW', 'THANH_TOAN', 'VNPAY', 5910000, 'BANK-MN-NEW', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '12' HOUR);

-- ============================================================
-- BO SUNG: DATA TOUR QUA KHU DE CO DANH GIA CHO HOI AN, MUI NE, HA LONG
-- ============================================================
-- 1. Tour thuc te trong qua khu (ban dau set MO_BAN de vuot trigger)
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HOIAN_OLD', 'TM_HOIAN', TRUNC(SYSDATE) - 20, 5980000, 24, 10, 24, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_MUINE_OLD', 'TM_MUINE', TRUNC(SYSDATE) - 20, 5910000, 26, 10, 26, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HALONG_OLD', 'TM_HALONG', TRUNC(SYSDATE) - 20, 6790000, 26, 10, 26, 'MO_BAN');

-- 2. Don dat tour trong qua khu
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan)
VALUES ('DDT_HA_OLD', 'TTT_HOIAN_OLD', 'KH_06', SYSTIMESTAMP - INTERVAL '30' DAY, 5980000, 'DA_XAC_NHAN', SYSTIMESTAMP);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HA_OLD', 'DDT_HA_OLD', 'KH_06', NULL, 'NGUOI_DAT', 5980000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HA_OLD', 'DDT_HA_OLD', 'THANH_TOAN', 'CHUYEN_KHOAN', 5980000, 'BANK-HA', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '29' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan)
VALUES ('DDT_MN_OLD', 'TTT_MUINE_OLD', 'KH_07', SYSTIMESTAMP - INTERVAL '30' DAY, 5910000, 'DA_XAC_NHAN', SYSTIMESTAMP);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_MN_OLD', 'DDT_MN_OLD', 'KH_07', NULL, 'NGUOI_DAT', 5910000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_MN_OLD', 'DDT_MN_OLD', 'THANH_TOAN', 'CHUYEN_KHOAN', 5910000, 'BANK-MN', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '29' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan)
VALUES ('DDT_HL_OLD', 'TTT_HALONG_OLD', 'KH_08', SYSTIMESTAMP - INTERVAL '30' DAY, 6790000, 'DA_XAC_NHAN', SYSTIMESTAMP);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HL_OLD', 'DDT_HL_OLD', 'KH_08', NULL, 'NGUOI_DAT', 6790000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HL_OLD', 'DDT_HL_OLD', 'THANH_TOAN', 'CHUYEN_KHOAN', 6790000, 'BANK-HL', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '29' DAY);

-- 3. Chuyen trang thai tour sang KET_THUC de pass logic
UPDATE TOURTHUCTE SET TrangThai = 'KET_THUC' WHERE MaTourThucTe IN ('TTT_HOIAN_OLD', 'TTT_MUINE_OLD', 'TTT_HALONG_OLD');

-- 4. Them Lich Su Tour 
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_HA_OLD', 'KH_06', 'TTT_HOIAN_OLD', 'CTDT_HA_OLD', TRUNC(SYSDATE) - 20);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_MN_OLD', 'KH_07', 'TTT_MUINE_OLD', 'CTDT_MN_OLD', TRUNC(SYSDATE) - 20);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_HL_OLD', 'KH_08', 'TTT_HALONG_OLD', 'CTDT_HL_OLD', TRUNC(SYSDATE) - 20);

-- 5. Them Danh Gia cho cac tour nay
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_HA_01', 'TTT_HOIAN_OLD', 'KH_06', 5, 'Trai nghiem rat tuyet voi, pho co dep.', SYSTIMESTAMP - INTERVAL '15' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_MN_01', 'TTT_MUINE_OLD', 'KH_07', 4, 'Doi cat rat rong va dep, tuy nhien troi hoi nang.', SYSTIMESTAMP - INTERVAL '15' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_HL_01', 'TTT_HALONG_OLD', 'KH_08', 5, 'Du thuyen dep, do an ngon, phuc vu chu dao.', SYSTIMESTAMP - INTERVAL '15' DAY);


-- Phuc hoi lai ham kiem tra goc (co ho tro DA_QUYET_TOAN)
CREATE OR REPLACE FUNCTION FN_CHECK_CAN_DANH_GIA (
    p_MaTourThucTe IN VARCHAR2,
    p_MaKhachHang  IN VARCHAR2
) RETURN VARCHAR2
IS
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_Count
    FROM LICHSUTOUR lst
    JOIN TOURTHUCTE ttt ON ttt.MaTourThucTe = lst.MaTourThucTe
    JOIN TOURMAU tm ON tm.MaTourMau = ttt.MaTourMau
    WHERE lst.MaTourThucTe = p_MaTourThucTe
      AND lst.MaKhachHang = p_MaKhachHang
      AND ttt.TrangThai IN ('KET_THUC', 'DA_QUYET_TOAN')
      AND TRUNC(SYSDATE) <= TRUNC(ttt.NgayKhoiHanh) + tm.ThoiLuong + 30;

    RETURN CASE WHEN v_Count > 0 THEN 'YES' ELSE 'NO' END;
END;
/

-- Cap nhat lai SoDanhGia va DanhGia dong bo voi so luot review thuc te cho tat ca cac tour.
-- Nhung tour chua co ai danh gia se co SoDanhGia = 0, DanhGia = 0
UPDATE TOURMAU tm
SET SoDanhGia = (SELECT COUNT(*) FROM TOURTHUCTE ttt JOIN DANHGIAKH dg ON ttt.MaTourThucTe = dg.MaTourThucTe WHERE ttt.MaTourMau = tm.MaTourMau),
    DanhGia = NVL((SELECT ROUND(AVG(dg.SoSao), 2) FROM TOURTHUCTE ttt JOIN DANHGIAKH dg ON ttt.MaTourThucTe = dg.MaTourThucTe WHERE ttt.MaTourMau = tm.MaTourMau), 0);

COMMIT;

-- ============================================================
-- END SEED DATA LIEN KET
-- ============================================================

