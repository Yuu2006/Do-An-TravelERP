-- ============================================================
-- SEED DATA — Tài khoản nhân viên
-- Phạm vi    : Vai trò, tài khoản nhân viên, hồ sơ nhân viên
-- Mật khẩu mặc định cho tất cả tài khoản: password
-- BCrypt(cost=10): $2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK
-- ============================================================

-- ------------------------------------------------------------
-- 1. VAITRO — Vai trò hệ thống
-- ------------------------------------------------------------
INSERT INTO VAITRO (MaVaiTro, TenHienThi) VALUES ('ADMIN',      'Quản trị hệ thống');
INSERT INTO VAITRO (MaVaiTro, TenHienThi) VALUES ('SANPHAM',    'Nhân viên sản phẩm');
INSERT INTO VAITRO (MaVaiTro, TenHienThi) VALUES ('KINHDOANH',  'Nhân viên kinh doanh');
INSERT INTO VAITRO (MaVaiTro, TenHienThi) VALUES ('DIEUHANH',   'Nhân viên điều hành');
INSERT INTO VAITRO (MaVaiTro, TenHienThi) VALUES ('KETOAN',     'Kế toán');
INSERT INTO VAITRO (MaVaiTro, TenHienThi) VALUES ('HDV',        'Hướng dẫn viên');
INSERT INTO VAITRO (MaVaiTro, TenHienThi) VALUES ('KHACHHANG',  'Khách hàng');

-- ------------------------------------------------------------
-- 2. TAIKHOAN — Tài khoản nhân viên hệ thống
-- ------------------------------------------------------------
INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_ADMIN01', 'admin',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Admin', '079099000001', DATE '1988-01-12', 'admin@digitaltravel.vn', '0900000001',
        'ADMIN', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_MGR01', 'manager01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Lê Hoàng Phú', '079099000002', DATE '1990-03-08', 'dieuhanh01@digitaltravel.vn', '0900000002',
        'DIEUHANH', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_SP01', 'sanpham01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyễn Tuấn Anh', '079099000099', DATE '1992-06-18', 'sanpham01@digitaltravel.vn', '0900000099',
        'SANPHAM', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_SALES01', 'sales01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyễn Hoàng An', '079099000003', DATE '1989-09-21', 'kinhdoanh01@digitaltravel.vn', '0900000003',
        'KINHDOANH', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_KT01', 'ketoan01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Lê Thị Thanh Tiền', '079099000004', DATE '1991-12-02', 'ketoan01@digitaltravel.vn', '0900000004',
        'KETOAN', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_HDV01', 'hdv01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyễn Hoàng An', '079099000005', DATE '1987-04-15', 'hdv01@digitaltravel.vn', '0900000005',
        'HDV', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_HDV02', 'hdv02',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyễn Thị Hương', '079099000006', DATE '1993-07-27', 'hdv02@digitaltravel.vn', '0900000006',
        'HDV', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_HDV03', 'hdv03',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Trần Minh Quân', '079099000007', DATE '1990-10-05', 'hdv03@digitaltravel.vn', '0900000007',
        'HDV', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_HDV04', 'hdv04',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Phạm Thu Trang', '079099000008', DATE '1994-02-19', 'hdv04@digitaltravel.vn', '0900000008',
        'HDV', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_HDV05', 'hdv05',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Lê Quốc Bảo', '079099000009', DATE '1988-12-11', 'hdv05@digitaltravel.vn', '0900000009',
        'HDV', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_HDV06', 'hdv06',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Đỗ Mai Anh', '079099000010', DATE '1992-06-03', 'hdv06@digitaltravel.vn', '0900000010',
        'HDV', 'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES ('TK_HDV07', 'hdv07',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Võ Hải Nam', '079099000011', DATE '1991-08-24', 'hdv07@digitaltravel.vn', '0900000011',
        'HDV', 'HOAT_DONG');

-- ------------------------------------------------------------
-- 3. NHANVIEN — Hồ sơ nhân viên nội bộ
-- ------------------------------------------------------------
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_ADMIN01',  'TK_ADMIN01',  'ADMIN',     DATE '2022-01-01', 'HOAT_DONG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_MGR01',    'TK_MGR01',    'DIEUHANH',  DATE '2022-01-15', 'HOAT_DONG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_SP01',     'TK_SP01',     'SANPHAM',   DATE '2022-02-01', 'HOAT_DONG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_SALES01',  'TK_SALES01',  'KINHDOANH', DATE '2023-03-01', 'HOAT_DONG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_KT01',     'TK_KT01',     'KETOAN',    DATE '2023-06-01', 'HOAT_DONG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV01',    'TK_HDV01',    'HDV',       DATE '2021-09-15', 'HOAT_DONG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV02',    'TK_HDV02',    'HDV',       DATE '2022-05-10', 'HOAT_DONG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV03',    'TK_HDV03',    'HDV',       DATE '2020-08-20', 'HOAT_DONG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV04',    'TK_HDV04',    'HDV',       DATE '2023-01-12', 'HOAT_DONG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV05',    'TK_HDV05',    'HDV',       DATE '2019-04-18', 'HOAT_DONG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV06',    'TK_HDV06',    'HDV',       DATE '2021-11-01', 'HOAT_DONG');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV07',    'TK_HDV07',    'HDV',       DATE '2022-09-05', 'HOAT_DONG');

-- ------------------------------------------------------------
-- 4. NANGLUCNHANVIEN — Đánh giá và năng lực
-- ------------------------------------------------------------
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NLNV_HDV01', 'NV_HDV01', 'Tiếng Anh, Tiếng Pháp', 'Thẻ HDV Quốc tế, Sơ cấp cứu', 'Lịch sử, Văn hóa, Ẩm thực', 4.8, 126);

INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NLNV_HDV02', 'NV_HDV02', 'Tiếng Anh, Tiếng Trung', 'Thẻ HDV Quốc tế', 'Mua sắm, Ẩm thực', 4.5, 89);

INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NLNV_HDV03', 'NV_HDV03', 'Tiếng Việt, Tiếng Anh, Tiếng Nhật', 'Thẻ HDV Quốc tế, Sơ cấp cứu nâng cao', 'Trekking, du lịch mạo hiểm, Tây Bắc', 4.9, 151);

INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NLNV_HDV04', 'NV_HDV04', 'Tiếng Việt, Tiếng Anh, Tiếng Hàn', 'Thẻ HDV Nội địa, chứng nhận thuyết minh di sản', 'Di sản miền Trung, gia đình, ẩm thực địa phương', 4.6, 73);

INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NLNV_HDV05', 'NV_HDV05', 'Tiếng Việt, Tiếng Pháp', 'Thẻ HDV Quốc tế, PADI Open Water', 'Biển đảo, lặn biển cơ bản, khách châu Âu', 4.7, 118);

INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NLNV_HDV06', 'NV_HDV06', 'Tiếng Việt, Tiếng Anh', 'Thẻ HDV Nội địa, sơ cứu trẻ em', 'Tour gia đình, chăm sóc trẻ em, team building', 4.8, 104);

INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NLNV_HDV07', 'NV_HDV07', 'Tiếng Việt, Tiếng Anh, Tiếng Đức', 'Thẻ HDV Quốc tế, chứng chỉ điều phối đoàn lớn', 'Du lịch xanh, MICE, quản trị rủi ro hiện trường', 4.6, 96);

COMMIT;
-- ============================================================
-- END SEED DATA
-- ============================================================
