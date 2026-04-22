-- ============================================================
-- SEED DATA v2 — Du lieu bo sung (5-10 ban ghi moi tung bang)
-- Ke thua tu data_v1.sql, khong trung PK
-- Mat khau mac dinh: password
-- BCrypt(cost=10): $2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK
-- ============================================================

-- ------------------------------------------------------------
-- 1. LOAIPHONG — them 4 loai phong moi
-- ------------------------------------------------------------
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP005', 'Phong Suite', 1500000, 'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP006', 'Phong Gia Dinh (Family)', 600000, 'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP007', 'Phong Bungalow Bien', 2000000, 'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP008', 'Phong Ky Tuc Xa (Dorm)', 0, 'KHOA');

-- ------------------------------------------------------------
-- 2. DICHVUTHEM — them 5 dich vu bo sung moi
-- ------------------------------------------------------------
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV006', 'Massage thu gian toan than', 'Gio', 350000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV007', 'Cho thue xe may kham pha', 'Ngay', 180000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV008', 'Goi chup anh chuyen nghiep', 'Buoi', 500000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV009', 'Bua sang room service', 'Nguoi/ngay', 95000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV010', 'Tham quan ban dem (city tour dem)', 'Nguoi', 220000, 'HOAT_DONG');

-- ------------------------------------------------------------
-- 3. HANHDONGXANH — them 5 hanh dong xanh moi
-- ------------------------------------------------------------
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX006', 'Dung tui vai thay tui nhua khi mua sam', 60, 'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX007', 'Chup anh, bao cao tinh trang o nhiem moi truong', 120, 'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX008', 'Su dung xe dap dien thay o to ca nhan', 90, 'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX009', 'Tiet kiem dien nuoc tai khach san (dang ky eco room)', 70, 'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX010', 'Mua san pham thu cong dia phuong thay hang nhap', 50, 'HOAT_DONG');

-- ------------------------------------------------------------
-- 4. TOURMAU — them 4 tour mau moi
-- ------------------------------------------------------------
INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM005', 'Hue - Phong Nha Di San UNESCO 4N3D',
        'Kham pha co do Hue voi lang tam, chua chien; Dong Phong Nha huyen bi; bai bien Nhat Le.',
        4, 4500000, 4.6, 74, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM006', 'Can Tho - Mien Tay Song Nuoc 3N2D',
        'Cho noi Cai Rang sang som, vuon trai cay Lai Vung, rung tram Tra Su, lang boi ca Cai Be.',
        3, 2900000, 4.3, 55, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM007', 'Da Lat Thanh Pho Nghin Hoa 2N1D',
        'Thanh pho tinh lang giua cao nguyen: vuon hoa Da Lat, thung lung tinh yeu, thac Datanla, du thuyen ho Xuan Huong.',
        2, 1800000, 4.5, 112, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM008', 'Con Dao Thien Duong Bien Dao 4N3D',
        'Bien Con Dao xanh trong vat, vuon quoc gia, khu bao ton rua bien, di tich lich su Phu Hai.',
        4, 6500000, 4.9, 43, 'HOAT_DONG', 'SYSTEM');

-- ------------------------------------------------------------
-- 5. LICHTRINHTOUR — them lich trinh cho TM005, TM006, TM007
-- ------------------------------------------------------------
-- TM005: Hue - Phong Nha 4N3D
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT005_N1', 'TM005', 1,
        'May bay / xe Ha Noi → Hue → Dai Noi → Lang Minh Mang',
        'Khoi hanh sang som. Tham quan Kinh thanh Hue, Chua Thien Mu, Lang vua Minh Mang.',
        'Trua: Com Hue co truyen | Toi: Lau bo Hue');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT005_N2', 'TM005', 2,
        'Lang Tu Duc → Lang Khai Dinh → Dong Phong Nha',
        'Tham quan cac lang tam co kinh dien nhat Hue. Chieu chuyen sang Dong Ha, kham pha hang Phong Nha.',
        'Sang: Banh canh Hue | Trua: Com bui mien Trung | Toi: Hai san tuoi');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT005_N3', 'TM005', 3,
        'Dong Tien Son → Nuoc Mooc Eco Trail → Bai bien Nhat Le',
        'Kham pha hang Tien Son huy hoang. Boi loi Nuoc Mooc. Chieu thu gian bai bien Nhat Le.',
        'Sang: Bun bo Quang Binh | Trua: Hai san | Toi: Nuong tai bien');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT005_N4', 'TM005', 4,
        'Tu do mua sam → San bay ve Ha Noi / TP HCM',
        'Sang mua dac san: mut gung, nuoc mam Quy Duc, banh loc kho. Ra san bay.',
        'Sang: Banh mi que Dong Hoi');

-- TM006: Can Tho - Mien Tay 3N2D
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT006_N1', 'TM006', 1,
        'TP HCM → Can Tho → Cho noi Cai Rang → Vuon trai cay',
        'Xe giuong nam khoi hanh 20h tu Ben Xe Mien Tay. Sang den Can Tho, tham cho noi noi tieng. Tham vuon trai cay Phong Dien.',
        'Sang: Hu tieu Nam Vang | Trua: Com nha vuon | Toi: Lau mam mien Tay');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT006_N2', 'TM006', 2,
        'Rung tram Tra Su → Cho noi Long Xuyen → Lang boi ca Cai Be',
        'Cheo thuyen doc rung tram buoi sang. Tham cho noi Long Xuyen. Tro ve tham lang boi ca Cai Be buoi toi.',
        'Sang: Banh xeo mien Tay | Trua: Ca kho to / rau muong | Toi: Lau ca linh bong dieu');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT006_N3', 'TM006', 3,
        'Che Ngoi → Xe ve TP HCM ~ 17h',
        'Tham lang nghe de che Ngoi truyen thong. Mua dac san mang ve, len xe tra lai TP HCM.',
        'Sang: Com tam suon bi cha | Trua: Com nha hang Can Tho');

-- TM007: Da Lat 2N1D
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT007_N1', 'TM007', 1,
        'San bay Da Lat → Vuon hoa → Thung lung Tinh Yeu → Thac Datanla',
        'Don khach tai san bay. Tham Vuon Hoa Da Lat ruc ro. Thung lung Tinh Yeu lang man. Chieu kham pha Thac Datanla.',
        'Trua: Banh uot long ga Da Lat | Toi: Lau De Nuong Da Lat');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT007_N2', 'TM007', 2,
        'Ho Xuan Huong → Cho Da Lat sang → San bay / xe ve',
        'Du thuyen ho Xuan Huong sang som. Dao Cho Da Lat mua dac san: cafe, dau tay, atisô. Ra san bay.',
        'Sang: Banh mi Da Lat / hu tieu | Trua: Com ga Da Lat');

-- ------------------------------------------------------------
-- 6. VAITRO — them 1 vai tro moi
-- ------------------------------------------------------------
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('SUPPORT', 'Nhân viên hỗ trợ', 'HOAT_DONG');

-- ------------------------------------------------------------
-- 7. TAIKHOAN — them 7 tai khoan moi (2 HDV, 1 Sales, 4 KH)
-- ------------------------------------------------------------
INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_HDV03', 'hdv03',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Tran Minh Tuan', '079099000009', 'hdv03@digitaltravel.vn', '0900000009',
        'HDV', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_HDV04', 'hdv04',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Ly Thi Mai Phuong', '079099000010', 'hdv04@digitaltravel.vn', '0900000010',
        'HDV', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_SALES02', 'sales02',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Vo Van Nam', '079099000011', 'sales02@digitaltravel.vn', '0900000011',
        'SALES', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH03', 'khachhang03',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyen Thi Thu Ha', '079099000012', 'kh03@gmail.com', '0900000012',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH04', 'khachhang04',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Pham Quoc Bao', '079099000013', 'kh04@gmail.com', '0900000013',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH05', 'khachhang05',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Le Thi Bich Ngoc', '079099000014', 'kh05@gmail.com', '0900000014',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH06', 'khachhang06',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Tran Van Hung', '079099000015', 'kh06@gmail.com', '0900000015',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

-- ------------------------------------------------------------
-- 8. NHANVIEN — them 3 nhan vien moi (2 HDV, 1 Sales)
-- ------------------------------------------------------------
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV03', 'TK_HDV03', 'HDV', DATE '2023-08-01', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV04', 'TK_HDV04', 'HDV', DATE '2024-01-15', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_SALES02', 'TK_SALES02', 'SALES', DATE '2024-03-01', 'AVAILABLE');

-- ------------------------------------------------------------
-- 9. HOCHIEUSO — ho so 4 khach hang moi
-- ------------------------------------------------------------
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH003', 'TK_KH03', 'VANG',    1200);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH004', 'TK_KH04', 'CO_BAN',  0);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH005', 'TK_KH05', 'BAC',     480);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH006', 'TK_KH06', 'KIM_CUONG', 3500);

-- ------------------------------------------------------------
-- 10. NANGLUCNHANVIEN — nang luc 2 HDV moi
-- ------------------------------------------------------------
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV03', 'NV_HDV03',
        'Tieng Viet, Tieng Nhat (JLPT N2)',
        'Chung chi HDV quoc te, So y te, Chung chi phi thuyen',
        'Mien Trung, Bai bien, Kham pha hang dong',
        4.6, 38);
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV04', 'NV_HDV04',
        'Tieng Viet, Tieng Han (TOPIK 4)',
        'Chung chi HDV noi dia, Chung chi so cap cuu',
        'Mien Nam, Mien Tay, Am thuc dia phuong',
        4.4, 21);

-- ------------------------------------------------------------
-- 11. TOURTHUCTE — 6 dot khoi hanh moi
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
-- 12. VOUCHER — them 5 voucher moi
-- ------------------------------------------------------------
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC004', 'GOLD20', 'PHAN_TRAM', 20,
        'Uu dai 20% danh rieng thanh vien hang Vang va Kim Cuong. Don toi thieu 5.000.000 VND.',
        100, 0, DATE '2026-04-01', DATE '2026-12-31', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC005', 'MIENNAM300', 'SO_TIEN', 300000,
        'Giam 300.000 VND cho tour mien Nam (Can Tho, Phu Quoc). Don toi thieu 3.000.000 VND.',
        80, 0, DATE '2026-05-01', DATE '2026-08-31', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC006', 'LOYALTY500', 'SO_TIEN', 500000,
        'Tang voucher doi tu 500 diem xanh. Khong gioi han don toi thieu.',
        500, 0, DATE '2026-01-01', DATE '2026-12-31', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC007', 'HOLIDAY15', 'PHAN_TRAM', 15,
        'Khuyen mai le 30/4 - 1/5. Ap dung toan bo tour. Don toi thieu 2.000.000 VND.',
        200, 12, DATE '2026-04-25', DATE '2026-05-05', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC008', 'CONGE10', 'PHAN_TRAM', 10,
        'Giam 10% cho tour Con Dao. Don toi thieu 6.000.000 VND.',
        30, 0, DATE '2026-06-01', DATE '2026-09-30', 'SAN_SANG', 'SYSTEM');

-- ------------------------------------------------------------
-- 13. KHUYENMAI_KH — phat hanh voucher cho khach hang
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
-- 14. DONDATTOUR — 8 don dat tour moi
-- ------------------------------------------------------------
-- KH003 dat TTT008 (Hue-Phong Nha) da xac nhan
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT003', 'KH003', 'TTT008', 9000000, 'DA_XAC_NHAN', 'SYSTEM');

-- KH004 dat TTT001 (Ha Long) cho xac nhan
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT004', 'KH004', 'TTT001', 3500000, 'CHO_XAC_NHAN', 'SYSTEM');

-- KH005 dat TTT009 (Mien Tay) da xac nhan
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT005', 'KH005', 'TTT009', 5800000, 'DA_XAC_NHAN', 'SYSTEM');

-- KH006 dat TTT010 (Da Lat) da xac nhan
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT006', 'KH006', 'TTT010', 3800000, 'DA_XAC_NHAN', 'SYSTEM');

-- KH001 dat TTT005 (Sapa) cho xac nhan
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT007', 'KH001', 'TTT005', 3200000, 'CHO_XAC_NHAN', 'SYSTEM');

-- KH002 dat TTT006 (Da Nang lan 2) da xac nhan
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT008', 'KH002', 'TTT006', 4400000, 'DA_XAC_NHAN', 'SYSTEM');

-- KH003 dat TTT098 (Da Nang ket thuc) da xac nhan - de test bao cao
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT097', 'KH003', 'TTT098', 8400000, 'DA_XAC_NHAN', 'SYSTEM');

-- KH006 dat TTT099 (Ha Long ket thuc) da xac nhan - them du lieu bao cao
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT098', 'KH006', 'TTT099', 3500000, 'DA_XAC_NHAN', 'SYSTEM');

-- ------------------------------------------------------------
-- 15. CHITIETDATTOUR — danh sach hanh khach trong don dat
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
-- 16. CHITIETDICHVU — dich vu bo sung theo don dat
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
-- 17. DATTOUR_UUDAI — lich su ap dung voucher vao don dat
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
-- 18. GIAODICH — giao dich thanh toan moi
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
-- 19. PHANCONGTOUR — phan cong HDV vao tour
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
-- Phan cong cho tour da ket thuc de test diem danh / hanh dong xanh
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, TrangThai, TaoBoi)
VALUES ('PCT097', 'TTT098', 'NV_HDV02', 'DA_XAC_NHAN', 'SYSTEM');
INSERT INTO PHANCONGTOUR (MaPhanCongTour, MaTourThucTe, MaNhanVien, TrangThai, TaoBoi)
VALUES ('PCT099', 'TTT099', 'NV_HDV01', 'DA_XAC_NHAN', 'SYSTEM');

-- ------------------------------------------------------------
-- 20. LICHSUTOUR — lich su tour da hoan thanh
-- ------------------------------------------------------------
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LS002', 'KH003', 'TTT098', 'CTDT097', DATE '2026-01-15');
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, MaChiTietDat, NgayThamGia)
VALUES ('LS003', 'KH006', 'TTT099', 'CTDT098', DATE '2026-02-10');

-- ------------------------------------------------------------
-- 21. DIEMDANH — diem danh khach trong tour (cho tour da co PCT)
-- ------------------------------------------------------------
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNhanVien, ThoiGian, DiaDiem)
VALUES ('DD001', 'TTT099', 'KH001', 'NV_HDV01',
        TIMESTAMP '2026-02-10 07:30:00', 'Ben xe My Dinh - Ha Noi');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNhanVien, ThoiGian, DiaDiem)
VALUES ('DD002', 'TTT099', 'KH006', 'NV_HDV01',
        TIMESTAMP '2026-02-10 07:35:00', 'Ben xe My Dinh - Ha Noi');
INSERT INTO DIEMDANH (MaDiemDanh, MaTourThucTe, MaKhachHang, MaNhanVien, ThoiGian, DiaDiem)
VALUES ('DD003', 'TTT098', 'KH003', 'NV_HDV02',
        TIMESTAMP '2026-01-15 08:00:00', 'San bay Da Nang');

-- ------------------------------------------------------------
-- 22. HANHDONG — ghi nhan hanh dong xanh trong tour
-- ------------------------------------------------------------
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD001', 'TTT099', 'KH001', 'HDX001', 'NV_HDV01',
        TIMESTAMP '2026-02-11 09:00:00', 'Hinh chup binh nuoc tai su dung cua khach');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD002', 'TTT099', 'KH001', 'HDX003', 'NV_HDV01',
        TIMESTAMP '2026-02-11 15:30:00', 'Khach tham gia don rac tai bai bien Ha Long');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD003', 'TTT099', 'KH006', 'HDX002', 'NV_HDV01',
        TIMESTAMP '2026-02-12 10:00:00', 'Khach tu choi tui nhua, su dung tui vai');
INSERT INTO HANHDONG (MaGhiNhanHanhDong, MaTourThucTe, MaKhachHang, MaHanhDongXanh, MaNhanVienXacMinh, ThoiGian, MinhChung)
VALUES ('HD004', 'TTT098', 'KH003', 'HDX005', 'NV_HDV02',
        TIMESTAMP '2026-01-16 08:00:00', 'Khach muon xe dap kham pha Hoi An');

-- ------------------------------------------------------------
-- 23. NHATKYSUCO — nhat ky su co trong tour
-- ------------------------------------------------------------
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, TrangThai)
VALUES ('NKSC001', 'TTT099', 'NV_HDV01',
        'Mot khach bi say song nhe khi di thuyen qua vung nuoc lon.',
        'Da cap thuoc say song du phong cho khach. Khach hoi phuc sau 30 phut nghi ngoi.',
        'DA_DONG');
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, TrangThai)
VALUES ('NKSC002', 'TTT098', 'NV_HDV02',
        'Xe du lich bi thung banh giua duong tren cu San Bay Da Nang.',
        'Lien he hang xe cap xe thay the. Hanh trinh bi tre 45 phut.',
        'DA_DONG');
INSERT INTO NHATKYSUCO (MaNhatKySuCo, MaTourThucTe, MaNhanVienBaoCao, MoTa, GiaiPhap, TrangThai)
VALUES ('NKSC003', 'TTT008', 'NV_HDV03',
        'Nha hang doi bua an toi tu lau nuong sang com binh thuong do co su co bep.',
        'Da boi thuong phan chenh lech chi phi, xin loi khach, ghi nhan phan anh voi doi tac.',
        'DANG_XU_LY');

-- ------------------------------------------------------------
-- 24. CHIPHITHUCTE — chi phi thuc te HDV khai bao
-- ------------------------------------------------------------
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT001', 'TTT099', 'NV_HDV01', 'Mua thuoc say song cap cuu', 85000, 'DA_DUYET');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT002', 'TTT099', 'NV_HDV01', 'Phi cang du thuyen phat sinh', 150000, 'DA_DUYET');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT003', 'TTT098', 'NV_HDV02', 'Boi thuong chenh lech bua an toi', 480000, 'DA_DUYET');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT004', 'TTT098', 'NV_HDV02', 'Nuoc uong va khan lanh cho khach tren xe', 120000, 'DA_DUYET');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT005', 'TTT008', 'NV_HDV03', 'Ve tham quan phat sinh - Khe Nuoc Trong', 350000, 'CHO_DUYET');
INSERT INTO CHIPHITHUCTE (MaChiPhiThucTe, MaTourThucTe, MaNhanVien, DanhMuc, ThanhTien, TrangThaiDuyet)
VALUES ('CPTT006', 'TTT003', 'NV_HDV01', 'Phi dua don khach san bay phat sinh', 200000, 'CHO_DUYET');

-- ------------------------------------------------------------
-- 25. QUYETTOAN — quyet toan tai chinh cho tour da ket thuc
-- ------------------------------------------------------------
-- TTT099: Ha Long ket thuc (doanh thu: DDT001 7tr + DDT099 7tr + DDT098 3.5tr = 17.5tr)
INSERT INTO QUYETTOAN (MaQuyetToan, MaTourThucTe, TongDoanhThu, TongChiPhi, LoiNhuan, MaNhanVien, TrangThai, TaoBoi)
VALUES ('QT001', 'TTT099', 17500000, 2350000, 15150000, 'NV_KT01', 'LOCKED', 'SYSTEM');
-- TTT098: Da Nang ket thuc (doanh thu: DDT097 8.4tr)
INSERT INTO QUYETTOAN (MaQuyetToan, MaTourThucTe, TongDoanhThu, TongChiPhi, LoiNhuan, MaNhanVien, TrangThai, TaoBoi)
VALUES ('QT002', 'TTT098', 8400000, 1800000, 6600000, 'NV_KT01', 'LOCKED', 'SYSTEM');

-- ------------------------------------------------------------
-- 26. NHATKYDOIDIEM — doi diem xanh sang voucher
-- ------------------------------------------------------------
INSERT INTO NHATKYDOIDIEM (MaNhatKyDoiDiem, MaKhachHang, MaVoucher, DiemQuyDoi, NgayQuyDoi)
VALUES ('NKDD001', 'KH006', 'VC006', 500, SYSTIMESTAMP - 30);
INSERT INTO NHATKYDOIDIEM (MaNhatKyDoiDiem, MaKhachHang, MaVoucher, DiemQuyDoi, NgayQuyDoi)
VALUES ('NKDD002', 'KH003', 'VC006', 500, SYSTIMESTAMP - 10);

-- ------------------------------------------------------------
-- 27. YEUCAUHOTRO — ticket ho tro / khieu nai
-- ------------------------------------------------------------
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT001', 'DDT001', 'KH001', 'KHIEU_NAI',
        'Cabin tren tau khong co nuoc nong buoi sang ngay 1. Mong cong ty ho tro phan boi thuong.',
        'DA_DONG', 'NV_SALES01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT002', 'DDT003', 'KH003', 'THONG_TIN',
        'Xin hoi lich trinh ngay 2 tai Phong Nha co the doi sang hang dong Thien Duong khong?',
        'DA_DONG', 'NV_SALES01');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT003', 'DDT005', 'KH005', 'HO_TRO_VE',
        'Can xuất hoa don VAT cho cong ty de thanh toan chi phi cong tac.',
        'DANG_XU_LY', 'NV_SALES02');
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT004', NULL, 'KH004', 'TU_VAN_TOUR',
        'Can tu van tour phu hop cho gia dinh 4 nguoi (2 nguoi lon, 2 tre em duoi 10 tuoi) dip he thang 7.',
        'MOI_TAO', NULL);
INSERT INTO YEUCAUHOTRO (MaYeuCauHoTro, MaDatTour, MaKhachHang, LoaiYeuCau, NoiDung, TrangThai, MaNhanVienXuLy)
VALUES ('YCHT005', 'DDT006', 'KH006', 'HUY_TOUR',
        'Yeu cau huy tour Da Lat do co viec dot xuat. Mong duoc hoan tien theo chinh sach.',
        'MOI_TAO', NULL);

-- ------------------------------------------------------------
-- 28. DANHGIAKH — danh gia sau tour
-- ------------------------------------------------------------
-- Yeu cau: FK_DGKH_LichSuTour: (MaKhachHang, MaTourThucTe) phai co trong LICHSUTOUR
-- KH001 + TTT099 co trong LS001; KH003 + TTT098 co trong LS002; KH006 + TTT099 co trong LS003
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, TrangThai)
VALUES ('DG002', 'TTT098', 'KH003', 4,
        'Tour mien Trung rat thu vi, HDV nhiet tinh. Tuy nhien xe bi thung banh khien hanh trinh tre. Van se gioi thieu ban be.', 'HIEU_LUC');
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaTourThucTe, MaKhachHang, SoSao, NhanXet, TrangThai)
VALUES ('DG003', 'TTT099', 'KH006', 5,
        'Tuyet voi! Ha Long dep hon nhung gi toi tuong tuong. HDV Hoang Van Huong Dan rat chuyen nghiep, sang tao nhieu tro choi hay cho khach.', 'HIEU_LUC');

COMMIT;
-- ============================================================
-- END SEED DATA v2
-- ============================================================
