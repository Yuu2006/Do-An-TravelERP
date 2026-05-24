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
VALUES ('NL_HDV01', 'NV_HDV01', 'Tiếng Việt', 'Tiếng Anh', 'The HDV nội địa; Sơ cấp cứu cơ bản', 'Tây Bắc, Trekking, Tour xanh', 4.80, 126);

INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV02', 'NV_HDV02', 'Tiếng Việt, Tiếng Anh, Tiếng Hàn', 'The HDV quốc tế', 'Biển đảo, di sản miền Trung, gia đình', 4.70, 98);

INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV03', 'NV_HDV03', 'Tiếng Việt, Tiếng Anh', 'Thẻ HDV nội địa', 'Miền núi phía Bắc, tour cộng đồng', 4.76, 84);
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV04', 'NV_HDV04', 'Tiếng Việt, Tiếng Trung', 'Thẻ HDV nội địa; Sơ cấp cứu cơ bản', 'Di sản miền Trung, ẩm thực địa phương', 4.68, 71);
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV05', 'NV_HDV05', 'Tiếng Việt, Tiếng Anh', 'Thẻ HDV nội địa', 'Biển đảo, nghỉ dưỡng gia đình', 4.72, 79);
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV06', 'NV_HDV06', 'Tiếng Việt, Tiếng Anh', 'Thẻ HDV nội địa', 'Du thuyền, tour cao cấp', 4.74, 68);

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_01', 'khach01', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Trần Minh Khoa', '079199000101', DATE '1995-02-14', 'khach01@digitaltravel.vn', '0911000101', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_02', 'khach02', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Phạm Ngọc Linh', '079199000102', DATE '1997-08-20', 'khach02@digitaltravel.vn', '0911000102', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_03', 'khach03', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Lê Thu Hà', '079199000103', DATE '1992-11-03', 'khach03@digitaltravel.vn', '0911000103', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_04', 'khach04', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyễn Bảo Châu', '079199000104', DATE '1989-05-09', 'khach04@digitaltravel.vn', '0911000104', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_05', 'khach05', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Đỗ Quang Huy', '079199000105', DATE '1986-12-25', 'khach05@digitaltravel.vn', '0911000105', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_06', 'khach06', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Bùi Anh Thư', '079199000106', DATE '1999-04-18', 'khach06@digitaltravel.vn', '0911000106', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_07', 'khach07', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Hoàng Việt Anh', '079199000107', DATE '1991-01-16', 'khach07@digitaltravel.vn', '0911000107', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_08', 'khach08', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Vũ Khánh Vy', '079199000108', DATE '1994-09-27', 'khach08@digitaltravel.vn', '0911000108', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_09', 'khach09', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Đặng Gia Hân', '079199000109', DATE '1988-03-30', 'khach09@digitaltravel.vn', '0911000109', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_10', 'khach10', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Mai Phương Nhi', '079199000110', DATE '1996-06-12', 'khach10@digitaltravel.vn', '0911000110', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_11', 'khach11', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Cao Minh Trí', '079199000111', DATE '1984-10-08', 'khach11@digitaltravel.vn', '0911000111', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_12', 'khach12', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Trịnh Mỹ Duyên', '079199000112', DATE '1998-07-07', 'khach12@digitaltravel.vn', '0911000112', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_13', 'khach13', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyễn Đức Long', '079199000113', DATE '1985-09-19', 'khach13@digitaltravel.vn', '0911000113', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_14', 'khach14', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Lâm Tuệ Minh', '079199000114', DATE '1990-02-28', 'khach14@digitaltravel.vn', '0911000114', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KH_15', 'khach15', '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Phan Gia Bảo', '079199000115', DATE '1993-12-02', 'khach15@digitaltravel.vn', '0911000115', 'KHACHHANG', 'HOAT_DONG');

INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_01', 'TK_KH_01', 'Ăn chay vào buổi tối', 'Hải sản', 'DONG', 650);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_02', 'TK_KH_02', 'Đi cùng gia đình có trẻ em', NULL, 'BAC', 2400);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_03', 'TK_KH_03', NULL, 'Đậu phộng', 'THANH_VIEN', 200);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_04', 'TK_KH_04', 'Cần phòng tầng thấp', NULL, 'VANG', 5600);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_05', 'TK_KH_05', NULL, NULL, 'KIM_CUONG', 10200);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_06', 'TK_KH_06', 'Cần xác nhận dịch vụ đưa đón sân bay', NULL, 'DONG', 850);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_07', 'TK_KH_07', 'Ưu tiên phòng không hút thuốc', NULL, 'THANH_VIEN', 120);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_08', 'TK_KH_08', 'Đi cùng người cao tuổi', 'Sữa bò', 'DONG', 780);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_09', 'TK_KH_09', 'Cần xuất hóa đơn công ty', NULL, 'BAC', 3100);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_10', 'TK_KH_10', NULL, 'Hải sản có vỏ', 'VANG', 6200);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_11', 'TK_KH_11', 'Cần lịch trình ít leo dốc', NULL, 'KIM_CUONG', 11800);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_12', 'TK_KH_12', 'Ăn chay trường', NULL, 'BAC', 2800);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_13', 'TK_KH_13', 'Cần phòng yên tĩnh để làm việc từ xa', NULL, 'VANG', 7100);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_14', 'TK_KH_14', 'Đi cùng trẻ nhỏ dưới 6 tuổi', 'Trứng gà', 'DONG', 950);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, GhiChuYTe, DiUng, HangThanhVien, DiemXanh)
VALUES ('KH_15', 'TK_KH_15', NULL, 'Phấn hoa', 'THANH_VIEN', 320);

-- ------------------------------------------------------------
-- 2. DANH MUC TOUR, DICH VU, HANH DONG XANH
-- ------------------------------------------------------------
INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia)
VALUES ('TM_SAPA', 'Sa Pa - Săn mây Fansipan và bản Cát Cát',
        'Khám phá Sa Pa theo cách trọn vẹn nhất cùng hành trình săn mây Fansipan và bản Cát Cát, nơi du khách được chạm vào vẻ đẹp núi rừng Tây Bắc, văn hóa bản địa và nhịp sống bình yên giữa mây trời. Với lịch trình 3 ngày, tour cân bằng giữa tham quan, nghỉ dưỡng và trải nghiệm địa phương, phù hợp cho gia đình, nhóm bạn và du khách yêu thiên nhiên.

Bao gồm:
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
        'Tận hưởng miền Trung năng động cùng hành trình Đà Nẵng, Sơn Trà, Hội An và Mỹ Sơn, nơi biển xanh, di sản và ẩm thực địa phương hòa quyện trong một chuyến đi giàu cảm xúc. Với lịch trình 4 ngày, tour được thiết kế để du khách vừa có thời gian khám phá các biểu tượng nổi bật vừa nghỉ ngơi thoải mái trong không gian thân thiện và an toàn.

Bao gồm:
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
        'Khám phá Đà Lạt theo cách trọn vẹn nhất cùng hành trình Đà Lạt - Rừng thông và nông trại xanh, nơi mỗi điểm dừng không chỉ là một chuyến tham quan mà còn là trải nghiệm đáng nhớ về văn hóa, thiên nhiên và con người bản địa. Với lịch trình 3 ngày, tour được thiết kế hài hòa giữa nghỉ dưỡng, khám phá và các hoạt động trải nghiệm xanh, mang đến cảm giác thư thái nhưng vẫn đầy cảm hứng cho mọi du khách để bạn tận hưởng chuyến đi một cách tiện lợi, an toàn và đáng nhớ cùng Digital Travel.

Bao gồm:
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
        'Du ngoạn Ninh Bình với hành trình Tràng An, Hoa Lư và chùa Bái Đính, nơi cảnh quan non nước, di sản cố đô và không gian tâm linh tạo nên một chuyến đi nhẹ nhàng nhưng sâu lắng. Lịch trình 2 ngày phù hợp cho du khách muốn đổi gió cuối tuần, trải nghiệm văn hóa miền Bắc và tận hưởng dịch vụ được sắp xếp gọn gàng.

Bao gồm:
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
        'Tận hưởng Phú Quốc với hành trình biển xanh, hoàng hôn Nam Đảo và những trải nghiệm nghỉ dưỡng thư thái giữa thiên nhiên đảo ngọc. Trong 4 ngày, du khách được kết hợp tham quan, tắm biển, khám phá đặc sản địa phương và nghỉ ngơi theo nhịp chậm rãi, phù hợp cho gia đình, cặp đôi và nhóm bạn.

Bao gồm:
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
        'Đi qua chiều sâu văn hóa cố đô cùng hành trình Huế - Kinh thành và ẩm thực, nơi du khách được khám phá Đại Nội, lăng tẩm, làng nghề và những hương vị tinh tế của đất kinh kỳ. Lịch trình 3 ngày mang nhịp điệu chậm rãi, giàu chất văn hóa và phù hợp với du khách yêu lịch sử, kiến trúc và ẩm thực địa phương.

Bao gồm:
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
        'Chạm vào vẻ đẹp hùng vĩ của miền cực Bắc qua cung đường đá Hà Giang, nơi cao nguyên đá, chợ phiên, bản làng và những khúc cua đèo tạo nên một hành trình đầy cảm hứng. Với 4 ngày di chuyển và khám phá, tour phù hợp cho du khách yêu thiên nhiên, văn hóa vùng cao và những trải nghiệm chân thực trên đường.

Bao gồm:
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
        'Khám phá Hạ Long trên du thuyền giữa vịnh xanh, nơi những dãy núi đá vôi, làn nước êm và khoảnh khắc hoàng hôn tạo nên trải nghiệm nghỉ dưỡng đáng nhớ. Lịch trình 3 ngày kết hợp tham quan, thư giãn trên tàu và khám phá Cát Bà, phù hợp cho du khách muốn tận hưởng một chuyến đi tiện nghi nhưng vẫn gần gũi thiên nhiên.

Bao gồm:
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
        'Trải nghiệm nhịp sống miền Tây qua hành trình Cần Thơ, chợ nổi Cái Răng và miệt vườn sông nước, nơi du khách được cảm nhận sự mộc mạc, hào sảng và giàu bản sắc của vùng đất phù sa. Lịch trình 3 ngày nhẹ nhàng, nhiều hoạt động đời sống địa phương và phù hợp cho gia đình, nhóm bạn hoặc khách muốn nghỉ ngắn ngày.

Bao gồm:
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
        'Đến Côn Đảo để cảm nhận vẻ đẹp hoang sơ của biển đảo và chiều sâu lịch sử qua những điểm đến giàu ký ức. Trong 4 ngày, tour kết hợp nghỉ biển, tham quan di tích, trải nghiệm thiên nhiên và hoạt động bảo vệ môi trường, mang đến một chuyến đi yên bình nhưng nhiều dư âm.

Bao gồm:
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
        'Tận hưởng Mộc Châu trong sắc xanh của đồi chè, mùa hoa cao nguyên và không khí trong lành của núi rừng Tây Bắc. Lịch trình 2 ngày được thiết kế gọn gàng, dễ đi, phù hợp cho chuyến nghỉ cuối tuần với các điểm tham quan thiên nhiên, nông trại và văn hóa địa phương.

Bao gồm:
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
        'Khám phá Quy Nhơn qua Kỳ Co, Eo Gió và những làng chài ven biển, nơi vẻ đẹp biển xanh, vách đá và ẩm thực miền Trung tạo nên một hành trình đầy năng lượng. Với 3 ngày, tour cân bằng giữa tham quan, nghỉ biển và trải nghiệm đời sống địa phương, phù hợp cho du khách thích biển và những khung cảnh rộng mở.

Bao gồm:
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
        'Dạo bước qua Hội An với phố cổ, làng rau Trà Quế và những trải nghiệm văn hóa nhẹ nhàng, nơi từng con phố, món ăn và nếp sống địa phương đều mang nét duyên riêng. Lịch trình 3 ngày kết hợp tham quan di sản, trải nghiệm ẩm thực và hoạt động cộng đồng, phù hợp cho du khách yêu sự chậm rãi và tinh tế.

Bao gồm:
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
        'Khám phá Buôn Ma Thuột qua hương cà phê, văn hóa Tây Nguyên và vẻ đẹp mạnh mẽ của thác Dray Nur. Trong 3 ngày, tour đưa du khách đến bảo tàng cà phê, Buôn Đôn và các không gian văn hóa bản địa, tạo nên chuyến đi giàu trải nghiệm, gần gũi thiên nhiên và con người địa phương.

Bao gồm:
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
        'Trở về nhịp sống an yên của Pù Luông với ruộng bậc thang, bản làng và những cung đường đi bộ nhẹ giữa thung lũng xanh. Lịch trình 2 ngày phù hợp cho du khách muốn tạm rời phố thị, nghỉ tại không gian gần gũi thiên nhiên và trải nghiệm văn hóa cộng đồng một cách vừa sức.

Bao gồm:
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
        'Tận hưởng Mũi Né với đồi cát, làng chài và biển xanh Phan Thiết, nơi nắng gió miền duyên hải mang đến một chuyến đi rực rỡ và thư thái. Lịch trình 3 ngày kết hợp tham quan, nghỉ biển và thưởng thức đặc sản địa phương, phù hợp cho nhóm bạn, gia đình và những ai yêu không khí biển.

Bao gồm:
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
VALUES ('LTT_HALONG_02', 'TM_HALONG', 2, 'Hang Sửng Sốt - đảo Titop', 'Tham quan hang, chèo kayak và ngắm toàn cảnh vịnh từ đỉnh Titop.', 'Cơm Việt trên tàu');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HALONG_03', 'TM_HALONG', 3, 'Cát Bà - Hà Nội', 'Trải nghiệm buổi sáng trên vịnh, trả phòng và về lại Hà Nội.', 'Bún hải sản');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_CANTHO_02', 'TM_CANTHO', 2, 'Chợ nổi Cái Răng - miệt vườn', 'Đi chợ nổi sớm, thăm vườn trái cây và làm bánh dân gian.', 'Cá lóc nướng trui');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_CANTHO_03', 'TM_CANTHO', 3, 'Nhà cổ Bình Thủy - tiễn khách', 'Tham quan nhà cổ, mua đặc sản và kết thúc chương trình.', 'Hủ tiếu Nam Vang');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_CONDAO_02', 'TM_CONDAO', 2, 'Hòn Bảy Cạnh - bảo tồn biển', 'Trải nghiệm biển đảo và nghe giới thiệu về bảo tồn rùa biển.', 'Cơm niêu hải sản');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_CONDAO_03', 'TM_CONDAO', 3, 'Di tích Côn Đảo', 'Tham quan các điểm di tích lịch sử và bảo tàng địa phương.', 'Bánh xèo hải sản');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_CONDAO_04', 'TM_CONDAO', 4, 'Đầm Trầu - tiễn khách', 'Nghỉ biển buổi sáng, mua đặc sản và ra sân bay.', 'Cơm đoàn');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_MOCCHAU_02', 'TM_MOCCHAU', 2, 'Thác Dải Yếm - kết thúc', 'Tham quan thác, mua đặc sản sữa và về lại điểm đón.', 'Lẩu gà đen');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_QUYNHON_02', 'TM_QUYNHON', 2, 'Eo Gió - Tháp Đôi', 'Tham quan Eo Gió, Tháp Đôi và thưởng thức đặc sản địa phương.', 'Nem nướng, bánh xèo tôm nhảy');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_QUYNHON_03', 'TM_QUYNHON', 3, 'Làng chài - tiễn khách', 'Trải nghiệm làng chài, mua đặc sản và kết thúc tour.', 'Cơm nhà hàng biển');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HOIAN_02', 'TM_HOIAN', 2, 'Mỹ Sơn - rừng dừa Bảy Mẫu', 'Tham quan Mỹ Sơn, đi thuyền thúng và ăn tối phố cổ.', 'Mì Quảng, bánh đập');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HOIAN_03', 'TM_HOIAN', 3, 'Trà Quế - tiễn khách', 'Trải nghiệm làng rau, mua quà và kết thúc chương trình.', 'Cơm gà Hội An');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_BMT_02', 'TM_BUONMATHUOT', 2, 'Thác Dray Nur - Buôn Đôn', 'Tham quan thác, tìm hiểu văn hóa Ê Đê và M''Nông.', 'Cơm lam, thịt nướng');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_BMT_03', 'TM_BUONMATHUOT', 3, 'Làng cà phê - tiễn khách', 'Thưởng thức cà phê, mua quà và ra sân bay.', 'Bún đỏ Buôn Ma Thuột');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_PULUONG_02', 'TM_PULUONG', 2, 'Hiêu - kết thúc', 'Đi bộ nhẹ ra thác Hiêu, ăn trưa và về lại Hà Nội.', 'Cơm bản');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_MUINE_02', 'TM_MUINE', 2, 'Bàu Trắng - Suối Tiên', 'Ngắm bình minh Bàu Trắng, tham quan Suối Tiên và nghỉ biển.', 'Hải sản nướng');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_MUINE_03', 'TM_MUINE', 3, 'Phan Thiết - tiễn khách', 'Tham quan lầu Ông Hoàng, mua đặc sản và kết thúc tour.', 'Lẩu thả Phan Thiết');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HAGIANG_01', 'TM_HAGIANG', 1, 'Hà Nội - Quản Bạ', 'Di chuyển lên Hà Giang, nhận phòng và tham quan cổng trời Quản Bạ.', 'Thắng cố, rau cải mèo');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HAGIANG_02', 'TM_HAGIANG', 2, 'Yên Minh - Đồng Văn', 'Tham quan rừng thông Yên Minh, dinh vua Mèo và phố cổ Đồng Văn.', 'Lẩu gà đen');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HAGIANG_03', 'TM_HAGIANG', 3, 'Mã Pì Lèng - Mèo Vạc', 'Đi cung đường Mã Pì Lèng, sông Nho Quế và chợ phiên địa phương.', 'Cơm lam, thịt lợn cắp nách');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_HAGIANG_04', 'TM_HAGIANG', 4, 'Mèo Vạc - Hà Nội', 'Mua đặc sản, trả phòng và về lại Hà Nội.', 'Phở chua Hà Giang');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_PHUQUOC_01', 'TM_PHUQUOC', 1, 'Dương Đông - Bãi Trường', 'Đón khách, nhận phòng và ngắm hoàng hôn trên Bãi Trường.', 'Gỏi cá trích');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_PHUQUOC_02', 'TM_PHUQUOC', 2, 'Nam Đảo - Hòn Thơm', 'Tham quan Nam Đảo, trải nghiệm cáp treo và bãi biển Hòn Thơm.', 'Hải sản nướng');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_PHUQUOC_03', 'TM_PHUQUOC', 3, 'Rạch Vẹm - vườn tiêu', 'Tham quan Rạch Vẹm, vườn tiêu và cơ sở nước mắm truyền thống.', 'Bún quậy');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LTT_PHUQUOC_04', 'TM_PHUQUOC', 4, 'Chợ Dương Đông - tiễn khách', 'Mua đặc sản, trả phòng và kết thúc tour.', 'Cơm gia đình');

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
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_CONDAO_WATER', 'TTT_CONDAO', 'NV_HDV02', 'Nuoc uong bo sung tai ben tau', 240000, 'https://seed.local/hoa-don/condao-water.jpg', 'CHO_DUYET', SYSTIMESTAMP - INTERVAL '35' MINUTE);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_CONDAO_TRANSFER', 'TTT_CONDAO', 'NV_HDV02', 'Xe trung chuyen du phong', 750000, 'https://seed.local/hoa-don/condao-transfer.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '25' MINUTE);

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
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_MOCCHAU_TRAIL', 'TTT_MOCCHAU', 'NV_HDV01', 'Duong vao doi che am uot sau mua.',
        'Chuyen sang loi di phu, nhac khach mang giay chong tron.', 'THAP', 'THOI_TIET', SYSTIMESTAMP - INTERVAL '11' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_MOCCHAU_RAINCOAT', 'TTT_MOCCHAU', 'NV_HDV01', 'Ao mua mong cho khach', 180000, 'https://seed.local/hoa-don/mocchau-raincoat.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '11' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_MOCCHAU_LOCAL', 'TTT_MOCCHAU', 'NV_HDV01', 'Phi xe dien vao nong trai', 300000, 'https://seed.local/hoa-don/mocchau-ev.jpg', 'CHO_DUYET', SYSTIMESTAMP - INTERVAL '10' DAY);
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
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_PULUONG_CHILD', 'TTT_PULUONG', 'NV_HDV02', 'Tre nho met sau chang di bo ban Don.',
        'Rut ngan cung di bo va bo tri xe dien ve homestay.', 'THAP', 'Y_TE', SYSTIMESTAMP - INTERVAL '17' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_PULUONG_EV', 'TTT_PULUONG', 'NV_HDV02', 'Xe dien ho tro gia dinh co tre nho', 360000, 'https://seed.local/hoa-don/puluong-ev.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '17' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_PULUONG_SNACK', 'TTT_PULUONG', 'NV_HDV02', 'Do an nhe cho tre em', 150000, 'https://seed.local/hoa-don/puluong-snack.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '17' DAY);
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
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_SAPA_OLD', 'TM_SAPA', TRUNC(SYSDATE) - 35, 4800000, 24, 8, 24, 'MO_BAN');

INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HOIAN_OLD', 'DVT_DINNER');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_MUINE_OLD', 'DVT_AIRPORT');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HALONG_OLD', 'DVT_PHOTO');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_SAPA_OLD', 'DVT_DINNER');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_SAPA_OLD', 'DVT_SINGLE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HOIAN_OLD', 'HDX_LOCAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_MUINE_OLD', 'HDX_BOTTLE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HALONG_OLD', 'HDX_EBILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_SAPA_OLD', 'HDX_CLEANUP');

INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_HOIAN_OLD_HDV04', 'TTT_HOIAN_OLD', 'NV_HDV04', SYSTIMESTAMP - INTERVAL '35' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '34' DAY);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_MUINE_OLD_HDV05', 'TTT_MUINE_OLD', 'NV_HDV05', SYSTIMESTAMP - INTERVAL '35' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '34' DAY);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_HALONG_OLD_HDV06', 'TTT_HALONG_OLD', 'NV_HDV06', SYSTIMESTAMP - INTERVAL '35' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '34' DAY);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_SAPA_OLD_HDV03', 'TTT_SAPA_OLD', 'NV_HDV03', SYSTIMESTAMP - INTERVAL '55' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '54' DAY);

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

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_SAPA_OLD_01', 'TTT_SAPA_OLD', 'KH_01', SYSTIMESTAMP - INTERVAL '50' DAY, 4800000, 'DA_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '48' DAY, 'Khách lẻ đã thanh toán đủ tour Sa Pa quá khứ.', 'HDX_CLEANUP:1');
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_SAPA_OLD_02', 'TTT_SAPA_OLD', 'KH_02', SYSTIMESTAMP - INTERVAL '50' DAY, 9600000, 'DA_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '48' DAY, 'Cặp đôi đã thanh toán đủ tour Sa Pa.', 'HDX_CLEANUP:1');
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_SAPA_OLD_03', 'TTT_SAPA_OLD', 'KH_03', SYSTIMESTAMP - INTERVAL '49' DAY, 15240000, 'DA_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '47' DAY, 'Nhóm 3 khách có thêm bữa tối đặc sản.', 'HDX_CLEANUP:1');
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_SAPA_OLD_04', 'TTT_SAPA_OLD', 'KH_04', SYSTIMESTAMP - INTERVAL '49' DAY, 5450000, 'DA_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '47' DAY, 'Khách yêu cầu phụ thu phòng đơn.', NULL);
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_SAPA_OLD_05', 'TTT_SAPA_OLD', 'KH_05', SYSTIMESTAMP - INTERVAL '48' DAY, 19200000, 'DA_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '46' DAY, 'Gia đình 4 người đã thanh toán đủ.', 'HDX_CLEANUP:1');

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_SAPA_OLD_02_01', 'DDT_SAPA_OLD_02', 'Pham Quang Hieu', '079299000401', '0922000401', DATE '1994-09-09', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_SAPA_OLD_03_01', 'DDT_SAPA_OLD_03', 'Le Bao Ngoc', '079299000402', '0922000402', DATE '1996-12-11', 'NU', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_SAPA_OLD_03_02', 'DDT_SAPA_OLD_03', 'Le Minh Quan', '079299000403', '0922000403', DATE '1992-03-15', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_SAPA_OLD_05_01', 'DDT_SAPA_OLD_05', 'Do Thanh Lam', '079299000404', '0922000404', DATE '1988-08-08', 'NU', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_SAPA_OLD_05_02', 'DDT_SAPA_OLD_05', 'Do Minh Khoi', '079299000405', '0922000405', DATE '2012-05-20', 'NAM', 'Tre em');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_SAPA_OLD_05_03', 'DDT_SAPA_OLD_05', 'Do Gia Han', '079299000406', '0922000406', DATE '2016-11-02', 'NU', 'Tre em');

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OLD_01_KH', 'DDT_SAPA_OLD_01', 'KH_01', NULL, 'NGUOI_DAT', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OLD_02_KH', 'DDT_SAPA_OLD_02', 'KH_02', NULL, 'NGUOI_DAT', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OLD_02_NDH1', 'DDT_SAPA_OLD_02', NULL, 'NDH_SAPA_OLD_02_01', 'NGUOI_DONG_HANH', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OLD_03_KH', 'DDT_SAPA_OLD_03', 'KH_03', NULL, 'NGUOI_DAT', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OLD_03_NDH1', 'DDT_SAPA_OLD_03', NULL, 'NDH_SAPA_OLD_03_01', 'NGUOI_DONG_HANH', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OLD_03_NDH2', 'DDT_SAPA_OLD_03', NULL, 'NDH_SAPA_OLD_03_02', 'NGUOI_DONG_HANH', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OLD_04_KH', 'DDT_SAPA_OLD_04', 'KH_04', NULL, 'NGUOI_DAT', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OLD_05_KH', 'DDT_SAPA_OLD_05', 'KH_05', NULL, 'NGUOI_DAT', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OLD_05_NDH1', 'DDT_SAPA_OLD_05', NULL, 'NDH_SAPA_OLD_05_01', 'NGUOI_DONG_HANH', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OLD_05_NDH2', 'DDT_SAPA_OLD_05', NULL, 'NDH_SAPA_OLD_05_02', 'NGUOI_DONG_HANH', 4800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OLD_05_NDH3', 'DDT_SAPA_OLD_05', NULL, 'NDH_SAPA_OLD_05_03', 'NGUOI_DONG_HANH', 4800000);

INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_SAPA_OLD_03_DINNER', 'DDT_SAPA_OLD_03', 'DVT_DINNER', 3, 280000, 840000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_SAPA_OLD_04_SINGLE', 'DDT_SAPA_OLD_04', 'DVT_SINGLE', 1, 650000, 650000);

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_SAPA_OLD_01_PAY', 'DDT_SAPA_OLD_01', 'THANH_TOAN', 'CHUYEN_KHOAN', 4800000, 'BANK-SAPA-001', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '49' DAY);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_SAPA_OLD_02_PAY', 'DDT_SAPA_OLD_02', 'THANH_TOAN', 'THE_QUOC_TE', 9600000, 'BANK-SAPA-002', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '49' DAY);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_SAPA_OLD_03_PAY', 'DDT_SAPA_OLD_03', 'THANH_TOAN', 'VI_DIEN_TU', 15240000, 'BANK-SAPA-003', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '48' DAY);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_SAPA_OLD_04_PAY', 'DDT_SAPA_OLD_04', 'THANH_TOAN', 'CHUYEN_KHOAN', 5450000, 'BANK-SAPA-004', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '48' DAY);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_SAPA_OLD_05_PAY', 'DDT_SAPA_OLD_05', 'THANH_TOAN', 'THE_NOI_DIA', 19200000, 'BANK-SAPA-005', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '47' DAY);

-- 3. Chuyen trang thai tour sang KET_THUC de pass logic
UPDATE TOURTHUCTE SET TrangThai = 'KET_THUC' WHERE MaTourThucTe IN ('TTT_HOIAN_OLD', 'TTT_MUINE_OLD', 'TTT_HALONG_OLD', 'TTT_SAPA_OLD');

-- 4. Them Lich Su Tour 
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_HA_OLD', 'KH_06', 'TTT_HOIAN_OLD', 'CTDT_HA_OLD', TRUNC(SYSDATE) - 20);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_MN_OLD', 'KH_07', 'TTT_MUINE_OLD', 'CTDT_MN_OLD', TRUNC(SYSDATE) - 20);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_HL_OLD', 'KH_08', 'TTT_HALONG_OLD', 'CTDT_HL_OLD', TRUNC(SYSDATE) - 20);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_SAPA_OLD_KH01', 'KH_01', 'TTT_SAPA_OLD', 'CTDT_SAPA_OLD_01_KH', TRUNC(SYSDATE) - 35);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_SAPA_OLD_KH02', 'KH_02', 'TTT_SAPA_OLD', 'CTDT_SAPA_OLD_02_KH', TRUNC(SYSDATE) - 35);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_SAPA_OLD_KH03', 'KH_03', 'TTT_SAPA_OLD', 'CTDT_SAPA_OLD_03_KH', TRUNC(SYSDATE) - 35);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_SAPA_OLD_KH04', 'KH_04', 'TTT_SAPA_OLD', 'CTDT_SAPA_OLD_04_KH', TRUNC(SYSDATE) - 35);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_SAPA_OLD_KH05', 'KH_05', 'TTT_SAPA_OLD', 'CTDT_SAPA_OLD_05_KH', TRUNC(SYSDATE) - 35);

INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_HOIAN_OLD_MEAL', 'TTT_HOIAN_OLD', 'NV_HDV04', 'Một khách báo món chay được phục vụ chậm.',
        'HDV làm việc lại với nhà hàng và đổi món riêng cho khách.', 'THAP', 'AN_UONG', SYSTIMESTAMP - INTERVAL '19' DAY);
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_MUINE_OLD_WEATHER', 'TTT_MUINE_OLD', 'NV_HDV05', 'Gió mạnh tại đồi cát vào buổi chiều.',
        'Đổi lịch chụp ảnh sáng sớm ngày tiếp theo và cấp nước bổ sung.', 'THAP', 'THOI_TIET', SYSTIMESTAMP - INTERVAL '19' DAY);
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_HALONG_OLD_ROUTE', 'TTT_HALONG_OLD', 'NV_HDV06', 'Cảng tàu đổi giờ lên du thuyền 30 phút.',
        'Cập nhật thông tin cho khách và sắp xếp khu chờ riêng.', 'THAP', 'PHUONG_TIEN', SYSTIMESTAMP - INTERVAL '19' DAY);
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_SAPA_OLD_FOG', 'TTT_SAPA_OLD', 'NV_HDV03', 'Sương mù dày tại Fansipan làm giảm tầm nhìn.',
        'Đổi khung giờ tham quan và bổ sung điểm check-in trong nhà.', 'THAP', 'THOI_TIET', SYSTIMESTAMP - INTERVAL '34' DAY);
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_SAPA_OLD_MEDICAL', 'TTT_SAPA_OLD', 'NV_HDV03', 'Một khách bị đau chân nhẹ sau chặng đi bộ.',
        'Hỗ trợ băng cố định, sắp xếp xe điện và theo dõi sức khỏe.', 'THAP', 'Y_TE', SYSTIMESTAMP - INTERVAL '33' DAY);

INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_HOIAN_OLD_WATER', 'TTT_HOIAN_OLD', 'NV_HDV04', 'Nước uống bổ sung', 210000, 'https://seed.local/hoa-don/hoian-water.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '19' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_MUINE_OLD_JEEP', 'TTT_MUINE_OLD', 'NV_HDV05', 'Xe jeep Bàu Trắng phát sinh', 650000, 'https://seed.local/hoa-don/muine-jeep.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '19' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_HALONG_OLD_LOUNGE', 'TTT_HALONG_OLD', 'NV_HDV06', 'Khu chờ khách tại cảng', 480000, 'https://seed.local/hoa-don/halong-lounge.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '19' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_SAPA_OLD_MEDICAL', 'TTT_SAPA_OLD', 'NV_HDV03', 'Bộ y tế và băng cố định', 260000, 'https://seed.local/hoa-don/sapa-medical.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '33' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_SAPA_OLD_EV', 'TTT_SAPA_OLD', 'NV_HDV03', 'Xe điện hỗ trợ khách', 420000, 'https://seed.local/hoa-don/sapa-ev.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '33' DAY);

-- 5. Them Danh Gia cho cac tour nay
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_HA_01', 'TTT_HOIAN_OLD', 'KH_06', 5, 'Trai nghiem rat tuyet voi, pho co dep.', SYSTIMESTAMP - INTERVAL '15' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_MN_01', 'TTT_MUINE_OLD', 'KH_07', 4, 'Doi cat rat rong va dep, tuy nhien troi hoi nang.', SYSTIMESTAMP - INTERVAL '15' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_HL_01', 'TTT_HALONG_OLD', 'KH_08', 5, 'Du thuyen dep, do an ngon, phuc vu chu dao.', SYSTIMESTAMP - INTERVAL '15' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_SAPA_OLD_KH01', 'TTT_SAPA_OLD', 'KH_01', 5, 'Fansipan nhiều sương nhưng HDV đổi lịch rất linh hoạt.', SYSTIMESTAMP - INTERVAL '30' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_SAPA_OLD_KH02', 'TTT_SAPA_OLD', 'KH_02', 5, 'Khách sạn sạch, bữa ăn địa phương ngon và lịch trình vừa sức.', SYSTIMESTAMP - INTERVAL '30' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_SAPA_OLD_KH03', 'TTT_SAPA_OLD', 'KH_03', 4, 'Cần thêm thời gian tự do ở chợ đêm, còn lại rất ổn.', SYSTIMESTAMP - INTERVAL '29' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_SAPA_OLD_KH04', 'TTT_SAPA_OLD', 'KH_04', 5, 'Phòng đơn được sắp xếp đúng yêu cầu, HDV chăm sóc kỹ.', SYSTIMESTAMP - INTERVAL '29' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_SAPA_OLD_KH05', 'TTT_SAPA_OLD', 'KH_05', 4, 'Gia đình hài lòng, trẻ nhỏ được hỗ trợ khi đi bộ.', SYSTIMESTAMP - INTERVAL '28' DAY);

-- ============================================================
-- BỔ SUNG: TOUR THỰC TẾ Ở NHIỀU TRẠNG THÁI, DỮ LIỆU LIÊN QUAN ĐẦY ĐỦ
-- ============================================================
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_NINHBINH_CKH_02', 'TM_NINHBINH', TRUNC(SYSDATE) + 210, 3000000, 22, 8, 22, 'CHO_KICH_HOAT');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_DALAT_MB_02', 'TM_DALAT', TRUNC(SYSDATE) + 220, 4300000, 20, 8, 20, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_PHUQUOC_SDR_02', 'TM_PHUQUOC', TRUNC(SYSDATE) + 8, 7900000, 24, 10, 24, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_BUONMATHUOT_DDR_02', 'TM_BUONMATHUOT', TRUNC(SYSDATE) - 1, 4200000, 18, 8, 18, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_CANTHO_KT_02', 'TM_CANTHO', TRUNC(SYSDATE) - 14, 3800000, 26, 10, 26, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HAGIANG_HUY_02', 'TM_HAGIANG', TRUNC(SYSDATE) + 240, 6300000, 18, 8, 18, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HUE_QT_02', 'TM_HUE', TRUNC(SYSDATE) - 45, 4400000, 22, 8, 22, 'MO_BAN');

INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_DALAT_MB_02', 'DVT_INSURANCE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_PHUQUOC_SDR_02', 'DVT_AIRPORT');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_BUONMATHUOT_DDR_02', 'DVT_DINNER');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_CANTHO_KT_02', 'DVT_PHOTO');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HAGIANG_HUY_02', 'DVT_INSURANCE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HUE_QT_02', 'DVT_SINGLE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_DALAT_MB_02', 'HDX_EBILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_PHUQUOC_SDR_02', 'HDX_BOTTLE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_BUONMATHUOT_DDR_02', 'HDX_LOCAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_CANTHO_KT_02', 'HDX_EBILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HAGIANG_HUY_02', 'HDX_TREE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HUE_QT_02', 'HDX_LOCAL');

INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_NB_CKH_02_HDV07', 'TTT_NINHBINH_CKH_02', 'NV_HDV07', SYSTIMESTAMP - INTERVAL '2' DAY, 'CHO_PHAN_HOI', NULL);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_DALAT_MB_02_HDV08', 'TTT_DALAT_MB_02', 'NV_HDV08', SYSTIMESTAMP - INTERVAL '2' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '1' DAY);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_PHUQUOC_SDR_02_HDV09', 'TTT_PHUQUOC_SDR_02', 'NV_HDV09', SYSTIMESTAMP - INTERVAL '5' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '4' DAY);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_BMT_DDR_02_HDV10', 'TTT_BUONMATHUOT_DDR_02', 'NV_HDV10', SYSTIMESTAMP - INTERVAL '12' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '11' DAY);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_CANTHO_KT_02_HDV07', 'TTT_CANTHO_KT_02', 'NV_HDV07', SYSTIMESTAMP - INTERVAL '25' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '24' DAY);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_HAGIANG_HUY_02_HDV08', 'TTT_HAGIANG_HUY_02', 'NV_HDV08', SYSTIMESTAMP - INTERVAL '7' DAY, 'TU_CHOI', SYSTIMESTAMP - INTERVAL '6' DAY);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_HUE_QT_02_HDV09', 'TTT_HUE_QT_02', 'NV_HDV09', SYSTIMESTAMP - INTERVAL '60' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '59' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_DALAT_MB_02_CHO', 'TTT_DALAT_MB_02', 'KH_06', SYSTIMESTAMP - INTERVAL '6' HOUR, 8720000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP + INTERVAL '1' DAY, 'Hai khách giữ chỗ tour Đà Lạt, đã thanh toán cọc một phần.', 'HDX_EBILL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_DALAT_MB_02_01', 'DDT_DALAT_MB_02_CHO', 'Bùi Minh Ngọc', '079299000501', '0922000501', DATE '1998-02-14', 'NỮ', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_DALAT_MB_02_KH', 'DDT_DALAT_MB_02_CHO', 'KH_06', NULL, 'NGUOI_DAT', 4300000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_DALAT_MB_02_NDH1', 'DDT_DALAT_MB_02_CHO', NULL, 'NDH_DALAT_MB_02_01', 'NGUOI_DONG_HANH', 4300000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_DALAT_MB_02_INS', 'DDT_DALAT_MB_02_CHO', 'DVT_INSURANCE', 1, 120000, 120000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_DALAT_MB_02_COC', 'DDT_DALAT_MB_02_CHO', 'THANH_TOAN', 'CHUYEN_KHOAN', 3000000, 'BANK-DALAT-02', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '2' HOUR);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_PHUQUOC_SDR_02_OK', 'TTT_PHUQUOC_SDR_02', 'KH_07', SYSTIMESTAMP - INTERVAL '12' DAY, 16150000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '10' DAY, 'Gia đình ba người đi Phú Quốc, thanh toán đủ trước ngày khởi hành.', 'HDX_BOTTLE:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_PHUQUOC_SDR_02_01', 'DDT_PHUQUOC_SDR_02_OK', 'Hoàng Gia Bảo', '079299000502', '0922000502', DATE '1990-06-06', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_PHUQUOC_SDR_02_02', 'DDT_PHUQUOC_SDR_02_OK', 'Hoàng Minh Châu', '079299000503', '0922000503', DATE '2016-09-09', 'NỮ', 'Trẻ em');
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_PHUQUOC_SDR_02_KH', 'DDT_PHUQUOC_SDR_02_OK', 'KH_07', NULL, 'NGUOI_DAT', 7900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_PHUQUOC_SDR_02_NDH1', 'DDT_PHUQUOC_SDR_02_OK', NULL, 'NDH_PHUQUOC_SDR_02_01', 'NGUOI_DONG_HANH', 7900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_PHUQUOC_SDR_02_NDH2', 'DDT_PHUQUOC_SDR_02_OK', NULL, 'NDH_PHUQUOC_SDR_02_02', 'NGUOI_DONG_HANH', 0);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_PHUQUOC_SDR_02_AIR', 'DDT_PHUQUOC_SDR_02_OK', 'DVT_AIRPORT', 1, 350000, 350000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_PHUQUOC_SDR_02_PAY', 'DDT_PHUQUOC_SDR_02_OK', 'THANH_TOAN', 'THE_QUOC_TE', 16150000, 'BANK-PHUQUOC-02', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '11' DAY);
UPDATE TOURTHUCTE SET TrangThai = 'SAP_DIEN_RA' WHERE MaTourThucTe = 'TTT_PHUQUOC_SDR_02';

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_BMT_DDR_02_OK', 'TTT_BUONMATHUOT_DDR_02', 'KH_08', SYSTIMESTAMP - INTERVAL '10' DAY, 8680000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '8' DAY, 'Hai khách đang tham gia tour Buôn Ma Thuột.', 'HDX_LOCAL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_BMT_DDR_02_01', 'DDT_BMT_DDR_02_OK', 'Vũ Hải Đăng', '079299000504', '0922000504', DATE '1989-12-12', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_BMT_DDR_02_KH', 'DDT_BMT_DDR_02_OK', 'KH_08', NULL, 'NGUOI_DAT', 4200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_BMT_DDR_02_NDH1', 'DDT_BMT_DDR_02_OK', NULL, 'NDH_BMT_DDR_02_01', 'NGUOI_DONG_HANH', 4200000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_BMT_DDR_02_DINNER', 'DDT_BMT_DDR_02_OK', 'DVT_DINNER', 1, 280000, 280000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_BMT_DDR_02_PAY', 'DDT_BMT_DDR_02_OK', 'THANH_TOAN', 'CHUYEN_KHOAN', 8680000, 'BANK-BMT-02', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '9' DAY);
UPDATE TOURTHUCTE SET TrangThai = 'DANG_DIEN_RA' WHERE MaTourThucTe = 'TTT_BUONMATHUOT_DDR_02';
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai)
VALUES ('DD_BMT_DDR_02_KH_OK', 'TTT_BUONMATHUOT_DDR_02', 'KH_08', NULL, 'NGUOI_DAT', 'NV_HDV10', SYSTIMESTAMP - INTERVAL '4' HOUR, 'Bảo tàng Cà phê', 'DA_DIEM_DANH');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNguoiDongHanh, LoaiKhach, MaNhanVien, ThoiGian, DiaDiem, TrangThai)
VALUES ('DD_BMT_DDR_02_NDH_OK', 'TTT_BUONMATHUOT_DDR_02', NULL, 'NDH_BMT_DDR_02_01', 'NGUOI_DONG_HANH', 'NV_HDV10', SYSTIMESTAMP - INTERVAL '4' HOUR, 'Bảo tàng Cà phê', 'DA_DIEM_DANH');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD_BMT_DDR_02_LOCAL', 'TTT_BUONMATHUOT_DDR_02', 'KH_08', 'HDX_LOCAL', 'NV_HDV10', SYSTIMESTAMP - INTERVAL '2' HOUR,
        'Khách sử dụng bình nước cá nhân và mua sản phẩm địa phương không dùng túi nhựa.');
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_BMT_DDR_02_RAIN', 'TTT_BUONMATHUOT_DDR_02', 'NV_HDV10', 'Mưa lớn khi tham quan thác Dray Nur.',
        'Đổi lịch tham quan trong nhà và phát áo mưa cho khách.', 'THAP', 'THOI_TIET', SYSTIMESTAMP - INTERVAL '90' MINUTE);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_BMT_DDR_02_RAINCOAT', 'TTT_BUONMATHUOT_DDR_02', 'NV_HDV10', 'Áo mưa và khăn khô', 220000, 'https://seed.local/hoa-don/bmt-ao-mua.jpg', 'CHO_DUYET', SYSTIMESTAMP - INTERVAL '80' MINUTE);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_CANTHO_KT_02_OK', 'TTT_CANTHO_KT_02', 'KH_09', SYSTIMESTAMP - INTERVAL '25' DAY, 8500000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '23' DAY, 'Nhóm hai khách đã hoàn thành tour Cần Thơ.', 'HDX_EBILL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_CANTHO_KT_02_01', 'DDT_CANTHO_KT_02_OK', 'Đặng Minh Khôi', '079299000505', '0922000505', DATE '1986-01-21', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KT_02_KH', 'DDT_CANTHO_KT_02_OK', 'KH_09', NULL, 'NGUOI_DAT', 3800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KT_02_NDH1', 'DDT_CANTHO_KT_02_OK', NULL, 'NDH_CANTHO_KT_02_01', 'NGUOI_DONG_HANH', 3800000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_CANTHO_KT_02_PHOTO', 'DDT_CANTHO_KT_02_OK', 'DVT_PHOTO', 1, 900000, 900000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_CANTHO_KT_02_PAY', 'DDT_CANTHO_KT_02_OK', 'THANH_TOAN', 'CHUYEN_KHOAN', 8500000, 'BANK-CANTHO-02', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '24' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_CANTHO_KT_02_02', 'TTT_CANTHO_KT_02', 'KH_12', SYSTIMESTAMP - INTERVAL '24' DAY, 3800000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '22' DAY, 'Khách lẻ đặt tour Cần Thơ, cần thực đơn chay.', 'HDX_EBILL:1');
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KT_02_02_KH', 'DDT_CANTHO_KT_02_02', 'KH_12', NULL, 'NGUOI_DAT', 3800000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_CANTHO_KT_02_02_PAY', 'DDT_CANTHO_KT_02_02', 'THANH_TOAN', 'VI_DIEN_TU', 3800000, 'BANK-CANTHO-022', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '23' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_CANTHO_KT_02_03', 'TTT_CANTHO_KT_02', 'KH_13', SYSTIMESTAMP - INTERVAL '24' DAY, 7600000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '22' DAY, 'Hai khách đi nghỉ cuối tuần, ưu tiên phòng yên tĩnh.', 'HDX_EBILL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_CANTHO_KT_02_03_01', 'DDT_CANTHO_KT_02_03', 'Nguyễn Hoài Nam', '079299000508', '0922000508', DATE '1984-06-17', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KT_02_03_KH', 'DDT_CANTHO_KT_02_03', 'KH_13', NULL, 'NGUOI_DAT', 3800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KT_02_03_NDH1', 'DDT_CANTHO_KT_02_03', NULL, 'NDH_CANTHO_KT_02_03_01', 'NGUOI_DONG_HANH', 3800000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_CANTHO_KT_02_03_PAY', 'DDT_CANTHO_KT_02_03', 'THANH_TOAN', 'CHUYEN_KHOAN', 7600000, 'BANK-CANTHO-023', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '23' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_CANTHO_KT_02_04', 'TTT_CANTHO_KT_02', 'KH_14', SYSTIMESTAMP - INTERVAL '23' DAY, 12300000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '21' DAY, 'Gia đình ba người đặt thêm gói chụp ảnh hành trình.', 'HDX_EBILL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_CANTHO_KT_02_04_01', 'DDT_CANTHO_KT_02_04', 'Lâm Gia Hân', '079299000509', '0922000509', DATE '2019-03-15', 'NỮ', 'Trẻ em');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_CANTHO_KT_02_04_02', 'DDT_CANTHO_KT_02_04', 'Lâm Minh Phúc', '079299000510', '0922000510', DATE '1988-05-03', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KT_02_04_KH', 'DDT_CANTHO_KT_02_04', 'KH_14', NULL, 'NGUOI_DAT', 3800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KT_02_04_NDH1', 'DDT_CANTHO_KT_02_04', NULL, 'NDH_CANTHO_KT_02_04_01', 'NGUOI_DONG_HANH', 3800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KT_02_04_NDH2', 'DDT_CANTHO_KT_02_04', NULL, 'NDH_CANTHO_KT_02_04_02', 'NGUOI_DONG_HANH', 3800000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_CANTHO_KT_02_04_PHOTO', 'DDT_CANTHO_KT_02_04', 'DVT_PHOTO', 1, 900000, 900000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_CANTHO_KT_02_04_PAY', 'DDT_CANTHO_KT_02_04', 'THANH_TOAN', 'THE_NOI_DIA', 12300000, 'BANK-CANTHO-024', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '22' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_CANTHO_KT_02_05', 'TTT_CANTHO_KT_02', 'KH_15', SYSTIMESTAMP - INTERVAL '23' DAY, 4700000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '21' DAY, 'Khách lẻ đặt thêm gói ảnh, thanh toán đủ một lần.', 'HDX_EBILL:1');
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KT_02_05_KH', 'DDT_CANTHO_KT_02_05', 'KH_15', NULL, 'NGUOI_DAT', 3800000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_CANTHO_KT_02_05_PHOTO', 'DDT_CANTHO_KT_02_05', 'DVT_PHOTO', 1, 900000, 900000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_CANTHO_KT_02_05_PAY', 'DDT_CANTHO_KT_02_05', 'THANH_TOAN', 'CHUYEN_KHOAN', 4700000, 'BANK-CANTHO-025', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '22' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_CANTHO_KT_02_06', 'TTT_CANTHO_KT_02', 'KH_06', SYSTIMESTAMP - INTERVAL '22' DAY, 7600000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '20' DAY, 'Hai khách đi tour Cần Thơ, cần xác nhận xe đưa đón.', 'HDX_EBILL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_CANTHO_KT_02_06_01', 'DDT_CANTHO_KT_02_06', 'Bùi Minh An', '079299000511', '0922000511', DATE '1995-10-10', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KT_02_06_KH', 'DDT_CANTHO_KT_02_06', 'KH_06', NULL, 'NGUOI_DAT', 3800000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_CANTHO_KT_02_06_NDH1', 'DDT_CANTHO_KT_02_06', NULL, 'NDH_CANTHO_KT_02_06_01', 'NGUOI_DONG_HANH', 3800000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_CANTHO_KT_02_06_PAY', 'DDT_CANTHO_KT_02_06', 'THANH_TOAN', 'THE_QUOC_TE', 7600000, 'BANK-CANTHO-026', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '21' DAY);

UPDATE TOURTHUCTE SET TrangThai = 'KET_THUC' WHERE MaTourThucTe = 'TTT_CANTHO_KT_02';
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_CANTHO_KT_02_KH09', 'KH_09', 'TTT_CANTHO_KT_02', 'CTDT_CANTHO_KT_02_KH', TRUNC(SYSDATE) - 14);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_CANTHO_KT_02_KH12', 'KH_12', 'TTT_CANTHO_KT_02', 'CTDT_CANTHO_KT_02_02_KH', TRUNC(SYSDATE) - 14);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_CANTHO_KT_02_KH13', 'KH_13', 'TTT_CANTHO_KT_02', 'CTDT_CANTHO_KT_02_03_KH', TRUNC(SYSDATE) - 14);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_CANTHO_KT_02_KH14', 'KH_14', 'TTT_CANTHO_KT_02', 'CTDT_CANTHO_KT_02_04_KH', TRUNC(SYSDATE) - 14);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_CANTHO_KT_02_KH15', 'KH_15', 'TTT_CANTHO_KT_02', 'CTDT_CANTHO_KT_02_05_KH', TRUNC(SYSDATE) - 14);
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_CANTHO_KT_02_KH06', 'KH_06', 'TTT_CANTHO_KT_02', 'CTDT_CANTHO_KT_02_06_KH', TRUNC(SYSDATE) - 14);
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_CANTHO_KT_02_BOAT', 'TTT_CANTHO_KT_02', 'NV_HDV07', 'Thuyền chợ nổi đổi bến đón khách do triều cường.',
        'Thông báo sớm, điều xe trung chuyển và giữ nguyên lịch tham quan.', 'THAP', 'PHUONG_TIEN', SYSTIMESTAMP - INTERVAL '13' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_CANTHO_KT_02_TRANSFER', 'TTT_CANTHO_KT_02', 'NV_HDV07', 'Xe trung chuyển ra bến phụ', 420000, 'https://seed.local/hoa-don/cantho-transfer.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '13' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_CANTHO_KT_02_KH09', 'TTT_CANTHO_KT_02', 'KH_09', 5, 'Lịch trình hợp lý, hướng dẫn viên xử lý đổi bến rất chuyên nghiệp.', SYSTIMESTAMP - INTERVAL '10' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_CANTHO_KT_02_KH12', 'TTT_CANTHO_KT_02', 'KH_12', 5, 'Thực đơn chay được chuẩn bị chu đáo, chợ nổi rất thú vị.', SYSTIMESTAMP - INTERVAL '10' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_CANTHO_KT_02_KH13', 'TTT_CANTHO_KT_02', 'KH_13', 4, 'Tour nhẹ nhàng, khách sạn yên tĩnh, nên thêm thời gian ở miệt vườn.', SYSTIMESTAMP - INTERVAL '9' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_CANTHO_KT_02_KH14', 'TTT_CANTHO_KT_02', 'KH_14', 5, 'Gia đình có trẻ nhỏ vẫn đi rất thoải mái, ảnh hành trình đẹp.', SYSTIMESTAMP - INTERVAL '9' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_CANTHO_KT_02_KH15', 'TTT_CANTHO_KT_02', 'KH_15', 4, 'Dịch vụ tốt, di chuyển đúng giờ, phần ăn sáng có thể đa dạng hơn.', SYSTIMESTAMP - INTERVAL '8' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_CANTHO_KT_02_KH06', 'TTT_CANTHO_KT_02', 'KH_06', 5, 'Hướng dẫn viên nhiệt tình và hỗ trợ xe đưa đón rất rõ ràng.', SYSTIMESTAMP - INTERVAL '8' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_HAGIANG_HUY_02_OK', 'TTT_HAGIANG_HUY_02', 'KH_10', SYSTIMESTAMP - INTERVAL '9' DAY, 12720000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '7' DAY, 'Hai khách đã thanh toán, tour bị hủy do sạt lở đường đèo.', 'HDX_TREE:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_HAGIANG_HUY_02_01', 'DDT_HAGIANG_HUY_02_OK', 'Mai Hoàng Long', '079299000506', '0922000506', DATE '1991-04-04', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HAGIANG_HUY_02_KH', 'DDT_HAGIANG_HUY_02_OK', 'KH_10', NULL, 'NGUOI_DAT', 6300000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HAGIANG_HUY_02_NDH1', 'DDT_HAGIANG_HUY_02_OK', NULL, 'NDH_HAGIANG_HUY_02_01', 'NGUOI_DONG_HANH', 6300000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_HAGIANG_HUY_02_INS', 'DDT_HAGIANG_HUY_02_OK', 'DVT_INSURANCE', 1, 120000, 120000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HAGIANG_HUY_02_PAY', 'DDT_HAGIANG_HUY_02_OK', 'THANH_TOAN', 'CHUYEN_KHOAN', 12720000, 'BANK-HAGIANG-02', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '8' DAY);
UPDATE TOURTHUCTE SET TrangThai = 'HUY' WHERE MaTourThucTe = 'TTT_HAGIANG_HUY_02';
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HAGIANG_HUY_02_REFUND', 'DDT_HAGIANG_HUY_02_OK', 'HOAN_TIEN', 'HE_THONG', 12720000, 'BANK-HAGIANG-RF02', 'CHO_THANH_TOAN', NULL);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_HUE_QT_02_OK', 'TTT_HUE_QT_02', 'KH_11', SYSTIMESTAMP - INTERVAL '65' DAY, 9450000, 'CHO_XAC_NHAN',
        SYSTIMESTAMP - INTERVAL '63' DAY, 'Hai khách hoàn thành tour Huế và đã quyết toán.', 'HDX_LOCAL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_HUE_QT_02_01', 'DDT_HUE_QT_02_OK', 'Cao Minh Anh', '079299000507', '0922000507', DATE '1982-07-17', 'NỮ', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HUE_QT_02_KH', 'DDT_HUE_QT_02_OK', 'KH_11', NULL, 'NGUOI_DAT', 4400000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_HUE_QT_02_NDH1', 'DDT_HUE_QT_02_OK', NULL, 'NDH_HUE_QT_02_01', 'NGUOI_DONG_HANH', 4400000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_HUE_QT_02_SINGLE', 'DDT_HUE_QT_02_OK', 'DVT_SINGLE', 1, 650000, 650000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_HUE_QT_02_PAY', 'DDT_HUE_QT_02_OK', 'THANH_TOAN', 'THE_QUOC_TE', 9450000, 'BANK-HUE-02', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '64' DAY);
UPDATE TOURTHUCTE SET TrangThai = 'KET_THUC' WHERE MaTourThucTe = 'TTT_HUE_QT_02';
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LST_HUE_QT_02_KH11', 'KH_11', 'TTT_HUE_QT_02', 'CTDT_HUE_QT_02_KH', TRUNC(SYSDATE) - 45);
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, MucDo, LoaiSuCo, ThoiGianBaoCao)
VALUES ('SC_HUE_QT_02_FOOD', 'TTT_HUE_QT_02', 'NV_HDV09', 'Một khách dị ứng nhẹ với món ăn có tôm.',
        'Đổi suất ăn riêng và ghi chú lại với nhà hàng các bữa sau.', 'THAP', 'AN_UONG', SYSTIMESTAMP - INTERVAL '44' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_HUE_QT_02_HOTEL', 'TTT_HUE_QT_02', 'NV_HDV09', 'Khách sạn Huế 2 đêm', 3900000, 'https://seed.local/hoa-don/hue02-hotel.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '43' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_HUE_QT_02_MEAL', 'TTT_HUE_QT_02', 'NV_HDV09', 'Suất ăn thay thế cho khách dị ứng', 260000, 'https://seed.local/hoa-don/hue02-meal.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '43' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_HUE_QT_02_TICKET', 'TTT_HUE_QT_02', 'NV_HDV09', 'Vé tham quan Đại Nội', 700000, 'https://seed.local/hoa-don/hue02-ticket.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '42' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia)
VALUES ('DG_HUE_QT_02_KH11', 'TTT_HUE_QT_02', 'KH_11', 5, 'Tour Huế chỉn chu, xử lý dị ứng món ăn rất nhanh và chu đáo.', SYSTIMESTAMP - INTERVAL '40' DAY);
INSERT INTO QUYETTOAN (MaQuyetToan, MaTourThucTe, TongDoanhThu, TongChiPhi, GiaCamKet, LoiNhuan, MaNhanVien, NgayQuyetToan, TrangThai, GhiChu)
VALUES ('QT_HUE_02_DONE', 'TTT_HUE_QT_02', 0, 0, 8500000, 0, 'NV_KT01', SYSTIMESTAMP - INTERVAL '39' DAY, 'DA_QUYET_TOAN',
        'Quyết toán tour Huế bổ sung, doanh thu và chi phí được trigger tính lại.');

INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_NB_CKH_02_PC', 'TK_MGR01', 'THEM', 'PHANCONGTOUR_DIEU_HANH', 'PC_NB_CKH_02_HDV07', SYSTIMESTAMP - INTERVAL '2' DAY);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_BMT_DDR_02_CP', 'TK_HDV10', 'THEM', 'CHIPHITHUCTE_HDV', 'CP_BMT_DDR_02_RAINCOAT', SYSTIMESTAMP - INTERVAL '75' MINUTE);
INSERT INTO NHATKYHETHONG (MaNhatKyHeThong, MaTaiKhoan, HanhDong, DoiTuong, MaDoiTuong, ThoiGian)
VALUES ('NKHT_HUE_QT_02_DONE', 'TK_KT01', 'THEM', 'QUYETTOAN_KETOAN', 'QT_HUE_02_DONE', SYSTIMESTAMP - INTERVAL '39' DAY);

-- ------------------------------------------------------------
-- 20 TOUR MO BAN BO SUNG - DON DAT, HANH KHACH, DICH VU, THANH TOAN LIEN KET
-- Luu y: danh gia khach hang chi hop le voi tour da ket thuc/quyet toan theo trigger nghiep vu.
-- ------------------------------------------------------------
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_SAPA_OPEN_03', 'TM_SAPA', TRUNC(SYSDATE) + 270, 4950000, 30, 10, 30, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_DANANG_OPEN_03', 'TM_DANANG', TRUNC(SYSDATE) + 276, 6750000, 32, 12, 32, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_DALAT_OPEN_03', 'TM_DALAT', TRUNC(SYSDATE) + 282, 4350000, 24, 8, 24, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_NINHBINH_OPEN_03', 'TM_NINHBINH', TRUNC(SYSDATE) + 288, 3200000, 34, 12, 34, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_PHUQUOC_OPEN_03', 'TM_PHUQUOC', TRUNC(SYSDATE) + 294, 8150000, 26, 10, 26, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HUE_OPEN_03', 'TM_HUE', TRUNC(SYSDATE) + 300, 4550000, 28, 10, 28, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HAGIANG_OPEN_03', 'TM_HAGIANG', TRUNC(SYSDATE) + 306, 6500000, 22, 8, 22, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HOIAN_OPEN_03', 'TM_HOIAN', TRUNC(SYSDATE) + 312, 4750000, 26, 8, 26, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HALONG_OPEN_03', 'TM_HALONG', TRUNC(SYSDATE) + 318, 6150000, 30, 10, 30, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_CANTHO_OPEN_03', 'TM_CANTHO', TRUNC(SYSDATE) + 324, 3950000, 32, 12, 32, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_CONDAO_OPEN_03', 'TM_CONDAO', TRUNC(SYSDATE) + 330, 8850000, 20, 8, 20, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_MOCCHAU_OPEN_03', 'TM_MOCCHAU', TRUNC(SYSDATE) + 336, 2950000, 26, 10, 26, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_QUYNHON_OPEN_03', 'TM_QUYNHON', TRUNC(SYSDATE) + 342, 5750000, 26, 8, 26, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_BUONMATHUOT_OPEN_03', 'TM_BUONMATHUOT', TRUNC(SYSDATE) + 348, 4300000, 24, 8, 24, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_PULUONG_OPEN_03', 'TM_PULUONG', TRUNC(SYSDATE) + 354, 3450000, 22, 8, 22, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_MUINE_OPEN_03', 'TM_MUINE', TRUNC(SYSDATE) + 360, 5100000, 30, 10, 30, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_SAPA_OPEN_04', 'TM_SAPA', TRUNC(SYSDATE) + 366, 5050000, 28, 10, 28, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_DANANG_OPEN_04', 'TM_DANANG', TRUNC(SYSDATE) + 372, 6900000, 34, 12, 34, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_PHUQUOC_OPEN_04', 'TM_PHUQUOC', TRUNC(SYSDATE) + 378, 8350000, 26, 10, 26, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HUE_OPEN_04', 'TM_HUE', TRUNC(SYSDATE) + 384, 4650000, 28, 10, 28, 'MO_BAN');

INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_SAPA_OPEN_03', 'DVT_SINGLE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_DANANG_OPEN_03', 'DVT_DINNER');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_DALAT_OPEN_03', 'DVT_AIRPORT');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_NINHBINH_OPEN_03', 'DVT_PHOTO');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_PHUQUOC_OPEN_03', 'DVT_INSURANCE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HUE_OPEN_03', 'DVT_SINGLE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HAGIANG_OPEN_03', 'DVT_INSURANCE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HOIAN_OPEN_03', 'DVT_DINNER');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HALONG_OPEN_03', 'DVT_PHOTO');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_CANTHO_OPEN_03', 'DVT_DINNER');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_CONDAO_OPEN_03', 'DVT_INSURANCE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_MOCCHAU_OPEN_03', 'DVT_PHOTO');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_QUYNHON_OPEN_03', 'DVT_AIRPORT');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_BUONMATHUOT_OPEN_03', 'DVT_INSURANCE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_PULUONG_OPEN_03', 'DVT_PHOTO');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_MUINE_OPEN_03', 'DVT_AIRPORT');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_SAPA_OPEN_04', 'DVT_SINGLE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_DANANG_OPEN_04', 'DVT_DINNER');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_PHUQUOC_OPEN_04', 'DVT_INSURANCE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HUE_OPEN_04', 'DVT_SINGLE');

INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_SAPA_OPEN_03', 'HDX_EBILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_DANANG_OPEN_03', 'HDX_LOCAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_DALAT_OPEN_03', 'HDX_BOTTLE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_NINHBINH_OPEN_03', 'HDX_TREE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_PHUQUOC_OPEN_03', 'HDX_CLEANUP');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HUE_OPEN_03', 'HDX_LOCAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HAGIANG_OPEN_03', 'HDX_TREE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HOIAN_OPEN_03', 'HDX_LOCAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HALONG_OPEN_03', 'HDX_EBILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_CANTHO_OPEN_03', 'HDX_EBILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_CONDAO_OPEN_03', 'HDX_CLEANUP');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_MOCCHAU_OPEN_03', 'HDX_TREE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_QUYNHON_OPEN_03', 'HDX_BOTTLE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_BUONMATHUOT_OPEN_03', 'HDX_LOCAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_PULUONG_OPEN_03', 'HDX_TREE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_MUINE_OPEN_03', 'HDX_BOTTLE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_SAPA_OPEN_04', 'HDX_EBILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_DANANG_OPEN_04', 'HDX_LOCAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_PHUQUOC_OPEN_04', 'HDX_CLEANUP');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HUE_OPEN_04', 'HDX_LOCAL');

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_SAPA_OPEN_03_GD1', 'TTT_SAPA_OPEN_03', 'KH_01', SYSTIMESTAMP - INTERVAL '5' DAY, 25350000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Gia đình 5 khách, yêu cầu 2 phòng gần nhau và suất ăn không hải sản cho người đặt.', 'HDX_EBILL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_SAPA_OPEN_03_GD1_01', 'DDT_SAPA_OPEN_03_GD1', 'Nguyễn Minh Đức', '001086030101', '0903000101', DATE '1986-03-12', 'NAM', 'Chồng người đặt tour');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_SAPA_OPEN_03_GD1_02', 'DDT_SAPA_OPEN_03_GD1', 'Nguyễn Bảo An', '001112030102', '0903000102', DATE '2012-08-24', 'Nữ', 'Trẻ em 12 tuổi');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_SAPA_OPEN_03_GD1_03', 'DDT_SAPA_OPEN_03_GD1', 'Nguyễn Gia Huy', '001116030103', '0903000103', DATE '2016-11-05', 'NAM', 'Trẻ em 8 tuổi');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
VALUES ('NDH_SAPA_OPEN_03_GD1_04', 'DDT_SAPA_OPEN_03_GD1', 'Trần Thị Kim Liên', '001060030104', '0903000104', DATE '1960-02-18', 'Nữ', 'Người cao tuổi, hạn chế leo dốc');
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OPEN_03_GD1_KH', 'DDT_SAPA_OPEN_03_GD1', 'KH_01', NULL, 'NGUOI_DAT', 4950000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OPEN_03_GD1_NDH1', 'DDT_SAPA_OPEN_03_GD1', NULL, 'NDH_SAPA_OPEN_03_GD1_01', 'NGUOI_DONG_HANH', 4950000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OPEN_03_GD1_NDH2', 'DDT_SAPA_OPEN_03_GD1', NULL, 'NDH_SAPA_OPEN_03_GD1_02', 'NGUOI_DONG_HANH', 4950000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OPEN_03_GD1_NDH3', 'DDT_SAPA_OPEN_03_GD1', NULL, 'NDH_SAPA_OPEN_03_GD1_03', 'NGUOI_DONG_HANH', 4950000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
VALUES ('CTDT_SAPA_OPEN_03_GD1_NDH4', 'DDT_SAPA_OPEN_03_GD1', NULL, 'NDH_SAPA_OPEN_03_GD1_04', 'NGUOI_DONG_HANH', 4950000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV_SAPA_OPEN_03_GD1_SINGLE', 'DDT_SAPA_OPEN_03_GD1', 'DVT_SINGLE', 1, 600000, 600000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
VALUES ('GD_SAPA_OPEN_03_GD1_PAY', 'DDT_SAPA_OPEN_03_GD1', 'THANH_TOAN', 'CHUYEN_KHOAN', 25350000, 'BANK-OPEN-0301', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '4' DAY);

-- Cac don con lai moi don co nguoi dat tour va thanh toan rieng, phu hop gia tour/dich vu.
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
VALUES ('DDT_DANANG_OPEN_03_FAMILY', 'TTT_DANANG_OPEN_03', 'KH_06', SYSTIMESTAMP - INTERVAL '3' DAY, 27300000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Gia đình bốn khách, cần đưa đón sân bay Đà Nẵng và bàn ăn riêng tối ở Hội An.', 'HDX_LOCAL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_DANANG_OPEN_03_01', 'DDT_DANANG_OPEN_03_FAMILY', 'Bùi Thanh Phong', '048087030111', '0903000111', DATE '1987-01-19', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_DANANG_OPEN_03_02', 'DDT_DANANG_OPEN_03_FAMILY', 'Bùi An Nhiên', '048014030112', '0903000112', DATE '2014-05-07', 'Nữ', 'Trẻ em');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_DANANG_OPEN_03_03', 'DDT_DANANG_OPEN_03_FAMILY', 'Bùi Gia Khang', '048017030113', '0903000113', DATE '2017-09-22', 'NAM', 'Trẻ em');
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_OPEN_03_KH', 'DDT_DANANG_OPEN_03_FAMILY', 'KH_06', NULL, 'NGUOI_DAT', 6750000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_OPEN_03_NDH1', 'DDT_DANANG_OPEN_03_FAMILY', NULL, 'NDH_DANANG_OPEN_03_01', 'NGUOI_DONG_HANH', 6750000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_OPEN_03_NDH2', 'DDT_DANANG_OPEN_03_FAMILY', NULL, 'NDH_DANANG_OPEN_03_02', 'NGUOI_DONG_HANH', 6750000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_OPEN_03_NDH3', 'DDT_DANANG_OPEN_03_FAMILY', NULL, 'NDH_DANANG_OPEN_03_03', 'NGUOI_DONG_HANH', 6750000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_DANANG_OPEN_03_DINNER', 'DDT_DANANG_OPEN_03_FAMILY', 'DVT_DINNER', 1, 300000, 300000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_DANANG_OPEN_03_PAY', 'DDT_DANANG_OPEN_03_FAMILY', 'THANH_TOAN', 'CHUYEN_KHOAN', 27300000, 'BANK-OPEN-0302', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '2' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_DALAT_OPEN_03_COUPLE', 'TTT_DALAT_OPEN_03', 'KH_07', SYSTIMESTAMP - INTERVAL '2' DAY, 9100000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Hai khách đi nghỉ dưỡng, đặt đưa đón sân bay Liên Khương.', 'HDX_BOTTLE:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_DALAT_OPEN_03_01', 'DDT_DALAT_OPEN_03_COUPLE', 'Tạ Minh Quân', '026091030114', '0903000114', DATE '1991-03-03', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DALAT_OPEN_03_KH', 'DDT_DALAT_OPEN_03_COUPLE', 'KH_07', NULL, 'NGUOI_DAT', 4350000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DALAT_OPEN_03_NDH1', 'DDT_DALAT_OPEN_03_COUPLE', NULL, 'NDH_DALAT_OPEN_03_01', 'NGUOI_DONG_HANH', 4350000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_DALAT_OPEN_03_AIRPORT', 'DDT_DALAT_OPEN_03_COUPLE', 'DVT_AIRPORT', 1, 400000, 400000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_DALAT_OPEN_03_PAY', 'DDT_DALAT_OPEN_03_COUPLE', 'THANH_TOAN', 'VI_DIEN_TU', 9100000, 'BANK-OPEN-0303', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '2' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_NINHBINH_OPEN_03_TEAM', 'TTT_NINHBINH_OPEN_03', 'KH_08', SYSTIMESTAMP - INTERVAL '2' DAY, 16900000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Nhóm năm khách đi cuối tuần, đặt gói ảnh hành trình.', 'HDX_TREE:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_NINHBINH_OPEN_03_01', 'DDT_NINHBINH_OPEN_03_TEAM', 'Đinh Hải Long', '037089030115', '0903000115', DATE '1989-04-12', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_NINHBINH_OPEN_03_02', 'DDT_NINHBINH_OPEN_03_TEAM', 'Đinh Ngọc Hân', '037092030116', '0903000116', DATE '1992-02-23', 'Nữ', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_NINHBINH_OPEN_03_03', 'DDT_NINHBINH_OPEN_03_TEAM', 'Trịnh Gia Phúc', '037090030117', '0903000117', DATE '1990-10-08', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_NINHBINH_OPEN_03_04', 'DDT_NINHBINH_OPEN_03_TEAM', 'Trịnh Hoài Thương', '037093030118', '0903000118', DATE '1993-07-16', 'Nữ', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_NINHBINH_OPEN_03_KH', 'DDT_NINHBINH_OPEN_03_TEAM', 'KH_08', NULL, 'NGUOI_DAT', 3200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_NINHBINH_OPEN_03_NDH1', 'DDT_NINHBINH_OPEN_03_TEAM', NULL, 'NDH_NINHBINH_OPEN_03_01', 'NGUOI_DONG_HANH', 3200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_NINHBINH_OPEN_03_NDH2', 'DDT_NINHBINH_OPEN_03_TEAM', NULL, 'NDH_NINHBINH_OPEN_03_02', 'NGUOI_DONG_HANH', 3200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_NINHBINH_OPEN_03_NDH3', 'DDT_NINHBINH_OPEN_03_TEAM', NULL, 'NDH_NINHBINH_OPEN_03_03', 'NGUOI_DONG_HANH', 3200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_NINHBINH_OPEN_03_NDH4', 'DDT_NINHBINH_OPEN_03_TEAM', NULL, 'NDH_NINHBINH_OPEN_03_04', 'NGUOI_DONG_HANH', 3200000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_NINHBINH_OPEN_03_PHOTO', 'DDT_NINHBINH_OPEN_03_TEAM', 'DVT_PHOTO', 1, 900000, 900000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_NINHBINH_OPEN_03_PAY', 'DDT_NINHBINH_OPEN_03_TEAM', 'THANH_TOAN', 'CHUYEN_KHOAN', 16900000, 'BANK-OPEN-0304', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '2' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_PHUQUOC_OPEN_03_FAMILY', 'TTT_PHUQUOC_OPEN_03', 'KH_09', SYSTIMESTAMP - INTERVAL '3' DAY, 32600000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Bốn khách nghỉ biển, cần xuất hóa đơn công ty sau khi thanh toán.', 'HDX_CLEANUP:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_PHUQUOC_OPEN_03_01', 'DDT_PHUQUOC_OPEN_03_FAMILY', 'Võ Nhật Minh', '091087030119', '0903000119', DATE '1987-12-09', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_PHUQUOC_OPEN_03_02', 'DDT_PHUQUOC_OPEN_03_FAMILY', 'Võ Mai Chi', '091013030120', '0903000120', DATE '2013-01-29', 'Nữ', 'Trẻ em');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_PHUQUOC_OPEN_03_03', 'DDT_PHUQUOC_OPEN_03_FAMILY', 'Võ Khánh An', '091016030121', '0903000121', DATE '2016-06-11', 'NAM', 'Trẻ em');
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PHUQUOC_OPEN_03_KH', 'DDT_PHUQUOC_OPEN_03_FAMILY', 'KH_09', NULL, 'NGUOI_DAT', 8150000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PHUQUOC_OPEN_03_NDH1', 'DDT_PHUQUOC_OPEN_03_FAMILY', NULL, 'NDH_PHUQUOC_OPEN_03_01', 'NGUOI_DONG_HANH', 8150000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PHUQUOC_OPEN_03_NDH2', 'DDT_PHUQUOC_OPEN_03_FAMILY', NULL, 'NDH_PHUQUOC_OPEN_03_02', 'NGUOI_DONG_HANH', 8150000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PHUQUOC_OPEN_03_NDH3', 'DDT_PHUQUOC_OPEN_03_FAMILY', NULL, 'NDH_PHUQUOC_OPEN_03_03', 'NGUOI_DONG_HANH', 8150000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_PHUQUOC_OPEN_03_PAY', 'DDT_PHUQUOC_OPEN_03_FAMILY', 'THANH_TOAN', 'THE_NOI_DIA', 32600000, 'BANK-OPEN-0305', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '2' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_HUE_OPEN_03_COUPLE', 'TTT_HUE_OPEN_03', 'KH_10', SYSTIMESTAMP - INTERVAL '2' DAY, 9750000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Hai khách tham quan di sản, một khách dị ứng hải sản có vỏ.', 'HDX_LOCAL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_HUE_OPEN_03_01', 'DDT_HUE_OPEN_03_COUPLE', 'Mai Thanh Bình', '075086030122', '0903000122', DATE '1986-08-18', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HUE_OPEN_03_KH', 'DDT_HUE_OPEN_03_COUPLE', 'KH_10', NULL, 'NGUOI_DAT', 4550000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HUE_OPEN_03_NDH1', 'DDT_HUE_OPEN_03_COUPLE', NULL, 'NDH_HUE_OPEN_03_01', 'NGUOI_DONG_HANH', 4550000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_HUE_OPEN_03_SINGLE', 'DDT_HUE_OPEN_03_COUPLE', 'DVT_SINGLE', 1, 650000, 650000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_HUE_OPEN_03_PAY', 'DDT_HUE_OPEN_03_COUPLE', 'THANH_TOAN', 'CHUYEN_KHOAN', 9750000, 'BANK-OPEN-0306', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_HAGIANG_OPEN_03_TEAM', 'TTT_HAGIANG_OPEN_03', 'KH_11', SYSTIMESTAMP - INTERVAL '4' DAY, 19620000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Ba khách yêu thiên nhiên, cần lịch trình ít leo dốc và bảo hiểm bổ sung.', 'HDX_TREE:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_HAGIANG_OPEN_03_01', 'DDT_HAGIANG_OPEN_03_TEAM', 'Cao Minh Khoa', '024084030123', '0903000123', DATE '1984-02-10', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_HAGIANG_OPEN_03_02', 'DDT_HAGIANG_OPEN_03_TEAM', 'Cao Ngọc Linh', '024090030124', '0903000124', DATE '1990-05-21', 'Nữ', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HAGIANG_OPEN_03_KH', 'DDT_HAGIANG_OPEN_03_TEAM', 'KH_11', NULL, 'NGUOI_DAT', 6500000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HAGIANG_OPEN_03_NDH1', 'DDT_HAGIANG_OPEN_03_TEAM', NULL, 'NDH_HAGIANG_OPEN_03_01', 'NGUOI_DONG_HANH', 6500000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HAGIANG_OPEN_03_NDH2', 'DDT_HAGIANG_OPEN_03_TEAM', NULL, 'NDH_HAGIANG_OPEN_03_02', 'NGUOI_DONG_HANH', 6500000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_HAGIANG_OPEN_03_INS', 'DDT_HAGIANG_OPEN_03_TEAM', 'DVT_INSURANCE', 1, 120000, 120000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_HAGIANG_OPEN_03_PAY', 'DDT_HAGIANG_OPEN_03_TEAM', 'THANH_TOAN', 'CHUYEN_KHOAN', 19620000, 'BANK-OPEN-0307', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '3' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_HOIAN_OPEN_03_GROUP', 'TTT_HOIAN_OPEN_03', 'KH_12', SYSTIMESTAMP - INTERVAL '3' DAY, 19300000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Bốn khách ăn chay, đặt thêm bữa tối trải nghiệm món địa phương.', 'HDX_LOCAL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_HOIAN_OPEN_03_01', 'DDT_HOIAN_OPEN_03_GROUP', 'Ngô Thanh Nhã', '048092030125', '0903000125', DATE '1992-04-04', 'Nữ', 'Ăn chay');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_HOIAN_OPEN_03_02', 'DDT_HOIAN_OPEN_03_GROUP', 'Ngô Minh Triết', '048089030126', '0903000126', DATE '1989-01-15', 'NAM', 'Ăn chay');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_HOIAN_OPEN_03_03', 'DDT_HOIAN_OPEN_03_GROUP', 'Lý Hoài An', '048094030127', '0903000127', DATE '1994-09-27', 'Nữ', 'Ăn chay');
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HOIAN_OPEN_03_KH', 'DDT_HOIAN_OPEN_03_GROUP', 'KH_12', NULL, 'NGUOI_DAT', 4750000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HOIAN_OPEN_03_NDH1', 'DDT_HOIAN_OPEN_03_GROUP', NULL, 'NDH_HOIAN_OPEN_03_01', 'NGUOI_DONG_HANH', 4750000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HOIAN_OPEN_03_NDH2', 'DDT_HOIAN_OPEN_03_GROUP', NULL, 'NDH_HOIAN_OPEN_03_02', 'NGUOI_DONG_HANH', 4750000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HOIAN_OPEN_03_NDH3', 'DDT_HOIAN_OPEN_03_GROUP', NULL, 'NDH_HOIAN_OPEN_03_03', 'NGUOI_DONG_HANH', 4750000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_HOIAN_OPEN_03_DINNER', 'DDT_HOIAN_OPEN_03_GROUP', 'DVT_DINNER', 1, 300000, 300000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_HOIAN_OPEN_03_PAY', 'DDT_HOIAN_OPEN_03_GROUP', 'THANH_TOAN', 'VI_DIEN_TU', 19300000, 'BANK-OPEN-0308', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '2' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_HALONG_OPEN_03_COUPLE', 'TTT_HALONG_OPEN_03', 'KH_13', SYSTIMESTAMP - INTERVAL '2' DAY, 13200000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Hai khách cần phòng yên tĩnh và gói ảnh trên du thuyền.', 'HDX_EBILL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_HALONG_OPEN_03_01', 'DDT_HALONG_OPEN_03_COUPLE', 'Dương Hoài Nam', '022087030128', '0903000128', DATE '1987-06-06', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HALONG_OPEN_03_KH', 'DDT_HALONG_OPEN_03_COUPLE', 'KH_13', NULL, 'NGUOI_DAT', 6150000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HALONG_OPEN_03_NDH1', 'DDT_HALONG_OPEN_03_COUPLE', NULL, 'NDH_HALONG_OPEN_03_01', 'NGUOI_DONG_HANH', 6150000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_HALONG_OPEN_03_PHOTO', 'DDT_HALONG_OPEN_03_COUPLE', 'DVT_PHOTO', 1, 900000, 900000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_HALONG_OPEN_03_PAY', 'DDT_HALONG_OPEN_03_COUPLE', 'THANH_TOAN', 'THE_QUOC_TE', 13200000, 'BANK-OPEN-0309', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_CANTHO_OPEN_03_FAMILY', 'TTT_CANTHO_OPEN_03', 'KH_14', SYSTIMESTAMP - INTERVAL '2' DAY, 12150000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Gia đình ba khách có trẻ nhỏ, cần món không trứng gà.', 'HDX_EBILL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_CANTHO_OPEN_03_01', 'DDT_CANTHO_OPEN_03_FAMILY', 'Lâm Minh Phúc', '092088030129', '0903000129', DATE '1988-05-03', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_CANTHO_OPEN_03_02', 'DDT_CANTHO_OPEN_03_FAMILY', 'Lâm Gia Hân', '092019030130', '0903000130', DATE '2019-03-15', 'Nữ', 'Trẻ em');
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_CANTHO_OPEN_03_KH', 'DDT_CANTHO_OPEN_03_FAMILY', 'KH_14', NULL, 'NGUOI_DAT', 3950000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_CANTHO_OPEN_03_NDH1', 'DDT_CANTHO_OPEN_03_FAMILY', NULL, 'NDH_CANTHO_OPEN_03_01', 'NGUOI_DONG_HANH', 3950000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_CANTHO_OPEN_03_NDH2', 'DDT_CANTHO_OPEN_03_FAMILY', NULL, 'NDH_CANTHO_OPEN_03_02', 'NGUOI_DONG_HANH', 3950000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_CANTHO_OPEN_03_DINNER', 'DDT_CANTHO_OPEN_03_FAMILY', 'DVT_DINNER', 1, 300000, 300000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_CANTHO_OPEN_03_PAY', 'DDT_CANTHO_OPEN_03_FAMILY', 'THANH_TOAN', 'CHUYEN_KHOAN', 12150000, 'BANK-OPEN-0310', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_CONDAO_OPEN_03_COUPLE', 'TTT_CONDAO_OPEN_03', 'KH_15', SYSTIMESTAMP - INTERVAL '2' DAY, 17820000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Hai khách nghỉ dưỡng biển đảo, đăng ký bảo hiểm và hoạt động làm sạch bãi biển.', 'HDX_CLEANUP:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_CONDAO_OPEN_03_01', 'DDT_CONDAO_OPEN_03_COUPLE', 'Hồ Minh Quân', '095090030131', '0903000131', DATE '1990-11-20', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_CONDAO_OPEN_03_KH', 'DDT_CONDAO_OPEN_03_COUPLE', 'KH_15', NULL, 'NGUOI_DAT', 8850000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_CONDAO_OPEN_03_NDH1', 'DDT_CONDAO_OPEN_03_COUPLE', NULL, 'NDH_CONDAO_OPEN_03_01', 'NGUOI_DONG_HANH', 8850000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_CONDAO_OPEN_03_INS', 'DDT_CONDAO_OPEN_03_COUPLE', 'DVT_INSURANCE', 1, 120000, 120000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_CONDAO_OPEN_03_PAY', 'DDT_CONDAO_OPEN_03_COUPLE', 'THANH_TOAN', 'VI_DIEN_TU', 17820000, 'BANK-OPEN-0311', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_MOCCHAU_OPEN_03_COUPLE', 'TTT_MOCCHAU_OPEN_03', 'KH_01', SYSTIMESTAMP - INTERVAL '1' DAY, 6800000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Hai khách đi ngắm mùa hoa, đặt gói ảnh hành trình.', 'HDX_TREE:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_MOCCHAU_OPEN_03_01', 'DDT_MOCCHAU_OPEN_03_COUPLE', 'Trần Minh Hoàng', '014086030132', '0903000132', DATE '1986-09-09', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_MOCCHAU_OPEN_03_KH', 'DDT_MOCCHAU_OPEN_03_COUPLE', 'KH_01', NULL, 'NGUOI_DAT', 2950000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_MOCCHAU_OPEN_03_NDH1', 'DDT_MOCCHAU_OPEN_03_COUPLE', NULL, 'NDH_MOCCHAU_OPEN_03_01', 'NGUOI_DONG_HANH', 2950000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_MOCCHAU_OPEN_03_PHOTO', 'DDT_MOCCHAU_OPEN_03_COUPLE', 'DVT_PHOTO', 1, 900000, 900000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_MOCCHAU_OPEN_03_PAY', 'DDT_MOCCHAU_OPEN_03_COUPLE', 'THANH_TOAN', 'THE_NOI_DIA', 6800000, 'BANK-OPEN-0312', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_QUYNHON_OPEN_03_TEAM', 'TTT_QUYNHON_OPEN_03', 'KH_02', SYSTIMESTAMP - INTERVAL '1' DAY, 17650000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Ba khách đi biển, cần đưa đón sân bay Phù Cát.', 'HDX_BOTTLE:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_QUYNHON_OPEN_03_01', 'DDT_QUYNHON_OPEN_03_TEAM', 'Lê Hoàng Duy', '052091030133', '0903000133', DATE '1991-02-02', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_QUYNHON_OPEN_03_02', 'DDT_QUYNHON_OPEN_03_TEAM', 'Lê Ngọc Ánh', '052094030134', '0903000134', DATE '1994-08-08', 'Nữ', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_QUYNHON_OPEN_03_KH', 'DDT_QUYNHON_OPEN_03_TEAM', 'KH_02', NULL, 'NGUOI_DAT', 5750000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_QUYNHON_OPEN_03_NDH1', 'DDT_QUYNHON_OPEN_03_TEAM', NULL, 'NDH_QUYNHON_OPEN_03_01', 'NGUOI_DONG_HANH', 5750000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_QUYNHON_OPEN_03_NDH2', 'DDT_QUYNHON_OPEN_03_TEAM', NULL, 'NDH_QUYNHON_OPEN_03_02', 'NGUOI_DONG_HANH', 5750000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_QUYNHON_OPEN_03_AIRPORT', 'DDT_QUYNHON_OPEN_03_TEAM', 'DVT_AIRPORT', 1, 400000, 400000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_QUYNHON_OPEN_03_PAY', 'DDT_QUYNHON_OPEN_03_TEAM', 'THANH_TOAN', 'CHUYEN_KHOAN', 17650000, 'BANK-OPEN-0313', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_BMT_OPEN_03_COUPLE', 'TTT_BUONMATHUOT_OPEN_03', 'KH_03', SYSTIMESTAMP - INTERVAL '1' DAY, 8720000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Hai khách yêu cà phê, đăng ký bảo hiểm du lịch.', 'HDX_LOCAL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_BMT_OPEN_03_01', 'DDT_BMT_OPEN_03_COUPLE', 'Phan Anh Tuấn', '066090030135', '0903000135', DATE '1990-01-28', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_BMT_OPEN_03_KH', 'DDT_BMT_OPEN_03_COUPLE', 'KH_03', NULL, 'NGUOI_DAT', 4300000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_BMT_OPEN_03_NDH1', 'DDT_BMT_OPEN_03_COUPLE', NULL, 'NDH_BMT_OPEN_03_01', 'NGUOI_DONG_HANH', 4300000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_BMT_OPEN_03_INS', 'DDT_BMT_OPEN_03_COUPLE', 'DVT_INSURANCE', 1, 120000, 120000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_BMT_OPEN_03_PAY', 'DDT_BMT_OPEN_03_COUPLE', 'THANH_TOAN', 'VI_DIEN_TU', 8720000, 'BANK-OPEN-0314', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_PULUONG_OPEN_03_FAMILY', 'TTT_PULUONG_OPEN_03', 'KH_04', SYSTIMESTAMP - INTERVAL '1' DAY, 14700000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Bốn khách nghỉ dưỡng sinh thái, cần phòng tầng thấp cho người lớn tuổi.', 'HDX_TREE:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_PULUONG_OPEN_03_01', 'DDT_PULUONG_OPEN_03_FAMILY', 'Vũ Minh Sơn', '038083030136', '0903000136', DATE '1983-03-30', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_PULUONG_OPEN_03_02', 'DDT_PULUONG_OPEN_03_FAMILY', 'Vũ Thảo Vy', '038012030137', '0903000137', DATE '2012-12-12', 'Nữ', 'Trẻ em');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_PULUONG_OPEN_03_03', 'DDT_PULUONG_OPEN_03_FAMILY', 'Vũ Hải Đăng', '038015030138', '0903000138', DATE '2015-04-04', 'NAM', 'Trẻ em');
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PULUONG_OPEN_03_KH', 'DDT_PULUONG_OPEN_03_FAMILY', 'KH_04', NULL, 'NGUOI_DAT', 3450000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PULUONG_OPEN_03_NDH1', 'DDT_PULUONG_OPEN_03_FAMILY', NULL, 'NDH_PULUONG_OPEN_03_01', 'NGUOI_DONG_HANH', 3450000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PULUONG_OPEN_03_NDH2', 'DDT_PULUONG_OPEN_03_FAMILY', NULL, 'NDH_PULUONG_OPEN_03_02', 'NGUOI_DONG_HANH', 3450000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PULUONG_OPEN_03_NDH3', 'DDT_PULUONG_OPEN_03_FAMILY', NULL, 'NDH_PULUONG_OPEN_03_03', 'NGUOI_DONG_HANH', 3450000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_PULUONG_OPEN_03_PHOTO', 'DDT_PULUONG_OPEN_03_FAMILY', 'DVT_PHOTO', 1, 900000, 900000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_PULUONG_OPEN_03_PAY', 'DDT_PULUONG_OPEN_03_FAMILY', 'THANH_TOAN', 'CHUYEN_KHOAN', 14700000, 'BANK-OPEN-0315', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_MUINE_OPEN_03_TEAM', 'TTT_MUINE_OPEN_03', 'KH_05', SYSTIMESTAMP - INTERVAL '1' DAY, 15700000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Ba khách nghỉ dưỡng Mũi Né, cần xe đưa đón từ ga Phan Thiết.', 'HDX_BOTTLE:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_MUINE_OPEN_03_01', 'DDT_MUINE_OPEN_03_TEAM', 'Đặng Quang Huy', '060088030139', '0903000139', DATE '1988-08-13', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_MUINE_OPEN_03_02', 'DDT_MUINE_OPEN_03_TEAM', 'Đặng Ngọc Trâm', '060091030140', '0903000140', DATE '1991-06-25', 'Nữ', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_MUINE_OPEN_03_KH', 'DDT_MUINE_OPEN_03_TEAM', 'KH_05', NULL, 'NGUOI_DAT', 5100000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_MUINE_OPEN_03_NDH1', 'DDT_MUINE_OPEN_03_TEAM', NULL, 'NDH_MUINE_OPEN_03_01', 'NGUOI_DONG_HANH', 5100000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_MUINE_OPEN_03_NDH2', 'DDT_MUINE_OPEN_03_TEAM', NULL, 'NDH_MUINE_OPEN_03_02', 'NGUOI_DONG_HANH', 5100000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_MUINE_OPEN_03_AIRPORT', 'DDT_MUINE_OPEN_03_TEAM', 'DVT_AIRPORT', 1, 400000, 400000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_MUINE_OPEN_03_PAY', 'DDT_MUINE_OPEN_03_TEAM', 'THANH_TOAN', 'THE_QUOC_TE', 15700000, 'BANK-OPEN-0316', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_SAPA_OPEN_04_COUPLE', 'TTT_SAPA_OPEN_04', 'KH_06', SYSTIMESTAMP - INTERVAL '1' DAY, 10700000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Hai khách đặt phụ thu phòng đơn do lịch ngủ khác nhau.', 'HDX_EBILL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_SAPA_OPEN_04_01', 'DDT_SAPA_OPEN_04_COUPLE', 'Bùi Minh An', '001095030141', '0903000141', DATE '1995-10-10', 'NAM', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_SAPA_OPEN_04_KH', 'DDT_SAPA_OPEN_04_COUPLE', 'KH_06', NULL, 'NGUOI_DAT', 5050000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_SAPA_OPEN_04_NDH1', 'DDT_SAPA_OPEN_04_COUPLE', NULL, 'NDH_SAPA_OPEN_04_01', 'NGUOI_DONG_HANH', 5050000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_SAPA_OPEN_04_SINGLE', 'DDT_SAPA_OPEN_04_COUPLE', 'DVT_SINGLE', 1, 600000, 600000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_SAPA_OPEN_04_PAY', 'DDT_SAPA_OPEN_04_COUPLE', 'THANH_TOAN', 'CHUYEN_KHOAN', 10700000, 'BANK-OPEN-0317', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_DANANG_OPEN_04_TEAM', 'TTT_DANANG_OPEN_04', 'KH_07', SYSTIMESTAMP - INTERVAL '1' DAY, 21000000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Ba khách đi miền Trung, đặt thêm bữa tối phố cổ.', 'HDX_LOCAL:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_DANANG_OPEN_04_01', 'DDT_DANANG_OPEN_04_TEAM', 'Tạ Khánh Duy', '048092030142', '0903000142', DATE '1992-12-12', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_DANANG_OPEN_04_02', 'DDT_DANANG_OPEN_04_TEAM', 'Tạ Hồng Nhung', '048094030143', '0903000143', DATE '1994-03-18', 'Nữ', NULL);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_OPEN_04_KH', 'DDT_DANANG_OPEN_04_TEAM', 'KH_07', NULL, 'NGUOI_DAT', 6900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_OPEN_04_NDH1', 'DDT_DANANG_OPEN_04_TEAM', NULL, 'NDH_DANANG_OPEN_04_01', 'NGUOI_DONG_HANH', 6900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_OPEN_04_NDH2', 'DDT_DANANG_OPEN_04_TEAM', NULL, 'NDH_DANANG_OPEN_04_02', 'NGUOI_DONG_HANH', 6900000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_DANANG_OPEN_04_DINNER', 'DDT_DANANG_OPEN_04_TEAM', 'DVT_DINNER', 1, 300000, 300000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_DANANG_OPEN_04_PAY', 'DDT_DANANG_OPEN_04_TEAM', 'THANH_TOAN', 'VI_DIEN_TU', 21000000, 'BANK-OPEN-0318', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_PHUQUOC_OPEN_04_COUPLE', 'TTT_PHUQUOC_OPEN_04', 'KH_08', SYSTIMESTAMP - INTERVAL '1' DAY, 16820000, 'DA_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Hai khách có người cao tuổi, đăng ký bảo hiểm và phòng gần thang máy.', 'HDX_CLEANUP:1');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_PHUQUOC_OPEN_04_01', 'DDT_PHUQUOC_OPEN_04_COUPLE', 'Đoàn Thị Hạnh', '091060030144', '0903000144', DATE '1960-07-07', 'Nữ', 'Người cao tuổi');
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PHUQUOC_OPEN_04_KH', 'DDT_PHUQUOC_OPEN_04_COUPLE', 'KH_08', NULL, 'NGUOI_DAT', 8350000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PHUQUOC_OPEN_04_NDH1', 'DDT_PHUQUOC_OPEN_04_COUPLE', NULL, 'NDH_PHUQUOC_OPEN_04_01', 'NGUOI_DONG_HANH', 8350000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_PHUQUOC_OPEN_04_INS', 'DDT_PHUQUOC_OPEN_04_COUPLE', 'DVT_INSURANCE', 1, 120000, 120000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_PHUQUOC_OPEN_04_PAY', 'DDT_PHUQUOC_OPEN_04_COUPLE', 'THANH_TOAN', 'THE_NOI_DIA', 16820000, 'BANK-OPEN-0319', 'THANH_CONG', SYSTIMESTAMP - INTERVAL '1' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh) VALUES ('DDT_HUE_OPEN_04_SOLO', 'TTT_HUE_OPEN_04', 'KH_09', SYSTIMESTAMP - INTERVAL '1' DAY, 5300000, 'CHO_XAC_NHAN', SYSTIMESTAMP + INTERVAL '2' DAY, 'Khách lẻ cần xuất hóa đơn công ty, giữ chỗ chờ xác nhận chuyển khoản.', 'HDX_LOCAL:1');
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HUE_OPEN_04_KH', 'DDT_HUE_OPEN_04_SOLO', 'KH_09', NULL, 'NGUOI_DAT', 4650000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien) VALUES ('CTDV_HUE_OPEN_04_SINGLE', 'DDT_HUE_OPEN_04_SOLO', 'DVT_SINGLE', 1, 650000, 650000);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan) VALUES ('GD_HUE_OPEN_04_WAIT', 'DDT_HUE_OPEN_04_SOLO', 'THANH_TOAN', 'CHUYEN_KHOAN', 5300000, 'BANK-OPEN-0320', 'CHO_THANH_TOAN', NULL);

-- Dich vu va hanh dong xanh ca nhan hoa theo tinh chat tung tuyen mo ban.
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_SAPA_HERBAL', 'Tắm lá thuốc Dao đỏ tại Sa Pa', 'Khách', 320000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_DANANG_SHOW', 'Vé show Ký ức Hội An', 'Vé', 650000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_DALAT_FARM', 'Workshop hái rau và pha cà phê Đà Lạt', 'Khách', 380000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_NINHBINH_BIKE', 'Thuê xe đạp khám phá Tam Cốc', 'Xe/ngày', 120000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_PHUQUOC_SNORKEL', 'Lặn ngắm san hô bằng tàu riêng Phú Quốc', 'Khách', 950000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_HAGIANG_MOTOR', 'Xe máy có lái bản địa cung Hà Giang', 'Khách/ngày', 700000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_HOIAN_LANTERN', 'Lớp làm đèn lồng Hội An', 'Khách', 280000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_HALONG_KAYAK', 'Chèo kayak vịnh Hạ Long', 'Khách', 300000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_CANTHO_COOKING', 'Lớp nấu món miền Tây tại Cần Thơ', 'Khách', 360000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_CONDAO_TURTLE', 'Trải nghiệm bảo tồn rùa biển Côn Đảo', 'Khách', 520000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_MOCCHAU_TEA', 'Trải nghiệm hái chè Mộc Châu', 'Khách', 220000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_QUYNHON_CANOE', 'Cano Kỳ Co - Hòn Khô riêng', 'Khách', 680000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_BMT_COFFEE', 'Workshop rang xay cà phê Buôn Ma Thuột', 'Khách', 340000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_PULUONG_HOMESTAY', 'Nâng hạng homestay view ruộng bậc thang', 'Phòng/đêm', 480000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_MUINE_JEEP', 'Jeep riêng ngắm bình minh đồi cát Mũi Né', 'Xe', 750000);
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia) VALUES ('DVT_HUE_AODAI', 'Thuê áo dài chụp ảnh Đại Nội Huế', 'Bộ', 250000);

INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong) VALUES ('HDX_REFILL', 'Dùng trạm tiếp nước thay chai nhựa dùng một lần', 90);
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong) VALUES ('HDX_REUSABLE_BAG', 'Mang túi vải khi mua đặc sản địa phương', 70);
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong) VALUES ('HDX_LOCAL_MEAL', 'Chọn bữa ăn nguyên liệu địa phương theo mùa', 120);
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong) VALUES ('HDX_PUBLIC_TRANSFER', 'Ưu tiên xe ghép hoặc phương tiện công cộng trong chặng ngắn', 110);
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong) VALUES ('HDX_CORAL_SAFE', 'Không chạm san hô và dùng kem chống nắng thân thiện biển', 160);
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong) VALUES ('HDX_COMMUNITY_BUY', 'Mua sản phẩm thủ công trực tiếp từ cộng đồng bản địa', 130);

INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_SAPA_OPEN_03', 'DVT_SAPA_HERBAL');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_DANANG_OPEN_03', 'DVT_DANANG_SHOW');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_DALAT_OPEN_03', 'DVT_DALAT_FARM');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_NINHBINH_OPEN_03', 'DVT_NINHBINH_BIKE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_PHUQUOC_OPEN_03', 'DVT_PHUQUOC_SNORKEL');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HUE_OPEN_03', 'DVT_HUE_AODAI');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HAGIANG_OPEN_03', 'DVT_HAGIANG_MOTOR');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HOIAN_OPEN_03', 'DVT_HOIAN_LANTERN');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HALONG_OPEN_03', 'DVT_HALONG_KAYAK');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_CANTHO_OPEN_03', 'DVT_CANTHO_COOKING');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_CONDAO_OPEN_03', 'DVT_CONDAO_TURTLE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_MOCCHAU_OPEN_03', 'DVT_MOCCHAU_TEA');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_QUYNHON_OPEN_03', 'DVT_QUYNHON_CANOE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_BUONMATHUOT_OPEN_03', 'DVT_BMT_COFFEE');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_PULUONG_OPEN_03', 'DVT_PULUONG_HOMESTAY');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_MUINE_OPEN_03', 'DVT_MUINE_JEEP');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_SAPA_OPEN_04', 'DVT_SAPA_HERBAL');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_DANANG_OPEN_04', 'DVT_DANANG_SHOW');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_PHUQUOC_OPEN_04', 'DVT_PHUQUOC_SNORKEL');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HUE_OPEN_04', 'DVT_HUE_AODAI');

INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_SAPA_OPEN_03', 'HDX_REFILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_DANANG_OPEN_03', 'HDX_PUBLIC_TRANSFER');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_DALAT_OPEN_03', 'HDX_LOCAL_MEAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_NINHBINH_OPEN_03', 'HDX_PUBLIC_TRANSFER');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_PHUQUOC_OPEN_03', 'HDX_CORAL_SAFE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HUE_OPEN_03', 'HDX_REUSABLE_BAG');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HAGIANG_OPEN_03', 'HDX_COMMUNITY_BUY');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HOIAN_OPEN_03', 'HDX_LOCAL_MEAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HALONG_OPEN_03', 'HDX_REFILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_CANTHO_OPEN_03', 'HDX_LOCAL_MEAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_CONDAO_OPEN_03', 'HDX_CORAL_SAFE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_MOCCHAU_OPEN_03', 'HDX_COMMUNITY_BUY');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_QUYNHON_OPEN_03', 'HDX_CORAL_SAFE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_BUONMATHUOT_OPEN_03', 'HDX_LOCAL_MEAL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_PULUONG_OPEN_03', 'HDX_COMMUNITY_BUY');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_MUINE_OPEN_03', 'HDX_REFILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_SAPA_OPEN_04', 'HDX_REFILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_DANANG_OPEN_04', 'HDX_PUBLIC_TRANSFER');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_PHUQUOC_OPEN_04', 'HDX_CORAL_SAFE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HUE_OPEN_04', 'HDX_REUSABLE_BAG');

-- Voucher bo sung: tao master, vi khach hang, lich su ap dung va dong bo tong tien/giao dich.
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai) VALUES ('VC_OPEN_FAMILY1M', 'OPEN-FAMILY-1M', 'SO_TIEN', 1000000, 'Giảm 1.000.000 cho nhóm gia đình từ 4 khách trong giai đoạn mở bán', 120, 0, TRUNC(SYSDATE) - 7, TRUNC(SYSDATE) + 180, 'SAN_SANG');
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai) VALUES ('VC_OPEN_SUMMER8', 'OPEN-SUMMER-8', 'PHAN_TRAM', 8, 'Giảm 8% cho tour biển, đảo và miền Trung đặt trước 60 ngày', 150, 0, TRUNC(SYSDATE) - 7, TRUNC(SYSDATE) + 210, 'SAN_SANG');
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai) VALUES ('VC_OPEN_GREEN600', 'OPEN-GREEN-600', 'SO_TIEN', 600000, 'Giảm 600.000 cho khách cam kết tối thiểu một hành động xanh', 100, 0, TRUNC(SYSDATE) - 7, TRUNC(SYSDATE) + 180, 'SAN_SANG');
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai) VALUES ('VC_OPEN_COUPLE500', 'OPEN-COUPLE-500', 'SO_TIEN', 500000, 'Giảm 500.000 cho đơn hai khách', 90, 0, TRUNC(SYSDATE) - 7, TRUNC(SYSDATE) + 160, 'SAN_SANG');
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai) VALUES ('VC_OPEN_LOCAL5', 'OPEN-LOCAL-5', 'PHAN_TRAM', 5, 'Giảm 5% cho tour có trải nghiệm cộng đồng địa phương', 110, 0, TRUNC(SYSDATE) - 7, TRUNC(SYSDATE) + 180, 'SAN_SANG');
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai) VALUES ('VC_OPEN_PREMIUM2M', 'OPEN-PREMIUM-2M', 'SO_TIEN', 2000000, 'Giảm 2.000.000 cho đơn trên 25.000.000 của khách hạng cao', 40, 0, TRUNC(SYSDATE) - 7, TRUNC(SYSDATE) + 180, 'SAN_SANG');

INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_01', 'VC_OPEN_FAMILY1M', TRUNC(SYSDATE) + 120, SYSTIMESTAMP - INTERVAL '6' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_06', 'VC_OPEN_SUMMER8', TRUNC(SYSDATE) + 120, SYSTIMESTAMP - INTERVAL '4' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_07', 'VC_OPEN_COUPLE500', TRUNC(SYSDATE) + 120, SYSTIMESTAMP - INTERVAL '3' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_08', 'VC_OPEN_GREEN600', TRUNC(SYSDATE) + 120, SYSTIMESTAMP - INTERVAL '3' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_09', 'VC_OPEN_PREMIUM2M', TRUNC(SYSDATE) + 120, SYSTIMESTAMP - INTERVAL '4' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_10', 'VC_OPEN_COUPLE500', TRUNC(SYSDATE) + 120, SYSTIMESTAMP - INTERVAL '3' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_11', 'VC_OPEN_LOCAL5', TRUNC(SYSDATE) + 120, SYSTIMESTAMP - INTERVAL '5' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_12', 'VC_OPEN_GREEN600', TRUNC(SYSDATE) + 120, SYSTIMESTAMP - INTERVAL '4' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_13', 'VC_OPEN_COUPLE500', TRUNC(SYSDATE) + 120, SYSTIMESTAMP - INTERVAL '3' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_14', 'VC_OPEN_GREEN600', TRUNC(SYSDATE) + 120, SYSTIMESTAMP - INTERVAL '3' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_15', 'VC_OPEN_SUMMER8', TRUNC(SYSDATE) + 120, SYSTIMESTAMP - INTERVAL '3' DAY, 'DA_SU_DUNG');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_02', 'VC_OPEN_LOCAL5', TRUNC(SYSDATE) + 100, SYSTIMESTAMP - INTERVAL '2' DAY, 'CO_HIEU_LUC');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, NgayHetHan, NgayNhan, TrangThai) VALUES ('KH_03', 'VC_OPEN_FAMILY1M', TRUNC(SYSDATE) + 100, SYSTIMESTAMP - INTERVAL '2' DAY, 'CO_HIEU_LUC');

INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai) VALUES ('DDT_SAPA_OPEN_03_GD1', 'VC_OPEN_FAMILY1M', 1000000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai) VALUES ('DDT_DANANG_OPEN_03_FAMILY', 'VC_OPEN_SUMMER8', 2184000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai) VALUES ('DDT_DALAT_OPEN_03_COUPLE', 'VC_OPEN_COUPLE500', 500000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai) VALUES ('DDT_NINHBINH_OPEN_03_TEAM', 'VC_OPEN_GREEN600', 600000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai) VALUES ('DDT_PHUQUOC_OPEN_03_FAMILY', 'VC_OPEN_PREMIUM2M', 2000000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai) VALUES ('DDT_HUE_OPEN_03_COUPLE', 'VC_OPEN_COUPLE500', 500000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai) VALUES ('DDT_HAGIANG_OPEN_03_TEAM', 'VC_OPEN_LOCAL5', 981000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai) VALUES ('DDT_HOIAN_OPEN_03_GROUP', 'VC_OPEN_GREEN600', 600000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai) VALUES ('DDT_HALONG_OPEN_03_COUPLE', 'VC_OPEN_COUPLE500', 500000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai) VALUES ('DDT_CANTHO_OPEN_03_FAMILY', 'VC_OPEN_GREEN600', 600000);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai) VALUES ('DDT_CONDAO_OPEN_03_COUPLE', 'VC_OPEN_SUMMER8', 1425600);

UPDATE DONDATTOUR SET TongTien = 24350000, GhiChu = GhiChu || ' Áp dụng voucher OPEN-FAMILY-1M giảm 1.000.000.' WHERE MaDatTour = 'DDT_SAPA_OPEN_03_GD1';
UPDATE GIAODICH SET SoTien = 24350000 WHERE MaGiaoDich = 'GD_SAPA_OPEN_03_GD1_PAY';
UPDATE DONDATTOUR SET TongTien = 25116000, GhiChu = GhiChu || ' Áp dụng voucher OPEN-SUMMER-8 giảm 2.184.000.' WHERE MaDatTour = 'DDT_DANANG_OPEN_03_FAMILY';
UPDATE GIAODICH SET SoTien = 25116000 WHERE MaGiaoDich = 'GD_DANANG_OPEN_03_PAY';
UPDATE DONDATTOUR SET TongTien = 8600000, GhiChu = GhiChu || ' Áp dụng voucher OPEN-COUPLE-500 giảm 500.000.' WHERE MaDatTour = 'DDT_DALAT_OPEN_03_COUPLE';
UPDATE GIAODICH SET SoTien = 8600000 WHERE MaGiaoDich = 'GD_DALAT_OPEN_03_PAY';
UPDATE DONDATTOUR SET TongTien = 16300000, GhiChu = GhiChu || ' Áp dụng voucher OPEN-GREEN-600 giảm 600.000.' WHERE MaDatTour = 'DDT_NINHBINH_OPEN_03_TEAM';
UPDATE GIAODICH SET SoTien = 16300000 WHERE MaGiaoDich = 'GD_NINHBINH_OPEN_03_PAY';
UPDATE DONDATTOUR SET TongTien = 30600000, GhiChu = GhiChu || ' Áp dụng voucher OPEN-PREMIUM-2M giảm 2.000.000.' WHERE MaDatTour = 'DDT_PHUQUOC_OPEN_03_FAMILY';
UPDATE GIAODICH SET SoTien = 30600000 WHERE MaGiaoDich = 'GD_PHUQUOC_OPEN_03_PAY';
UPDATE DONDATTOUR SET TongTien = 9250000, GhiChu = GhiChu || ' Áp dụng voucher OPEN-COUPLE-500 giảm 500.000.' WHERE MaDatTour = 'DDT_HUE_OPEN_03_COUPLE';
UPDATE GIAODICH SET SoTien = 9250000 WHERE MaGiaoDich = 'GD_HUE_OPEN_03_PAY';
UPDATE DONDATTOUR SET TongTien = 18639000, GhiChu = GhiChu || ' Áp dụng voucher OPEN-LOCAL-5 giảm 981.000.' WHERE MaDatTour = 'DDT_HAGIANG_OPEN_03_TEAM';
UPDATE GIAODICH SET SoTien = 18639000 WHERE MaGiaoDich = 'GD_HAGIANG_OPEN_03_PAY';
UPDATE DONDATTOUR SET TongTien = 18700000, GhiChu = GhiChu || ' Áp dụng voucher OPEN-GREEN-600 giảm 600.000.' WHERE MaDatTour = 'DDT_HOIAN_OPEN_03_GROUP';
UPDATE GIAODICH SET SoTien = 18700000 WHERE MaGiaoDich = 'GD_HOIAN_OPEN_03_PAY';
UPDATE DONDATTOUR SET TongTien = 12700000, GhiChu = GhiChu || ' Áp dụng voucher OPEN-COUPLE-500 giảm 500.000.' WHERE MaDatTour = 'DDT_HALONG_OPEN_03_COUPLE';
UPDATE GIAODICH SET SoTien = 12700000 WHERE MaGiaoDich = 'GD_HALONG_OPEN_03_PAY';
UPDATE DONDATTOUR SET TongTien = 11550000, GhiChu = GhiChu || ' Áp dụng voucher OPEN-GREEN-600 giảm 600.000.' WHERE MaDatTour = 'DDT_CANTHO_OPEN_03_FAMILY';
UPDATE GIAODICH SET SoTien = 11550000 WHERE MaGiaoDich = 'GD_CANTHO_OPEN_03_PAY';
UPDATE DONDATTOUR SET TongTien = 16394400, GhiChu = GhiChu || ' Áp dụng voucher OPEN-SUMMER-8 giảm 1.425.600.' WHERE MaDatTour = 'DDT_CONDAO_OPEN_03_COUPLE';
UPDATE GIAODICH SET SoTien = 16394400 WHERE MaGiaoDich = 'GD_CONDAO_OPEN_03_PAY';

-- Tour da hoan thanh bo sung de tang nguon danh gia cho cac tour mau dang mo ban.
-- Cac don duoc chen khi tour con MO_BAN va NgayDat truoc NgayKhoiHanh, sau do tour moi chuyen KET_THUC de hop le khi danh gia.
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_SAPA_REVIEW_03', 'TM_SAPA', TRUNC(SYSDATE) - 12, 4900000, 26, 8, 26, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_DANANG_REVIEW_03', 'TM_DANANG', TRUNC(SYSDATE) - 14, 6700000, 30, 10, 30, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_PHUQUOC_REVIEW_03', 'TM_PHUQUOC', TRUNC(SYSDATE) - 15, 8200000, 24, 8, 24, 'MO_BAN');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai)
VALUES ('TTT_HUE_REVIEW_03', 'TM_HUE', TRUNC(SYSDATE) - 10, 4600000, 24, 8, 24, 'MO_BAN');

INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_SAPA_REVIEW_03', 'DVT_SAPA_HERBAL');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_DANANG_REVIEW_03', 'DVT_DANANG_SHOW');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_PHUQUOC_REVIEW_03', 'DVT_PHUQUOC_SNORKEL');
INSERT INTO DICHVU_TOURTHUCTE (MaTourThucTe, MaDichVuThem) VALUES ('TTT_HUE_REVIEW_03', 'DVT_HUE_AODAI');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_SAPA_REVIEW_03', 'HDX_REFILL');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_DANANG_REVIEW_03', 'HDX_PUBLIC_TRANSFER');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_PHUQUOC_REVIEW_03', 'HDX_CORAL_SAFE');
INSERT INTO HDX_TOURTHUCTE (MaTourThucTe, MaHanhDongXanh) VALUES ('TTT_HUE_REVIEW_03', 'HDX_REUSABLE_BAG');

INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_SAPA_REVIEW_03_HDV03', 'TTT_SAPA_REVIEW_03', 'NV_HDV03', SYSTIMESTAMP - INTERVAL '35' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '34' DAY);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_DANANG_REVIEW_03_HDV04', 'TTT_DANANG_REVIEW_03', 'NV_HDV04', SYSTIMESTAMP - INTERVAL '36' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '35' DAY);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_PHUQUOC_REVIEW_03_HDV05', 'TTT_PHUQUOC_REVIEW_03', 'NV_HDV05', SYSTIMESTAMP - INTERVAL '37' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '36' DAY);
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, NgayPhanCong, TrangThaiChapNhan, NgayPhanHoi)
VALUES ('PC_HUE_REVIEW_03_HDV06', 'TTT_HUE_REVIEW_03', 'NV_HDV06', SYSTIMESTAMP - INTERVAL '33' DAY, 'DA_DONG_Y', SYSTIMESTAMP - INTERVAL '32' DAY);

INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
SELECT 'DDT_SAPA_REVIEW_03_' || MaKhachHang, 'TTT_SAPA_REVIEW_03', MaKhachHang, SYSTIMESTAMP - INTERVAL '32' DAY,
       CASE MaKhachHang WHEN 'KH_02' THEN 9800000 WHEN 'KH_05' THEN 14700000 ELSE 4900000 END,
       'DA_XAC_NHAN', SYSTIMESTAMP - INTERVAL '31' DAY, 'Khach da hoan thanh tour Sa Pa, dung lam nguon danh gia cho tour mau.', 'HDX_REFILL:1'
FROM HOCHIEUSO WHERE MaKhachHang IN ('KH_01','KH_02','KH_03','KH_04','KH_05');
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
SELECT 'DDT_DANANG_REVIEW_03_' || MaKhachHang, 'TTT_DANANG_REVIEW_03', MaKhachHang, SYSTIMESTAMP - INTERVAL '35' DAY,
       CASE MaKhachHang WHEN 'KH_08' THEN 20100000 WHEN 'KH_06' THEN 13400000 WHEN 'KH_10' THEN 13400000 ELSE 6700000 END,
       'DA_XAC_NHAN', SYSTIMESTAMP - INTERVAL '34' DAY, 'Khach da hoan thanh tour Da Nang - Hoi An, dung lam nguon danh gia cho tour mau.', 'HDX_PUBLIC_TRANSFER:1'
FROM HOCHIEUSO WHERE MaKhachHang IN ('KH_06','KH_07','KH_08','KH_09','KH_10');
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
SELECT 'DDT_PHUQUOC_REVIEW_03_' || MaKhachHang, 'TTT_PHUQUOC_REVIEW_03', MaKhachHang, SYSTIMESTAMP - INTERVAL '36' DAY,
       CASE MaKhachHang WHEN 'KH_14' THEN 24600000 WHEN 'KH_11' THEN 16400000 WHEN 'KH_13' THEN 16400000 ELSE 8200000 END,
       'DA_XAC_NHAN', SYSTIMESTAMP - INTERVAL '35' DAY, 'Khach da hoan thanh tour Phu Quoc, dung lam nguon danh gia cho tour mau.', 'HDX_CORAL_SAFE:1'
FROM HOCHIEUSO WHERE MaKhachHang IN ('KH_11','KH_12','KH_13','KH_14','KH_15');
INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
SELECT 'DDT_HUE_REVIEW_03_' || MaKhachHang, 'TTT_HUE_REVIEW_03', MaKhachHang, SYSTIMESTAMP - INTERVAL '28' DAY,
       CASE MaKhachHang WHEN 'KH_02' THEN 9200000 WHEN 'KH_04' THEN 9200000 WHEN 'KH_05' THEN 13800000 ELSE 4600000 END,
       'DA_XAC_NHAN', SYSTIMESTAMP - INTERVAL '27' DAY, 'Khach da hoan thanh tour Hue, dung lam nguon danh gia cho tour mau.', 'HDX_REUSABLE_BAG:1'
FROM HOCHIEUSO WHERE MaKhachHang IN ('KH_01','KH_02','KH_03','KH_04','KH_05');

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
SELECT 'CTDT_' || SUBSTR(MaDatTour, 5) || '_KH', MaDatTour, MaKhachHang, NULL, 'NGUOI_DAT',
       CASE MaTourThucTe WHEN 'TTT_SAPA_REVIEW_03' THEN 4900000 WHEN 'TTT_DANANG_REVIEW_03' THEN 6700000 WHEN 'TTT_PHUQUOC_REVIEW_03' THEN 8200000 ELSE 4600000 END
FROM DONDATTOUR
WHERE MaDatTour LIKE 'DDT\_%\_REVIEW\_03\_KH%' ESCAPE '\';

INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_SAPA_REVIEW_03_KH02_01', 'DDT_SAPA_REVIEW_03_KH_02', 'Lê Quốc Thịnh', '001088040101', '0904000101', DATE '1988-07-09', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_SAPA_REVIEW_03_KH05_01', 'DDT_SAPA_REVIEW_03_KH_05', 'Hoàng Gia Bảo', '001085040102', '0904000102', DATE '1985-06-30', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_SAPA_REVIEW_03_KH05_02', 'DDT_SAPA_REVIEW_03_KH_05', 'Hoàng Ngọc Mai', '001089040103', '0904000103', DATE '1989-10-11', 'Nữ', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_DANANG_REVIEW_03_KH06_01', 'DDT_DANANG_REVIEW_03_KH_06', 'Bùi Thanh Phong', '048087040104', '0904000104', DATE '1987-01-19', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_DANANG_REVIEW_03_KH08_01', 'DDT_DANANG_REVIEW_03_KH_08', 'Đoàn Thị Hạnh', '048060040105', '0904000105', DATE '1960-07-07', 'Nữ', 'Người cao tuổi');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_DANANG_REVIEW_03_KH08_02', 'DDT_DANANG_REVIEW_03_KH_08', 'Đoàn Minh Khôi', '048090040106', '0904000106', DATE '1990-05-21', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_DANANG_REVIEW_03_KH09_01', 'DDT_DANANG_REVIEW_03_KH_09', 'Đặng Minh Khôi', '048086040116', '0904000116', DATE '1986-01-21', 'NAM', 'Đi công tác kết hợp nghỉ dưỡng');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_DANANG_REVIEW_03_KH10_01', 'DDT_DANANG_REVIEW_03_KH_10', 'Mai Hoàng Long', '048091040107', '0904000107', DATE '1991-04-04', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_PHUQUOC_REVIEW_03_KH11_01', 'DDT_PHUQUOC_REVIEW_03_KH_11', 'Cao Minh Anh', '091082040108', '0904000108', DATE '1982-07-17', 'Nữ', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_PHUQUOC_REVIEW_03_KH13_01', 'DDT_PHUQUOC_REVIEW_03_KH_13', 'Nguyễn Hoài Nam', '091084040109', '0904000109', DATE '1984-06-17', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_PHUQUOC_REVIEW_03_KH14_01', 'DDT_PHUQUOC_REVIEW_03_KH_14', 'Lâm Gia Hân', '091019040110', '0904000110', DATE '2019-03-15', 'Nữ', 'Trẻ em');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_PHUQUOC_REVIEW_03_KH14_02', 'DDT_PHUQUOC_REVIEW_03_KH_14', 'Lâm Minh Phúc', '091088040111', '0904000111', DATE '1988-05-03', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_HUE_REVIEW_03_KH02_01', 'DDT_HUE_REVIEW_03_KH_02', 'Nguyễn Minh Đức', '075086040112', '0904000112', DATE '1986-03-12', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_HUE_REVIEW_03_KH04_01', 'DDT_HUE_REVIEW_03_KH_04', 'Trần Thị Kim Liên', '075060040113', '0904000113', DATE '1960-02-18', 'Nữ', 'Người cao tuổi');
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_HUE_REVIEW_03_KH05_01', 'DDT_HUE_REVIEW_03_KH_05', 'Hoàng Gia Bảo', '075085040114', '0904000114', DATE '1985-06-30', 'NAM', NULL);
INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu) VALUES ('NDH_HUE_REVIEW_03_KH05_02', 'DDT_HUE_REVIEW_03_KH_05', 'Hoàng Ngọc Mai', '075089040115', '0904000115', DATE '1989-10-11', 'Nữ', NULL);

INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_SAPA_REVIEW_03_KH02_NDH1', 'DDT_SAPA_REVIEW_03_KH_02', NULL, 'NDH_SAPA_REVIEW_03_KH02_01', 'NGUOI_DONG_HANH', 4900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_SAPA_REVIEW_03_KH05_NDH1', 'DDT_SAPA_REVIEW_03_KH_05', NULL, 'NDH_SAPA_REVIEW_03_KH05_01', 'NGUOI_DONG_HANH', 4900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_SAPA_REVIEW_03_KH05_NDH2', 'DDT_SAPA_REVIEW_03_KH_05', NULL, 'NDH_SAPA_REVIEW_03_KH05_02', 'NGUOI_DONG_HANH', 4900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_REVIEW_03_KH06_NDH1', 'DDT_DANANG_REVIEW_03_KH_06', NULL, 'NDH_DANANG_REVIEW_03_KH06_01', 'NGUOI_DONG_HANH', 6700000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_REVIEW_03_KH08_NDH1', 'DDT_DANANG_REVIEW_03_KH_08', NULL, 'NDH_DANANG_REVIEW_03_KH08_01', 'NGUOI_DONG_HANH', 6700000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_REVIEW_03_KH08_NDH2', 'DDT_DANANG_REVIEW_03_KH_08', NULL, 'NDH_DANANG_REVIEW_03_KH08_02', 'NGUOI_DONG_HANH', 6700000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_REVIEW_03_KH09_NDH1', 'DDT_DANANG_REVIEW_03_KH_09', NULL, 'NDH_DANANG_REVIEW_03_KH09_01', 'NGUOI_DONG_HANH', 6700000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_DANANG_REVIEW_03_KH10_NDH1', 'DDT_DANANG_REVIEW_03_KH_10', NULL, 'NDH_DANANG_REVIEW_03_KH10_01', 'NGUOI_DONG_HANH', 6700000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PHUQUOC_REVIEW_03_KH11_NDH1', 'DDT_PHUQUOC_REVIEW_03_KH_11', NULL, 'NDH_PHUQUOC_REVIEW_03_KH11_01', 'NGUOI_DONG_HANH', 8200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PHUQUOC_REVIEW_03_KH13_NDH1', 'DDT_PHUQUOC_REVIEW_03_KH_13', NULL, 'NDH_PHUQUOC_REVIEW_03_KH13_01', 'NGUOI_DONG_HANH', 8200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PHUQUOC_REVIEW_03_KH14_NDH1', 'DDT_PHUQUOC_REVIEW_03_KH_14', NULL, 'NDH_PHUQUOC_REVIEW_03_KH14_01', 'NGUOI_DONG_HANH', 8200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_PHUQUOC_REVIEW_03_KH14_NDH2', 'DDT_PHUQUOC_REVIEW_03_KH_14', NULL, 'NDH_PHUQUOC_REVIEW_03_KH14_02', 'NGUOI_DONG_HANH', 8200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HUE_REVIEW_03_KH02_NDH1', 'DDT_HUE_REVIEW_03_KH_02', NULL, 'NDH_HUE_REVIEW_03_KH02_01', 'NGUOI_DONG_HANH', 4600000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HUE_REVIEW_03_KH04_NDH1', 'DDT_HUE_REVIEW_03_KH_04', NULL, 'NDH_HUE_REVIEW_03_KH04_01', 'NGUOI_DONG_HANH', 4600000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HUE_REVIEW_03_KH05_NDH1', 'DDT_HUE_REVIEW_03_KH_05', NULL, 'NDH_HUE_REVIEW_03_KH05_01', 'NGUOI_DONG_HANH', 4600000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat) VALUES ('CTDT_HUE_REVIEW_03_KH05_NDH2', 'DDT_HUE_REVIEW_03_KH_05', NULL, 'NDH_HUE_REVIEW_03_KH05_02', 'NGUOI_DONG_HANH', 4600000);

UPDATE DONDATTOUR SET TongTien = 13400000, GhiChu = GhiChu || ' Bổ sung một người đồng hành để đủ số khách tối thiểu.' WHERE MaDatTour = 'DDT_DANANG_REVIEW_03_KH_09';

INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
SELECT 'GD_' || SUBSTR(MaDatTour, 5) || '_PAY', MaDatTour, 'THANH_TOAN',
       CASE WHEN MaKhachHang IN ('KH_02','KH_05','KH_08','KH_11','KH_14') THEN 'THE_QUOC_TE' ELSE 'CHUYEN_KHOAN' END,
       TongTien, 'BANK-' || SUBSTR(MaDatTour, 5), 'THANH_CONG', NgayDat + INTERVAL '6' HOUR
FROM DONDATTOUR
WHERE MaDatTour LIKE 'DDT\_%\_REVIEW\_03\_KH%' ESCAPE '\';

UPDATE TOURTHUCTE SET TrangThai = 'KET_THUC' WHERE MaTourThucTe IN ('TTT_SAPA_REVIEW_03','TTT_DANANG_REVIEW_03','TTT_PHUQUOC_REVIEW_03','TTT_HUE_REVIEW_03');

INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
SELECT 'LST_' || SUBSTR(ddt.MaDatTour, 5), ddt.MaKhachHang, ddt.MaTourThucTe, ctdt.MaChiTietDat, ttt.NgayKhoiHanh
FROM DONDATTOUR ddt
JOIN TOURTHUCTE ttt ON ttt.MaTourThucTe = ddt.MaTourThucTe
JOIN CHITIETDATTOUR ctdt ON ctdt.MaDatTour = ddt.MaDatTour AND ctdt.MaKhachHang = ddt.MaKhachHang
WHERE ddt.MaDatTour LIKE 'DDT\_%\_REVIEW\_03\_KH%' ESCAPE '\';

INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_SAPA_REVIEW_03_KH01', 'TTT_SAPA_REVIEW_03', 'KH_01', 5, 'Lịch trình Sa Pa vừa sức, hướng dẫn viên chăm sóc kỹ và xử lý yêu cầu ăn uống rất chu đáo.', SYSTIMESTAMP - INTERVAL '7' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_SAPA_REVIEW_03_KH02', 'TTT_SAPA_REVIEW_03', 'KH_02', 5, 'Khách sạn sạch, xe đưa đón đúng giờ, gia đình có trẻ nhỏ vẫn đi rất thoải mái.', SYSTIMESTAMP - INTERVAL '7' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_SAPA_REVIEW_03_KH03', 'TTT_SAPA_REVIEW_03', 'KH_03', 4, 'Cảnh đẹp và trải nghiệm bản làng tốt, nên thêm thời gian tự do ở chợ đêm.', SYSTIMESTAMP - INTERVAL '6' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_SAPA_REVIEW_03_KH04', 'TTT_SAPA_REVIEW_03', 'KH_04', 5, 'Phòng tầng thấp đúng yêu cầu, lịch trình không quá gấp và HDV hỗ trợ rất nhiệt tình.', SYSTIMESTAMP - INTERVAL '6' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_SAPA_REVIEW_03_KH05', 'TTT_SAPA_REVIEW_03', 'KH_05', 4, 'Dịch vụ tốt, bữa ăn địa phương ngon, chỉ cần cải thiện thời gian chờ cáp treo.', SYSTIMESTAMP - INTERVAL '5' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_DANANG_REVIEW_03_KH06', 'TTT_DANANG_REVIEW_03', 'KH_06', 5, 'Tour Đà Nẵng - Hội An cân bằng giữa biển, di sản và nghỉ ngơi, xe đưa đón rất đúng giờ.', SYSTIMESTAMP - INTERVAL '8' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_DANANG_REVIEW_03_KH07', 'TTT_DANANG_REVIEW_03', 'KH_07', 4, 'Phố cổ đẹp, show buổi tối đáng xem, nên giảm thời gian mua sắm ở điểm dừng.', SYSTIMESTAMP - INTERVAL '8' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_DANANG_REVIEW_03_KH08', 'TTT_DANANG_REVIEW_03', 'KH_08', 5, 'Đi cùng người lớn tuổi vẫn rất ổn, HDV sắp xếp nhịp tham quan hợp lý.', SYSTIMESTAMP - INTERVAL '7' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_DANANG_REVIEW_03_KH09', 'TTT_DANANG_REVIEW_03', 'KH_09', 5, 'Dịch vụ xuất hóa đơn rõ ràng, lịch trình chuyên nghiệp và bữa tối Hội An ngon.', SYSTIMESTAMP - INTERVAL '7' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_DANANG_REVIEW_03_KH10', 'TTT_DANANG_REVIEW_03', 'KH_10', 4, 'Đội ngũ lưu ý dị ứng hải sản tốt, khách sạn ổn, biển hơi đông vào cuối tuần.', SYSTIMESTAMP - INTERVAL '6' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_PHUQUOC_REVIEW_03_KH11', 'TTT_PHUQUOC_REVIEW_03', 'KH_11', 5, 'Tour Phú Quốc thư giãn, ít phải đi bộ nhiều và hoạt động biển được hướng dẫn an toàn.', SYSTIMESTAMP - INTERVAL '9' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_PHUQUOC_REVIEW_03_KH12', 'TTT_PHUQUOC_REVIEW_03', 'KH_12', 5, 'Thực đơn chay được chuẩn bị riêng, lịch trình đảo đẹp và không quá mệt.', SYSTIMESTAMP - INTERVAL '9' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_PHUQUOC_REVIEW_03_KH13', 'TTT_PHUQUOC_REVIEW_03', 'KH_13', 4, 'Khách sạn yên tĩnh, biển đẹp, nên thông báo rõ hơn thời tiết trước ngày đi cano.', SYSTIMESTAMP - INTERVAL '8' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_PHUQUOC_REVIEW_03_KH14', 'TTT_PHUQUOC_REVIEW_03', 'KH_14', 5, 'Gia đình có trẻ nhỏ được hỗ trợ tốt, hoạt động làm sạch bãi biển rất ý nghĩa.', SYSTIMESTAMP - INTERVAL '8' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_PHUQUOC_REVIEW_03_KH15', 'TTT_PHUQUOC_REVIEW_03', 'KH_15', 4, 'Dịch vụ tốt, hướng dẫn viên vui vẻ, bữa hải sản nên có thêm lựa chọn nhẹ hơn.', SYSTIMESTAMP - INTERVAL '7' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_HUE_REVIEW_03_KH01', 'TTT_HUE_REVIEW_03', 'KH_01', 5, 'Tour Huế nhẹ nhàng, món chay được chuẩn bị tốt và thuyết minh di sản rất cuốn hút.', SYSTIMESTAMP - INTERVAL '5' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_HUE_REVIEW_03_KH02', 'TTT_HUE_REVIEW_03', 'KH_02', 5, 'Gia đình hài lòng, Đại Nội và lăng tẩm được sắp xếp đúng nhịp, không bị quá tải.', SYSTIMESTAMP - INTERVAL '5' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_HUE_REVIEW_03_KH03', 'TTT_HUE_REVIEW_03', 'KH_03', 4, 'Lịch trình tốt, nên thêm một quán cà phê địa phương vào buổi chiều.', SYSTIMESTAMP - INTERVAL '4' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_HUE_REVIEW_03_KH04', 'TTT_HUE_REVIEW_03', 'KH_04', 5, 'Khách sạn sắp phòng đúng yêu cầu, HDV kiên nhẫn và hỗ trợ người lớn tuổi tốt.', SYSTIMESTAMP - INTERVAL '4' DAY);
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, NgayDanhGia) VALUES ('DG_HUE_REVIEW_03_KH05', 'TTT_HUE_REVIEW_03', 'KH_05', 5, 'Dịch vụ chỉn chu, ăn uống ngon và phần áo dài chụp ảnh tạo trải nghiệm đáng nhớ.', SYSTIMESTAMP - INTERVAL '3' DAY);

-- Bo sung cac don dat nhieu hanh khach de tao tour gan full va full cho.
-- Moi don co: nguoi dat, danh sach nguoi dong hanh, chi tiet dat tour, dich vu, giao dich thanh toan.
DECLARE
    PROCEDURE them_don_day_cho (
        p_MaDatTour      IN VARCHAR2,
        p_MaTourThucTe   IN VARCHAR2,
        p_MaKhachHang    IN VARCHAR2,
        p_SoKhach        IN NUMBER,
        p_GiaTour        IN NUMBER,
        p_MaDichVuThem   IN VARCHAR2,
        p_SoLuongDichVu  IN NUMBER,
        p_DonGiaDichVu   IN NUMBER,
        p_PhuongThuc     IN VARCHAR2,
        p_GhiChu         IN VARCHAR2,
        p_HanhDongXanh   IN VARCHAR2,
        p_NgayLui        IN NUMBER
    ) IS
        v_MaNguoiDongHanh VARCHAR2(50);
        v_MaChiTietDat    VARCHAR2(50);
        v_TongTien        NUMBER(18,2);
        v_HoTen           VARCHAR2(200);
    BEGIN
        v_TongTien := p_SoKhach * p_GiaTour + NVL(p_SoLuongDichVu, 0) * NVL(p_DonGiaDichVu, 0);

        INSERT INTO DONDATTOUR (MaDatTour, MaTourThucTe, MaKhachHang, NgayDat, TongTien, TrangThai, ThoiGianHetHan, GhiChu, HanhDongXanh)
        VALUES (p_MaDatTour, p_MaTourThucTe, p_MaKhachHang, SYSTIMESTAMP - NUMTODSINTERVAL(p_NgayLui, 'DAY'), v_TongTien, 'DA_XAC_NHAN',
                SYSTIMESTAMP + INTERVAL '2' DAY, p_GhiChu, p_HanhDongXanh);

        INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
        VALUES ('CTDT_' || SUBSTR(p_MaDatTour, 5) || '_KH', p_MaDatTour, p_MaKhachHang, NULL, 'NGUOI_DAT', p_GiaTour);

        FOR i IN 1 .. p_SoKhach - 1 LOOP
            v_MaNguoiDongHanh := 'NDH_' || SUBSTR(p_MaDatTour, 5) || '_' || LPAD(i, 2, '0');
            v_MaChiTietDat := 'CTDT_' || SUBSTR(p_MaDatTour, 5) || '_N' || LPAD(i, 2, '0');
            v_HoTen := CASE MOD(i + p_NgayLui, 12)
                WHEN 0 THEN 'Nguyễn Minh An'
                WHEN 1 THEN 'Trần Gia Bảo'
                WHEN 2 THEN 'Lê Hoài Thương'
                WHEN 3 THEN 'Phạm Hải Đăng'
                WHEN 4 THEN 'Vũ Khánh Linh'
                WHEN 5 THEN 'Đỗ Nhật Minh'
                WHEN 6 THEN 'Bùi Thanh Trúc'
                WHEN 7 THEN 'Hoàng Đức Huy'
                WHEN 8 THEN 'Mai Phương Uyên'
                WHEN 9 THEN 'Cao Tuấn Kiệt'
                WHEN 10 THEN 'Tạ Ngọc Mai'
                ELSE 'Đặng Quốc Việt'
            END;

            INSERT INTO DSNGUOIDONGHANH (MaNguoiDongHanh, MaDatTour, HoTen, CCCD, SoDienThoai, NgaySinh, GioiTinh, GhiChu)
            VALUES (v_MaNguoiDongHanh, p_MaDatTour, v_HoTen,
                    TO_CHAR(800000000000 + p_NgayLui * 100 + i),
                    '09' || LPAD(TO_CHAR(70000000 + p_NgayLui * 100 + i), 8, '0'),
                    ADD_MONTHS(DATE '1990-01-01', -12 * MOD(p_NgayLui + i, 25)),
                    CASE WHEN MOD(i, 2) = 0 THEN 'Nữ' ELSE 'NAM' END,
                    CASE WHEN i = 1 THEN 'Người đồng hành chính, nhận thông báo lịch trình cùng người đặt.' ELSE 'Đi cùng nhóm, đã xác nhận thông tin cá nhân.' END);

            INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaNguoiDongHanh, LoaiKhach, GiaTaiThoiDiemDat)
            VALUES (v_MaChiTietDat, p_MaDatTour, NULL, v_MaNguoiDongHanh, 'NGUOI_DONG_HANH', p_GiaTour);
        END LOOP;

        IF p_MaDichVuThem IS NOT NULL AND p_SoLuongDichVu > 0 THEN
            INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
            VALUES ('CTDV_' || SUBSTR(p_MaDatTour, 5), p_MaDatTour, p_MaDichVuThem, p_SoLuongDichVu, p_DonGiaDichVu, p_SoLuongDichVu * p_DonGiaDichVu);
        END IF;

        INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, LoaiGiaoDich, PhuongThuc, SoTien, MaGDNH, TrangThai, NgayThanhToan)
        VALUES ('GD_' || SUBSTR(p_MaDatTour, 5) || '_PAY', p_MaDatTour, 'THANH_TOAN', p_PhuongThuc, v_TongTien,
                'BANK-' || SUBSTR(p_MaDatTour, 5), 'THANH_CONG', SYSTIMESTAMP - NUMTODSINTERVAL(p_NgayLui - 1, 'DAY'));
    END;
BEGIN
    -- TTT_HAGIANG_OPEN_03: da co 3/22 khach, bo sung 19 khach => full 22/22.
    them_don_day_cho('DDT_HG_FULL_01', 'TTT_HAGIANG_OPEN_03', 'KH_10', 5, 6500000, 'DVT_HAGIANG_MOTOR', 5, 700000, 'CHUYEN_KHOAN', 'Nhóm bạn trekking Hà Giang, yêu cầu xe máy có lái bản địa cho toàn bộ khách.', 'HDX_TREE:3;HDX_REFILL:5', 6);
    them_don_day_cho('DDT_HG_FULL_02', 'TTT_HAGIANG_OPEN_03', 'KH_11', 5, 6500000, 'DVT_INSURANCE', 5, 120000, 'THE_NOI_DIA', 'Gia đình đặt sớm, cần bảo hiểm du lịch và phòng nghỉ tầng thấp khi có thể.', 'HDX_TREE:2;HDX_LOCAL_MEAL:5', 5);
    them_don_day_cho('DDT_HG_FULL_03', 'TTT_HAGIANG_OPEN_03', 'KH_12', 5, 6500000, 'DVT_HAGIANG_MOTOR', 5, 700000, 'VI_DIEN_TU', 'Nhóm khách trẻ muốn đi cung Đồng Văn - Mèo Vạc, đã gửi danh sách căn cước.', 'HDX_REFILL:5', 4);
    them_don_day_cho('DDT_HG_FULL_04', 'TTT_HAGIANG_OPEN_03', 'KH_13', 4, 6500000, 'DVT_INSURANCE', 4, 120000, 'CHUYEN_KHOAN', 'Bốn khách đi nghỉ lễ, yêu cầu xác nhận ghế xe cạnh nhau.', 'HDX_TREE:1;HDX_REUSABLE_BAG:4', 3);

    -- TTT_CONDAO_OPEN_03: da co 2/20 khach, bo sung 18 khach => full 20/20.
    them_don_day_cho('DDT_CD_FULL_01', 'TTT_CONDAO_OPEN_03', 'KH_14', 5, 8850000, 'DVT_CONDAO_TURTLE', 5, 520000, 'THE_QUOC_TE', 'Nhóm gia đình quan tâm hoạt động bảo tồn rùa biển, cần phòng gần nhau.', 'HDX_CLEANUP:5;HDX_CORAL_SAFE:5', 6);
    them_don_day_cho('DDT_CD_FULL_02', 'TTT_CONDAO_OPEN_03', 'KH_15', 5, 8850000, 'DVT_INSURANCE', 5, 120000, 'CHUYEN_KHOAN', 'Nhóm công ty nhỏ đặt trọn gói, yêu cầu xuất hóa đơn sau thanh toán.', 'HDX_CLEANUP:3', 5);
    them_don_day_cho('DDT_CD_FULL_03', 'TTT_CONDAO_OPEN_03', 'KH_01', 4, 8850000, 'DVT_CONDAO_TURTLE', 4, 520000, 'VI_DIEN_TU', 'Bốn khách nghỉ dưỡng biển, ưu tiên lịch trình nhẹ và bữa tối hải sản.', 'HDX_CORAL_SAFE:4', 4);
    them_don_day_cho('DDT_CD_FULL_04', 'TTT_CONDAO_OPEN_03', 'KH_02', 4, 8850000, 'DVT_INSURANCE', 4, 120000, 'THE_NOI_DIA', 'Nhóm bạn đã thanh toán đủ, cần hỗ trợ check-in online trước ngày bay.', 'HDX_CLEANUP:2;HDX_REFILL:4', 3);

    -- Cac tour mo ban gan full: con lai it cho de UI hien thi sap het cho.
    them_don_day_cho('DDT_DN_NEAR_01', 'TTT_DANANG_OPEN_03', 'KH_03', 6, 6750000, 'DVT_DANANG_SHOW', 6, 650000, 'CHUYEN_KHOAN', 'Đoàn gia đình sáu khách đặt show Ký ức Hội An cho cả nhóm.', 'HDX_LOCAL:4;HDX_PUBLIC_TRANSFER:6', 6);
    them_don_day_cho('DDT_DN_NEAR_02', 'TTT_DANANG_OPEN_03', 'KH_04', 5, 6750000, 'DVT_DINNER', 1, 300000, 'VI_DIEN_TU', 'Nhóm bạn cần bữa tối riêng tại Hội An, có một khách dị ứng hải sản.', 'HDX_LOCAL_MEAL:5', 5);
    them_don_day_cho('DDT_DN_NEAR_03', 'TTT_DANANG_OPEN_03', 'KH_05', 5, 6750000, 'DVT_DANANG_SHOW', 5, 650000, 'THE_NOI_DIA', 'Năm khách đặt tour miền Trung, ưu tiên khách sạn gần biển Mỹ Khê.', 'HDX_PUBLIC_TRANSFER:5', 4);
    them_don_day_cho('DDT_DN_NEAR_04', 'TTT_DANANG_OPEN_03', 'KH_10', 5, 6750000, 'DVT_DINNER', 1, 300000, 'THE_QUOC_TE', 'Gia đình có trẻ nhỏ, cần ghế trẻ em trên xe và bàn ăn yên tĩnh.', 'HDX_LOCAL:3', 3);
    them_don_day_cho('DDT_DN_NEAR_05', 'TTT_DANANG_OPEN_03', 'KH_11', 5, 6750000, 'DVT_DANANG_SHOW', 5, 650000, 'CHUYEN_KHOAN', 'Nhóm khách doanh nghiệp chốt lịch sớm, yêu cầu xuất hóa đơn VAT.', 'HDX_EBILL:5;HDX_LOCAL_MEAL:5', 2);

    them_don_day_cho('DDT_PQ_NEAR_01', 'TTT_PHUQUOC_OPEN_03', 'KH_12', 5, 8150000, 'DVT_PHUQUOC_SNORKEL', 5, 950000, 'THE_QUOC_TE', 'Nhóm khách thích lặn ngắm san hô, đã xác nhận biết bơi cơ bản.', 'HDX_CLEANUP:5;HDX_CORAL_SAFE:5', 6);
    them_don_day_cho('DDT_PQ_NEAR_02', 'TTT_PHUQUOC_OPEN_03', 'KH_13', 5, 8150000, 'DVT_INSURANCE', 5, 120000, 'CHUYEN_KHOAN', 'Gia đình năm khách, cần thực đơn ít cay và phòng gần thang máy.', 'HDX_CLEANUP:2', 5);
    them_don_day_cho('DDT_PQ_NEAR_03', 'TTT_PHUQUOC_OPEN_03', 'KH_14', 5, 8150000, 'DVT_PHUQUOC_SNORKEL', 5, 950000, 'VI_DIEN_TU', 'Nhóm bạn nghỉ dưỡng biển, đặt thêm hoạt động đảo riêng.', 'HDX_CORAL_SAFE:5;HDX_REFILL:5', 4);
    them_don_day_cho('DDT_PQ_NEAR_04', 'TTT_PHUQUOC_OPEN_03', 'KH_15', 5, 8150000, 'DVT_INSURANCE', 5, 120000, 'THE_NOI_DIA', 'Năm khách đặt trọn gói, cần hỗ trợ xe đón tại sân bay Phú Quốc.', 'HDX_EBILL:5', 3);

    them_don_day_cho('DDT_MN_NEAR_01', 'TTT_MUINE_OPEN_03', 'KH_06', 6, 5100000, 'DVT_MUINE_JEEP', 2, 750000, 'CHUYEN_KHOAN', 'Đoàn sáu khách đặt jeep riêng ngắm bình minh đồi cát.', 'HDX_BOTTLE:6;HDX_REFILL:6', 6);
    them_don_day_cho('DDT_MN_NEAR_02', 'TTT_MUINE_OPEN_03', 'KH_07', 6, 5100000, 'DVT_AIRPORT', 2, 400000, 'VI_DIEN_TU', 'Nhóm gia đình cần hai xe đưa đón từ ga Phan Thiết.', 'HDX_BOTTLE:4', 5);
    them_don_day_cho('DDT_MN_NEAR_03', 'TTT_MUINE_OPEN_03', 'KH_08', 6, 5100000, 'DVT_MUINE_JEEP', 2, 750000, 'THE_QUOC_TE', 'Nhóm bạn trẻ đặt jeep và yêu cầu lịch chụp ảnh tại Bàu Trắng.', 'HDX_REFILL:6', 4);
    them_don_day_cho('DDT_MN_NEAR_04', 'TTT_MUINE_OPEN_03', 'KH_09', 6, 5100000, 'DVT_AIRPORT', 2, 400000, 'THE_NOI_DIA', 'Sáu khách đi nghỉ cuối tuần, cần phòng cùng tầng và check-in sớm.', 'HDX_EBILL:6;HDX_LOCAL_MEAL:6', 3);
END;
/

-- Bo sung chi phi va quyet toan cho tour da hoan thanh co nhieu don dat, phuc vu luong tai chinh sau tour.
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_DN_REVIEW_03_HOTEL', 'TTT_DANANG_REVIEW_03', 'NV_HDV04', 'Khach san Da Nang - Hoi An 3 dem', 42000000, 'https://seed.local/hoa-don/danang-review-hotel.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '10' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_DN_REVIEW_03_BUS', 'TTT_DANANG_REVIEW_03', 'NV_HDV04', 'Xe du lich 29 cho tron tour', 18500000, 'https://seed.local/hoa-don/danang-review-bus.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '10' DAY);
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, HoaDonAnh, TrangThaiDuyet, NgayKhai)
VALUES ('CP_DN_REVIEW_03_TICKET', 'TTT_DANANG_REVIEW_03', 'NV_HDV04', 'Ve tham quan va show Hoi An', 12600000, 'https://seed.local/hoa-don/danang-review-ticket.jpg', 'DA_DUYET', SYSTIMESTAMP - INTERVAL '9' DAY);

INSERT INTO QUYETTOAN (MaQuyetToan, MaTourThucTe, TongDoanhThu, TongChiPhi, GiaCamKet, LoiNhuan, MaNhanVien, NgayQuyetToan, TrangThai, GhiChu)
VALUES ('QT_DANANG_REVIEW_03_DONE', 'TTT_DANANG_REVIEW_03', 0, 0, 98000000, 0, 'NV_KT01', SYSTIMESTAMP - INTERVAL '7' DAY, 'DA_QUYET_TOAN',
        'Quyet toan tour Da Nang - Hoi An da hoan thanh; trigger tu tinh doanh thu, chi phi va loi nhuan theo giao dich/chi phi thuc te.');

-- Tính lại số chỗ còn lại sau toàn bộ cụm dữ liệu bổ sung.
UPDATE CHITIETDATTOUR
SET MaDatTour = MaDatTour
WHERE MaChiTietDat LIKE 'CTDT_%';


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

