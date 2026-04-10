# Hướng dẫn sử dụng API Authentication với Postman

Base URL: `http://localhost:8080`

---

## 1. Đăng ký tài khoản khách hàng

**Endpoint:** `POST /api/auth/dang-ky`

**Yêu cầu token:** Không (public)

**Vai trò được gán tự động:** `KHACHHANG`

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

> Các trường `email` và `soDienThoai` là tuỳ chọn.

**Response thành công (201):**
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

> Sau khi đăng ký thành công, hệ thống tự đăng nhập và trả về `accessToken` ngay.

**Lỗi thường gặp:**

| HTTP | Nguyên nhân |
|------|-------------|
| 400 | `tenDangNhap` đã tồn tại |
| 400 | `email` đã được sử dụng |
| 400 | Mật khẩu và xác nhận không khớp |
| 400 | Validation thất bại (tên đăng nhập < 4 ký tự, mật khẩu < 6 ký tự, v.v.) |
| 404 | Vai trò `KHACHHANG` chưa có trong DB |

---

## 2. Đăng ký tài khoản nhân viên (ADMIN only)

**Endpoint:** `POST /api/admin/dang-ky-nhan-vien`

**Yêu cầu token:** Có — Tài khoản **ADMIN**

**Vai trò được chỉ định bởi ADMIN:** `MANAGER` | `SALES` | `KETOAN` | `HDV`

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

> `maVaiTro` chấp nhận (không phân biệt hoa thường): `MANAGER`, `SALES`, `KETOAN`, `HDV`

**Response thành công (201):**
```json
{
  "status": 201,
  "success": true,
  "message": "Tao tai khoan nhan vien thanh cong"
}
```

> Khác với đăng ký khách hàng, endpoint này **không** trả về token — ADMIN tạo tài khoản rồi giao thông tin đăng nhập cho nhân viên.

**Lỗi thường gặp:**

| HTTP | Nguyên nhân |
|------|-------------|
| 400 | `maVaiTro` không hợp lệ (không phải MANAGER/SALES/KETOAN/HDV) |
| 400 | `tenDangNhap` đã tồn tại |
| 400 | `email` đã được sử dụng |
| 401 | Chưa gắn token hoặc token hết hạn |
| 403 | Token không phải ADMIN |
| 404 | Vai trò chỉ định chưa có trong DB |

---

## 3. Đăng nhập

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

**Response thành công (200):**
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

**Lỗi thường gặp:**

| HTTP | error | Nguyên nhân |
|------|-------|-------------|
| 401 | BAD_CREDENTIALS | Sai tên đăng nhập hoặc mật khẩu |
| 403 | FORBIDDEN | Tài khoản chưa được kích hoạt (không ở trạng thái HOAT_DONG) |
| 423 | ACCOUNT_LOCKED | Tài khoản bị khóa (trạng thái BI_KHOA) |

> **Lưu ý:** Sao chép giá trị `accessToken` từ response để dùng cho các bước tiếp theo.

---

## 4. Gắn token vào Postman (dùng cho mọi request cần xác thực)

**Cách 1 — Tab Authorization:**
1. Mở request bất kỳ trong Postman
2. Chọn tab **Authorization**
3. Chọn **Type: Bearer Token**
4. Paste `accessToken` vào ô **Token**

**Cách 2 — Header thủ công:**
```
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9...
```

---

## 5. Xem thông tin tài khoản đang đăng nhập

**Endpoint:** `GET /api/me`

**Headers:**
```
Authorization: Bearer <accessToken>
```

**Response thành công (200):**
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

## 6. Đổi mật khẩu

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

**Response thành công (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Doi mat khau thanh cong"
}
```

**Lỗi thường gặp:**

| HTTP | error | Nguyên nhân |
|------|-------|-------------|
| 400 | BAD_REQUEST | Mật khẩu mới và xác nhận không khớp |
| 400 | VALIDATION_ERROR | `matKhauMoi` ít hơn 6 ký tự |
| 401 | UNAUTHORIZED | Mật khẩu cũ không đúng |
| 401 | UNAUTHORIZED | Chưa gắn token vào header |

---

## 7. Đăng xuất

**Endpoint:** `POST /api/auth/dang-xuat`

**Headers:**
```
Authorization: Bearer <accessToken>
```

**Body:** Không cần

**Response thành công (200):**
```json
{
  "status": 200,
  "success": true,
  "message": "Dang xuat thanh cong"
}
```

> **Lưu ý:** Hệ thống dùng JWT Stateless — server không lưu session. Sau khi đăng xuất, client cần tự xóa token khỏi bộ nhớ. Token vẫn còn hiệu lực cho đến khi hết hạn (mặc định 24 giờ).

---

## 8. Các lỗi chung

| HTTP | Nguyên nhân | Giải pháp |
|------|-------------|-----------|
| 401 | Không có hoặc sai token | Đăng nhập lại, gắn đúng token |
| 403 | Token hợp lệ nhưng không đủ quyền | Dùng tài khoản có vai trò phù hợp |
| 404 | Sai đường dẫn | Kiểm tra lại URL |
| 500 | Lỗi server | Xem log ứng dụng |
