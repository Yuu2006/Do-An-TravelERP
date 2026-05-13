-- ============================================================
-- SEED DATA v2 — Dữ liệu bổ sung (5-10 bản ghi mỗi từng bảng)
-- Kế thừa từ data_v1.sql, không trùng PK
-- Mật khẩu mặc định: password
-- BCrypt(cost=10): $2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK
-- ============================================================

-- ------------------------------------------------------------
-- 1. LOAIPHONG — Thêm 4 loại phòng mới
-- ------------------------------------------------------------
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP005', 'Phòng Suite', 1500000, 'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP006', 'Phòng Gia Đình (Family)', 600000, 'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP007', 'Phòng Bungalow Biển', 2000000, 'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP008', 'Phòng Ký Túc Xá (Dorm)', 0, 'KHOA');

-- ------------------------------------------------------------
-- 2. DICHVUTHEM — Thêm 5 dịch vụ bổ sung mới
-- ------------------------------------------------------------
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV006', 'Massage thư giãn toàn thân', 'Giờ', 350000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV007', 'Cho thuê xe máy khám phá', 'Ngày', 180000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV008', 'Gói chụp ảnh chuyên nghiệp', 'Buổi', 500000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV009', 'Bữa sáng room service', 'Người/ngày', 95000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV010', 'Tham quan ban đêm (city tour đêm)', 'Người', 220000, 'HOAT_DONG');

-- ------------------------------------------------------------
-- 3. HANHDONGXANH — Thêm 5 hành động xanh mới
-- ------------------------------------------------------------
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX006', 'Dùng túi vải thay túi nhựa khi mua sắm', 60, 'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX007', 'Chụp ảnh, báo cáo tình trạng ô nhiễm môi trường', 120, 'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX008', 'Sử dụng xe đạp điện thay ô tô cá nhân', 90, 'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX009', 'Tiết kiệm điện nước tại khách sạn (đăng ký eco room)', 70, 'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX010', 'Mua sản phẩm thủ công địa phương thay hàng nhập', 50, 'HOAT_DONG');

-- ------------------------------------------------------------
-- 4. TOURMAU — Thêm 4 tour mẫu mới
-- ------------------------------------------------------------
INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM005', 'Huế - Phong Nha Di Sản UNESCO 4N3Đ',
        'Khám phá cố đô Huế với lăng tẩm, chùa chiền; Động Phong Nha huyền bí; bãi biển Nhật Lệ.',
        4, 4500000, 4.6, 74, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM006', 'Cần Thơ - Miền Tây Sông Nước 3N2Đ',
        'Chợ nổi Cái Răng sáng sớm, vườn trái cây Lai Vung, rừng tràm Trà Sư, làng bội cá Cái Bè.',
        3, 2900000, 4.3, 55, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM007', 'Đà Lạt Thành Phố Ngàn Hoa 2N1Đ',
        'Thành phố tĩnh lặng giữa cao nguyên: vườn hoa Đà Lạt, thung lũng tình yêu, thác Datanla, du thuyền hồ Xuân Hương.',
        2, 1800000, 4.5, 112, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM008', 'Côn Đảo Thiên Đường Biển Đảo 4N3Đ',
        'Biển Côn Đảo xanh trong vắt, vườn quốc gia, khu bảo tồn rùa biển, di tích lịch sử Phú Hải.',
        4, 6500000, 4.9, 43, 'HOAT_DONG', 'SYSTEM');

-- ------------------------------------------------------------
-- 5. LICHTRINHTOUR — Thêm lịch trình cho TM005, TM006, TM007
-- ------------------------------------------------------------
-- TM005: Huế - Phong Nha 4N3Đ
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT005_N1', 'TM005', 1,
        'Máy bay / xe Hà Nội → Huế → Đại Nội → Lăng Minh Mạng',
        'Khởi hành sáng sớm. Tham quan Kinh thành Huế, Chùa Thiên Mụ, Lăng vua Minh Mạng.',
        'Trưa: Cơm Huế cổ truyền | Tối: Lẩu bò Huế');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT005_N2', 'TM005', 2,
        'Lăng Tự Đức → Lăng Khải Định → Động Phong Nha',
        'Tham quan các lăng tẩm cổ kính điển nhất Huế. Chiều chuyển sang Đồng Hới, khám phá hang Phong Nha.',
        'Sáng: Bánh canh Huế | Trưa: Cơm bụi miền Trung | Tối: Hải sản tươi');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT005_N3', 'TM005', 3,
        'Động Tiên Sơn → Nước Moọc Eco Trail → Bãi biển Nhật Lệ',
        'Khám phá hang Tiên Sơn huy hoàng. Bơi lội Nước Moọc. Chiều thư giãn bãi biển Nhật Lệ.',
        'Sáng: Bún bò Quảng Bình | Trưa: Hải sản | Tối: Nướng tại biển');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT005_N4', 'TM005', 4,
        'Tự do mua sắm → Sân bay về Hà Nội / TP HCM',
        'Sáng mua đặc sản: mứt gừng, nước mắm Quý Đức, bánh lọc khô. Ra sân bay.',
        'Sáng: Bánh mì que Đồng Hới');

-- TM006: Cần Thơ - Miền Tây 3N2Đ
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT006_N1', 'TM006', 1,
        'TP HCM → Cần Thơ → Chợ nổi Cái Răng → Vườn trái cây',
        'Xe giường nằm khởi hành 20h từ Bến Xe Miền Tây. Sáng đến Cần Thơ, thăm chợ nổi nổi tiếng. Thăm vườn trái cây Phong Điền.',
        'Sáng: Hủ tiếu Nam Vang | Trưa: Cơm nhà vườn | Tối: Lẩu mắm miền Tây');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT006_N2', 'TM006', 2,
        'Rừng tràm Trà Sư → Chợ nổi Long Xuyên → Làng bội cá Cái Bè',
        'Chèo thuyền dọc rừng tràm buổi sáng. Thăm chợ nổi Long Xuyên. Trở về thăm làng bội cá Cái Bè buổi tối.',
        'Sáng: Bánh xèo miền Tây | Trưa: Cá kho tộ / rau muống | Tối: Lẩu cá linh bông điều');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT006_N3', 'TM006', 3,
        'Chè Ngói → Xe về TP HCM ~ 17h',
        'Thăm làng nghề dệ chè Ngói truyền thống. Mua đặc sản mang về, lên xe trả lại TP HCM.',
        'Sáng: Cơm tấm sườn bì chả | Trưa: Cơm nhà hàng Cần Thơ');

-- TM007: Đà Lạt 2N1Đ
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT007_N1', 'TM007', 1,
        'Sân bay Đà Lạt → Vườn hoa → Thung lũng Tình Yêu → Thác Datanla',
        'Đón khách tại sân bay. Thăm Vườn Hoa Đà Lạt rực rỡ. Thung lũng Tình Yêu lãng mạn. Chiều khám phá Thác Datanla.',
        'Trưa: Bánh ướt lòng gà Đà Lạt | Tối: Lẩu Dê Nướng Đà Lạt');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT007_N2', 'TM007', 2,
        'Hồ Xuân Hương → Chợ Đà Lạt sáng → Sân bay / xe về',
        'Du thuyền hồ Xuân Hương sáng sớm. Dạo Chợ Đà Lạt mua đặc sản: cà phê, dâu tây, atisô. Ra sân bay.',
        'Sáng: Bánh mì Đà Lạt / hủ tiếu | Trưa: Cơm gà Đà Lạt');

-- ------------------------------------------------------------
-- 6. VAITRO — Thêm 1 vai trò mới
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- 7. TAIKHOAN — Thêm 7 tài khoản mới (2 HDV, 1 Sales, 4 KH)
-- ------------------------------------------------------------
INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_HDV03', 'hdv03',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Trần Minh Tuấn', '079099000009', 'hdv03@digitaltravel.vn', '0900000009',
        'HDV', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_HDV04', 'hdv04',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Lý Thị Mai Phương', '079099000010', 'hdv04@digitaltravel.vn', '0900000010',
        'HDV', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_SALES02', 'sales02',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Võ Văn Nam', '079099000011', 'sales02@digitaltravel.vn', '0900000011',
        'KINHDOANH', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH03', 'khachhang03',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyễn Thị Thu Hà', '079099000012', 'kh03@gmail.com', '0900000012',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH04', 'khachhang04',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Phạm Quốc Bảo', '079099000013', 'kh04@gmail.com', '0900000013',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH05', 'khachhang05',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Lê Thị Bích Ngọc', '079099000014', 'kh05@gmail.com', '0900000014',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH06', 'khachhang06',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Trần Văn Hùng', '079099000015', 'kh06@gmail.com', '0900000015',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

-- ------------------------------------------------------------
-- 8. NHANVIEN — Thêm 3 nhân viên mới (2 HDV, 1 Sales)
-- ------------------------------------------------------------
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV03', 'TK_HDV03', 'HDV', DATE '2023-08-01', 'SAN_SANG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV04', 'TK_HDV04', 'HDV', DATE '2024-01-15', 'SAN_SANG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_SALES02', 'TK_SALES02', 'KINHDOANH', DATE '2024-03-01', 'SAN_SANG');

-- ------------------------------------------------------------
-- 9. HOCHIEUSO — Hồ sơ 4 khách hàng mới
-- ------------------------------------------------------------
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH003', 'TK_KH03', 'BAC', 1200);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH004', 'TK_KH04', 'THANH_VIEN', 0);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH005', 'TK_KH05', 'THANH_VIEN', 480);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH006', 'TK_KH06', 'VANG', 3500);

-- ------------------------------------------------------------
-- 10. NANGLUCNHANVIEN — Năng lực 2 HDV mới
-- ------------------------------------------------------------
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV03', 'NV_HDV03',
        'Tiếng Việt, Tiếng Nhật (JLPT N2)',
        'Chứng chỉ HDV quốc tế, Sổ y tế, Chứng chỉ phi thuyền',
        'Miền Trung, Bãi biển, Khám phá hang động',
        4.6, 38);
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV04', 'NV_HDV04',
        'Tiếng Việt, Tiếng Hàn (TOPIK 4)',
        'Chứng chỉ HDV nội địa, Chứng chỉ sơ cấp cứu',
        'Miền Nam, Miền Tây, Ẩm thực địa phương',
        4.4, 21);

-- ------------------------------------------------------------
-- 11. TOURTHUCTE — 6 đợt khởi hành mới
-- ------------------------------------------------------------
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT006', 'TM002', DATE '2026-06-14', 4400000, 20, 8, 18, 'MO_BAN', 'SYSTEM');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT007', 'TM003', DATE '2026-08-20', 6000000, 15, 5,  15, 'CHO_KICH_HOAT', 'SYSTEM');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT008', 'TM005', DATE '2026-05-25', 4500000, 20, 8,  20, 'MO_BAN', 'SYSTEM');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT009', 'TM006', DATE '2026-06-01', 2900000, 25, 10, 23, 'MO_BAN', 'SYSTEM');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT010', 'TM007', DATE '2026-05-17', 1900000, 30, 10, 28, 'MO_BAN', 'SYSTEM');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT098', 'TM002', DATE '2026-01-15', 4200000, 20, 8,  0, 'KET_THUC', 'SYSTEM');

-- ------------------------------------------------------------
-- 12. VOUCHER — Thêm 5 voucher mới
-- ------------------------------------------------------------
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC004', 'GOLD20', 'PHAN_TRAM', 20,
        'Ưu đãi 20% dành riêng thành viên hạng VANG và KIM_CUONG. Đơn tối thiểu 5.000.000 VNĐ.',
        100, 0, DATE '2026-04-01', DATE '2026-12-31', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC005', 'MIENNAM300', 'SO_TIEN', 300000,
        'Giảm 300.000 VNĐ cho tour miền Nam (Cần Thơ, Phú Quốc). Đơn tối thiểu 3.000.000 VNĐ.',
        80, 0, DATE '2026-05-01', DATE '2026-08-31', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC006', 'LOYALTY500', 'SO_TIEN', 500000,
        'Tặng voucher đổi từ 500 điểm xanh. Không giới hạn đơn tối thiểu.',
        500, 0, DATE '2026-01-01', DATE '2026-12-31', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC007', 'HOLIDAY15', 'PHAN_TRAM', 15,
        'Khuyến mãi lễ 30/4 - 1/5. Áp dụng toàn bộ tour. Đơn tối thiểu 2.000.000 VNĐ.',
        200, 12, DATE '2026-04-25', DATE '2026-05-05', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC008', 'CONGE10', 'PHAN_TRAM', 10,
        'Giảm 10% cho tour Côn Đảo. Đơn tối thiểu 6.000.000 VNĐ.',
        30, 0, DATE '2026-06-01', DATE '2026-09-30', 'SAN_SANG', 'SYSTEM');

-- ------------------------------------------------------------
-- 13. KHUYENMAI_KH — Phát hành voucher cho khách hàng
-- ------------------------------------------------------------
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, TrangThai, NgayNhan, NgayHetHan)
VALUES ('KH001', 'VC004', 'SAN_SANG', SYSTIMESTAMP, DATE '2026-12-31');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, TrangThai, NgayNhan, NgayHetHan)
VALUES ('KH003', 'VC004', 'SAN_SANG', SYSTIMESTAMP, DATE '2026-12-31');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, TrangThai, NgayNhan, NgayHetHan)
VALUES ('KH003', 'VC007', 'SAN_SANG', SYSTIMESTAMP, DATE '2026-05-05');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, TrangThai, NgayNhan, NgayHetHan)
VALUES ('KH004', 'VC001', 'SAN_SANG', SYSTIMESTAMP, DATE '2026-12-31');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, TrangThai, NgayNhan, NgayHetHan)
VALUES ('KH005', 'VC003', 'SAN_SANG', SYSTIMESTAMP, DATE '2026-12-31');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, TrangThai, NgayNhan, NgayHetHan)
VALUES ('KH006', 'VC004', 'SAN_SANG', SYSTIMESTAMP, DATE '2026-12-31');
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, TrangThai, NgayNhan, NgayHetHan)
VALUES ('KH006', 'VC006', 'DA_DUNG',  SYSTIMESTAMP - 30, DATE '2026-12-31');

-- ------------------------------------------------------------
-- 14. DONDATTOUR — 8 đơn đặt tour mới
-- ------------------------------------------------------------
-- KH003 đặt TTT008 (Huế-Phong Nha) đã xác nhận
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT003', 'KH003', 'TTT008', 9000000, 'DA_XAC_NHAN', 'SYSTEM');

-- KH004 đặt TTT001 (Hạ Long) chờ xác nhận
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT004', 'KH004', 'TTT001', 3500000, 'CHO_XAC_NHAN', 'SYSTEM');

-- KH005 đặt TTT009 (Miền Tây) đã xác nhận
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT005', 'KH005', 'TTT009', 5800000, 'DA_XAC_NHAN', 'SYSTEM');

-- KH006 đặt TTT010 (Đà Lạt) đã xác nhận
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT006', 'KH006', 'TTT010', 3800000, 'DA_XAC_NHAN', 'SYSTEM');

-- KH001 đặt TTT005 (Sapa) chờ xác nhận
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT007', 'KH001', 'TTT005', 3200000, 'CHO_XAC_NHAN', 'SYSTEM');

-- KH002 đặt TTT006 (Đà Nẵng lần 2) đã xác nhận
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT008', 'KH002', 'TTT006', 4400000, 'DA_XAC_NHAN', 'SYSTEM');

-- KH003 đặt TTT098 (Đà Nẵng kết thúc) đã xác nhận - để test báo cáo
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT097', 'KH003', 'TTT098', 8400000, 'DA_XAC_NHAN', 'SYSTEM');

-- KH006 đặt TTT099 (Hạ Long kết thúc) đã xác nhận - thêm dữ liệu báo cáo
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT098', 'KH006', 'TTT099', 3500000, 'DA_XAC_NHAN', 'SYSTEM');

-- ------------------------------------------------------------
-- 15. CHITIETDATTOUR — Danh sách hành khách trong đơn đặt
-- ------------------------------------------------------------
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaLoaiPhong, GiaTaiThoiDiemDat)
VALUES ('CTDT001', 'DDT001', 'KH001', 'LP002', 3700000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaLoaiPhong, GiaTaiThoiDiemDat)
VALUES ('CTDT002', 'DDT003', 'KH003', 'LP004', 4500000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaLoaiPhong, GiaTaiThoiDiemDat)
VALUES ('CTDT003', 'DDT005', 'KH005', 'LP001', 2900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaLoaiPhong, GiaTaiThoiDiemDat)
VALUES ('CTDT004', 'DDT006', 'KH006', 'LP002', 1900000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaLoaiPhong, GiaTaiThoiDiemDat)
VALUES ('CTDT005', 'DDT008', 'KH002', 'LP003', 4400000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaLoaiPhong, GiaTaiThoiDiemDat)
VALUES ('CTDT097', 'DDT097', 'KH003', 'LP004', 5200000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaLoaiPhong, GiaTaiThoiDiemDat)
VALUES ('CTDT098', 'DDT098', 'KH006', 'LP001', 3500000);
INSERT INTO CHITIETDATTOUR (MaChiTietDat, MaDatTour, MaKhachHang, MaLoaiPhong, GiaTaiThoiDiemDat)
VALUES ('CTDT099', 'DDT099', 'KH001', 'LP002', 3500000);

-- ------------------------------------------------------------
-- 16. CHITIETDICHVU — Dịch vụ bổ sung theo đơn đặt
-- ------------------------------------------------------------
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV001', 'DDT001', 'DV002', 2, 80000,  160000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV002', 'DDT001', 'DV003', 1, 250000, 250000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV003', 'DDT003', 'DV002', 1, 80000,  80000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV004', 'DDT003', 'DV008', 1, 500000, 500000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV005', 'DDT005', 'DV001', 2, 150000, 300000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV006', 'DDT006', 'DV006', 2, 350000, 700000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV007', 'DDT097', 'DV002', 2, 80000,  160000);
INSERT INTO CHITIETDICHVU (MaChiTietDichVu, MaDatTour, MaDichVuThem, SoLuong, DonGia, ThanhTien)
VALUES ('CTDV008', 'DDT097', 'DV005', 1, 200000, 200000);

-- ------------------------------------------------------------
-- 17. DATTOUR_UUDAI — Lịch sử áp dụng voucher vào đơn đặt
-- ------------------------------------------------------------
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai, NgayApDung)
VALUES ('DDT003', 'VC004', 1800000, SYSTIMESTAMP - 5);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai, NgayApDung)
VALUES ('DDT005', 'VC005', 300000,  SYSTIMESTAMP - 3);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai, NgayApDung)
VALUES ('DDT006', 'VC007', 570000,  SYSTIMESTAMP - 2);
INSERT INTO DATTOUR_UUDAI (MaDatTour, MaVoucher, SoTienUuDai, NgayApDung)
VALUES ('DDT008', 'VC002', 500000,  SYSTIMESTAMP - 1);

-- ------------------------------------------------------------
-- 18. GIAODICH — Giao dịch thanh toán mới
-- ------------------------------------------------------------
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai, NgayThanhToan)
VALUES ('GD002', 'DDT003', 9000000, 'THANH_TOAN', 'CHUYEN_KHOAN', 'THANH_CONG', SYSTIMESTAMP - 5);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai, NgayThanhToan)
VALUES ('GD003', 'DDT005', 5800000, 'THANH_TOAN', 'THE_VISA',     'THANH_CONG', SYSTIMESTAMP - 3);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai, NgayThanhToan)
VALUES ('GD004', 'DDT006', 3800000, 'THANH_TOAN', 'THE_ATM',      'THANH_CONG', SYSTIMESTAMP - 2);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai, NgayThanhToan)
VALUES ('GD005', 'DDT008', 4400000, 'THANH_TOAN', 'CHUYEN_KHOAN', 'THANH_CONG', SYSTIMESTAMP - 1);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai)
VALUES ('GD006', 'DDT004', 3500000, 'THANH_TOAN', 'CHUYEN_KHOAN', 'CHO_THANH_TOAN');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai, NgayThanhToan)
VALUES ('GD097', 'DDT097', 8400000, 'THANH_TOAN', 'CHUYEN_KHOAN', 'THANH_CONG', SYSTIMESTAMP - 90);
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai, NgayThanhToan)
VALUES ('GD098', 'DDT098', 3500000, 'THANH_TOAN', 'THE_VISA',     'THANH_CONG', SYSTIMESTAMP - 70);

-- ------------------------------------------------------------
-- 19. PHANCONGTOUR — Phân công HDV vào tour
-- ------------------------------------------------------------
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, TrangThai, TaoBoi)
VALUES ('PCT001', 'TTT001', 'NV_HDV01', 'DA_XAC_NHAN', 'SYSTEM');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, TrangThai, TaoBoi)
VALUES ('PCT002', 'TTT003', 'NV_HDV02', 'DA_XAC_NHAN', 'SYSTEM');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, TrangThai, TaoBoi)
VALUES ('PCT003', 'TTT005', 'NV_HDV01', 'CHO_XAC_NHAN', 'SYSTEM');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, TrangThai, TaoBoi)
VALUES ('PCT004', 'TTT008', 'NV_HDV03', 'DA_XAC_NHAN', 'SYSTEM');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, TrangThai, TaoBoi)
VALUES ('PCT005', 'TTT009', 'NV_HDV04', 'DA_XAC_NHAN', 'SYSTEM');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, TrangThai, TaoBoi)
VALUES ('PCT006', 'TTT010', 'NV_HDV02', 'DA_XAC_NHAN', 'SYSTEM');
-- Phân công cho tour đã kết thúc để test điểm danh / hành động xanh
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, TrangThai, TaoBoi)
VALUES ('PCT097', 'TTT098', 'NV_HDV02', 'DA_XAC_NHAN', 'SYSTEM');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, TrangThai, TaoBoi)
VALUES ('PCT099', 'TTT099', 'NV_HDV01', 'DA_XAC_NHAN', 'SYSTEM');

-- ------------------------------------------------------------
-- 20. LICHSUTOUR — Lịch sử tour đã hoàn thành
-- ------------------------------------------------------------
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LS002', 'KH003', 'TTT098', 'CTDT097', DATE '2026-01-15');
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LS003', 'KH006', 'TTT099', 'CTDT098', DATE '2026-02-10');

-- ------------------------------------------------------------
-- 21. DIEMDANH — Điểm danh khách trong tour (cho tour đã có PCT)
-- ------------------------------------------------------------
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNhanVien, ThoiGian, DiaDiem)
VALUES ('DD001', 'TTT099', 'KH001', 'NV_HDV01',
        TIMESTAMP '2026-02-10 07:30:00', 'Bến xe Mỹ Đình - Hà Nội');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNhanVien, ThoiGian, DiaDiem)
VALUES ('DD002', 'TTT099', 'KH006', 'NV_HDV01',
        TIMESTAMP '2026-02-10 07:35:00', 'Bến xe Mỹ Đình - Hà Nội');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNhanVien, ThoiGian, DiaDiem)
VALUES ('DD003', 'TTT098', 'KH003', 'NV_HDV02',
        TIMESTAMP '2026-01-15 08:00:00', 'Sân bay Đà Nẵng');

-- ------------------------------------------------------------
-- 22. HANHDONG — Ghi nhận hành động xanh trong tour
-- ------------------------------------------------------------
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD001', 'TTT099', 'KH001', 'HDX001', 'NV_HDV01',
        TIMESTAMP '2026-02-11 09:00:00', 'Hình chụp bình nước tái sử dụng của khách');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD002', 'TTT099', 'KH001', 'HDX003', 'NV_HDV01',
        TIMESTAMP '2026-02-11 15:30:00', 'Khách tham gia dọn rác tại bãi biển Hạ Long');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD003', 'TTT099', 'KH006', 'HDX002', 'NV_HDV01',
        TIMESTAMP '2026-02-12 10:00:00', 'Khách từ chối túi nhựa, sử dụng túi vải');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD004', 'TTT098', 'KH003', 'HDX005', 'NV_HDV02',
        TIMESTAMP '2026-01-16 08:00:00', 'Khách mượn xe đạp khám phá Hội An');

-- ------------------------------------------------------------
-- 23. NHATKYSUCO — Nhật ký sự cố trong tour
-- ------------------------------------------------------------
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, TrangThai)
VALUES ('NKSC001', 'TTT099', 'NV_HDV01',
        'Một khách bị say sóng nhẹ khi đi thuyền qua vùng nước lớn.',
        'Đã cấp thuốc say sóng dự phòng cho khách. Khách hồi phục sau 30 phút nghỉ ngơi.',
        'DA_DONG');
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, TrangThai)
VALUES ('NKSC002', 'TTT098', 'NV_HDV02',
        'Xe du lịch bị thủng bánh giữa đường trên cự Sân Bay Đà Nẵng.',
        'Liên hệ hãng xe cấp xe thay thế. Hành trình bị trễ 45 phút.',
        'DA_DONG');
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, TrangThai)
VALUES ('NKSC003', 'TTT008', 'NV_HDV03',
        'Nhà hàng đổi bữa ăn tối từ lẩu nướng sang cơm bình thường do có sự cố bếp.',
        'Đã bồi thường phần chênh lệch chi phí, xin lỗi khách, ghi nhận phản ánh với đối tác.',
        'DANG_XU_LY');

-- ------------------------------------------------------------
-- 24. CHIPHITHUCTE — Chi phí thực tế HDV khai báo
-- ------------------------------------------------------------
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT001', 'TTT099', 'NV_HDV01', 'Mua thuốc say sóng cấp cứu', 85000, 'DA_DUYET');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT002', 'TTT099', 'NV_HDV01', 'Phí cảng du thuyền phát sinh', 150000, 'DA_DUYET');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT003', 'TTT098', 'NV_HDV02', 'Bồi thường chênh lệch bữa ăn tối', 480000, 'DA_DUYET');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT004', 'TTT098', 'NV_HDV02', 'Nước uống và khăn lạnh cho khách trên xe', 120000, 'DA_DUYET');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT005', 'TTT008', 'NV_HDV03', 'Vé tham quan phát sinh - Khe Nước Trong', 350000, 'CHO_DUYET');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT006', 'TTT003', 'NV_HDV01', 'Phí đưa đón khách sân bay phát sinh', 200000, 'CHO_DUYET');

-- ------------------------------------------------------------
-- 25. QUYETTOAN — Quyết toán tài chính cho tour đã kết thúc
-- ------------------------------------------------------------
-- TTT099: Hạ Long kết thúc (doanh thu: DDT001 7tr + DDT099 7tr + DDT098 3.5tr = 17.5tr)
INSERT INTO QUYETTOAN (MaQuyetToan, MaTourThucTe, TongDoanhThu, TongChiPhi, LoiNhuan, MaNhanVien, TrangThai, TaoBoi)
VALUES ('QT001', 'TTT099', 17500000, 2350000, 15150000, 'NV_KT01', 'DA_CHOT', 'SYSTEM');
-- TTT098: Đà Nẵng kết thúc (doanh thu: DDT097 8.4tr)
INSERT INTO QUYETTOAN (MaQuyetToan, MaTourThucTe, TongDoanhThu, TongChiPhi, LoiNhuan, MaNhanVien, TrangThai, TaoBoi)
VALUES ('QT002', 'TTT098', 8400000, 1800000, 6600000, 'NV_KT01', 'DA_CHOT', 'SYSTEM');

-- ------------------------------------------------------------
-- 26. NHATKYDOIDIEM — Đổi điểm xanh sang voucher
-- ------------------------------------------------------------
INSERT INTO NHATKYDOIDIEM (MaNhatKyDoiDiem, MaKhachHang, MaVoucher, DiemQuyDoi, NgayQuyDoi)
VALUES ('NKDD001', 'KH006', 'VC006', 500, SYSTIMESTAMP - 30);
INSERT INTO NHATKYDOIDIEM (MaNhatKyDoiDiem, MaKhachHang, MaVoucher, DiemQuyDoi, NgayQuyDoi)
VALUES ('NKDD002', 'KH003', 'VC006', 500, SYSTIMESTAMP - 10);

-- ------------------------------------------------------------
-- 27. YEUCAUHOTRO — Ticket hỗ trợ / khiếu nại
-- ------------------------------------------------------------
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT001', 'DDT001', 'KH001', 'KHIEU_NAI',
        'Cabin trên tàu không có nước nóng buổi sáng ngày 1. Mong công ty hỗ trợ phần bồi thường.',
        'DA_DONG', 'NV_SALES01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT002', 'DDT003', 'KH003', 'THONG_TIN',
        'Xin hỏi lịch trình ngày 2 tại Phong Nha có thể đổi sang hang động Thiên Đường không?',
        'DA_DONG', 'NV_SALES01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT003', 'DDT005', 'KH005', 'HO_TRO_VE',
        'Cần xuất hóa đơn VAT cho công ty để thanh toán chi phí công tác.',
        'DANG_XU_LY', 'NV_SALES02');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT004', NULL, 'KH004', 'TU_VAN_TOUR',
        'Cần tư vấn tour phù hợp cho gia đình 4 người (2 người lớn, 2 trẻ em dưới 10 tuổi) dịp hè tháng 7.',
        'MOI_TAO', NULL);
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT005', 'DDT006', 'KH006', 'HUY_TOUR',
        'Yêu cầu hủy tour Đà Lạt do có việc đột xuất. Mong được hoàn tiền theo chính sách.',
        'MOI_TAO', NULL);

-- ------------------------------------------------------------
-- 28. DANHGIAKH — Đánh giá sau tour
-- ------------------------------------------------------------
-- Yêu cầu: FK_DGKH_LichSuTour: (MaKhachHang, MaTourThucTe) phải có trong LICHSUTOUR
-- KH001 + TTT099 có trong LS001; KH003 + TTT098 có trong LS002; KH006 + TTT099 có trong LS003
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, TrangThai)
VALUES ('DG002', 'TTT098', 'KH003', 4,
        'Tour miền Trung rất thú vị, HDV nhiệt tình. Tuy nhiên xe bị thủng bánh khiến hành trình trễ. Vẫn sẽ giới thiệu bạn bè.', 'HIEU_LUC');
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, TrangThai)
VALUES ('DG003', 'TTT099', 'KH006', 5,
        'Tuyệt vời! Hạ Long đẹp hơn những gì tôi tưởng tượng. HDV Hoàng Văn Hướng Dẫn rất chuyên nghiệp, sáng tạo nhiều trò chơi hay cho khách.', 'HIEU_LUC');

COMMIT;
-- ============================================================
-- END SEED DATA v2
-- ============================================================
