-- Cap nhat schema hien co de bo sung muc do su co trong nhat ky su co.
-- Chay script nay neu database da duoc tao truoc khi them cot MucDo.

ALTER TABLE NHATKYSUCO ADD (
    MucDo VARCHAR2(20) DEFAULT 'TRUNG_BINH' NOT NULL
);

ALTER TABLE NHATKYSUCO ADD CONSTRAINT CK_NKSC_MucDo CHECK (MucDo IN (
    'THAP',
    'TRUNG_BINH',
    'CAO'
));
