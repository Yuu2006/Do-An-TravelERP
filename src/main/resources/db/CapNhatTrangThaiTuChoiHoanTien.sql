-- Cap nhat schema hien co de bo sung trang thai don dat tour khi ke toan tu choi hoan tien.
-- Chay script nay neu database da duoc tao truoc khi them TU_CHOI_HOAN_TIEN.

ALTER TABLE DONDATTOUR DROP CONSTRAINT CK_DDT_TrangThai;

ALTER TABLE DONDATTOUR ADD CONSTRAINT CK_DDT_TrangThai CHECK (TrangThai IN (
    'CHO_XAC_NHAN',
    'DA_XAC_NHAN',
    'DA_HUY',
    'HET_HAN_GIU_CHO',
    'CHO_HUY',
    'TU_CHOI_HOAN_TIEN',
    'THANH_TOAN_THAT_BAI'
));
