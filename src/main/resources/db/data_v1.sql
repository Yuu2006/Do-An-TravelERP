-- ============================================================
-- SEED DATA — Dữ liệu mẫu khởi tạo (catalog + master data)
-- Phạm vi    : Các bảng danh mục + tài khoản hệ thống
-- Mật khẩu mặc định cho tất cả tài khoản: password
-- BCrypt hash (cost 10): $2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lh32
-- CHÚ Ý: Đổi mật khẩu ngay sau lần đăng nhập đầu tiên trên Production!
-- ============================================================

-- ------------------------------------------------------------
-- 1. LOAIPHONG — Danh mục loại phòng / phụ thu
-- ------------------------------------------------------------
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP001', 'Phòng đơn (Single)',             0,       'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP002', 'Phòng đôi (Twin / Double)',      200000,  'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP003', 'Phòng ba (Triple)',              350000,  'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP004', 'Phòng Deluxe',                  800000,  'HOAT_DONG');

-- ------------------------------------------------------------
-- 2. DICHVUTHEM — Danh mục dịch vụ bổ sung
-- ------------------------------------------------------------
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV001', 'Vé tham quan thêm',            'Lượt/người',  150000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV002', 'Bảo hiểm du lịch',             'Người',        80000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV003', 'Đón/trả sân bay',              'Chuyến',      250000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV004', 'Bổ sung bữa ăn tối đặc sản',   'Người',       120000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV005', 'Cho thuê máy ảnh / máy quay',  'Ngày',        200000, 'HOAT_DONG');

-- ------------------------------------------------------------
-- 3. HANHDONGXANH — Cấu hình hành động xanh cộng điểm loyalty
-- ------------------------------------------------------------
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX001', 'Mang bình nước tái sử dụng',              50,  'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX002', 'Không dùng đồ nhựa dùng một lần',         80,  'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX003', 'Tham gia dọn rác môi trường tại điểm đến',150,  'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX004', 'Trồng cây / phục hồi hệ sinh thái',       200,  'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX005', 'Mượn xe đạp thay xe máy',                 100,  'HOAT_DONG');

-- ------------------------------------------------------------
-- 4. TOURMAU — Tour mẫu (template sản phẩm)
-- ------------------------------------------------------------
INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM001', 'Khám phá Hạ Long - Cát Bà 3N2Đ',
        'Vịnh Hạ Long kỳ vĩ kết hợp đảo Cát Bà hùng vĩ. Trải nghiệm ngủ trên tàu đêm, chèo kayak qua hang động, khám phá rừng quốc gia Cát Bà.',
        3, 3500000, 4.5, 128, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM002', 'Đà Nẵng - Hội An - Bà Nà Hills 4N3Đ',
        'Hành trình miền Trung: bãi biển Mỹ Khê, phố cổ Hội An lung linh ánh đèn, Bà Nà Hills với Cầu Vàng biểu tượng.',
        4, 4200000, 4.7, 215, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM003', 'Phú Quốc Nghỉ Dưỡng Biển Đảo 5N4Đ',
        'Nghỉ dưỡng biển đảo Phú Quốc: bãi Trường, bãi Sao, khám phá nhà tù Phú Quốc, hòn đảo An Thới, làng chài trên biển.',
        5, 5800000, 4.8, 302, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM004', 'Sapa - Bắc Hà Mây Mờ Trekking 3N2Đ',
        'Trekking bản làng người H''Mông, chợ tình Bắc Hà họp ngày chủ nhật, ngắm ruộng bậc thang Mù Cang Chải.',
        3, 3200000, 4.4, 87, 'HOAT_DONG', 'SYSTEM');

-- ------------------------------------------------------------
-- 5. LICHTRINHTOUR — Lịch trình theo ngày
-- ------------------------------------------------------------
-- TM001: Hạ Long - Cát Bà 3N2Đ
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT001_N1', 'TM001', 1,
        'Hà Nội → Hạ Long → Lên tàu → Hang Đầu Gỗ → Hang Thiên Cung',
        'Xe limousine khởi hành 7:30 từ Mỹ Đình. Đón khách tại cảng Hạ Long ~12h. Check-in cabin, ăn trưa trên tàu. Tham quan hang động nằm trong Top 10 thế giới.',
        'Trưa: Hải sản tươi trên tàu | Tối: Buffet tươi sống');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT001_N2', 'TM001', 2,
        'Sáng: Chèo kayak - Đảo Cát Bà | Chiều: Tự do khám phá bãi biển',
        'Tập Tai Chi trên tàu lúc bình minh. Chèo kayak qua vùng Tùng Cung. Đi bộ nhẹ rừng quốc gia Cát Bà. Buổi chiều tự do tại bãi biển.',
        'Sáng: Buffet Châu Á | Trưa: Bento trên thuyền | Tối: Cơm nhà hàng địa phương');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT001_N3', 'TM001', 3,
        'Bơi lội sáng buổi sáng → Trả phòng → Xe về Hà Nội ~17h',
        'Dùng cà phê sáng ngắm bầu trời Hạ Long. Trả phòng, xe đưa về Hà Nội.',
        'Sáng: Bánh bao, cháo, hoa quả | Trưa: Cơm nhà hàng tại cảng');

-- TM002: Đà Nẵng - Hội An - Bà Nà Hills 4N3Đ
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT002_N1', 'TM002', 1,
        'Sân bay Đà Nẵng → Nhận phòng → Bà Nà Hills → Cầu Vàng',
        'Đón tại sân bay. Nghỉ ngơi. Chiều khám phá Bà Nà Hills: Cầu Vàng, làng cổ Pháp, hội chợ ẩm thực ban đêm.',
        'Trưa: Tự túc | Tối: Lẩu nướng Đà Nẵng');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT002_N2', 'TM002', 2,
        'Phố cổ Hội An → Thuyền sông Hoài → Đêm Hội An',
        'Khám phá phố cổ Hội An: Chợ Hội An, Cầu Nhật Bản, Hội quán Phúc Kiến. Thử thuyền xuôi sông Hoài.',
        'Sáng: Cao lầu / Mì Quảng | Trưa: Cơm Hội An | Tối: Bữa tối thư thiện trên sông');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT002_N3', 'TM002', 3,
        'Bãi biển Mỹ Khê → Ngũ Hành Sơn → Bảo tàng Chăm',
        'Bơi biển Mỹ Khê sáng sớm. Tham quan Ngũ Hành Sơn, chùa chiền. Bảo tàng Điêu khắc Chăm Pa buổi chiều.',
        'Sáng: Bánh mì Hội An | Trưa: Hải sản | Tối: Bún chả cá Đà Nẵng');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT002_N4', 'TM002', 4,
        'Tự do mua sắm chợ Hàn → Ra sân bay → Kết thúc',
        'Sáng tự do mua sắm tại chợ Hàn. Trả phòng, ra sân bay Đà Nẵng.',
        'Sáng: Bánh tráng cuốn thịt heo');

-- ------------------------------------------------------------
-- 6. TAIKHOAN — Tài khoản hệ thống (mật khẩu: password)
-- BCrypt(cost=10,"password")=$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK
-- ------------------------------------------------------------
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('ADMIN',      'Quản trị hệ thống',    'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('SANPHAM',    'Nhân viên sản phẩm',   'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('KINHDOANH',  'Nhân viên kinh doanh', 'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('DIEUHANH',   'Nhân viên điều hành',  'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('KETOAN',     'Kế toán',              'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('HDV',        'Hướng dẫn viên',       'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('KHACHHANG',  'Khách hàng',           'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_ADMIN01', 'admin',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyễn Văn Admin', '079099000001', 'admin@digitaltravel.vn', '0900000001',
        'ADMIN', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_MGR01', 'manager01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Trần Thị Điều Hành', '079099000002', 'dieuhanh01@digitaltravel.vn', '0900000002',
        'DIEUHANH', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_SP01', 'sanpham01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyễn Thị Sản Phẩm', '079099000099', 'sanpham01@digitaltravel.vn', '0900000099',
        'SANPHAM', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_SALES01', 'sales01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Lê Văn Kinh Doanh', '079099000003', 'kinhdoanh01@digitaltravel.vn', '0900000003',
        'KINHDOANH', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KT01', 'ketoan01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Phạm Thị Kế Toán', '079099000004', 'ketoan01@digitaltravel.vn', '0900000004',
        'KETOAN', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_HDV01', 'hdv01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Hoàng Văn Hướng Dẫn', '079099000005', 'hdv01@digitaltravel.vn', '0900000005',
        'HDV', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_HDV02', 'hdv02',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyễn Thị Hương', '079099000006', 'hdv02@digitaltravel.vn', '0900000006',
        'HDV', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH01', 'khachhang01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Bùi Thị Khách Hàng', '079099000007', 'kh01@gmail.com', '0900000007',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH02', 'khachhang02',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Đinh Văn Khách Hàng', '079099000008', 'kh02@gmail.com', '0900000008',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

-- ------------------------------------------------------------
-- 7. NHANVIEN — Hồ sơ nhân viên nội bộ
-- ------------------------------------------------------------
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_ADMIN01',  'TK_ADMIN01',  'ADMIN',     DATE '2022-01-01', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_MGR01',    'TK_MGR01',    'DIEUHANH',  DATE '2022-01-15', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_SP01',     'TK_SP01',     'SANPHAM',   DATE '2022-02-01', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_SALES01',  'TK_SALES01',  'KINHDOANH', DATE '2023-03-01', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_KT01',     'TK_KT01',     'KETOAN',    DATE '2023-06-01', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV01',    'TK_HDV01',    'HDV',       DATE '2021-09-15', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV02',    'TK_HDV02',    'HDV',       DATE '2022-05-10', 'AVAILABLE');

-- ------------------------------------------------------------
-- 8. HOCHIEUSO — Hồ sơ khách hàng
-- ------------------------------------------------------------
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH001', 'TK_KH01', 'BAC',    350);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH002', 'TK_KH02', 'CO_BAN',   0);

-- ------------------------------------------------------------
-- 9. NANGLUCNHANVIEN — Năng lực / chứng chỉ HDV
-- ------------------------------------------------------------
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV01', 'NV_HDV01',
        'Tiếng Việt, Tiếng Anh (IELTS 7.0)',
        'Chứng chỉ HDV quốc tế, Sổ y tế, WSET Level 2',
        'Miền Bắc, Du thuyền, Eco-tour',
        4.7, 95);
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV02', 'NV_HDV02',
        'Tiếng Việt, Tiếng Trung (HSK 5)',
        'Chứng chỉ HDV nội địa, Sổ y tế',
        'Miền Trung, Phố cổ, Ẩm thực',
        4.5, 62);

-- ------------------------------------------------------------
-- 10. TOURTHUCTE — Đợt khởi hành cụ thể
-- ------------------------------------------------------------
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT001', 'TM001', DATE '2026-05-10', 3500000, 25, 10, 25, 'MO_BAN',        'SYSTEM');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT002', 'TM001', DATE '2026-06-07', 3700000, 30, 10, 30, 'MO_BAN',        'SYSTEM');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT003', 'TM002', DATE '2026-05-20', 4200000, 20, 8,  20, 'MO_BAN',        'SYSTEM');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT004', 'TM003', DATE '2026-07-15', 5800000, 20, 5,  20, 'CHO_KICH_HOAT', 'SYSTEM');
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT005', 'TM004', DATE '2026-05-30', 3200000, 15, 6,  15, 'MO_BAN',        'SYSTEM');

-- ------------------------------------------------------------
-- 11. VOUCHER — Chương trình ưu đãi mẫu
-- ------------------------------------------------------------
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC001', 'WELCOME10', 'PHAN_TRAM', 10,
        'Giảm 10% cho khách đặt tour lần đầu. Đơn tối thiểu 3.000.000 VNĐ.',
        100, 0, DATE '2026-04-01', DATE '2026-12-31', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC002', 'SUMMER500K', 'SO_TIEN', 500000,
        'Giảm 500.000 VNĐ cho tour khởi hành tháng 5–7/2026. Đơn tối thiểu 4.000.000 VNĐ.',
        50, 0, DATE '2026-05-01', DATE '2026-07-31', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC003', 'BAC15', 'PHAN_TRAM', 15,
        'Ưu đãi 15% dành riêng thành viên hạng Bạc trở lên. Đơn tối thiểu 5.000.000 VNĐ.',
        200, 0, DATE '2026-04-01', DATE '2026-12-31', 'SAN_SANG', 'SYSTEM');

-- ------------------------------------------------------------
-- 12. KHUYENMAI_KH — Phát hành voucher cho khách hàng
-- ------------------------------------------------------------
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, TrangThai, NgayNhan, NgayHetHan)
VALUES ('KH001', 'VC003', 'SAN_SANG', SYSTIMESTAMP, DATE '2026-12-31');

INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, TrangThai, NgayNhan, NgayHetHan)
VALUES ('KH002', 'VC001', 'SAN_SANG', SYSTIMESTAMP, DATE '2026-12-31');

-- ------------------------------------------------------------
-- 13. TOURTHUCTE bổ sung — 1 tour KẾT THÚC để test báo cáo
-- ------------------------------------------------------------
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT099', 'TM001', DATE '2026-02-10', 3500000, 20, 8, 0, 'KET_THUC', 'SYSTEM');

-- ------------------------------------------------------------
-- 14. DONDATTOUR — Đơn đặt tour mẫu
-- ------------------------------------------------------------
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT001', 'KH001', 'TTT001', 7000000, 'DA_XAC_NHAN', 'SYSTEM');

INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT002', 'KH002', 'TTT003', 4200000, 'CHO_XAC_NHAN', 'SYSTEM');

INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT099', 'KH001', 'TTT099', 7000000, 'DA_XAC_NHAN', 'SYSTEM');

-- ------------------------------------------------------------
-- 15. LICHSUTOUR — Lịch sử tour đã hoàn thành
-- ------------------------------------------------------------
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, NgayThamGia)
VALUES ('LS001', 'KH001', 'TTT099', DATE '2026-02-10');

-- ------------------------------------------------------------
-- 16. DANHGIAKH — Đánh giá tour đã hoàn thành
-- ------------------------------------------------------------
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaKhachHang, MaTourThucTe, SoSao, NhanXet, TrangThai)
VALUES ('DG001', 'KH001', 'TTT099', 5, 'Tour rất tốt, HDV nhiệt tình, dịch vụ chuẩn.', 'HIEU_LUC');

-- ------------------------------------------------------------
-- 17. GIAODICH — Giao dịch thanh toán mẫu
-- ------------------------------------------------------------
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai)
VALUES ('GD001', 'DDT001', 7000000, 'THANH_TOAN', 'CHUYEN_KHOAN', 'THANH_CONG');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai)
VALUES ('GD099', 'DDT099', 7000000, 'THANH_TOAN', 'CHUYEN_KHOAN', 'THANH_CONG');
-- Giao dịch hoàn tiền cho test UC52
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai)
VALUES ('GD_HOA01', 'DDT002', 4200000, 'HOAN_TIEN', 'CHUYEN_KHOAN', 'CHO_THANH_TOAN');

COMMIT;
-- ============================================================
-- END SEED DATA
-- ============================================================
