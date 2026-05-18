-- Cap nhat schema hien co de bo sung trang thai voucher va trang thai voucher trong vi khach hang.
-- Chay script nay neu database da duoc tao truoc khi them cac cot TrangThai nay.

ALTER TABLE VOUCHER ADD (
    TrangThai VARCHAR2(20) DEFAULT 'SAN_SANG' NOT NULL
);

ALTER TABLE VOUCHER ADD CONSTRAINT CK_VOUCHER_TrangThai CHECK (TrangThai IN (
    'SAN_SANG',
    'VO_HIEU_HOA'
));

ALTER TABLE KHUYENMAI_KH ADD (
    TrangThai VARCHAR2(20) DEFAULT 'CO_HIEU_LUC' NOT NULL
);

ALTER TABLE KHUYENMAI_KH ADD CONSTRAINT CK_KMKH_TrangThai CHECK (TrangThai IN (
    'CO_HIEU_LUC',
    'DA_SU_DUNG',
    'DA_THU_HOI',
    'HET_HAN'
));
