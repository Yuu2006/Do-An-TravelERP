-- ============================================================
-- MIGRATION: HDV assignment acceptance + remove SAP_DIEN_RA
-- Run after the current schema exists.
-- ============================================================

-- TOURTHUCTE: remove SAP_DIEN_RA from data and constraint.
UPDATE TOURTHUCTE
SET TrangThai = 'MO_BAN'
WHERE TrangThai = 'SAP_DIEN_RA';

BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE TOURTHUCTE DROP CONSTRAINT CK_TTT_TrangThai';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2443 THEN RAISE; END IF;
END;
/

ALTER TABLE TOURTHUCTE ADD CONSTRAINT CK_TTT_TrangThai CHECK (
    TrangThai IN ('CHO_KICH_HOAT','MO_BAN','DANG_DIEN_RA','KET_THUC','HUY','DA_QUYET_TOAN')
);

-- PHANCONGTOUR: guide response status.
BEGIN
    EXECUTE IMMEDIATE q'[
        ALTER TABLE PHANCONGTOUR
        ADD TrangThaiChapNhan VARCHAR2(20) DEFAULT 'CHO_PHAN_HOI' NOT NULL
    ]';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1430 THEN RAISE; END IF;
END;
/

UPDATE PHANCONGTOUR
SET TrangThaiChapNhan = 'DA_DONG_Y'
WHERE TrangThaiChapNhan IS NULL;

BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE PHANCONGTOUR DROP CONSTRAINT CK_PCT_TrangThaiChapNhan';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2443 THEN RAISE; END IF;
END;
/

ALTER TABLE PHANCONGTOUR ADD CONSTRAINT CK_PCT_TrangThaiChapNhan CHECK (
    TrangThaiChapNhan IN ('CHO_PHAN_HOI','DA_DONG_Y','TU_CHOI')
);

-- Add 5 HDV accounts, employees, and competencies.
MERGE INTO TAIKHOAN t
USING (SELECT 'TK_HDV03' MaTaiKhoan, 'hdv03' TenDangNhap, 'Trần Minh Quân' HoTen, '079099000007' CCCD, DATE '1990-10-05' NgaySinh, 'hdv03@digitaltravel.vn' Email, '0900000007' SoDienThoai FROM DUAL) s
ON (t.MaTaiKhoan = s.MaTaiKhoan)
WHEN NOT MATCHED THEN INSERT (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES (s.MaTaiKhoan, s.TenDangNhap, '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK', s.HoTen, s.CCCD, s.NgaySinh, s.Email, s.SoDienThoai, 'HDV', 'HOAT_DONG');

MERGE INTO TAIKHOAN t
USING (SELECT 'TK_HDV04' MaTaiKhoan, 'hdv04' TenDangNhap, 'Phạm Thu Trang' HoTen, '079099000008' CCCD, DATE '1994-02-19' NgaySinh, 'hdv04@digitaltravel.vn' Email, '0900000008' SoDienThoai FROM DUAL) s
ON (t.MaTaiKhoan = s.MaTaiKhoan)
WHEN NOT MATCHED THEN INSERT (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES (s.MaTaiKhoan, s.TenDangNhap, '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK', s.HoTen, s.CCCD, s.NgaySinh, s.Email, s.SoDienThoai, 'HDV', 'HOAT_DONG');

MERGE INTO TAIKHOAN t
USING (SELECT 'TK_HDV05' MaTaiKhoan, 'hdv05' TenDangNhap, 'Lê Quốc Bảo' HoTen, '079099000009' CCCD, DATE '1988-12-11' NgaySinh, 'hdv05@digitaltravel.vn' Email, '0900000009' SoDienThoai FROM DUAL) s
ON (t.MaTaiKhoan = s.MaTaiKhoan)
WHEN NOT MATCHED THEN INSERT (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES (s.MaTaiKhoan, s.TenDangNhap, '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK', s.HoTen, s.CCCD, s.NgaySinh, s.Email, s.SoDienThoai, 'HDV', 'HOAT_DONG');

MERGE INTO TAIKHOAN t
USING (SELECT 'TK_HDV06' MaTaiKhoan, 'hdv06' TenDangNhap, 'Đỗ Mai Anh' HoTen, '079099000010' CCCD, DATE '1992-06-03' NgaySinh, 'hdv06@digitaltravel.vn' Email, '0900000010' SoDienThoai FROM DUAL) s
ON (t.MaTaiKhoan = s.MaTaiKhoan)
WHEN NOT MATCHED THEN INSERT (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES (s.MaTaiKhoan, s.TenDangNhap, '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK', s.HoTen, s.CCCD, s.NgaySinh, s.Email, s.SoDienThoai, 'HDV', 'HOAT_DONG');

MERGE INTO TAIKHOAN t
USING (SELECT 'TK_HDV07' MaTaiKhoan, 'hdv07' TenDangNhap, 'Võ Hải Nam' HoTen, '079099000011' CCCD, DATE '1991-08-24' NgaySinh, 'hdv07@digitaltravel.vn' Email, '0900000011' SoDienThoai FROM DUAL) s
ON (t.MaTaiKhoan = s.MaTaiKhoan)
WHEN NOT MATCHED THEN INSERT (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, CCCD, NgaySinh, Email, SoDienThoai, VaiTro, TrangThai)
VALUES (s.MaTaiKhoan, s.TenDangNhap, '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK', s.HoTen, s.CCCD, s.NgaySinh, s.Email, s.SoDienThoai, 'HDV', 'HOAT_DONG');

MERGE INTO NHANVIEN n USING (SELECT 'NV_HDV03' MaNhanVien, 'TK_HDV03' MaTaiKhoan, DATE '2020-08-20' NgayVaoLam FROM DUAL) s ON (n.MaNhanVien = s.MaNhanVien)
WHEN NOT MATCHED THEN INSERT (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec) VALUES (s.MaNhanVien, s.MaTaiKhoan, 'HDV', s.NgayVaoLam, 'HOAT_DONG');
MERGE INTO NHANVIEN n USING (SELECT 'NV_HDV04' MaNhanVien, 'TK_HDV04' MaTaiKhoan, DATE '2023-01-12' NgayVaoLam FROM DUAL) s ON (n.MaNhanVien = s.MaNhanVien)
WHEN NOT MATCHED THEN INSERT (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec) VALUES (s.MaNhanVien, s.MaTaiKhoan, 'HDV', s.NgayVaoLam, 'HOAT_DONG');
MERGE INTO NHANVIEN n USING (SELECT 'NV_HDV05' MaNhanVien, 'TK_HDV05' MaTaiKhoan, DATE '2019-04-18' NgayVaoLam FROM DUAL) s ON (n.MaNhanVien = s.MaNhanVien)
WHEN NOT MATCHED THEN INSERT (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec) VALUES (s.MaNhanVien, s.MaTaiKhoan, 'HDV', s.NgayVaoLam, 'HOAT_DONG');
MERGE INTO NHANVIEN n USING (SELECT 'NV_HDV06' MaNhanVien, 'TK_HDV06' MaTaiKhoan, DATE '2021-11-01' NgayVaoLam FROM DUAL) s ON (n.MaNhanVien = s.MaNhanVien)
WHEN NOT MATCHED THEN INSERT (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec) VALUES (s.MaNhanVien, s.MaTaiKhoan, 'HDV', s.NgayVaoLam, 'HOAT_DONG');
MERGE INTO NHANVIEN n USING (SELECT 'NV_HDV07' MaNhanVien, 'TK_HDV07' MaTaiKhoan, DATE '2022-09-05' NgayVaoLam FROM DUAL) s ON (n.MaNhanVien = s.MaNhanVien)
WHEN NOT MATCHED THEN INSERT (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec) VALUES (s.MaNhanVien, s.MaTaiKhoan, 'HDV', s.NgayVaoLam, 'HOAT_DONG');

MERGE INTO NANGLUCNHANVIEN nl USING (SELECT 'NLNV_HDV03' MaNangLucNhanVien, 'NV_HDV03' MaNhanVien, 'Tiếng Việt, Tiếng Anh, Tiếng Nhật' NgonNgu, 'Thẻ HDV Quốc tế, Sơ cấp cứu nâng cao' ChungChi, 'Trekking, du lịch mạo hiểm, Tây Bắc' ChuyenMon, 4.9 DanhGia, 151 SoDanhGia FROM DUAL) s ON (nl.MaNangLucNhanVien = s.MaNangLucNhanVien)
WHEN NOT MATCHED THEN INSERT (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia) VALUES (s.MaNangLucNhanVien, s.MaNhanVien, s.NgonNgu, s.ChungChi, s.ChuyenMon, s.DanhGia, s.SoDanhGia);
MERGE INTO NANGLUCNHANVIEN nl USING (SELECT 'NLNV_HDV04' MaNangLucNhanVien, 'NV_HDV04' MaNhanVien, 'Tiếng Việt, Tiếng Anh, Tiếng Hàn' NgonNgu, 'Thẻ HDV Nội địa, chứng nhận thuyết minh di sản' ChungChi, 'Di sản miền Trung, gia đình, ẩm thực địa phương' ChuyenMon, 4.6 DanhGia, 73 SoDanhGia FROM DUAL) s ON (nl.MaNangLucNhanVien = s.MaNangLucNhanVien)
WHEN NOT MATCHED THEN INSERT (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia) VALUES (s.MaNangLucNhanVien, s.MaNhanVien, s.NgonNgu, s.ChungChi, s.ChuyenMon, s.DanhGia, s.SoDanhGia);
MERGE INTO NANGLUCNHANVIEN nl USING (SELECT 'NLNV_HDV05' MaNangLucNhanVien, 'NV_HDV05' MaNhanVien, 'Tiếng Việt, Tiếng Pháp' NgonNgu, 'Thẻ HDV Quốc tế, PADI Open Water' ChungChi, 'Biển đảo, lặn biển cơ bản, khách châu Âu' ChuyenMon, 4.7 DanhGia, 118 SoDanhGia FROM DUAL) s ON (nl.MaNangLucNhanVien = s.MaNangLucNhanVien)
WHEN NOT MATCHED THEN INSERT (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia) VALUES (s.MaNangLucNhanVien, s.MaNhanVien, s.NgonNgu, s.ChungChi, s.ChuyenMon, s.DanhGia, s.SoDanhGia);
MERGE INTO NANGLUCNHANVIEN nl USING (SELECT 'NLNV_HDV06' MaNangLucNhanVien, 'NV_HDV06' MaNhanVien, 'Tiếng Việt, Tiếng Anh' NgonNgu, 'Thẻ HDV Nội địa, sơ cứu trẻ em' ChungChi, 'Tour gia đình, chăm sóc trẻ em, team building' ChuyenMon, 4.8 DanhGia, 104 SoDanhGia FROM DUAL) s ON (nl.MaNangLucNhanVien = s.MaNangLucNhanVien)
WHEN NOT MATCHED THEN INSERT (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia) VALUES (s.MaNangLucNhanVien, s.MaNhanVien, s.NgonNgu, s.ChungChi, s.ChuyenMon, s.DanhGia, s.SoDanhGia);
MERGE INTO NANGLUCNHANVIEN nl USING (SELECT 'NLNV_HDV07' MaNangLucNhanVien, 'NV_HDV07' MaNhanVien, 'Tiếng Việt, Tiếng Anh, Tiếng Đức' NgonNgu, 'Thẻ HDV Quốc tế, chứng chỉ điều phối đoàn lớn' ChungChi, 'Du lịch xanh, MICE, quản trị rủi ro hiện trường' ChuyenMon, 4.6 DanhGia, 96 SoDanhGia FROM DUAL) s ON (nl.MaNangLucNhanVien = s.MaNangLucNhanVien)
WHEN NOT MATCHED THEN INSERT (MaNangLucNhanVien, MaNhanVien, NgonNgu, ChungChi, ChuyenMon, DanhGia, SoDanhGia) VALUES (s.MaNangLucNhanVien, s.MaNhanVien, s.NgonNgu, s.ChungChi, s.ChuyenMon, s.DanhGia, s.SoDanhGia);

COMMIT;
