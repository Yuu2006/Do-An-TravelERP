-- ============================================================
-- Fix nullable unique keys on CHITIETDATTOUR for existing schemas
-- Run before data_v3_demo.sql if the schema was created before this fix.
-- ============================================================

BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE CHITIETDATTOUR DROP CONSTRAINT UQ_CTDT_DATTOUR_KHACHHANG';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2443 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE CHITIETDATTOUR DROP CONSTRAINT UQ_CTDT_DATTOUR_NDH';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2443 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX UQ_CTDT_DATTOUR_KHACHHANG';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX UQ_CTDT_DATTOUR_NDH';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

CREATE UNIQUE INDEX UQ_CTDT_DATTOUR_KHACHHANG
    ON CHITIETDATTOUR (
        CASE WHEN MaKhachHang IS NOT NULL THEN MaDatTour END,
        CASE WHEN MaKhachHang IS NOT NULL THEN MaKhachHang END
    );

CREATE UNIQUE INDEX UQ_CTDT_DATTOUR_NDH
    ON CHITIETDATTOUR (
        CASE WHEN MaNguoiDongHanh IS NOT NULL THEN MaDatTour END,
        CASE WHEN MaNguoiDongHanh IS NOT NULL THEN MaNguoiDongHanh END
    );
