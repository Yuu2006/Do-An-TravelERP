# Phan tich thay doi backend TravelERP

Ngay tong hop: 02/06/2026

Tai lieu nay gom nhom cac file backend dang thay doi theo tung chuc nang, de de tach commit va trinh bay pham vi da sua.

## Tong quan file thay doi

### File da chinh sua

- `src/main/java/com/digitaltravel/erp/controller/AuthController.java`
- `src/main/java/com/digitaltravel/erp/controller/NhanVienController.java`
- `src/main/java/com/digitaltravel/erp/dto/responses/BaoCaoDoanhThuResponse.java`
- `src/main/java/com/digitaltravel/erp/entity/ChiPhiThucTe.java`
- `src/main/java/com/digitaltravel/erp/repository/HanhDongXanhRepository.java`
- `src/main/java/com/digitaltravel/erp/service/HanhDongXanhService.java`
- `src/main/java/com/digitaltravel/erp/service/HuyTourService.java`
- `src/main/java/com/digitaltravel/erp/service/QuyetToanService.java`
- `src/main/java/com/digitaltravel/erp/service/VanHanhService.java`
- `src/main/resources/application.yaml`
- `src/main/resources/db/data_lien_ket.sql`

### File moi

- `src/main/java/com/digitaltravel/erp/config/MigrationConfig.java`
- `src/main/java/com/digitaltravel/erp/controller/UploadController.java`

## Nhom 1: Hanh dong xanh chung cho huong dan vien va van hanh tour

Commit message de xuat:

```text
feat(hanh-dong-xanh): bo sung danh sach hanh dong xanh chung cho HDV
```

File lien quan:

- `src/main/java/com/digitaltravel/erp/controller/NhanVienController.java`
- `src/main/java/com/digitaltravel/erp/repository/HanhDongXanhRepository.java`
- `src/main/java/com/digitaltravel/erp/service/HanhDongXanhService.java`
- `src/main/java/com/digitaltravel/erp/service/VanHanhService.java`
- `src/main/resources/db/data_lien_ket.sql`

Noi dung da sua:

- Doi API `GET /api/huong-dan-vien/hanh-dong-xanh` tu danh sach theo `maTourThucTe` sang danh sach hanh dong xanh chung.
- Bo sung repository query `findCommonActions()` de lay cac hanh dong xanh khong bi gan rieng vao tour thuc te nao trong bang lien ket.
- Bo sung service `danhSachChung()` de tra ve danh sach hanh dong xanh chung theo response hien co.
- Bo dieu kien bat buoc hanh dong xanh phai thuoc tour trong luong ghi nhan hanh dong xanh cua `VanHanhService`.
- Bo sung du lieu mau cho cac hanh dong xanh chung:
  - Mang binh nuoc ca nhan trong tour.
  - Tham gia nhat rac tai diem tham quan.
  - Dung tram tiep nuoc thay chai nhua dung mot lan.
  - Uu tien san pham dia phuong it bao bi nhua.

Y nghia chuc nang:

- HDV co the xac nhan cac hanh dong xanh pho bien phat sinh trong thuc te, khong phu thuoc vao cau hinh rieng cua tung tour.
- He thong van giu duoc danh sach hanh dong xanh gan tour cho cac man hinh/luong nghiep vu khac, dong thoi co them tap hanh dong chung de su dung linh hoat.

## Nhom 2: Chuan hoa ghi chu y te cua nguoi dong hanh trong van hanh tour

Commit message de xuat:

```text
fix(van-hanh): chuan hoa ghi chu y te cua nguoi dong hanh
```

File lien quan:

- `src/main/java/com/digitaltravel/erp/service/VanHanhService.java`
- `src/main/resources/db/data_lien_ket.sql`

Noi dung da sua:

- Them ham chuan hoa ghi chu nguoi dong hanh trong `VanHanhService`.
- Loai bo cac ghi chu mang tinh quan he, thong bao lich trinh hoac ghi chu van hanh chung khoi truong `ghiChuYTe`.
- Chuyen doi cac ghi chu ngan thanh mo ta y te/suc khoe ro rang hon:
  - `Tre em` thanh ghi chu can luu y lich nghi va bua an.
  - `Nguoi cao tuoi` thanh ghi chu can lich trinh nhe va ho tro di chuyen.
  - Ghi chu ve an uong/gio nghi thanh noi dung ho tro cu the hon.
- Ap dung chuan hoa khi tra danh sach khach, chi tiet khach trong tour va du lieu su co lien quan den khach/nguoi dong hanh.
- Cap nhat SQL seed de du lieu nguoi dong hanh mau chi luu cac luu y y te/suc khoe that su trong truong `GhiChu`.
- Doi cach sinh ten nguoi dong hanh trong seed data de tao du lieu da dang hon theo ho, ten dem va ten rieng.

Y nghia chuc nang:

- Man hinh van hanh tour hien thi thong tin y te sach hon, tranh lan noi dung van hanh chung vao ghi chu suc khoe.
- HDV va dieu hanh co the nhin nhanh cac luu y quan trong cua tung hanh khach khi xu ly lich trinh, danh sach khach va su co.

## Nhom 3: Huy tour va hoan tien

Commit message de xuat:

```text
fix(huy-tour): chuan hoa noi dung yeu cau huy tour va ti le hoan
```

File lien quan:

- `src/main/java/com/digitaltravel/erp/service/HuyTourService.java`
- `src/main/resources/db/data_lien_ket.sql`

Noi dung da sua:

- Doi dinh dang noi dung yeu cau huy tour tu chuoi ngan phan tach bang dau `|` sang nhieu dong dang gach dau dong.
- Noi dung yeu cau hien gom ro:
  - Ly do huy tour.
  - So ngay con lai den ngay khoi hanh.
  - Ti le hoan.
  - So tien hoan.
- Khi tu choi huy tour, ghi chu tu choi duoc them vao noi dung yeu cau theo dong rieng.
- Cap nhat logic doc ti le hoan tu noi dung moi bang nhan `Ti le hoan`.
- Chuan hoa cac phieu mau trong seed SQL ve cung format voi UC32.

Y nghia chuc nang:

- Noi dung yeu cau huy tour de doc hon cho nhan vien xu ly.
- Logic hoan tien tiep tuc lay duoc ti le hoan tu noi dung da chuan hoa.
- Du lieu mau nhat quan voi chuc nang huy tour/hoan tien dang van hanh.

## Nhom 4: Quyet toan chi phi va upload hoa don

Commit message de xuat:

```text
feat(quyet-toan): luu anh hoa don bang data URI va migrate sang CLOB
```

File lien quan:

- `src/main/java/com/digitaltravel/erp/controller/UploadController.java`
- `src/main/java/com/digitaltravel/erp/config/MigrationConfig.java`
- `src/main/java/com/digitaltravel/erp/entity/ChiPhiThucTe.java`
- `src/main/java/com/digitaltravel/erp/service/QuyetToanService.java`
- `src/main/resources/application.yaml`

Noi dung da sua:

- Them `UploadController` tai `/api/public/upload`.
- API upload nhan multipart file va tra ve `data URI` base64 trong truong `url`, giup luu anh hoa don truc tiep vao du lieu chi phi.
- Giu endpoint doc file cu `/api/public/upload/files/{fileName}` de phuc vu cac URL file da ton tai neu can.
- Doi truong `HoaDonAnh` cua entity `ChiPhiThucTe` sang `@Lob`, tuong ung voi cot CLOB trong database.
- Them `MigrationConfig` chay khi khoi dong ung dung de:
  - Kiem tra cot `HOADONANH` trong bang `CHIPHITHUCTE`.
  - Chuyen cot tu VARCHAR2 sang CLOB neu chua dung kieu.
  - Tam tat/bat lai trigger quyet toan khi can cap nhat du lieu.
  - Doc cac file cu trong thu muc `uploads`, chuyen thanh `data URI`, cap nhat vao database va xoa file da migrate.
- Doi `spring.jpa.hibernate.ddl-auto` tu `validate` sang `none` de tranh xung dot khi ung dung tu thuc hien migration cot.
- Chinh format thong bao loi trong `QuyetToanService` cho de doc hon, khong lam doi hanh vi nghiep vu.

Y nghia chuc nang:

- Anh hoa don co the duoc luu truc tiep trong database thay vi phu thuoc vao file vat ly trong thu muc upload.
- Giam rui ro mat anh hoa don khi deploy, chuyen moi truong hoac don dep file server.
- Dam bao du lieu cu dang tro toi file upload co the duoc chuyen doi sang dinh dang moi.

Luu y ky thuat:

- `MigrationConfig` co tac dong truc tiep den database luc ung dung khoi dong. Nen kiem tra tren moi truong staging hoac database sao luu truoc khi ap dung production.
- Upload tra ve `data URI` base64 nen kich thuoc response va cot CLOB se tang theo kich thuoc anh. Nen gioi han kich thuoc file upload neu chua co cau hinh rieng.

## Nhom 5: Dang nhap, dang ky va don dep import

Commit message de xuat:

```text
chore(auth): don dep controller xac thuc va import thua
```

File lien quan:

- `src/main/java/com/digitaltravel/erp/controller/AuthController.java`
- `src/main/java/com/digitaltravel/erp/controller/NhanVienController.java`
- `src/main/java/com/digitaltravel/erp/dto/responses/BaoCaoDoanhThuResponse.java`
- `src/main/java/com/digitaltravel/erp/service/QuyetToanService.java`

Noi dung da sua:

- Don dep dong trong va format khoi tao `UsernamePasswordAuthenticationToken` trong dang ky/dang nhap.
- Xoa import trung lap trong `NhanVienController`.
- Xoa import khong su dung trong response bao cao doanh thu.
- Xoa import khong su dung trong `QuyetToanService`.

Y nghia chuc nang:

- Khong thay doi hanh vi dang nhap/dang ky.
- Code gon hon, giam canh bao import thua va tang tinh nhat quan khi build.

## Thu tu commit de xuat

Neu muon tach thanh nhieu commit nho, nen commit theo thu tu:

1. `chore(auth): don dep controller xac thuc va import thua`
2. `fix(van-hanh): chuan hoa ghi chu y te cua nguoi dong hanh`
3. `feat(hanh-dong-xanh): bo sung danh sach hanh dong xanh chung cho HDV`
4. `fix(huy-tour): chuan hoa noi dung yeu cau huy tour va ti le hoan`
5. `feat(quyet-toan): luu anh hoa don bang data URI va migrate sang CLOB`

Neu muon gom thanh mot commit lon cho dot backend nay:

```text
feat(backend): hoan thien van hanh tour, huy tour va quyet toan
```

## Checklist kiem tra nen thuc hien

- Build backend thanh cong.
- Kiem tra API dang nhap/dang ky van tra token nhu cu.
- Kiem tra API danh sach hanh dong xanh cua HDV tra ve cac hanh dong chung.
- Kiem tra HDV ghi nhan hanh dong xanh chung cho khach trong tour.
- Kiem tra danh sach khach/chi tiet khach/su co khong hien ghi chu quan he nhu ghi chu y te.
- Kiem tra tao yeu cau huy tour, duyet hoan tien va tu choi hoan tien voi format noi dung moi.
- Kiem tra upload anh hoa don va luu `HoaDonAnh` dang `data URI`.
- Kiem tra migration CLOB tren database co du lieu cu truoc khi chay production.
