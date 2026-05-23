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

COMMIT;
-- ============================================================
-- END SEED DATA
-- ============================================================
