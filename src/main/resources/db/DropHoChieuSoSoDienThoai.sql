-- Chay tren DB da ton tai de bo cot trung lap voi TAIKHOAN.SoDienThoai.
UPDATE TAIKHOAN tk
SET tk.SoDienThoai = (
    SELECT hcs.SoDienThoai
    FROM HOCHIEUSO hcs
    WHERE hcs.MaTaiKhoan = tk.MaTaiKhoan
)
WHERE tk.SoDienThoai IS NULL
  AND EXISTS (
      SELECT 1
      FROM HOCHIEUSO hcs
      WHERE hcs.MaTaiKhoan = tk.MaTaiKhoan
        AND hcs.SoDienThoai IS NOT NULL
  );

ALTER TABLE HOCHIEUSO DROP COLUMN SoDienThoai;
