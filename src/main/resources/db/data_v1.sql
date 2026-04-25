-- ============================================================
-- SEED DATA — Du lieu mau khoi tao (catalog + master data)
-- Pham vi    : Cac bang danh muc + tai khoan he thong
-- Mat khau mac dinh cho tat ca tai khoan: password
-- BCrypt hash (cost 10): $2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lh32
-- CHU Y: Doi mat khau ngay sau lan dang nhap dau tien tren Production!
-- ============================================================

-- ------------------------------------------------------------
-- 1. LOAIPHONG — Danh muc loai phong / phu thu
-- ------------------------------------------------------------
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP001', 'Phong don (Single)',             0,       'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP002', 'Phong doi (Twin / Double)',      200000,  'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP003', 'Phong ba (Triple)',              350000,  'HOAT_DONG');
INSERT INTO LOAIPHONG (MaLoaiPhong, TenLoai, MucPhuThu, TrangThai)
VALUES ('LP004', 'Phong Deluxe',                  800000,  'HOAT_DONG');

-- ------------------------------------------------------------
-- 2. DICHVUTHEM — Danh muc dich vu bo sung
-- ------------------------------------------------------------
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV001', 'Ve tham quan them',            'Luot/nguoi',  150000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV002', 'Bao hiem du lich',             'Nguoi',        80000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV003', 'Don/tra san bay',              'Chuyen',      250000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV004', 'Bo sung bua an toi dac san',   'Nguoi',       120000, 'HOAT_DONG');
INSERT INTO DICHVUTHEM (MaDichVuThem, Ten, DonViTinh, DonGia, TrangThai)
VALUES ('DV005', 'Cho thue may anh / may quay',  'Ngay',        200000, 'HOAT_DONG');

-- ------------------------------------------------------------
-- 3. HANHDONGXANH — Cau hinh hanh dong xanh cong diem loyalty
-- ------------------------------------------------------------
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX001', 'Mang binh nuoc tai su dung',              50,  'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX002', 'Khong dung do nhua dung mot lan',         80,  'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX003', 'Tham gia don rac moi truong tai diem den',150,  'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX004', 'Trong cay / phuc hoi he sinh thai',       200,  'HOAT_DONG');
INSERT INTO HANHDONGXANH (MaHanhDongXanh, TenHanhDong, DiemCong, TrangThai)
VALUES ('HDX005', 'Muon xe dap thay xe may',                 100,  'HOAT_DONG');

-- ------------------------------------------------------------
-- 4. TOURMAU — Tour mau (template san pham)
-- ------------------------------------------------------------
INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM001', 'Kham pha Ha Long - Cat Ba 3N2D',
        'Vinh Ha Long ky vi ket hop dao Cat Ba hung vi. Trai nghiem ngu tren tau dem, cheo kayak qua hang dong, kham pha rung quoc gia Cat Ba.',
        3, 3500000, 4.5, 128, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM002', 'Da Nang - Hoi An - Ba Na Hills 4N3D',
        'Hanh trinh mien Trung: bai bien My Khe, pho co Hoi An lan den anh den, Ba Na Hills voi Cau Vang biet danh.',
        4, 4200000, 4.7, 215, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM003', 'Phu Quoc Nghi Duong Bien Dao 5N4D',
        'Nghi duong bien dao Phu Quoc: bai Truong, bai Sao, kham pha nha tu Phu Quoc, hon dao An Thoi, lang chai tren bien.',
        5, 5800000, 4.8, 302, 'HOAT_DONG', 'SYSTEM');

INSERT INTO TOURMAU (MaTourMau, TieuDe, MoTa, ThoiLuong, GiaSan, DanhGia, SoDanhGia, TrangThai, TaoBoi)
VALUES ('TM004', 'Sapa - Bac Ha May Mo Trekking 3N2D',
        'Trekking ban lang nguoi H Mong, cho tinh Bac Ha hop ngay chu nhat, ngam ruong bac thang Mu Cang Chai.',
        3, 3200000, 4.4, 87, 'HOAT_DONG', 'SYSTEM');

-- ------------------------------------------------------------
-- 5. LICHTRINHTOUR — Lich trinh theo ngay
-- ------------------------------------------------------------
-- TM001: Ha Long - Cat Ba 3N2D
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT001_N1', 'TM001', 1,
        'Ha Noi → Ha Long → Len tau → Hang Dau Go → Hang Thien Cung',
        'Xe limousine khoi hanh 7:30 tu My Dinh. Don khach tai cang Ha Long ~12h. Check-in cabin, an trua tren tau. Tham quan hang dong nam trong Top 10 the gioi.',
        'Trua: Hai san tuoi tren tau | Toi: Buffet tuoi song');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT001_N2', 'TM001', 2,
        'Sang: Cheo kayak - Dao Cat Ba | Chieu: Tu do kham pha bai bien',
        'Tap Tai Chi tren tau luc binh minh. Cheo kayak qua vung Tu Cung. Di bo nhe rang quoc gia Cat Ba. Buoi chieu tu do tai bai bien.',
        'Sang: Buffet Chau A | Trua: Bento tren thuyen | Toi: Com nha hang dia phuong');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT001_N3', 'TM001', 3,
        'Boi loc sau buoi sang → Tra phong → Xe ve Ha Noi ~17h',
        'Dung ca phe sang ngam bau troi Ha Long. Tra phong, xe dua ve Ha Noi.',
        'Sang: Banh bao, chao, hoa qua | Trua: Com nha hang tai cang');

-- TM002: Da Nang - Hoi An - Ba Na Hills 4N3D
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT002_N1', 'TM002', 1,
        'San bay Da Nang → Nhan phong → Ba Na Hills → Cau Vang',
        'Don tai san bay. Nghi nguoi. Chieu kham pha Ba Na Hills: Cau Vang, lang co Phap, hoi cho am thuc ban dem.',
        'Trua: Tu tuc | Toi: Lau nuong Da Nang');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT002_N2', 'TM002', 2,
        'Pho co Hoi An → Thuyen song Hoai → Den Hoi An',
        'Kham pha pho co Hoi An: Cho Hoi An, Cau Nhat Ban, Hoi quan Phuc Kien. Thu thuyen xuoi song Hoai.',
        'Sang: Cao lau / Mi Quang | Trua: Com Hoi An | Toi: Bua toi thu thien tren song');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT002_N3', 'TM002', 3,
        'Bai bien My Khe → Ngu Hanh Son → Bao tang Cham',
        'Boi bien My Khe sang som. Tham quan Ngu Hanh Son, chua chien. Bao tang Dieu khac Cham Pa buoi chieu.',
        'Sang: Banh mi Hoi An | Trua: Hai san | Toi: Bun cha ca Da Nang');
INSERT INTO LICHTRINHTOUR (MaLichTrinhTour, MaTourMau, NgayThu, HoatDong, MoTa, ThucDon)
VALUES ('LT002_N4', 'TM002', 4,
        'Tu do mua sam cho Han → Ra san bay → Ket thuc',
        'Sang tu do mua sam tai cho Han. Tra phong, ra san bay Da Nang.',
        'Sang: Banh trang cuon thit heo');

-- ------------------------------------------------------------
-- 6. TAIKHOAN — Tai khoan he thong (mat khau: password)
-- BCrypt(cost=10,"password")=$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lh32
-- ------------------------------------------------------------
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('ADMIN',      'Quản trị hệ thống',  'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('SANPHAM',    'Nhan vien san pham',  'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('KINHDOANH',  'Nhan vien kinh doanh','HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('DIEUHANH',   'Nhan vien dieu hanh', 'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('KETOAN',     'Kế toán',            'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('HDV',        'Hướng dẫn viên',     'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('KHACHHANG',  'Khách hàng',         'HOAT_DONG');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_ADMIN01', 'admin',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyen Van Admin', '079099000001', 'admin@digitaltravel.vn', '0900000001',
        'ADMIN', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_MGR01', 'manager01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Tran Thi Dieu Hanh', '079099000002', 'dieuhanh01@digitaltravel.vn', '0900000002',
        'DIEUHANH', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_SP01', 'sanpham01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyen Thi San Pham', '079099000099', 'sanpham01@digitaltravel.vn', '0900000099',
        'SANPHAM', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_SALES01', 'sales01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Le Van Kinh Doanh', '079099000003', 'kinhdoanh01@digitaltravel.vn', '0900000003',
        'KINHDOANH', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KT01', 'ketoan01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Pham Thi Ke Toan', '079099000004', 'ketoan01@digitaltravel.vn', '0900000004',
        'KETOAN', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_HDV01', 'hdv01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Hoang Van Huong Dan', '079099000005', 'hdv01@digitaltravel.vn', '0900000005',
        'HDV', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_HDV02', 'hdv02',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Nguyen Thi Huong', '079099000006', 'hdv02@digitaltravel.vn', '0900000006',
        'HDV', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH01', 'khachhang01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Bui Thi Khach Hang', '079099000007', 'kh01@gmail.com', '0900000007',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_KH02', 'khachhang02',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Dinh Van Khach Hang', '079099000008', 'kh02@gmail.com', '0900000008',
        'KHACHHANG', 'HOAT_DONG', 'SYSTEM');

-- ------------------------------------------------------------
-- 7. NHANVIEN — Ho so nhan vien noi bo
-- ------------------------------------------------------------
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_ADMIN01',  'TK_ADMIN01',  'ADMIN',   DATE '2022-01-01', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_MGR01',    'TK_MGR01',    'DIEUHANH', DATE '2022-01-15', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_SP01',     'TK_SP01',     'SANPHAM', DATE '2022-02-01', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_SALES01',  'TK_SALES01',  'KINHDOANH', DATE '2023-03-01', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_KT01',     'TK_KT01',     'KETOAN',  DATE '2023-06-01', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV01',    'TK_HDV01',    'HDV',     DATE '2021-09-15', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_HDV02',    'TK_HDV02',    'HDV',     DATE '2022-05-10', 'AVAILABLE');

-- ------------------------------------------------------------
-- 8. HOCHIEUSO — Ho so khach hang
-- ------------------------------------------------------------
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH001', 'TK_KH01', 'BAC',    350);
INSERT INTO HOCHIEUSO (MaKhachHang, MaTaiKhoan, HangThanhVien, DiemXanh)
VALUES ('KH002', 'TK_KH02', 'CO_BAN',   0);

-- ------------------------------------------------------------
-- 9. NANGLUCNHANVIEN — Nang luc / chung chi HDV
-- ------------------------------------------------------------
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV01', 'NV_HDV01',
        'Tieng Viet, Tieng Anh (IELTS 7.0)',
        'Chung chi HDV quoc te, So y te, WSET Level 2',
        'Mien Bac, Du thuyen, Eco-tour',
        4.7, 95);
INSERT INTO NANGLUCNHANVIEN (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia)
VALUES ('NL_HDV02', 'NV_HDV02',
        'Tieng Viet, Tieng Trung (HSK 5)',
        'Chung chi HDV noi dia, So y te',
        'Mien Trung, Pho co, Am thuc',
        4.5, 62);

-- ------------------------------------------------------------
-- 10. TOURTHUCTE — Dot khoi hanh cu the
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
-- 11. VOUCHER — Chuong trinh uu dai mau
-- ------------------------------------------------------------
INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC001', 'WELCOME10', 'PHAN_TRAM', 10,
        'Giam 10% cho khach dat tour lan dau. Don toi thieu 3.000.000 VND.',
        100, 0, DATE '2026-04-01', DATE '2026-12-31', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC002', 'SUMMER500K', 'SO_TIEN', 500000,
        'Giam 500.000 VND cho tour khoi hanh thang 5–7/2026. Don toi thieu 4.000.000 VND.',
        50, 0, DATE '2026-05-01', DATE '2026-07-31', 'SAN_SANG', 'SYSTEM');

INSERT INTO VOUCHER (MaVoucher, MaCode, LoaiUuDai, GiaTriGiam, DieuKienApDung, SoLuotPhatHanh, SoLuotDaDung, NgayHieuLuc, NgayHetHan, TrangThai, TaoBoi)
VALUES ('VC003', 'BAC15', 'PHAN_TRAM', 15,
        'Uu dai 15% danh rieng thanh vien hang Bac tro len. Don toi thieu 5.000.000 VND.',
        200, 0, DATE '2026-04-01', DATE '2026-12-31', 'SAN_SANG', 'SYSTEM');

-- ------------------------------------------------------------
-- 12. KHUYENMAI_KH — Phat hanh voucher cho khach hang
-- ------------------------------------------------------------
INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, TrangThai, NgayNhan, NgayHetHan)
VALUES ('KH001', 'VC003', 'SAN_SANG', SYSTIMESTAMP, DATE '2026-12-31');

INSERT INTO KHUYENMAI_KH (MaKhachHang, MaVoucher, TrangThai, NgayNhan, NgayHetHan)
VALUES ('KH002', 'VC001', 'SAN_SANG', SYSTIMESTAMP, DATE '2026-12-31');

-- ------------------------------------------------------------
-- 13. TOURTHUCTE bo sung — 1 tour KET_THUC de test bao cao
-- ------------------------------------------------------------
INSERT INTO TOURTHUCTE (MaTourThucTe, MaTourMau, NgayKhoiHanh, GiaHienHanh, SoKhachToiDa, SoKhachToiThieu, ChoConLai, TrangThai, TaoBoi)
VALUES ('TTT099', 'TM001', DATE '2026-02-10', 3500000, 20, 8, 0, 'KET_THUC', 'SYSTEM');

-- ------------------------------------------------------------
-- 14. DONDATTOUR — Don dat tour mau
-- ------------------------------------------------------------
INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT001', 'KH001', 'TTT001', 7000000, 'DA_XAC_NHAN', 'SYSTEM');

INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT002', 'KH002', 'TTT003', 4200000, 'CHO_XAC_NHAN', 'SYSTEM');

INSERT INTO DONDATTOUR (MaDatTour, MaKhachHang, MaTourThucTe, TongTien, TrangThai, TaoBoi)
VALUES ('DDT099', 'KH001', 'TTT099', 7000000, 'DA_XAC_NHAN', 'SYSTEM');

-- ------------------------------------------------------------
-- 15. LICHSUTOUR — Lich su tour da hoan thanh
-- ------------------------------------------------------------
INSERT INTO LICHSUTOUR (MaLichSuTour, MaKhachHang, MaTourThucTe, NgayThamGia)
VALUES ('LS001', 'KH001', 'TTT099', DATE '2026-02-10');

-- ------------------------------------------------------------
-- 16. DANHGIAKH — Danh gia tour da hoan thanh
-- ------------------------------------------------------------
INSERT INTO DANHGIAKH (MaDanhGiaKhachHang, MaKhachHang, MaTourThucTe, SoSao, NhanXet, TrangThai)
VALUES ('DG001', 'KH001', 'TTT099', 5, 'Tour rat tot, HDV nhiet tinh, dich vu chuan.', 'HIEU_LUC');

-- ------------------------------------------------------------
-- 17. GIAODICH — Giao dich thanh toan mau
-- ------------------------------------------------------------
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai)
VALUES ('GD001', 'DDT001', 7000000, 'THANH_TOAN', 'CHUYEN_KHOAN', 'THANH_CONG');
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai)
VALUES ('GD099', 'DDT099', 7000000, 'THANH_TOAN', 'CHUYEN_KHOAN', 'THANH_CONG');
-- Giao dich hoan tien cho test UC52
INSERT INTO GIAODICH (MaGiaoDich, MaDatTour, SoTien, LoaiGiaoDich, PhuongThuc, TrangThai)
VALUES ('GD_HOA01', 'DDT002', 4200000, 'HOAN_TIEN', 'CHUYEN_KHOAN', 'CHO_THANH_TOAN');

COMMIT;
-- ============================================================
-- END SEED DATA
-- ============================================================

