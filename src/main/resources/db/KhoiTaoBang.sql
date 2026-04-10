-- ============================================================
-- Digital Travel ERP - Oracle DDL
-- Sinh tu skill  : oracle-create-table
-- Nguon logic    : docs_source/motaDatabase.md
-- Naming mode    : logical-name (PascalCase Vietnamese business cols)
-- Audit columns  : ThoiDiemTao, CapNhatVao, TaoBoi, CapNhatBoi
-- Cap nhat       : 2026-04-02
-- ============================================================

-- ------------------------------------------------------------
-- DROP TABLE (thu tu nguoc phu thuoc FK)
-- ------------------------------------------------------------
BEGIN
    FOR t IN (
        SELECT table_name FROM user_tables
        WHERE table_name IN (
                             'DANHGIAKH','YEUCAUHOTRO','NHATKYDOIDIEM','QUYETTOAN',
                             'CHIPHITHUCTE','NHATKYSUCO','HANHDONG','DIEMDANH',
                             'PHANCONGTOUR','LICHSUTOUR','THANHTOAN','DATTOUR_UUDAI',
                             'KHUYENMAI_KH','VOUCHER','CHITIETDICHVU','CHITIETDATTOUR',
                             'DONDATTOUR','TOURTHUCTE','LICHTRINHTOUR','NANGLUCNHANVIEN',
                             'NHANVIEN','HOCHIEUSO','HANHDONGXANH','DICHVUTHEM',
                             'LOAIPHONG','TOURMAU','VAITRO','TAIKHOAN'
            )
        ) LOOP
            EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS PURGE';
        END LOOP;
END;
/

-- ============================================================
-- PHAN HE: DINH DANH VA KHACH HANG
-- ============================================================

-- Danh muc vai tro he thong
CREATE TABLE VAITRO (
                        MaVaiTro         VARCHAR2(50)  PRIMARY KEY,
                        TenHienThi       VARCHAR2(100) NOT NULL,
                        TrangThai        VARCHAR2(20)  DEFAULT 'HOAT_DONG' NOT NULL,
                        ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                        CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                        TaoBoi           VARCHAR2(100),
                        CapNhatBoi       VARCHAR2(100),
                        CONSTRAINT CK_VAITRO_TTHAI        CHECK (TrangThai IN ('HOAT_DONG','KHOA'))
);

-- Tai khoan dang nhap he thong
CREATE TABLE TAIKHOAN (
                          MaTaiKhoan       VARCHAR2(50)  PRIMARY KEY,
                          TenDangNhap      VARCHAR2(100) NOT NULL,
                          MatKhau          VARCHAR2(255) NOT NULL,
                          HoTen            VARCHAR2(200) NOT NULL,
                          SoDinhDanh       VARCHAR2(20),
                          Email            VARCHAR2(200),
                          SoDienThoai      VARCHAR2(20),
                          VaiTro           VARCHAR2(50)  NOT NULL,
                          TrangThai        VARCHAR2(20)  DEFAULT 'HOAT_DONG' NOT NULL,
                          ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                          CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                          TaoBoi           VARCHAR2(100),
                          CapNhatBoi       VARCHAR2(100),
                          CONSTRAINT UQ_TK_TenDangNhap      UNIQUE (TenDangNhap),
                          CONSTRAINT UQ_TK_Email            UNIQUE (Email),
                          CONSTRAINT UQ_TK_SoDinhDanh       UNIQUE (SoDinhDanh),
                          CONSTRAINT FK_TK_VaiTro           FOREIGN KEY (VaiTro) REFERENCES VAITRO(MaVaiTro),
    CONSTRAINT CK_TAIKHOAN_TTHAI      CHECK (TrangThai IN ('HOAT_DONG','KHOA'))
);

-- Ho so nghiep vu cua khach hang (1-1 voi TAIKHOAN co VaiTro = KHACHHANG)
CREATE TABLE HOCHIEUSO (
                           MaKhachHang      VARCHAR2(50)   PRIMARY KEY,
                           MaTaiKhoan       VARCHAR2(50)   NOT NULL,
                           GhiChuYTe        CLOB,
                           DiUng            VARCHAR2(1000),
                           HangThanhVien    VARCHAR2(20)   DEFAULT 'CO_BAN' NOT NULL,
                           DiemXanh         NUMBER(15)     DEFAULT 0 NOT NULL,
                           ThoiDiemTao      TIMESTAMP      DEFAULT SYSTIMESTAMP NOT NULL,
                           CapNhatVao       TIMESTAMP      DEFAULT SYSTIMESTAMP,
                           CONSTRAINT UQ_HCS_TaiKhoan        UNIQUE (MaTaiKhoan),
                           CONSTRAINT FK_HCS_TaiKhoan        FOREIGN KEY (MaTaiKhoan)   REFERENCES TAIKHOAN(MaTaiKhoan),
                           CONSTRAINT CK_HCS_HangTV          CHECK (HangThanhVien IN ('CO_BAN','BAC','VANG','KIM_CUONG')),
                           CONSTRAINT CK_HCS_DiemXanh        CHECK (DiemXanh >= 0)
);

-- Ho so nhan vien noi bo (1-1 voi TAIKHOAN co VaiTro != KHACHHANG)
CREATE TABLE NHANVIEN (
                          MaNhanVien           VARCHAR2(50) PRIMARY KEY,
                          MaTaiKhoan           VARCHAR2(50) NOT NULL,
                          LoaiNhanVien         VARCHAR2(50),
                          NgayVaoLam           DATE,
                          TrangThaiLamViec     VARCHAR2(20) DEFAULT 'AVAILABLE' NOT NULL,
                          ThoiDiemTao          TIMESTAMP    DEFAULT SYSTIMESTAMP NOT NULL,
                          CapNhatVao           TIMESTAMP    DEFAULT SYSTIMESTAMP,
                          CONSTRAINT UQ_NV_TaiKhoan          UNIQUE (MaTaiKhoan),
                          CONSTRAINT FK_NV_TaiKhoan          FOREIGN KEY (MaTaiKhoan)   REFERENCES TAIKHOAN(MaTaiKhoan),
                          CONSTRAINT CK_NV_TrangThai         CHECK (TrangThaiLamViec IN ('AVAILABLE','BUSY','OFF'))
);

-- Nang luc va chung chi huong dan vien
CREATE TABLE NANGLUCNHANVIEN (
                                 MaNangLucNhanVien    VARCHAR2(50)  PRIMARY KEY,
                                 MaNhanVien           VARCHAR2(50)  NOT NULL,
                                 NgonNgu              VARCHAR2(200),
                                 ChungChi             VARCHAR2(500),
                                 ChuyenMon            VARCHAR2(500),
                                 DanhGia              NUMBER(3,2)   DEFAULT 0,
                                 SoDanhGia            NUMBER(10)    DEFAULT 0,
                                 ThoiDiemTao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                                 CapNhatVao           TIMESTAMP     DEFAULT SYSTIMESTAMP,
                                 CONSTRAINT FK_NLNV_NhanVien        FOREIGN KEY (MaNhanVien)   REFERENCES NHANVIEN(MaNhanVien),
                                 CONSTRAINT CK_NLNV_DanhGia         CHECK (DanhGia BETWEEN 0 AND 5),
                                 CONSTRAINT CK_NLNV_SoDanhGia       CHECK (SoDanhGia >= 0)
);

-- ============================================================
-- PHAN HE: SAN PHAM
-- ============================================================

-- Dinh nghia san pham tour mau
CREATE TABLE TOURMAU (
                         MaTourMau        VARCHAR2(50)  PRIMARY KEY,
                         TieuDe           VARCHAR2(500) NOT NULL,
                         MoTa             CLOB,
                         ThoiLuong        NUMBER(5)     NOT NULL,
                         GiaSan           NUMBER(18,2)  NOT NULL,
                         DanhGia          NUMBER(3,2)   DEFAULT 0,
                         SoDanhGia        NUMBER(10)    DEFAULT 0,
                         TrangThai        VARCHAR2(20)  DEFAULT 'HOAT_DONG' NOT NULL,
                         ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                         CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                         TaoBoi           VARCHAR2(100),
                         CapNhatBoi       VARCHAR2(100),
                         CONSTRAINT CK_TOURMAU_ThoiLuong    CHECK (ThoiLuong > 0),
                         CONSTRAINT CK_TOURMAU_GiaSan       CHECK (GiaSan >= 0),
                         CONSTRAINT CK_TOURMAU_DanhGia      CHECK (DanhGia BETWEEN 0 AND 5),
                         CONSTRAINT CK_TOURMAU_SoDanhGia    CHECK (SoDanhGia >= 0),
                         CONSTRAINT CK_TOURMAU_TrangThai    CHECK (TrangThai IN ('HOAT_DONG','KHOA'))
);

-- Lich trinh tung ngay cua tour mau
CREATE TABLE LICHTRINHTOUR (
                               MaLichTrinhTour  VARCHAR2(50)    PRIMARY KEY,
                               MaTourMau        VARCHAR2(50)    NOT NULL,
                               NgayThu          NUMBER(3)       NOT NULL,
                               HoatDong         VARCHAR2(1000),
                               MoTa             CLOB,
                               ThucDon          VARCHAR2(1000),
                               ThoiDiemTao      TIMESTAMP       DEFAULT SYSTIMESTAMP NOT NULL,
                               CapNhatVao       TIMESTAMP       DEFAULT SYSTIMESTAMP,
                               CONSTRAINT FK_LTT_TourMau              FOREIGN KEY (MaTourMau)   REFERENCES TOURMAU(MaTourMau),
                               CONSTRAINT CK_LICHTRINHTOUR_NgayThu    CHECK (NgayThu > 0)
);

-- Danh muc loai phong / phu thu
CREATE TABLE LOAIPHONG (
                           MaLoaiPhong      VARCHAR2(50)  PRIMARY KEY,
                           TenLoai          VARCHAR2(200) NOT NULL,
                           MucPhuThu        NUMBER(18,2)  DEFAULT 0 NOT NULL,
                           TrangThai        VARCHAR2(20)  DEFAULT 'HOAT_DONG' NOT NULL,
                           ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                           CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                           CONSTRAINT CK_LOAIPHONG_MucPhuThu  CHECK (MucPhuThu >= 0),
                           CONSTRAINT CK_LOAIPHONG_TrangThai  CHECK (TrangThai IN ('HOAT_DONG','KHOA'))
);

-- Danh muc dich vu bo sung
CREATE TABLE DICHVUTHEM (
                            MaDichVuThem     VARCHAR2(50)  PRIMARY KEY,
                            Ten              VARCHAR2(200) NOT NULL,
                            DonViTinh        VARCHAR2(100),
                            DonGia           NUMBER(18,2)  NOT NULL,
                            TrangThai        VARCHAR2(20)  DEFAULT 'HOAT_DONG' NOT NULL,
                            ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                            CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                            CONSTRAINT CK_DICHVUTHEM_DonGia      CHECK (DonGia >= 0),
                            CONSTRAINT CK_DICHVUTHEM_TrangThai   CHECK (TrangThai IN ('HOAT_DONG','KHOA'))
);

-- Danh muc hanh dong xanh duoc cong diem loyalty
CREATE TABLE HANHDONGXANH (
                              MaHanhDongXanh   VARCHAR2(50)  PRIMARY KEY,
                              TenHanhDong      VARCHAR2(200) NOT NULL,
                              DiemCong         NUMBER(10)    NOT NULL,
                              TrangThai        VARCHAR2(20)  DEFAULT 'HOAT_DONG' NOT NULL,
                              ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                              CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                              CONSTRAINT CK_HANHDONGXANH_DiemCong    CHECK (DiemCong >= 0),
                              CONSTRAINT CK_HANHDONGXANH_TrangThai   CHECK (TrangThai IN ('HOAT_DONG','KHOA'))
);

-- Dot khoi hanh cu the duoc tao tu tour mau
CREATE TABLE TOURTHUCTE (
                            MaTourThucTe         VARCHAR2(50) PRIMARY KEY,
                            MaTourMau            VARCHAR2(50) NOT NULL,
                            NgayKhoiHanh         DATE         NOT NULL,
                            GiaHienHanh          NUMBER(18,2) NOT NULL,
                            SoKhachToiDa         NUMBER(5)    NOT NULL,
                            SoKhachToiThieu      NUMBER(5)    DEFAULT 1 NOT NULL,
                            ChoConLai            NUMBER(5)    NOT NULL,
                            TrangThai            VARCHAR2(20) DEFAULT 'CHO_KICH_HOAT' NOT NULL,
                            ThoiDiemTao          TIMESTAMP    DEFAULT SYSTIMESTAMP NOT NULL,
                            CapNhatVao           TIMESTAMP    DEFAULT SYSTIMESTAMP,
                            TaoBoi               VARCHAR2(100),
                            CapNhatBoi           VARCHAR2(100),
                            CONSTRAINT FK_TTT_TourMau              FOREIGN KEY (MaTourMau)   REFERENCES TOURMAU(MaTourMau),
                            CONSTRAINT CK_TTT_GiaHienHanh          CHECK (GiaHienHanh >= 0),
                            CONSTRAINT CK_TTT_SoKhach              CHECK (SoKhachToiDa >= SoKhachToiThieu AND SoKhachToiThieu > 0),
                            CONSTRAINT CK_TTT_ChoConLai            CHECK (ChoConLai >= 0 AND ChoConLai <= SoKhachToiDa),
                            CONSTRAINT CK_TTT_TrangThai            CHECK (TrangThai IN (
                                                                                        'CHO_KICH_HOAT','MO_BAN','SAP_DIEN_RA','DANG_DIEN_RA',
                                                                                        'KET_THUC','HUY','DA_QUYET_TOAN'
                                ))
);

-- ============================================================
-- PHAN HE: DAT TOUR VA THANH TOAN
-- ============================================================

-- Don dat tour cua khach hang
CREATE TABLE DONDATTOUR (
                            MaDatTour        VARCHAR2(50)  PRIMARY KEY,
                            MaTourThucTe     VARCHAR2(50)  NOT NULL,
                            MaKhachHang      VARCHAR2(50)  NOT NULL,
                            NgayDat          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                            TongTien         NUMBER(18,2)  NOT NULL,
                            TrangThai        VARCHAR2(30)  DEFAULT 'CHO_XAC_NHAN' NOT NULL,
                            ThoiGianHetHan   TIMESTAMP,
                            GhiChu           VARCHAR2(2000),
                            ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                            CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                            TaoBoi           VARCHAR2(100),
                            CapNhatBoi       VARCHAR2(100),
                            CONSTRAINT FK_DDT_TourThucTe           FOREIGN KEY (MaTourThucTe) REFERENCES TOURTHUCTE(MaTourThucTe),
                            CONSTRAINT FK_DDT_KhachHang            FOREIGN KEY (MaKhachHang)  REFERENCES HOCHIEUSO(MaKhachHang),
                            CONSTRAINT CK_DDT_TongTien             CHECK (TongTien >= 0),
                            CONSTRAINT CK_DDT_TrangThai            CHECK (TrangThai IN (
                                                                                        'CHO_XAC_NHAN','DA_XAC_NHAN','DA_HUY','HET_HAN_GIU_CHO'
                                ))
);

-- Danh sach hanh khach trong 1 don dat (moi hang = 1 nguoi)
CREATE TABLE CHITIETDATTOUR (
                                MaChiTietDat         VARCHAR2(50) PRIMARY KEY,
                                MaDatTour            VARCHAR2(50) NOT NULL,
                                MaKhachHang          VARCHAR2(50) NOT NULL,
                                MaLoaiPhong          VARCHAR2(50),
                                GiaTaiThoiDiemDat    NUMBER(18,2) NOT NULL,
                                ThoiDiemTao          TIMESTAMP    DEFAULT SYSTIMESTAMP NOT NULL,
                                CapNhatVao           TIMESTAMP    DEFAULT SYSTIMESTAMP,
                                CONSTRAINT UQ_CTDT_DatTour_KhachHang  UNIQUE (MaDatTour, MaKhachHang),
                                CONSTRAINT FK_CTDT_DatTour             FOREIGN KEY (MaDatTour)   REFERENCES DONDATTOUR(MaDatTour),
                                CONSTRAINT FK_CTDT_KhachHang           FOREIGN KEY (MaKhachHang) REFERENCES HOCHIEUSO(MaKhachHang),
                                CONSTRAINT FK_CTDT_LoaiPhong           FOREIGN KEY (MaLoaiPhong) REFERENCES LOAIPHONG(MaLoaiPhong),
                                CONSTRAINT CK_CTDT_Gia                 CHECK (GiaTaiThoiDiemDat >= 0)
);

-- Dich vu bo sung trong 1 don dat
CREATE TABLE CHITIETDICHVU (
                               MaChiTietDichVu  VARCHAR2(50)  PRIMARY KEY,
                               MaDatTour        VARCHAR2(50)  NOT NULL,
                               MaDichVuThem     VARCHAR2(50)  NOT NULL,
                               SoLuong          NUMBER(10)    NOT NULL,
                               DonGia           NUMBER(18,2)  NOT NULL,
                               ThanhTien        NUMBER(18,2)  NOT NULL,
                               ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                               CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                               CONSTRAINT FK_CTDV_DatTour             FOREIGN KEY (MaDatTour)    REFERENCES DONDATTOUR(MaDatTour),
                               CONSTRAINT FK_CTDV_DichVuThem          FOREIGN KEY (MaDichVuThem) REFERENCES DICHVUTHEM(MaDichVuThem),
                               CONSTRAINT CK_CTDV_SoLuong             CHECK (SoLuong > 0),
                               CONSTRAINT CK_CTDV_DonGia              CHECK (DonGia >= 0),
                               CONSTRAINT CK_CTDV_ThanhTien           CHECK (ThanhTien >= 0),
                               CONSTRAINT CK_CTDV_ThanhTien_Calc CHECK (ThanhTien = SoLuong * DonGia)
);

-- Chuong trinh uu dai (voucher master)
CREATE TABLE VOUCHER (
                         MaVoucher            VARCHAR2(50)   PRIMARY KEY,
                         MaCode               VARCHAR2(50)   NOT NULL,
                         LoaiUuDai            VARCHAR2(20)   NOT NULL,
                         GiaTriGiam           NUMBER(18,2)   NOT NULL,
                         DieuKienApDung       VARCHAR2(2000),
                         SoLuotPhatHanh       NUMBER(10)     DEFAULT 1 NOT NULL,
                         SoLuotDaDung         NUMBER(10)     DEFAULT 0 NOT NULL,
                         NgayHieuLuc          DATE           NOT NULL,
                         NgayHetHan           DATE           NOT NULL,
                         TrangThai            VARCHAR2(20)   DEFAULT 'SAN_SANG' NOT NULL,
                         ThoiDiemTao          TIMESTAMP      DEFAULT SYSTIMESTAMP NOT NULL,
                         CapNhatVao           TIMESTAMP      DEFAULT SYSTIMESTAMP,
                         TaoBoi               VARCHAR2(100),
                         CapNhatBoi           VARCHAR2(100),
                         CONSTRAINT UQ_VOUCHER_MaCode           UNIQUE (MaCode),
                         CONSTRAINT CK_VOUCHER_LoaiUuDai        CHECK (LoaiUuDai IN ('PHAN_TRAM','SO_TIEN')),
                         CONSTRAINT CK_VOUCHER_GiaTriGiam       CHECK (GiaTriGiam >= 0),
                         CONSTRAINT CK_VOUCHER_SoLuot           CHECK (SoLuotPhatHanh > 0 AND SoLuotDaDung >= 0),
                         CONSTRAINT CK_VOUCHER_DaDung           CHECK (SoLuotDaDung <= SoLuotPhatHanh),
                         CONSTRAINT CK_VOUCHER_PhanTram         CHECK (LoaiUuDai <> 'PHAN_TRAM' OR GiaTriGiam <= 100),
                         CONSTRAINT CK_VOUCHER_NgayHL           CHECK (NgayHieuLuc <= NgayHetHan),
                         CONSTRAINT CK_VOUCHER_TrangThai        CHECK (TrangThai IN ('SAN_SANG','VO_HIEU'))
);

-- Vi voucher cua khach hang
CREATE TABLE KHUYENMAI_KH (
                              MaKhachHang      VARCHAR2(50)  NOT NULL,
                              MaVoucher        VARCHAR2(50)  NOT NULL,
                              TrangThai        VARCHAR2(20)  DEFAULT 'SAN_SANG' NOT NULL,
                              NgayHetHan       DATE,
                              NgayNhan         TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                              ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                              CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                              CONSTRAINT PK_KHUYENMAIKH              PRIMARY KEY (MaKhachHang, MaVoucher),
                              CONSTRAINT FK_KMKH_KhachHang           FOREIGN KEY (MaKhachHang) REFERENCES HOCHIEUSO(MaKhachHang),
                              CONSTRAINT FK_KMKH_Voucher             FOREIGN KEY (MaVoucher)   REFERENCES VOUCHER(MaVoucher),
                              CONSTRAINT CK_KMKH_TrangThai           CHECK (TrangThai IN ('SAN_SANG','DA_DUNG','HET_HAN','VO_HIEU'))
);

-- Lich su ap dung voucher vao don dat
CREATE TABLE DATTOUR_UUDAI (
                               MaDatTour        VARCHAR2(50)  NOT NULL,
                               MaVoucher        VARCHAR2(50)  NOT NULL,
                               SoTienUuDai      NUMBER(18,2)  NOT NULL,
                               NgayApDung       TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                               CONSTRAINT PK_DATTOUR_UUDAI            PRIMARY KEY (MaDatTour, MaVoucher),
                               CONSTRAINT FK_DTUD_DatTour             FOREIGN KEY (MaDatTour)  REFERENCES DONDATTOUR(MaDatTour),
                               CONSTRAINT FK_DTUD_Voucher             FOREIGN KEY (MaVoucher)  REFERENCES VOUCHER(MaVoucher),
                               CONSTRAINT CK_DTUD_SoTienUD            CHECK (SoTienUuDai >= 0)
);

-- Giao dich thanh toan
CREATE TABLE THANHTOAN (
                           MaThanhToan      VARCHAR2(50)  PRIMARY KEY,
                           MaDatTour        VARCHAR2(50)  NOT NULL,
                           PhuongThuc       VARCHAR2(50)  NOT NULL,
                           SoTien           NUMBER(18,2)  NOT NULL,
                           MaGiaoDich       VARCHAR2(200),
                           TrangThai        VARCHAR2(30)  DEFAULT 'CHO_THANH_TOAN' NOT NULL,
                           NgayThanhToan    TIMESTAMP,
                           GhiChu           VARCHAR2(2000),
                           ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                           CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                           CONSTRAINT FK_THANHTOAN_DatTour        FOREIGN KEY (MaDatTour)  REFERENCES DONDATTOUR(MaDatTour),
                           CONSTRAINT CK_THANHTOAN_SoTien         CHECK (SoTien >= 0),
                           CONSTRAINT CK_THANHTOAN_TrangThai      CHECK (TrangThai IN (
                                                                                       'CHO_THANH_TOAN','THANH_CONG','THAT_BAI','CHO_HOAN_TIEN','DA_HOAN_TIEN'
                               ))
);

-- Lich su tham gia tour cua khach
CREATE TABLE LICHSUTOUR (
                            MaLichSuTour     VARCHAR2(50)  PRIMARY KEY,
                            MaKhachHang      VARCHAR2(50)  NOT NULL,
                            MaTourThucTe     VARCHAR2(50)  NOT NULL,
                            MaChiTietDat     VARCHAR2(50),
                            NgayThamGia      DATE,
                            ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                            CONSTRAINT UQ_LST_KhachHang_TourThucTe UNIQUE (MaKhachHang, MaTourThucTe),
                            CONSTRAINT FK_LST_KhachHang            FOREIGN KEY (MaKhachHang)  REFERENCES HOCHIEUSO(MaKhachHang),
                            CONSTRAINT FK_LST_TourThucTe           FOREIGN KEY (MaTourThucTe) REFERENCES TOURTHUCTE(MaTourThucTe),
                            CONSTRAINT FK_LST_ChiTietDat           FOREIGN KEY (MaChiTietDat) REFERENCES CHITIETDATTOUR(MaChiTietDat)
);

-- ============================================================
-- PHAN HE: VAN HANH VA HIEN TRUONG
-- ============================================================

-- Phan cong HDV theo tour thuc te
CREATE TABLE PHANCONGTOUR (
                              MaPhanCongTour   VARCHAR2(50)  PRIMARY KEY,
                              MaTourThucTe     VARCHAR2(50)  NOT NULL,
                              MaNhanVien       VARCHAR2(50)  NOT NULL,
                              NgayPhanCong     TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                              TrangThai        VARCHAR2(20)  DEFAULT 'CHO_XAC_NHAN' NOT NULL,
                              ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                              CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                              TaoBoi           VARCHAR2(100),
                              CONSTRAINT UQ_PCT_TourThucTe_NhanVien UNIQUE (MaTourThucTe, MaNhanVien),
                              CONSTRAINT FK_PCT_TourThucTe           FOREIGN KEY (MaTourThucTe) REFERENCES TOURTHUCTE(MaTourThucTe),
                              CONSTRAINT FK_PCT_NhanVien             FOREIGN KEY (MaNhanVien)   REFERENCES NHANVIEN(MaNhanVien),
                              CONSTRAINT CK_PCT_TrangThai            CHECK (TrangThai IN ('CHO_XAC_NHAN','DA_XAC_NHAN','HUY'))
);

-- Nhat ky diem danh khach trong tour
CREATE TABLE DIEMDANH (
                          MaDiemDanh       VARCHAR2(50)  PRIMARY KEY,
                          MaTourThucTe     VARCHAR2(50)  NOT NULL,
                          MaKhachHang      VARCHAR2(50)  NOT NULL,
                          MaNhanVien       VARCHAR2(50)  NOT NULL,
                          ThoiGian         TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                          DiaDiem          VARCHAR2(500),
                          ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                          CONSTRAINT FK_DIEMDANH_TourThucTe      FOREIGN KEY (MaTourThucTe) REFERENCES TOURTHUCTE(MaTourThucTe),
                          CONSTRAINT FK_DIEMDANH_KhachHang       FOREIGN KEY (MaKhachHang)  REFERENCES HOCHIEUSO(MaKhachHang),
                          CONSTRAINT FK_DIEMDANH_NhanVien        FOREIGN KEY (MaNhanVien)   REFERENCES NHANVIEN(MaNhanVien),
                          CONSTRAINT FK_DIEMDANH_PhanCong        FOREIGN KEY (MaTourThucTe, MaNhanVien)
                              REFERENCES PHANCONGTOUR(MaTourThucTe, MaNhanVien)
);

-- Nhat ky xac nhan hanh dong xanh
CREATE TABLE HANHDONG (
                          MaGhiNhanHanhDong    VARCHAR2(50) PRIMARY KEY,
                          MaTourThucTe         VARCHAR2(50) NOT NULL,
                          MaKhachHang          VARCHAR2(50) NOT NULL,
                          MaHanhDongXanh       VARCHAR2(50) NOT NULL,
                          MaNhanVienXacMinh    VARCHAR2(50) NOT NULL,
                          ThoiGian             TIMESTAMP    DEFAULT SYSTIMESTAMP NOT NULL,
                          MinhChung            VARCHAR2(1000),
                          ThoiDiemTao          TIMESTAMP    DEFAULT SYSTIMESTAMP NOT NULL,
                          CONSTRAINT FK_HANHDONG_TourThucTe      FOREIGN KEY (MaTourThucTe)      REFERENCES TOURTHUCTE(MaTourThucTe),
                          CONSTRAINT FK_HANHDONG_KhachHang       FOREIGN KEY (MaKhachHang)       REFERENCES HOCHIEUSO(MaKhachHang),
                          CONSTRAINT FK_HANHDONG_HanhDongXanh    FOREIGN KEY (MaHanhDongXanh)    REFERENCES HANHDONGXANH(MaHanhDongXanh),
                          CONSTRAINT FK_HANHDONG_NhanVienXM      FOREIGN KEY (MaNhanVienXacMinh) REFERENCES NHANVIEN(MaNhanVien),
                          CONSTRAINT FK_HANHDONG_PhanCong        FOREIGN KEY (MaTourThucTe, MaNhanVienXacMinh)
                              REFERENCES PHANCONGTOUR(MaTourThucTe, MaNhanVien)
);

-- Nhat ky su co trong tour
CREATE TABLE NHATKYSUCO (
                            MaNhatKySuCo         VARCHAR2(50) PRIMARY KEY,
                            MaTourThucTe         VARCHAR2(50) NOT NULL,
                            MaNhanVienBaoCao     VARCHAR2(50) NOT NULL,
                            MoTa                 CLOB         NOT NULL,
                            GiaiPhap             CLOB,
                            TrangThai            VARCHAR2(20) DEFAULT 'MOI_TAO' NOT NULL,
                            ThoiGianBaoCao       TIMESTAMP    DEFAULT SYSTIMESTAMP NOT NULL,
                            ThoiDiemTao          TIMESTAMP    DEFAULT SYSTIMESTAMP NOT NULL,
                            CapNhatVao           TIMESTAMP    DEFAULT SYSTIMESTAMP,
                            CONSTRAINT FK_NKSC_TourThucTe          FOREIGN KEY (MaTourThucTe)     REFERENCES TOURTHUCTE(MaTourThucTe),
                            CONSTRAINT FK_NKSC_NhanVienBC          FOREIGN KEY (MaNhanVienBaoCao) REFERENCES NHANVIEN(MaNhanVien),
                            CONSTRAINT CK_NKSC_TrangThai           CHECK (TrangThai IN ('MOI_TAO','DANG_XU_LY','DA_DONG'))
);

-- Chi phi thuc te do HDV khai bao
CREATE TABLE CHIPHITHUCTE (
                              MaChiPhiThucTe   VARCHAR2(50)  PRIMARY KEY,
                              MaTourThucTe     VARCHAR2(50)  NOT NULL,
                              MaNhanVien       VARCHAR2(50)  NOT NULL,
                              DanhMuc          VARCHAR2(200) NOT NULL,
                              ThanhTien        NUMBER(18,2)  NOT NULL,
                              HoaDonAnh        VARCHAR2(1000),
                              TrangThaiDuyet   VARCHAR2(20)  DEFAULT 'CHO_DUYET' NOT NULL,
                              NgayKhai         TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                              ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                              CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                              CONSTRAINT FK_CPTT_TourThucTe          FOREIGN KEY (MaTourThucTe) REFERENCES TOURTHUCTE(MaTourThucTe),
                              CONSTRAINT FK_CPTT_NhanVien            FOREIGN KEY (MaNhanVien)   REFERENCES NHANVIEN(MaNhanVien),
                              CONSTRAINT CK_CPTT_ThanhTien           CHECK (ThanhTien >= 0),
                              CONSTRAINT CK_CPTT_TrangThaiDuyet      CHECK (TrangThaiDuyet IN ('CHO_DUYET','DA_DUYET','TU_CHOI'))
);

-- ============================================================
-- PHAN HE: TAI CHINH VA HO TRO
-- ============================================================

-- Tong hop quyet toan doanh thu - chi phi theo tour (1-1 voi TOURTHUCTE)
CREATE TABLE QUYETTOAN (
                           MaQuyetToan      VARCHAR2(50)  PRIMARY KEY,
                           MaTourThucTe     VARCHAR2(50)  NOT NULL,
                           TongDoanhThu     NUMBER(18,2)  NOT NULL,
                           TongChiPhi       NUMBER(18,2)  NOT NULL,
                           LoiNhuan         NUMBER(18,2)  NOT NULL,
                           MaNhanVien       VARCHAR2(50)  NOT NULL,
                           NgayQuyetToan    TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                           TrangThai        VARCHAR2(20)  DEFAULT 'DRAFT' NOT NULL,
                           GhiChu           CLOB,
                           ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                           CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                           TaoBoi           VARCHAR2(100),
                           CapNhatBoi       VARCHAR2(100),
                           CONSTRAINT UQ_QUYETTOAN_TourThucTe     UNIQUE (MaTourThucTe),
                           CONSTRAINT FK_QT_TourThucTe            FOREIGN KEY (MaTourThucTe) REFERENCES TOURTHUCTE(MaTourThucTe),
                           CONSTRAINT FK_QT_NhanVien              FOREIGN KEY (MaNhanVien)   REFERENCES NHANVIEN(MaNhanVien),
                           CONSTRAINT CK_QT_TongDoanhThu          CHECK (TongDoanhThu >= 0),
                           CONSTRAINT CK_QT_TongChiPhi            CHECK (TongChiPhi >= 0),
                           CONSTRAINT CK_QT_TrangThai             CHECK (TrangThai IN ('DRAFT','LOCKED')),
                           CONSTRAINT CK_QT_LoiNhuan CHECK (LoiNhuan = TongDoanhThu - TongChiPhi)
);

-- Nhat ky quy doi diem xanh sang voucher
CREATE TABLE NHATKYDOIDIEM (
                               MaNhatKyDoiDiem  VARCHAR2(50)  PRIMARY KEY,
                               MaKhachHang      VARCHAR2(50)  NOT NULL,
                               MaVoucher        VARCHAR2(50)  NOT NULL,
                               DiemQuyDoi       NUMBER(15)    NOT NULL,
                               NgayQuyDoi       TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                               ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                               CONSTRAINT FK_NKDD_KhachHang           FOREIGN KEY (MaKhachHang) REFERENCES HOCHIEUSO(MaKhachHang),
                               CONSTRAINT FK_NKDD_Voucher             FOREIGN KEY (MaVoucher)   REFERENCES VOUCHER(MaVoucher),
                               CONSTRAINT CK_NKDD_DiemQuyDoi         CHECK (DiemQuyDoi > 0)
);

-- Ticket ho tro / khieu nai cua khach
CREATE TABLE YEUCAUHOTRO (
                             MaYeuCauHoTro    VARCHAR2(50)  PRIMARY KEY,
                             MaDatTour        VARCHAR2(50),
                             MaKhachHang      VARCHAR2(50)  NOT NULL,
                             LoaiYeuCau       VARCHAR2(100) NOT NULL,
                             NoiDung          CLOB          NOT NULL,
                             TrangThai        VARCHAR2(20)  DEFAULT 'MOI_TAO' NOT NULL,
                             MaNhanVienXuLy   VARCHAR2(50),
                             ThoiDiemTao      TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
                             CapNhatVao       TIMESTAMP     DEFAULT SYSTIMESTAMP,
                             CONSTRAINT FK_YCHT_DatTour             FOREIGN KEY (MaDatTour)      REFERENCES DONDATTOUR(MaDatTour),
                             CONSTRAINT FK_YCHT_KhachHang           FOREIGN KEY (MaKhachHang)    REFERENCES HOCHIEUSO(MaKhachHang),
                             CONSTRAINT FK_YCHT_NhanVienXL          FOREIGN KEY (MaNhanVienXuLy) REFERENCES NHANVIEN(MaNhanVien),
                             CONSTRAINT CK_YCHT_TrangThai           CHECK (TrangThai IN ('MOI_TAO','DANG_XU_LY','DA_DONG'))
);

-- Danh gia sau tour cua khach hang
CREATE TABLE DANHGIAKH (
                           MaDanhGiaKhachHang   VARCHAR2(50) PRIMARY KEY,
                           MaTourThucTe         VARCHAR2(50) NOT NULL,
                           MaKhachHang          VARCHAR2(50) NOT NULL,
                           SoSao                NUMBER(1)    NOT NULL,
                           NhanXet              CLOB,
                           NgayDanhGia          TIMESTAMP    DEFAULT SYSTIMESTAMP NOT NULL,
                           TrangThai            VARCHAR2(20) DEFAULT 'HIEU_LUC' NOT NULL,
                           ThoiDiemTao          TIMESTAMP    DEFAULT SYSTIMESTAMP NOT NULL,
                           CapNhatVao           TIMESTAMP    DEFAULT SYSTIMESTAMP,
                           CONSTRAINT FK_DGKH_TourThucTe          FOREIGN KEY (MaTourThucTe) REFERENCES TOURTHUCTE(MaTourThucTe),
                           CONSTRAINT FK_DGKH_KhachHang           FOREIGN KEY (MaKhachHang)  REFERENCES HOCHIEUSO(MaKhachHang),
                           CONSTRAINT FK_DGKH_LichSuTour          FOREIGN KEY (MaKhachHang, MaTourThucTe)
                               REFERENCES LICHSUTOUR(MaKhachHang, MaTourThucTe),
                           CONSTRAINT CK_DANHGIAKH_SoSao          CHECK (SoSao BETWEEN 1 AND 5),
                           CONSTRAINT CK_DANHGIAKH_TrangThai      CHECK (TrangThai IN ('HIEU_LUC','AN'))
);


-- Thêm vào cuối file DDL, sau tất cả CREATE TABLE
CREATE INDEX IDX_DONDATTOUR_KHACHHANG    ON DONDATTOUR(MaKhachHang);
CREATE INDEX IDX_DONDATTOUR_TOURTHUCTE   ON DONDATTOUR(MaTourThucTe);
CREATE INDEX IDX_DONDATTOUR_TRANGTHAI    ON DONDATTOUR(TrangThai);
CREATE INDEX IDX_CTDATTOUR_DATTOUR       ON CHITIETDATTOUR(MaDatTour);
CREATE INDEX IDX_CTDICHVU_DATTOUR        ON CHITIETDICHVU(MaDatTour);
CREATE INDEX IDX_THANHTOAN_DATTOUR       ON THANHTOAN(MaDatTour);
CREATE INDEX IDX_PHANCONGTOUR_NHANVIEN   ON PHANCONGTOUR(MaNhanVien);
CREATE INDEX IDX_LICHSUTOUR_KHACHHANG    ON LICHSUTOUR(MaKhachHang);
CREATE INDEX IDX_HANHDONG_KHACHHANG      ON HANHDONG(MaKhachHang);
CREATE INDEX IDX_DIEMDANH_KHACHHANG      ON DIEMDANH(MaKhachHang);
CREATE INDEX IDX_CHIPHITHUCTE_TOURTT     ON CHIPHITHUCTE(MaTourThucTe);
CREATE INDEX IDX_KMKH_VOUCHER            ON KHUYENMAI_KH(MaVoucher);


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
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('MANAGER',    'Quản lý',            'HOAT_DONG');
INSERT INTO VAITRO (MaVaiTro, TenHienThi, TrangThai) VALUES ('SALES',      'Nhân viên kinh doanh','HOAT_DONG');
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
        'Tran Thi Manager', '079099000002', 'manager01@digitaltravel.vn', '0900000002',
        'MANAGER', 'HOAT_DONG', 'SYSTEM');

INSERT INTO TAIKHOAN (MaTaiKhoan, TenDangNhap, MatKhau, HoTen, SoDinhDanh, Email, SoDienThoai, VaiTro, TrangThai, TaoBoi)
VALUES ('TK_SALES01', 'sales01',
        '$2a$10$BBvBS1dGLV8lLRIF47sbfukbnxchs/ZbP6Gdb.JI2H5UZSeHOMmkK',
        'Le Van Sales', '079099000003', 'sales01@digitaltravel.vn', '0900000003',
        'SALES', 'HOAT_DONG', 'SYSTEM');

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
VALUES ('NV_MGR01',    'TK_MGR01',    'MANAGER', DATE '2022-01-15', 'AVAILABLE');
INSERT INTO NHANVIEN (MaNhanVien, MaTaiKhoan, LoaiNhanVien, NgayVaoLam, TrangThaiLamViec)
VALUES ('NV_SALES01',  'TK_SALES01',  'SALES',   DATE '2023-03-01', 'AVAILABLE');
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

COMMIT;
-- ============================================================
-- END SEED DATA
-- ============================================================

