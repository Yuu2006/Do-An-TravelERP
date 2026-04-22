# HÆ°á»›ng dáº«n sá»­ dá»¥ng API Authentication vá»›i Postman

Base URL: `http://localhost:8080`

---

## 1. ÄÄƒng kÃ½ tÃ i khoáº£n khÃ¡ch hÃ ng

**Endpoint:** `POST /api/auth/dang-ky`

**YÃªu cáº§u token:** KhÃ´ng (public)

**Vai trÃ² Ä‘Æ°á»£c gÃ¡n tá»± Ä‘á»™ng:** `KHACHHANG`

**Headers:**
```
Content-Type: application/json
```

**Body (raw JSON):**
```json
{
  "tenDangNhap": "nguyenvana",
  "matKhau": "123456",
  "xacNhanMatKhau": "123456",
  "hoTen": "Nguyen Van A",
  "email": "nguyenvana@example.com",
  "soDienThoai": "0901234567"
}
```

> CÃ¡c trÆ°á»ng `email` vÃ  `soDienThoai` lÃ  tuá»³ chá»n.

**Response thÃ nh cÃ´ng (201):**
```json
{
  "status": 201,
  "success": true,
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiJ9...",
    "tokenType": "Bearer",
    "maVaiTro": "KHACHHANG",
    "tenHienThi": "Khach hang",
    "hoTen": "Nguyen Van A"
  }
}
```

> Sau khi Ä‘Äƒng kÃ½ thÃ nh cÃ´ng, há»‡ thá»‘ng tá»± Ä‘Äƒng nháº­p vÃ  tráº£ vá» `accessToken` ngay.

**Lá»—i thÆ°á»ng gáº·p:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 400 | `tenDangNhap` Ä‘Ã£ tá»“n táº¡i |
| 400 | `email` Ä‘Ã£ Ä‘Æ°á»£c sá»­ dá»¥ng |
| 400 | Máº­t kháº©u vÃ  xÃ¡c nháº­n khÃ´ng khá»›p |
| 400 | Validation tháº¥t báº¡i (tÃªn Ä‘Äƒng nháº­p < 4 kÃ½ tá»±, máº­t kháº©u < 6 kÃ½ tá»±, v.v.) |
| 404 | Vai trÃ² `KHACHHANG` chÆ°a cÃ³ trong DB |

---

## 2. ÄÄƒng kÃ½ tÃ i khoáº£n nhÃ¢n viÃªn (ADMIN only)

**Endpoint:** `POST /api/admin/dang-ky-nhan-vien`

**YÃªu cáº§u token:** CÃ³ â€” TÃ i khoáº£n **ADMIN**

**Vai trÃ² Ä‘Æ°á»£c chá»‰ Ä‘á»‹nh bá»Ÿi ADMIN:** `MANAGER` | `SALES` | `KETOAN` | `HDV`

**Headers:**
```
Content-Type: application/json
Authorization: Bearer <accessToken_ADMIN>
```

**Body (raw JSON):**
```json
{
  "tenDangNhap": "nhanvien01",
  "matKhau": "password123",
  "hoTen": "Tran Thi B",
  "email": "tranthib@company.com",
  "soDienThoai": "0912345678",
  "maVaiTro": "SALES"
}
```

> `maVaiTro` cháº¥p nháº­n (khÃ´ng phÃ¢n biá»‡t hoa thÆ°á»ng): `MANAGER`, `SALES`, `KETOAN`, `HDV`

**Response thÃ nh cÃ´ng (201):**
```json
{
  "status": 201,
  "success": true,
  "message": "Tao tai khoan nhan vien thanh cong"
}
```

> KhÃ¡c vá»›i Ä‘Äƒng kÃ½ khÃ¡ch hÃ ng, endpoint nÃ y **khÃ´ng** tráº£ vá» token â€” ADMIN táº¡o tÃ i khoáº£n rá»“i giao thÃ´ng tin Ä‘Äƒng nháº­p cho nhÃ¢n viÃªn.

**Lá»—i thÆ°á»ng gáº·p:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 400 | `maVaiTro` khÃ´ng há»£p lá»‡ (khÃ´ng pháº£i MANAGER/SALES/KETOAN/HDV) |
| 400 | `tenDangNhap` Ä‘Ã£ tá»“n táº¡i |
| 400 | `email` Ä‘Ã£ Ä‘Æ°á»£c sá»­ dá»¥ng |
| 401 | ChÆ°a gáº¯n token hoáº·c token háº¿t háº¡n |
| 403 | Token khÃ´ng pháº£i ADMIN |
| 404 | Vai trÃ² chá»‰ Ä‘á»‹nh chÆ°a cÃ³ trong DB |

---

## 3. ÄÄƒng nháº­p

**Endpoint:** `POST /api/auth/dang-nhap`

**Headers:**
```
Content-Type: application/json
```

**Body (raw JSON):**
```json
{
  "tenDangNhap": "admin",
  "matKhau": "123456"
}
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Dang nhap thanh cong",
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiJ9...",
    "tokenType": "Bearer",
    "maVaiTro": "ADMIN",
    "tenHienThi": "Quan tri vien",
    "hoTen": "Nguyen Van A"
  }
}
```

**Lá»—i thÆ°á»ng gáº·p:**

| HTTP | error | NguyÃªn nhÃ¢n |
|------|-------|-------------|
| 401 | BAD_CREDENTIALS | Sai tÃªn Ä‘Äƒng nháº­p hoáº·c máº­t kháº©u |
| 403 | FORBIDDEN | TÃ i khoáº£n chÆ°a Ä‘Æ°á»£c kÃ­ch hoáº¡t (khÃ´ng á»Ÿ tráº¡ng thÃ¡i HOAT_DONG) |
| 423 | ACCOUNT_LOCKED | TÃ i khoáº£n bá»‹ khÃ³a (tráº¡ng thÃ¡i BI_KHOA) |

> **LÆ°u Ã½:** Sao chÃ©p giÃ¡ trá»‹ `accessToken` tá»« response Ä‘á»ƒ dÃ¹ng cho cÃ¡c bÆ°á»›c tiáº¿p theo.

---

## 4. Gáº¯n token vÃ o Postman (dÃ¹ng cho má»i request cáº§n xÃ¡c thá»±c)

**CÃ¡ch 1 â€” Tab Authorization:**
1. Má»Ÿ request báº¥t ká»³ trong Postman
2. Chá»n tab **Authorization**
3. Chá»n **Type: Bearer Token**
4. Paste `accessToken` vÃ o Ã´ **Token**

**CÃ¡ch 2 â€” Header thá»§ cÃ´ng:**
```
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9...
```

---

## 5. Xem thÃ´ng tin tÃ i khoáº£n Ä‘ang Ä‘Äƒng nháº­p

**Endpoint:** `GET /api/me`

**Headers:**
```
Authorization: Bearer <accessToken>
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Thanh cong",
  "data": {
    "tenDangNhap": "admin",
    "hoTen": "Nguyen Van A",
    "vaiTro": "ADMIN",
    "tenVaiTro": "Quan tri vien",
    "roles": ["ROLE_ADMIN"]
  }
}
```

---

## 6. Äá»•i máº­t kháº©u

**Endpoint:** `POST /api/auth/doi-mat-khau`

**Headers:**
```
Content-Type: application/json
Authorization: Bearer <accessToken>
```

**Body (raw JSON):**
```json
{
  "matKhauCu": "123456",
  "matKhauMoi": "newpassword123",
  "xacNhanMatKhau": "newpassword123"
}
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Doi mat khau thanh cong"
}
```

**Lá»—i thÆ°á»ng gáº·p:**

| HTTP | error | NguyÃªn nhÃ¢n |
|------|-------|-------------|
| 400 | BAD_REQUEST | Máº­t kháº©u má»›i vÃ  xÃ¡c nháº­n khÃ´ng khá»›p |
| 400 | VALIDATION_ERROR | `matKhauMoi` Ã­t hÆ¡n 6 kÃ½ tá»± |
| 401 | UNAUTHORIZED | Máº­t kháº©u cÅ© khÃ´ng Ä‘Ãºng |
| 401 | UNAUTHORIZED | ChÆ°a gáº¯n token vÃ o header |

---

## 7. ÄÄƒng xuáº¥t

**Endpoint:** `POST /api/auth/dang-xuat`

**Headers:**
```
Authorization: Bearer <accessToken>
```

**Body:** KhÃ´ng cáº§n

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Dang xuat thanh cong"
}
```

> **LÆ°u Ã½:** Há»‡ thá»‘ng dÃ¹ng JWT Stateless â€” server khÃ´ng lÆ°u session. Sau khi Ä‘Äƒng xuáº¥t, client cáº§n tá»± xÃ³a token khá»i bá»™ nhá»›. Token váº«n cÃ²n hiá»‡u lá»±c cho Ä‘áº¿n khi háº¿t háº¡n (máº·c Ä‘á»‹nh 24 giá»).

---

## 8. CÃ¡c lá»—i chung

| HTTP | NguyÃªn nhÃ¢n | Giáº£i phÃ¡p |
|------|-------------|-----------|
| 401 | KhÃ´ng cÃ³ hoáº·c sai token | ÄÄƒng nháº­p láº¡i, gáº¯n Ä‘Ãºng token |
| 403 | Token há»£p lá»‡ nhÆ°ng khÃ´ng Ä‘á»§ quyá»n | DÃ¹ng tÃ i khoáº£n cÃ³ vai trÃ² phÃ¹ há»£p |
| 404 | Sai Ä‘Æ°á»ng dáº«n | Kiá»ƒm tra láº¡i URL |
| 500 | Lá»—i server | Xem log á»©ng dá»¥ng |

---

# Module 1 â€” Quáº£n lÃ½ Sáº£n pháº©m Tour

> Táº¥t cáº£ endpoint dÆ°á»›i Ä‘Ã¢y yÃªu cáº§u **Bearer Token** (trá»« khi ghi chÃº khÃ¡c).
> Dá»¯ liá»‡u máº«u Ä‘Ã£ Ä‘Æ°á»£c seed sáºµn trong `KhoiTaoBang.sql`:
> - Tour máº«u: `TM001` â€“ `TM004` (kÃ¨m lá»‹ch trÃ¬nh)
> - Loáº¡i phÃ²ng: `LP001` â€“ `LP004`
> - Dá»‹ch vá»¥ thÃªm: `DV001` â€“ `DV005`
> - HÃ nh Ä‘á»™ng xanh: `HDX001` â€“ `HDX005`

---

## 9. Tour Máº«u & Lá»‹ch trÃ¬nh (`/api/tour-mau`)

### 9.1. Danh sÃ¡ch Tour Máº«u (cÃ³ phÃ¢n trang & lá»c)

**Endpoint:** `GET /api/tour-mau`

**Vai trÃ²:** `ADMIN`, `MANAGER`, `SALES`

**Headers:**
```
Authorization: Bearer <accessToken>
```

**Query Params (táº¥t cáº£ tuá»³ chá»n):**

| Param | Kiá»ƒu | MÃ´ táº£ | VÃ­ dá»¥ |
|-------|-------|-------|-------|
| `tieuDe` | String | TÃ¬m kiáº¿m theo tiÃªu Ä‘á» (LIKE) | `Ha Long` |
| `trangThai` | String | Lá»c theo tráº¡ng thÃ¡i | `HOAT_DONG` hoáº·c `KHOA` |
| `thoiLuongMin` | Integer | Thá»i lÆ°á»£ng tá»‘i thiá»ƒu (ngÃ y) | `3` |
| `thoiLuongMax` | Integer | Thá»i lÆ°á»£ng tá»‘i Ä‘a (ngÃ y) | `5` |
| `page` | Integer | Trang (báº¯t Ä‘áº§u tá»« 0) | `0` |
| `size` | Integer | Sá»‘ báº£n ghi/trang | `10` |
| `sort` | String | Sáº¯p xáº¿p | `ThoiDiemTao,DESC` |

**VÃ­ dá»¥ request:**
```
GET /api/tour-mau?tieuDe=Ha Long&trangThai=HOAT_DONG&page=0&size=5
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "data": {
    "content": [
      {
        "maTourMau": "TM001",
        "tieuDe": "Kham pha Ha Long - Cat Ba 3N2D",
        "moTa": "Vinh Ha Long ky vi...",
        "thoiLuong": 3,
        "giaSan": 3500000,
        "danhGia": 4.5,
        "soDanhGia": 128,
        "trangThai": "HOAT_DONG",
        "thoiDiemTao": "...",
        "capNhatVao": "...",
        "taoBoi": "SYSTEM",
        "capNhatBoi": null
      }
    ],
    "totalElements": 1,
    "totalPages": 1,
    "number": 0,
    "size": 5
  }
}
```

---

### 9.2. Chi tiáº¿t Tour Máº«u (kÃ¨m lá»‹ch trÃ¬nh)

**Endpoint:** `GET /api/tour-mau/{id}`

**Vai trÃ²:** `ADMIN`, `MANAGER`, `SALES`

**VÃ­ dá»¥ request:**
```
GET /api/tour-mau/TM001
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "data": {
    "tourMau": {
      "maTourMau": "TM001",
      "tieuDe": "Kham pha Ha Long - Cat Ba 3N2D",
      "thoiLuong": 3,
      "giaSan": 3500000,
      "trangThai": "HOAT_DONG",
      "..."
    },
    "lichTrinh": [
      {
        "maLichTrinhTour": "LT001_N1",
        "ngayThu": 1,
        "hoatDong": "Ha Noi â†’ Ha Long â†’ Len tau...",
        "moTa": "Xe limousine khoi hanh 7:30...",
        "thucDon": "Trua: Hai san tuoi tren tau..."
      },
      {
        "maLichTrinhTour": "LT001_N2",
        "ngayThu": 2,
        "hoatDong": "Sang: Cheo kayak...",
        "moTa": "...",
        "thucDon": "..."
      },
      {
        "maLichTrinhTour": "LT001_N3",
        "ngayThu": 3,
        "hoatDong": "Boi loc sau buoi sang...",
        "moTa": "...",
        "thucDon": "..."
      }
    ]
  }
}
```

**Lá»—i:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 404 | MÃ£ tour máº«u khÃ´ng tá»“n táº¡i |
| 403 | Vai trÃ² khÃ´ng Ä‘á»§ quyá»n |

---

### 9.3. Táº¡o Tour Máº«u má»›i (kÃ¨m lá»‹ch trÃ¬nh tuá»³ chá»n)

**Endpoint:** `POST /api/tour-mau`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**Headers:**
```
Content-Type: application/json
Authorization: Bearer <accessToken>
```

**Body (raw JSON):**
```json
{
  "tieuDe": "Da Lat Thanh Pho Nghin Hoa 3N2D",
  "moTa": "Kham pha Da Lat lang man voi thung lung tinh yeu, ho Xuan Huong, cho dem.",
  "thoiLuong": 3,
  "giaSan": 2800000,
  "lichTrinh": [
    {
      "ngayThu": 1,
      "hoatDong": "San bay Lien Khuong â†’ Da Lat â†’ Thung Lung Tinh Yeu",
      "moTa": "Don tai san bay, nhan phong khach san. Chieu tham Thung Lung Tinh Yeu.",
      "thucDon": "Trua: Tu tuc | Toi: Lau ga la e Da Lat"
    },
    {
      "ngayThu": 2,
      "hoatDong": "Ho Xuan Huong â†’ Dinh Bao Dai â†’ Cho Dem",
      "moTa": "Sang dao quanh ho. Tham dinh Bao Dai. Toi kham pha cho dem.",
      "thucDon": "Sang: Banh mi xiu mai | Trua: Com ga | Toi: An vat cho dem"
    },
    {
      "ngayThu": 3,
      "hoatDong": "Lang hoa Van Thanh â†’ Ve san bay",
      "moTa": "Tham lang hoa Van Thanh, mua sam. Ra san bay.",
      "thucDon": "Sang: Pho | Trua: Banh can Da Lat"
    }
  ]
}
```

> TrÆ°á»ng `lichTrinh` lÃ  tuá»³ chá»n â€” cÃ³ thá»ƒ táº¡o tour máº«u trÆ°á»›c rá»“i thÃªm lá»‹ch trÃ¬nh sau.

**Response thÃ nh cÃ´ng (201):**
```json
{
  "status": 201,
  "success": true,
  "data": {
    "tourMau": { "maTourMau": "TM...", "tieuDe": "Da Lat...", "..." },
    "lichTrinh": [ ... ]
  }
}
```

**Lá»—i validation:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 400 | `tieuDe` trá»‘ng hoáº·c vÆ°á»£t 500 kÃ½ tá»± |
| 400 | `thoiLuong` < 1 |
| 400 | `giaSan` â‰¤ 0 |
| 400 | `lichTrinh[].ngayThu` < 1 hoáº·c `hoatDong` trá»‘ng |

---

### 9.4. Cáº­p nháº­t Tour Máº«u

**Endpoint:** `PUT /api/tour-mau/{id}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**Body (raw JSON) â€” chá»‰ gá»­i cÃ¡c trÆ°á»ng cáº§n sá»­a:**
```json
{
  "tieuDe": "Da Lat Mong Mo 4N3D",
  "thoiLuong": 4,
  "giaSan": 3200000,
  "trangThai": "HOAT_DONG"
}
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "data": {
    "maTourMau": "TM...",
    "tieuDe": "Da Lat Mong Mo 4N3D",
    "thoiLuong": 4,
    "giaSan": 3200000,
    "..."
  }
}
```

---

### 9.5. XoÃ¡ má»m Tour Máº«u (chuyá»ƒn tráº¡ng thÃ¡i â†’ KHOA)

**Endpoint:** `DELETE /api/tour-mau/{id}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**VÃ­ dá»¥:**
```
DELETE /api/tour-mau/TM004
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Xoa thanh cong"
}
```

**Lá»—i:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 400 | Tour máº«u Ä‘ang cÃ³ Tour Thá»±c táº¿ á»Ÿ tráº¡ng thÃ¡i `MO_BAN` â€” khÃ´ng thá»ƒ xoÃ¡ |
| 404 | MÃ£ tour máº«u khÃ´ng tá»“n táº¡i |

---

### 9.6. Sao chÃ©p Tour Máº«u (deep copy kÃ¨m lá»‹ch trÃ¬nh)

**Endpoint:** `POST /api/tour-mau/{id}/sao-chep`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**Body:** KhÃ´ng cáº§n

**VÃ­ dá»¥:**
```
POST /api/tour-mau/TM001/sao-chep
```

> Há»‡ thá»‘ng táº¡o báº£n sao má»›i vá»›i mÃ£ tá»± sinh, tiÃªu Ä‘á» cÃ³ háº­u tá»‘ `(Ban sao)`, vÃ  toÃ n bá»™ lá»‹ch trÃ¬nh.

**Response thÃ nh cÃ´ng (201):**
```json
{
  "status": 201,
  "success": true,
  "data": {
    "tourMau": {
      "maTourMau": "TM...",
      "tieuDe": "Kham pha Ha Long - Cat Ba 3N2D (Ban sao)",
      "..."
    },
    "lichTrinh": [ ... ]
  }
}
```

---

### 9.7. ThÃªm Lá»‹ch trÃ¬nh vÃ o Tour Máº«u

**Endpoint:** `POST /api/tour-mau/{id}/lich-trinh`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**Body (raw JSON):**
```json
{
  "ngayThu": 4,
  "hoatDong": "Tu do mua sam tai cho dem",
  "moTa": "Ngay tu do cho khach tu kham pha.",
  "thucDon": "Sang: Buffet khach san"
}
```

**Response thÃ nh cÃ´ng (201):**
```json
{
  "status": 201,
  "success": true,
  "data": {
    "maLichTrinhTour": "LT...",
    "ngayThu": 4,
    "hoatDong": "Tu do mua sam tai cho dem",
    "moTa": "Ngay tu do cho khach tu kham pha.",
    "thucDon": "Sang: Buffet khach san"
  }
}
```

**Lá»—i:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 400 | `ngayThu` Ä‘Ã£ tá»“n táº¡i trong tour máº«u nÃ y |
| 404 | MÃ£ tour máº«u khÃ´ng tá»“n táº¡i |

---

### 9.8. Sá»­a Lá»‹ch trÃ¬nh

**Endpoint:** `PUT /api/tour-mau/{id}/lich-trinh/{maLichTrinh}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**VÃ­ dá»¥:**
```
PUT /api/tour-mau/TM001/lich-trinh/LT001_N1
```

**Body (raw JSON):**
```json
{
  "ngayThu": 1,
  "hoatDong": "Ha Noi â†’ Ha Long â†’ Hang Sung Sot (cap nhat)",
  "moTa": "Cap nhat hanh trinh ngay 1.",
  "thucDon": "Trua: Hai san | Toi: BBQ tren tau"
}
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "data": {
    "maLichTrinhTour": "LT001_N1",
    "ngayThu": 1,
    "hoatDong": "Ha Noi â†’ Ha Long â†’ Hang Sung Sot (cap nhat)",
    "..."
  }
}
```

---

### 9.9. XoÃ¡ Lá»‹ch trÃ¬nh

**Endpoint:** `DELETE /api/tour-mau/{id}/lich-trinh/{maLichTrinh}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**VÃ­ dá»¥:**
```
DELETE /api/tour-mau/TM001/lich-trinh/LT001_N3
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Xoa thanh cong"
}
```

---

## 10. Tour Thá»±c táº¿ (`/api/tour-thuc-te`)

### 10.1. Danh sÃ¡ch Tour Thá»±c táº¿ (ná»™i bá»™)

**Endpoint:** `GET /api/tour-thuc-te`

**Vai trÃ²:** `ADMIN`, `MANAGER`, `SALES`, `HDV`, `KETOAN`, `KHACHHANG`

**Query Params (táº¥t cáº£ tuá»³ chá»n):**

| Param | Kiá»ƒu | MÃ´ táº£ | VÃ­ dá»¥ |
|-------|-------|-------|-------|
| `trangThai` | String | Lá»c tráº¡ng thÃ¡i | `MO_BAN` |
| `maTourMau` | String | Lá»c theo tour máº«u gá»‘c | `TM001` |
| `giaTu` | BigDecimal | GiÃ¡ tá»‘i thiá»ƒu | `1000000` |
| `giaDen` | BigDecimal | GiÃ¡ tá»‘i Ä‘a | `5000000` |
| `thoiLuongMin` | Integer | Thá»i lÆ°á»£ng tour máº«u tá»‘i thiá»ƒu | `3` |
| `thoiLuongMax` | Integer | Thá»i lÆ°á»£ng tour máº«u tá»‘i Ä‘a | `5` |
| `congKhai` | Boolean | `true` = danh sÃ¡ch cÃ´ng khai (chá»‰ `MO_BAN`) | `false` |
| `page` | Integer | Trang | `0` |
| `size` | Integer | Báº£n ghi/trang | `10` |
| `sort` | String | Sáº¯p xáº¿p | `NgayKhoiHanh,ASC` |

**VÃ­ dá»¥ â€” Danh sÃ¡ch ná»™i bá»™ (xem táº¥t cáº£ tráº¡ng thÃ¡i):**
```
GET /api/tour-thuc-te?trangThai=MO_BAN&page=0&size=10
```

**VÃ­ dá»¥ â€” Danh sÃ¡ch cÃ´ng khai (cho khÃ¡ch hÃ ng, chá»‰ MO_BAN):**
```
GET /api/tour-thuc-te?congKhai=true&giaTu=2000000&giaDen=5000000
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "data": {
    "content": [
      {
        "maTourThucTe": "TTT001",
        "maTourMau": "TM001",
        "tieuDeTour": "Kham pha Ha Long - Cat Ba 3N2D",
        "ngayKhoiHanh": "2026-06-15",
        "ngayKetThuc": "2026-06-17",
        "giaHienHanh": 3800000,
        "soKhachToiDa": 30,
        "soKhachToiThieu": 10,
        "choConLai": 30,
        "trangThai": "MO_BAN",
        "thoiDiemTao": "...",
        "capNhatVao": "..."
      }
    ],
    "totalElements": 1,
    "totalPages": 1
  }
}
```

> **LÆ°u Ã½:** `ngayKetThuc` Ä‘Æ°á»£c tÃ­nh tá»± Ä‘á»™ng = `ngayKhoiHanh + thoiLuong(tour máº«u) - 1`

---

### 10.2. Chi tiáº¿t Tour Thá»±c táº¿

**Endpoint:** `GET /api/tour-thuc-te/{id}`

**Vai trÃ²:** Táº¥t cáº£ vai trÃ² Ä‘Ã£ xÃ¡c thá»±c

**VÃ­ dá»¥:**
```
GET /api/tour-thuc-te/TTT001
```

---

### 10.3. Táº¡o Tour Thá»±c táº¿ (tá»« Tour Máº«u)

**Endpoint:** `POST /api/tour-thuc-te`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**Headers:**
```
Content-Type: application/json
Authorization: Bearer <accessToken>
```

**Body (raw JSON):**
```json
{
  "maTourMau": "TM001",
  "ngayKhoiHanh": "2026-07-01",
  "soKhachToiDa": 25,
  "soKhachToiThieu": 10,
  "giaHienHanh": 3800000
}
```

> - `ngayKhoiHanh` pháº£i lÃ  ngÃ y trong tÆ°Æ¡ng lai
> - `giaHienHanh` > 0
> - Tour máº«u pháº£i á»Ÿ tráº¡ng thÃ¡i `HOAT_DONG`
> - Tráº¡ng thÃ¡i tour thá»±c táº¿ máº·c Ä‘á»‹nh: `CHO_KICH_HOAT`

**Response thÃ nh cÃ´ng (201):**
```json
{
  "status": 201,
  "success": true,
  "data": {
    "maTourThucTe": "TTT...",
    "maTourMau": "TM001",
    "tieuDeTour": "Kham pha Ha Long - Cat Ba 3N2D",
    "ngayKhoiHanh": "2026-07-01",
    "ngayKetThuc": "2026-07-03",
    "giaHienHanh": 3800000,
    "soKhachToiDa": 25,
    "soKhachToiThieu": 10,
    "choConLai": 25,
    "trangThai": "CHO_KICH_HOAT"
  }
}
```

**Lá»—i:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 400 | `ngayKhoiHanh` khÃ´ng á»Ÿ tÆ°Æ¡ng lai |
| 400 | `giaHienHanh` â‰¤ 0 |
| 404 | `maTourMau` khÃ´ng tá»“n táº¡i |
| 400 | Tour máº«u bá»‹ khoÃ¡ (`KHOA`) |

---

### 10.4. Cáº­p nháº­t Tour Thá»±c táº¿

**Endpoint:** `PUT /api/tour-thuc-te/{id}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**Body (raw JSON) â€” chá»‰ gá»­i trÆ°á»ng cáº§n sá»­a:**
```json
{
  "giaHienHanh": 4000000,
  "soKhachToiDa": 35,
  "trangThai": "MO_BAN"
}
```

> Tráº¡ng thÃ¡i há»£p lá»‡: `CHO_KICH_HOAT`, `MO_BAN`, `SAP_DIEN_RA`, `DANG_DIEN_RA`, `KET_THUC`, `HUY`, `DA_QUYET_TOAN`

**Response thÃ nh cÃ´ng (200):** Tráº£ vá» `TourThucTeResponse` Ä‘áº§y Ä‘á»§

---

### 10.5. XoÃ¡ má»m Tour Thá»±c táº¿ (chuyá»ƒn â†’ HUY)

**Endpoint:** `DELETE /api/tour-thuc-te/{id}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**VÃ­ dá»¥:**
```
DELETE /api/tour-thuc-te/TTT001
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Xoa thanh cong"
}
```

---

## 11. Loáº¡i PhÃ²ng (`/api/loai-phong`)

### 11.1. Danh sÃ¡ch Loáº¡i PhÃ²ng

**Endpoint:** `GET /api/loai-phong`

**Vai trÃ²:** Táº¥t cáº£ (chá»‰ cáº§n token xÃ¡c thá»±c)

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "data": [
    {
      "maLoaiPhong": "LP001",
      "tenLoai": "Phong don (Single)",
      "mucPhuThu": 0,
      "trangThai": "HOAT_DONG"
    },
    {
      "maLoaiPhong": "LP002",
      "tenLoai": "Phong doi (Twin / Double)",
      "mucPhuThu": 200000,
      "trangThai": "HOAT_DONG"
    }
  ]
}
```

---

### 11.2. Táº¡o Loáº¡i PhÃ²ng má»›i

**Endpoint:** `POST /api/loai-phong`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**Body (raw JSON):**
```json
{
  "tenLoai": "Phong Suite VIP",
  "mucPhuThu": 1500000,
  "trangThai": "HOAT_DONG"
}
```

> `trangThai` tuá»³ chá»n, máº·c Ä‘á»‹nh `HOAT_DONG`

**Response thÃ nh cÃ´ng (201):**
```json
{
  "status": 201,
  "success": true,
  "data": {
    "maLoaiPhong": "LP...",
    "tenLoai": "Phong Suite VIP",
    "mucPhuThu": 1500000,
    "trangThai": "HOAT_DONG"
  }
}
```

---

### 11.3. Cáº­p nháº­t Loáº¡i PhÃ²ng

**Endpoint:** `PUT /api/loai-phong/{id}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**VÃ­ dá»¥:**
```
PUT /api/loai-phong/LP001
```

**Body (raw JSON):**
```json
{
  "tenLoai": "Phong don (Single) - Cap nhat",
  "mucPhuThu": 50000,
  "trangThai": "HOAT_DONG"
}
```

---

### 11.4. XoÃ¡ má»m Loáº¡i PhÃ²ng (chuyá»ƒn â†’ KHOA)

**Endpoint:** `DELETE /api/loai-phong/{id}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**VÃ­ dá»¥:**
```
DELETE /api/loai-phong/LP004
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Xoa thanh cong"
}
```

---

## 12. Dá»‹ch vá»¥ ThÃªm (`/api/dich-vu-them`)

### 12.1. Danh sÃ¡ch Dá»‹ch vá»¥ ThÃªm

**Endpoint:** `GET /api/dich-vu-them`

**Vai trÃ²:** Táº¥t cáº£ (chá»‰ cáº§n token xÃ¡c thá»±c)

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "data": [
    {
      "maDichVuThem": "DV001",
      "ten": "Ve tham quan them",
      "donViTinh": "Luot/nguoi",
      "donGia": 150000,
      "trangThai": "HOAT_DONG"
    },
    {
      "maDichVuThem": "DV002",
      "ten": "Bao hiem du lich",
      "donViTinh": "Nguoi",
      "donGia": 80000,
      "trangThai": "HOAT_DONG"
    }
  ]
}
```

---

### 12.2. Táº¡o Dá»‹ch vá»¥ ThÃªm má»›i

**Endpoint:** `POST /api/dich-vu-them`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**Body (raw JSON):**
```json
{
  "ten": "Sim 4G du lich",
  "donViTinh": "Sim/nguoi",
  "donGia": 100000,
  "trangThai": "HOAT_DONG"
}
```

> `trangThai` tuá»³ chá»n, máº·c Ä‘á»‹nh `HOAT_DONG`

**Response thÃ nh cÃ´ng (201):**
```json
{
  "status": 201,
  "success": true,
  "data": {
    "maDichVuThem": "DV...",
    "ten": "Sim 4G du lich",
    "donViTinh": "Sim/nguoi",
    "donGia": 100000,
    "trangThai": "HOAT_DONG"
  }
}
```

---

### 12.3. Cáº­p nháº­t Dá»‹ch vá»¥ ThÃªm

**Endpoint:** `PUT /api/dich-vu-them/{id}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**VÃ­ dá»¥:**
```
PUT /api/dich-vu-them/DV001
```

**Body (raw JSON):**
```json
{
  "ten": "Ve tham quan them (gia moi)",
  "donViTinh": "Luot/nguoi",
  "donGia": 180000,
  "trangThai": "HOAT_DONG"
}
```

---

### 12.4. XoÃ¡ má»m Dá»‹ch vá»¥ ThÃªm (chuyá»ƒn â†’ KHOA)

**Endpoint:** `DELETE /api/dich-vu-them/{id}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**VÃ­ dá»¥:**
```
DELETE /api/dich-vu-them/DV005
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Xoa thanh cong"
}
```

---

## 13. HÃ nh Ä‘á»™ng Xanh (`/api/hanh-dong-xanh`)

### 13.1. Danh sÃ¡ch HÃ nh Ä‘á»™ng Xanh

**Endpoint:** `GET /api/hanh-dong-xanh`

**Vai trÃ²:** Táº¥t cáº£ (chá»‰ cáº§n token xÃ¡c thá»±c)

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "data": [
    {
      "maHanhDongXanh": "HDX001",
      "tenHanhDong": "Mang binh nuoc tai su dung",
      "diemCong": 50,
      "trangThai": "HOAT_DONG"
    },
    {
      "maHanhDongXanh": "HDX002",
      "tenHanhDong": "Khong dung do nhua dung mot lan",
      "diemCong": 80,
      "trangThai": "HOAT_DONG"
    }
  ]
}
```

---

### 13.2. Chi tiáº¿t HÃ nh Ä‘á»™ng Xanh

**Endpoint:** `GET /api/hanh-dong-xanh/{id}`

**Vai trÃ²:** Táº¥t cáº£ (chá»‰ cáº§n token xÃ¡c thá»±c)

**VÃ­ dá»¥:**
```
GET /api/hanh-dong-xanh/HDX003
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "data": {
    "maHanhDongXanh": "HDX003",
    "tenHanhDong": "Tham gia don rac moi truong tai diem den",
    "diemCong": 150,
    "trangThai": "HOAT_DONG"
  }
}
```

---

### 13.3. Táº¡o HÃ nh Ä‘á»™ng Xanh má»›i

**Endpoint:** `POST /api/hanh-dong-xanh`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**Body (raw JSON):**
```json
{
  "tenHanhDong": "Su dung phuong tien cong cong",
  "diemCong": 120,
  "trangThai": "HOAT_DONG"
}
```

> `trangThai` tuá»³ chá»n, máº·c Ä‘á»‹nh `HOAT_DONG`

**Response thÃ nh cÃ´ng (201):**
```json
{
  "status": 201,
  "success": true,
  "data": {
    "maHanhDongXanh": "HDX...",
    "tenHanhDong": "Su dung phuong tien cong cong",
    "diemCong": 120,
    "trangThai": "HOAT_DONG"
  }
}
```

---

### 13.4. Cáº­p nháº­t HÃ nh Ä‘á»™ng Xanh

**Endpoint:** `PUT /api/hanh-dong-xanh/{id}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**VÃ­ dá»¥:**
```
PUT /api/hanh-dong-xanh/HDX001
```

**Body (raw JSON):**
```json
{
  "tenHanhDong": "Mang binh nuoc tai su dung (cap nhat)",
  "diemCong": 60,
  "trangThai": "HOAT_DONG"
}
```

---

### 13.5. XoÃ¡ má»m HÃ nh Ä‘á»™ng Xanh (chuyá»ƒn â†’ KHOA)

**Endpoint:** `DELETE /api/hanh-dong-xanh/{id}`

**Vai trÃ²:** `ADMIN`, `MANAGER`

**VÃ­ dá»¥:**
```
DELETE /api/hanh-dong-xanh/HDX005
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Xoa thanh cong"
}
```

---

## Ká»‹ch báº£n test nhanh Module 1

> Thá»© tá»± test khuyáº¿n nghá»‹ Ä‘á»ƒ kiá»ƒm tra xuyÃªn suá»‘t:

### BÆ°á»›c 1 â€” Chuáº©n bá»‹ token
1. `POST /api/auth/dang-nhap` vá»›i tÃ i khoáº£n ADMIN â†’ lÆ°u `accessToken`

### BÆ°á»›c 2 â€” Loáº¡i phÃ²ng, Dá»‹ch vá»¥ thÃªm, HÃ nh Ä‘á»™ng xanh (danh má»¥c)
2. `GET /api/loai-phong` â†’ kiá»ƒm tra cÃ³ 4 loáº¡i phÃ²ng seed
3. `POST /api/loai-phong` â†’ táº¡o loáº¡i phÃ²ng má»›i
4. `PUT /api/loai-phong/{id}` â†’ sá»­a loáº¡i phÃ²ng vá»«a táº¡o
5. `DELETE /api/loai-phong/{id}` â†’ xoÃ¡ má»m (kiá»ƒm tra `trangThai` = `KHOA`)
6. Láº·p tÆ°Æ¡ng tá»± cho `/api/dich-vu-them` vÃ  `/api/hanh-dong-xanh`

### BÆ°á»›c 3 â€” Tour Máº«u & Lá»‹ch trÃ¬nh
7. `GET /api/tour-mau` â†’ kiá»ƒm tra cÃ³ 4 tour máº«u seed
8. `GET /api/tour-mau/TM001` â†’ xem chi tiáº¿t + 3 lá»‹ch trÃ¬nh
9. `POST /api/tour-mau` â†’ táº¡o tour máº«u má»›i kÃ¨m lá»‹ch trÃ¬nh
10. `PUT /api/tour-mau/{mÃ£ vá»«a táº¡o}` â†’ cáº­p nháº­t tiÃªu Ä‘á», giÃ¡ sÃ n
11. `POST /api/tour-mau/{mÃ£ vá»«a táº¡o}/lich-trinh` â†’ thÃªm lá»‹ch trÃ¬nh ngÃ y má»›i
12. `PUT /api/tour-mau/{id}/lich-trinh/{maLichTrinh}` â†’ sá»­a lá»‹ch trÃ¬nh
13. `DELETE /api/tour-mau/{id}/lich-trinh/{maLichTrinh}` â†’ xoÃ¡ lá»‹ch trÃ¬nh
14. `POST /api/tour-mau/TM001/sao-chep` â†’ sao chÃ©p tour máº«u
15. `DELETE /api/tour-mau/{id}` â†’ xoÃ¡ má»m tour máº«u

### BÆ°á»›c 4 â€” Tour Thá»±c táº¿
16. `POST /api/tour-thuc-te` â†’ táº¡o tá»« tour máº«u `TM001`
17. `GET /api/tour-thuc-te` â†’ danh sÃ¡ch ná»™i bá»™
18. `GET /api/tour-thuc-te?congKhai=true` â†’ danh sÃ¡ch cÃ´ng khai
19. `PUT /api/tour-thuc-te/{id}` â†’ cáº­p nháº­t giÃ¡, tráº¡ng thÃ¡i â†’ `MO_BAN`
20. `GET /api/tour-thuc-te/{id}` â†’ kiá»ƒm tra `ngayKetThuc` tÃ­nh Ä‘Ãºng
21. `DELETE /api/tour-thuc-te/{id}` â†’ xoÃ¡ má»m â†’ tráº¡ng thÃ¡i `HUY`

### BÆ°á»›c 5 â€” Kiá»ƒm tra phÃ¢n quyá»n
22. ÄÄƒng nháº­p vá»›i tÃ i khoáº£n `SALES` â†’ thá»­ `POST /api/tour-mau` â†’ expect **403**
23. ÄÄƒng nháº­p vá»›i tÃ i khoáº£n `KHACHHANG` â†’ `GET /api/tour-thuc-te?congKhai=true` â†’ expect **200**
24. KhÃ´ng gáº¯n token â†’ gá»i báº¥t ká»³ endpoint â†’ expect **401**

---

# Module 2 â€” KhÃ¡ch hÃ ng & Há»“ sÆ¡ cÃ¡ nhÃ¢n

> **YÃªu cáº§u:** Bearer Token cá»§a tÃ i khoáº£n **KHACHHANG**.
> Há»“ sÆ¡ (`HoChieuSo`) Ä‘Æ°á»£c tá»± Ä‘á»™ng táº¡o khi Ä‘Äƒng kÃ½ tÃ i khoáº£n khÃ¡ch hÃ ng.

---

## 14. Há»“ sÆ¡ KhÃ¡ch hÃ ng (`/api/khachhang/ho-so`)

### 14.1. Xem há»“ sÆ¡ cá»§a báº£n thÃ¢n

**Endpoint:** `GET /api/khachhang/ho-so`

**Vai trÃ²:** `KHACHHANG`

**Headers:**
```
Authorization: Bearer <accessToken_KHACHHANG>
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "ThÃ nh cÃ´ng",
  "data": {
    "maKhachHang": "KH_A1B2C3D4",
    "maTaiKhoan": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "tenDangNhap": "nguyenvana",
    "hoTen": "Nguyen Van A",
    "email": "nguyenvana@example.com",
    "soDienThoai": "0901234567",
    "diUng": null,
    "ghiChuYTe": null,
    "hangThanhVien": "CO_BAN",
    "diemXanh": 0,
    "thoiDiemTao": "2026-04-22T10:00:00",
    "capNhatVao": "2026-04-22T10:00:00"
  }
}
```

**Lá»—i thÆ°á»ng gáº·p:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 401 | ChÆ°a gáº¯n token |
| 403 | Token khÃ´ng pháº£i KHACHHANG |
| 404 | TÃ i khoáº£n chÆ°a cÃ³ há»“ sÆ¡ (khÃ´ng xáº£y ra náº¿u Ä‘Äƒng kÃ½ qua `/api/auth/dang-ky`) |

---

### 14.2. Cáº­p nháº­t há»“ sÆ¡ cÃ¡ nhÃ¢n

**Endpoint:** `PUT /api/khachhang/ho-so`

**Vai trÃ²:** `KHACHHANG`

**Headers:**
```
Content-Type: application/json
Authorization: Bearer <accessToken_KHACHHANG>
```

**Body (raw JSON):**
```json
{
  "diUng": "Hai san, dau phong",
  "ghiChuYTe": "Tieu duong type 2, can che do an it tinh bot"
}
```

> Cáº£ hai trÆ°á»ng Ä‘á»u tuá»³ chá»n. Chá»‰ cÃ¡c trÆ°á»ng cÃ³ trong body má»›i Ä‘Æ°á»£c cáº­p nháº­t.

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Cap nhat ho so thanh cong",
  "data": {
    "maKhachHang": "KH_A1B2C3D4",
    "diUng": "Hai san, dau phong",
    "ghiChuYTe": "Tieu duong type 2, can che do an it tinh bot",
    "hangThanhVien": "CO_BAN",
    "diemXanh": 0
  }
}
```

**Lá»—i thÆ°á»ng gáº·p:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 400 | `diUng` vÆ°á»£t quÃ¡ 1000 kÃ½ tá»± |
| 401 | ChÆ°a gáº¯n token |
| 403 | Token khÃ´ng pháº£i KHACHHANG |

---

# Module 3 â€” Äáº·t Tour

> **YÃªu cáº§u:** Bearer Token. KhÃ¡ch hÃ ng sá»­ dá»¥ng `/api/khachhang/*`, nhÃ¢n viÃªn Sales dÃ¹ng `/api/khachhang/admin/*`.
> **Äiá»u kiá»‡n tiÃªn quyáº¿t:** TÃ i khoáº£n pháº£i Ä‘Ã£ cÃ³ há»“ sÆ¡ `HoChieuSo` (tá»± Ä‘á»™ng khi Ä‘Äƒng kÃ½).

---

## 15. Táº¡o Ä‘Æ¡n Ä‘áº·t tour

**Endpoint:** `POST /api/khachhang/dat-tour`

**Vai trÃ²:** `KHACHHANG`

**Headers:**
```
Content-Type: application/json
Authorization: Bearer <accessToken_KHACHHANG>
```

**Body (raw JSON â€” tá»‘i giáº£n):**
```json
{
  "maTourThucTe": "TTT_XXXXXXXX"
}
```

**Body (raw JSON â€” Ä‘áº§y Ä‘á»§):**
```json
{
  "maTourThucTe": "TTT_XXXXXXXX",
  "maLoaiPhong": "LP002",
  "danhSachDichVu": [
    { "maDichVuThem": "DV001", "soLuong": 1 },
    { "maDichVuThem": "DV002", "soLuong": 2 }
  ],
  "ghiChu": "Yeu cau phong nhin ra bien"
}
```

> - `maLoaiPhong`: tuá»³ chá»n â€” phá»¥ thu thÃªm vÃ o giÃ¡ gá»‘c.
> - `danhSachDichVu`: tuá»³ chá»n â€” danh sÃ¡ch dá»‹ch vá»¥ bá»• sung.
> - ÄÆ¡n tá»± háº¿t háº¡n sau **24 giá»** náº¿u chÆ°a Ä‘Æ°á»£c Sales xÃ¡c nháº­n.

**Response thÃ nh cÃ´ng (201):**
```json
{
  "status": 201,
  "success": true,
  "message": "Táº¡o má»›i thÃ nh cÃ´ng",
  "data": {
    "maDatTour": "DDT_A1B2C3D4",
    "maTourThucTe": "TTT_XXXXXXXX",
    "tieuDeTour": "Tour Ha Long 3 ngay 2 dem",
    "ngayKhoiHanh": "2026-06-15",
    "giaHienHanh": 3500000,
    "thoiLuong": 3,
    "maKhachHang": "KH_A1B2C3D4",
    "tenKhachHang": "Nguyen Van A",
    "ngayDat": "2026-04-22T10:00:00",
    "tongTien": 3780000,
    "trangThai": "CHO_XAC_NHAN",
    "thoiGianHetHan": "2026-04-23T10:00:00",
    "ghiChu": "Yeu cau phong nhin ra bien",
    "chiTietKhach": [
      {
        "maChiTietDat": "CTDT_E5F6G7H8",
        "maKhachHang": "KH_A1B2C3D4",
        "hoTen": "Nguyen Van A",
        "maLoaiPhong": "LP002",
        "tenLoaiPhong": "Phong Double",
        "mucPhuThu": 280000,
        "giaTaiThoiDiemDat": 3780000
      }
    ],
    "chiTietDichVu": [
      {
        "maChiTietDichVu": "CTDV_I9J0K1L2",
        "maDichVuThem": "DV001",
        "tenDichVu": "Ve tham quan them",
        "donViTinh": "Luot/nguoi",
        "soLuong": 1,
        "donGia": 150000,
        "thanhTien": 150000
      }
    ]
  }
}
```

**Lá»—i thÆ°á»ng gáº·p:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 400 | Tour khÃ´ng á»Ÿ tráº¡ng thÃ¡i `MO_BAN` |
| 400 | Tour Ä‘Ã£ háº¿t chá»— (`choConLai = 0`) |
| 400 | `maLoaiPhong` khÃ´ng tá»“n táº¡i hoáº·c Ä‘Ã£ `KHOA` |
| 400 | `maDichVuThem` khÃ´ng tá»“n táº¡i hoáº·c Ä‘Ã£ `KHOA` |
| 404 | KhÃ´ng tÃ¬m tháº¥y tour thá»±c táº¿ |
| 404 | TÃ i khoáº£n chÆ°a cÃ³ há»“ sÆ¡ khÃ¡ch hÃ ng |

---

## 16. Danh sÃ¡ch Ä‘Æ¡n Ä‘áº·t tour cá»§a tÃ´i

**Endpoint:** `GET /api/khachhang/dat-tour`

**Vai trÃ²:** `KHACHHANG`

**Headers:**
```
Authorization: Bearer <accessToken_KHACHHANG>
```

**Query Params (tuá»³ chá»n):**

| Param | Kiá»ƒu | MÃ´ táº£ |
|-------|------|-------|
| `page` | int | Trang (máº·c Ä‘á»‹nh 0) |
| `size` | int | KÃ­ch thÆ°á»›c trang (máº·c Ä‘á»‹nh 10) |
| `sort` | string | TrÆ°á»ng sáº¯p xáº¿p (máº·c Ä‘á»‹nh `ThoiDiemTao,desc`) |

**VÃ­ dá»¥:**
```
GET /api/khachhang/dat-tour?page=0&size=5
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "ThÃ nh cÃ´ng",
  "data": {
    "content": [
      {
        "maDatTour": "DDT_A1B2C3D4",
        "tieuDeTour": "Tour Ha Long 3 ngay 2 dem",
        "ngayKhoiHanh": "2026-06-15",
        "tongTien": 3780000,
        "trangThai": "CHO_XAC_NHAN",
        "thoiGianHetHan": "2026-04-23T10:00:00",
        "chiTietKhach": [...],
        "chiTietDichVu": [...]
      }
    ],
    "totalElements": 1,
    "totalPages": 1,
    "number": 0
  }
}
```

---

## 17. Chi tiáº¿t Ä‘Æ¡n Ä‘áº·t tour cá»§a tÃ´i

**Endpoint:** `GET /api/khachhang/dat-tour/{maDatTour}`

**Vai trÃ²:** `KHACHHANG`

**Headers:**
```
Authorization: Bearer <accessToken_KHACHHANG>
```

**VÃ­ dá»¥:**
```
GET /api/khachhang/dat-tour/DDT_A1B2C3D4
```

**Lá»—i thÆ°á»ng gáº·p:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 404 | KhÃ´ng tÃ¬m tháº¥y Ä‘Æ¡n, hoáº·c Ä‘Æ¡n khÃ´ng thuá»™c vá» tÃ i khoáº£n Ä‘ang Ä‘Äƒng nháº­p |

---

## 18. Há»§y Ä‘Æ¡n Ä‘áº·t tour

**Endpoint:** `DELETE /api/khachhang/dat-tour/{maDatTour}`

**Vai trÃ²:** `KHACHHANG`

> Chá»‰ cÃ³ thá»ƒ há»§y khi Ä‘Æ¡n á»Ÿ tráº¡ng thÃ¡i **`CHO_XAC_NHAN`**. Há»§y sáº½ hoÃ n tráº£ 1 chá»— cho tour.

**Headers:**
```
Authorization: Bearer <accessToken_KHACHHANG>
```

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Huy dat tour thanh cong"
}
```

**Lá»—i thÆ°á»ng gáº·p:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 400 | ÄÆ¡n khÃ´ng á»Ÿ tráº¡ng thÃ¡i `CHO_XAC_NHAN` (Ä‘Ã£ xÃ¡c nháº­n hoáº·c Ä‘Ã£ há»§y) |
| 404 | KhÃ´ng tÃ¬m tháº¥y Ä‘Æ¡n hoáº·c khÃ´ng thuá»™c vá» báº¡n |

---

## 19. Sales: Danh sÃ¡ch táº¥t cáº£ Ä‘Æ¡n Ä‘áº·t tour

**Endpoint:** `GET /api/khachhang/admin/dat-tour`

**Vai trÃ²:** `ADMIN`, `MANAGER`, `SALES`

**Headers:**
```
Authorization: Bearer <accessToken_SALES>
```

**Query Params (tuá»³ chá»n):**

| Param | GiÃ¡ trá»‹ há»£p lá»‡ | MÃ´ táº£ |
|-------|----------------|-------|
| `trangThai` | `CHO_XAC_NHAN` \| `DA_XAC_NHAN` \| `DA_HUY` \| `HET_HAN_GIU_CHO` | Lá»c theo tráº¡ng thÃ¡i |
| `maTourThucTe` | string | Lá»c theo tour thá»±c táº¿ |
| `page` | int | Trang (máº·c Ä‘á»‹nh 0) |
| `size` | int | KÃ­ch thÆ°á»›c trang (máº·c Ä‘á»‹nh 10) |

**VÃ­ dá»¥:**
```
GET /api/khachhang/admin/dat-tour?trangThai=CHO_XAC_NHAN&page=0&size=20
```

---

## 20. Sales: XÃ¡c nháº­n Ä‘Æ¡n Ä‘áº·t tour

**Endpoint:** `PUT /api/khachhang/admin/dat-tour/{maDatTour}/xac-nhan`

**Vai trÃ²:** `ADMIN`, `MANAGER`, `SALES`

**Headers:**
```
Authorization: Bearer <accessToken_SALES>
```

**Body:** KhÃ´ng cáº§n

**Response thÃ nh cÃ´ng (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Xac nhan don dat tour thanh cong",
  "data": {
    "maDatTour": "DDT_A1B2C3D4",
    "trangThai": "DA_XAC_NHAN",
    ...
  }
}
```

**Lá»—i thÆ°á»ng gáº·p:**

| HTTP | NguyÃªn nhÃ¢n |
|------|-------------|
| 400 | ÄÆ¡n khÃ´ng á»Ÿ tráº¡ng thÃ¡i `CHO_XAC_NHAN` |
| 404 | KhÃ´ng tÃ¬m tháº¥y Ä‘Æ¡n |

---

## Ká»‹ch báº£n test Module 2 & 3

### BÆ°á»›c 1 â€” Chuáº©n bá»‹
1. ÄÄƒng nháº­p vá»›i tÃ i khoáº£n `admin` â†’ lÆ°u `accessToken_ADMIN`
2. **`POST /api/auth/dang-ky`** vá»›i tÃ i khoáº£n `khachhang01` â†’ lÆ°u `accessToken_KH`
3. ÄÄƒng nháº­p vá»›i tÃ i khoáº£n `sales01` â†’ lÆ°u `accessToken_SALES`

### BÆ°á»›c 2 â€” Há»“ sÆ¡ khÃ¡ch hÃ ng
4. `GET /api/khachhang/ho-so` (token: `accessToken_KH`) â†’ kiá»ƒm tra há»“ sÆ¡ Ä‘Æ°á»£c táº¡o tá»± Ä‘á»™ng
5. `PUT /api/khachhang/ho-so` â†’ cáº­p nháº­t `diUng` vÃ  `ghiChuYTe`
6. `GET /api/khachhang/ho-so` â†’ xÃ¡c nháº­n cáº­p nháº­t Ä‘Ã£ lÆ°u

### BÆ°á»›c 3 â€” Xem tour trÆ°á»›c khi Ä‘áº·t
7. `GET /api/tour-thuc-te?congKhai=true` (token: `accessToken_KH`) â†’ danh sÃ¡ch tour `MO_BAN`
8. Ghi láº¡i `maTourThucTe` cá»§a 1 tour cÃ²n chá»— vÃ  cÃ¡c `maLoaiPhong`, `maDichVuThem` cáº§n dÃ¹ng
9. `GET /api/loai-phong` â†’ xem danh sÃ¡ch loáº¡i phÃ²ng vÃ  phá»¥ thu

### BÆ°á»›c 4 â€” Äáº·t tour
10. `POST /api/khachhang/dat-tour` (token: `accessToken_KH`) vá»›i `maTourThucTe` vá»«a chá»n
11. Kiá»ƒm tra:
    - `trangThai = CHO_XAC_NHAN`
    - `thoiGianHetHan` = 24h sau ngÃ y Ä‘áº·t
    - `tongTien = giaHienHanh + mucPhuThuPhong + sumThanhTienDichVu`
12. `GET /api/tour-thuc-te/{maTourThucTe}` â†’ kiá»ƒm tra `choConLai` Ä‘Ã£ giáº£m 1

### BÆ°á»›c 5 â€” Xem & quáº£n lÃ½ Ä‘Æ¡n
13. `GET /api/khachhang/dat-tour` â†’ danh sÃ¡ch Ä‘Æ¡n cá»§a tÃ´i
14. `GET /api/khachhang/dat-tour/{maDatTour}` â†’ chi tiáº¿t Ä‘Æ¡n

### BÆ°á»›c 6 â€” XÃ¡c nháº­n (Sales)
15. `GET /api/khachhang/admin/dat-tour?trangThai=CHO_XAC_NHAN` (token: `accessToken_SALES`) â†’ xem cÃ¡c Ä‘Æ¡n chá»
16. `PUT /api/khachhang/admin/dat-tour/{maDatTour}/xac-nhan` â†’ xÃ¡c nháº­n Ä‘Æ¡n
17. `GET /api/khachhang/dat-tour/{maDatTour}` (token: `accessToken_KH`) â†’ kiá»ƒm tra `trangThai = DA_XAC_NHAN`

### BÆ°á»›c 7 â€” Há»§y Ä‘Æ¡n (test negative case)
18. **`POST /api/khachhang/dat-tour`** â†’ táº¡o Ä‘Æ¡n má»›i
19. **`DELETE /api/khachhang/dat-tour/{maDatTour}`** â†’ há»§y Ä‘Æ¡n vá»«a táº¡o â†’ expect **200**
20. `GET /api/tour-thuc-te/{maTourThucTe}` â†’ kiá»ƒm tra `choConLai` Ä‘Ã£ tÄƒng láº¡i 1
21. **`DELETE /api/khachhang/dat-tour/{maDatTour}`** â†’ thá»­ há»§y láº§n 2 â†’ expect **400** (Ä‘Ã£ á»Ÿ tráº¡ng thÃ¡i DA_HUY)

### BÆ°á»›c 8 â€” Kiá»ƒm tra phÃ¢n quyá»n & báº£o máº­t
22. ÄÄƒng nháº­p vá»›i `khachhang02` (tÃ i khoáº£n khÃ¡c) â†’ `GET /api/khachhang/dat-tour/{maDatTour_KH01}` â†’ expect **404** (IDOR protection)
23. DÃ¹ng token SALES Ä‘á»ƒ `GET /api/khachhang/ho-so` â†’ expect **403**
24. KhÃ´ng gáº¯n token â†’ `POST /api/khachhang/dat-tour` â†’ expect **401**

