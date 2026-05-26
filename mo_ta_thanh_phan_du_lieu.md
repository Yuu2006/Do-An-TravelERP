**MÔ TẢ THÀNH PHẦN DỮ LIỆU [Ràng buộc toàn vẹn](https://docs.google.com/spreadsheets/d/1OYLgD0M_nlYLurSxJypo_F0O2jczITIZQ5ZWM92gEMs/edit?usp=sharing) (sheet2)**

*Nguồn rà soát: `be/src/main/resources/db/KhoiTaoBang.sql` và các entity tại `be/src/main/java/com/digitaltravel/erp/entity`. Hệ quản trị cơ sở dữ liệu: Oracle.*

### **Bảng TOURMAU (Tour mẫu)**

Bảng … : Thành phần dữ liệu bảng TOURMAU (Tour mẫu)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaTourMau | Mã tour mẫu | VARCHAR2(50) | Không rỗng, tối đa 50 ký tự | PK |
| TieuDe | Tiêu đề tour | VARCHAR2(500) | Không rỗng | NOT NULL |
| MoTa | Mô tả chi tiết | CLOB | Văn bản dài |  |
| ThoiLuong | Thời lượng tour, tính theo ngày | NUMBER(5) | > 0 | NOT NULL, CHECK |
| GiaSan | Giá sàn tham khảo | NUMBER(18,2) | >= 0 | NOT NULL, CHECK |
| DanhGia | Điểm đánh giá trung bình | NUMBER(3,2) | 0 - 5 | DEFAULT 0, CHECK |
| SoDanhGia | Tổng số lượt đánh giá | NUMBER(10) | >= 0 | DEFAULT 0, CHECK |

### **Bảng LICHTRINHTOUR (Lịch trình tour)**

Bảng … : Thành phần dữ liệu bảng LICHTRINHTOUR (Lịch trình tour)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaLichTrinhTour | Mã lịch trình tour | VARCHAR2(50) | Không rỗng | PK |
| MaTourMau | Mã tour mẫu chứa lịch trình | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu TOURMAU(MaTourMau) |
| NgayThu | Số thứ tự ngày trong tour | NUMBER(3) | > 0 | NOT NULL, CHECK |
| HoatDong | Hoạt động chính trong ngày | VARCHAR2(1000) | Tối đa 1000 ký tự |  |
| MoTa | Mô tả lịch trình chi tiết | CLOB | Văn bản dài |  |
| ThucDon | Nội dung thực đơn theo ngày | VARCHAR2(1000) | Tối đa 1000 ký tự |  |

### **Bảng TOURTHUCTE (Tour thực tế)**

Bảng … : Thành phần dữ liệu bảng TOURTHUCTE (Tour thực tế)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaTourThucTe | Mã đợt khởi hành thực tế | VARCHAR2(50) | Không rỗng | PK |
| MaTourMau | Mã tour mẫu nguồn | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu TOURMAU(MaTourMau) |
| NgayKhoiHanh | Ngày khởi hành | DATE | Giá trị ngày | NOT NULL |
| GiaHienHanh | Giá bán hiện hành của chuyến | NUMBER(18,2) | >= 0 và >= GiaSan của tour mẫu | NOT NULL, CHECK; trigger kiểm tra giá sàn |
| SoKhachToiDa | Sức chứa tối đa | NUMBER(5) | >= SoKhachToiThieu | NOT NULL, CHECK |
| SoKhachToiThieu | Số khách tối thiểu | NUMBER(5) | > 0 | NOT NULL, DEFAULT 1, CHECK |
| ChoConLai | Số chỗ còn có thể bán | NUMBER(5) | 0 - SoKhachToiDa | NOT NULL, CHECK |
| TrangThai | Trạng thái vòng đời chuyến | VARCHAR2(20) | `CHO_KICH_HOAT`, `MO_BAN`, `DANG_DIEN_RA`, `KET_THUC`, `HUY`, `DA_QUYET_TOAN` | NOT NULL, DEFAULT `CHO_KICH_HOAT`, CHECK |

### **Bảng DICHVU_TOURTHUCTE (Dịch vụ áp dụng cho tour thực tế)**

Bảng … : Thành phần dữ liệu bảng DICHVU_TOURTHUCTE (Dịch vụ áp dụng cho tour thực tế)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaTourThucTe | Mã tour thực tế | VARCHAR2(50) | Mã đã tồn tại | PK, FK tham chiếu TOURTHUCTE(MaTourThucTe) |
| MaDichVuThem | Mã dịch vụ được mở bán cho chuyến | VARCHAR2(50) | Mã đã tồn tại | PK, FK tham chiếu DICHVUTHEM(MaDichVuThem) |

### **Bảng HDX_TOURTHUCTE (Hành động xanh áp dụng cho tour thực tế)**

Bảng … : Thành phần dữ liệu bảng HDX_TOURTHUCTE (Hành động xanh áp dụng cho tour thực tế)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaTourThucTe | Mã tour thực tế | VARCHAR2(50) | Mã đã tồn tại | PK, FK tham chiếu TOURTHUCTE(MaTourThucTe) |
| MaHanhDongXanh | Mã hành động xanh có thể ghi nhận | VARCHAR2(50) | Mã đã tồn tại | PK, FK tham chiếu HANHDONGXANH(MaHanhDongXanh) |

### **Bảng TAIKHOAN (Tài khoản hệ thống)**

Bảng … : Thành phần dữ liệu bảng TAIKHOAN (Tài khoản hệ thống)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaTaiKhoan | Mã tài khoản | VARCHAR2(50) | Không rỗng | PK |
| TenDangNhap | Tên đăng nhập | VARCHAR2(100) | Duy nhất | UNIQUE, NOT NULL |
| MatKhau | Mật khẩu đã mã hóa | VARCHAR2(255) | Không rỗng | NOT NULL |
| HoTen | Họ và tên | VARCHAR2(200) | Không rỗng | NOT NULL |
| CCCD | Số căn cước công dân | VARCHAR2(20) | Duy nhất nếu có | UNIQUE |
| NgaySinh | Ngày sinh | DATE | Giá trị ngày |  |
| Email | Địa chỉ email | VARCHAR2(200) | Duy nhất nếu có | UNIQUE |
| SoDienThoai | Số điện thoại | VARCHAR2(20) | Tối đa 20 ký tự |  |
| VaiTro | Mã vai trò đăng nhập | VARCHAR2(50) | `ADMIN`, `DIEUHANH`, `SANPHAM`, `KINHDOANH`, `KETOAN`, `HDV`, `KHACHHANG` theo dữ liệu vai trò | NOT NULL, FK tham chiếu VAITRO(MaVaiTro) |
| TrangThai | Trạng thái tài khoản | VARCHAR2(20) | `HOAT_DONG`, `KHOA` | NOT NULL, DEFAULT `HOAT_DONG`, CHECK |

### **Bảng NHATKYHETHONG (Nhật ký thao tác hệ thống)**

Bảng … : Thành phần dữ liệu bảng NHATKYHETHONG (Nhật ký thao tác hệ thống)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaNhatKyHeThong | Mã bản ghi nhật ký | VARCHAR2(50) | Không rỗng | PK |
| MaTaiKhoan | Tài khoản thực hiện thao tác | VARCHAR2(50) | Mã tài khoản hoặc NULL | FK tham chiếu TAIKHOAN(MaTaiKhoan) |
| HanhDong | Loại hành động được ghi nhận | VARCHAR2(100) | `THEM`, `CAP_NHAT`, `XOA`, `XUAT_DU_LIEU_POWERBI`, `POWER_BI_XUAT_FILE` | NOT NULL, CHECK |
| DoiTuong | Loại đối tượng bị thao tác | VARCHAR2(100) | Tối đa 100 ký tự |  |
| MaDoiTuong | Mã bản ghi bị thao tác | VARCHAR2(50) | Tối đa 50 ký tự |  |
| ThoiGian | Thời điểm ghi nhật ký | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |

### **Bảng VAITRO (Vai trò hệ thống)**

Bảng … : Thành phần dữ liệu bảng VAITRO (Vai trò hệ thống)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaVaiTro | Mã vai trò | VARCHAR2(50) | Không rỗng | PK |
| TenHienThi | Tên hiển thị của vai trò | VARCHAR2(100) | Không rỗng | NOT NULL |

### **Bảng HOCHIEUSO (Hộ chiếu số)**

Bảng … : Thành phần dữ liệu bảng HOCHIEUSO (Hộ chiếu số)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaKhachHang | Mã hồ sơ khách hàng | VARCHAR2(50) | Không rỗng | PK |
| MaTaiKhoan | Tài khoản sở hữu hồ sơ | VARCHAR2(50) | Một tài khoản khách chỉ có một hồ sơ | NOT NULL, UNIQUE, FK tham chiếu TAIKHOAN(MaTaiKhoan) |
| GhiChuYTe | Lưu ý y tế của khách | CLOB | Văn bản dài |  |
| DiUng | Thông tin dị ứng | VARCHAR2(1000) | Tối đa 1000 ký tự |  |
| HangThanhVien | Hạng thành viên | VARCHAR2(20) | `THANH_VIEN`, `DONG`, `BAC`, `VANG`, `KIM_CUONG` | NOT NULL, DEFAULT `THANH_VIEN`, CHECK |
| DiemXanh | Điểm xanh tích lũy | NUMBER(15) | >= 0 | NOT NULL, DEFAULT 0, CHECK |

### **Bảng LICHSUTOUR (Lịch sử tour)**

Bảng … : Thành phần dữ liệu bảng LICHSUTOUR (Lịch sử tour)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaLichSuTour | Mã lịch sử tham gia tour | VARCHAR2(50) | Không rỗng | PK |
| MaKhachHang | Mã khách hàng đã tham gia | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu HOCHIEUSO(MaKhachHang) |
| MaTourThucTe | Mã chuyến đã tham gia | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu TOURTHUCTE(MaTourThucTe) |
| MaChiTietDat | Mã hành khách trong đơn đặt | VARCHAR2(50) | Mã đã tồn tại nếu có | FK tham chiếu CHITIETDATTOUR(MaChiTietDat) |
| NgayThamGia | Ngày khách tham gia chuyến | DATE | Giá trị ngày |  |

*Ràng buộc duy nhất: một khách chỉ có một lịch sử trên cùng một tour thực tế (`MaKhachHang`, `MaTourThucTe`).*

### **Bảng DSNGUOIDONGHANH (Danh sách người đồng hành)**

Bảng … : Thành phần dữ liệu bảng DSNGUOIDONGHANH (Danh sách người đồng hành)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaNguoiDongHanh | Mã người đồng hành không có tài khoản | VARCHAR2(50) | Không rỗng | PK |
| MaDatTour | Mã đơn đặt chứa người đồng hành | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu DONDATTOUR(MaDatTour) |
| HoTen | Họ tên người đồng hành | VARCHAR2(200) | Không rỗng | NOT NULL |
| CCCD | Số căn cước | VARCHAR2(20) | Tối đa 20 ký tự |  |
| SoDienThoai | Số điện thoại | VARCHAR2(20) | Tối đa 20 ký tự |  |
| NgaySinh | Ngày sinh | DATE | Giá trị ngày |  |
| GioiTinh | Giới tính mô tả | VARCHAR2(20) | Tối đa 20 ký tự |  |
| GhiChu | Ghi chú hành khách | VARCHAR2(1000) | Tối đa 1000 ký tự |  |

### **Bảng DICHVUTHEM (Dịch vụ thêm)**

Bảng … : Thành phần dữ liệu bảng DICHVUTHEM (Dịch vụ thêm)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaDichVuThem | Mã dịch vụ bổ sung | VARCHAR2(50) | Không rỗng | PK |
| Ten | Tên dịch vụ, bao gồm cả dịch vụ phụ thu phòng nếu có | VARCHAR2(200) | Không rỗng | NOT NULL |
| DonViTinh | Đơn vị tính | VARCHAR2(100) | Tối đa 100 ký tự |  |
| DonGia | Đơn giá dịch vụ | NUMBER(18,2) | >= 0 | NOT NULL, CHECK |

### **Bảng DONDATTOUR (Đơn đặt tour)**

Bảng … : Thành phần dữ liệu bảng DONDATTOUR (Đơn đặt tour)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaDatTour | Mã đơn đặt tour | VARCHAR2(50) | Không rỗng | PK |
| MaTourThucTe | Mã chuyến được đặt | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu TOURTHUCTE(MaTourThucTe) |
| MaKhachHang | Mã người đặt chính | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu HOCHIEUSO(MaKhachHang) |
| NgayDat | Thời điểm đặt tour | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |
| TongTien | Tổng tiền đơn sau các cập nhật ưu đãi | NUMBER(18,2) | >= 0 | NOT NULL, CHECK |
| TrangThai | Trạng thái xử lý đơn | VARCHAR2(30) | `CHO_XAC_NHAN`, `DA_XAC_NHAN`, `DA_HUY`, `HET_HAN_GIU_CHO`, `CHO_HUY`, `TU_CHOI_HOAN_TIEN`, `THANH_TOAN_THAT_BAI` | NOT NULL, DEFAULT `CHO_XAC_NHAN`, CHECK |
| ThoiGianHetHan | Hạn giữ chỗ/thanh toán | TIMESTAMP | Giá trị thời gian |  |
| GhiChu | Ghi chú đơn hàng | VARCHAR2(2000) | Tối đa 2000 ký tự |  |
| HanhDongXanh | Thông tin hành động xanh khách chọn cùng đơn | VARCHAR2(1000) | Tối đa 1000 ký tự |  |

### **Bảng CHITIETDATTOUR (Chi tiết đặt tour)**

Bảng … : Thành phần dữ liệu bảng CHITIETDATTOUR (Chi tiết đặt tour)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaChiTietDat | Mã dòng hành khách trong đơn | VARCHAR2(50) | Không rỗng | PK |
| MaDatTour | Mã đơn đặt tour | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu DONDATTOUR(MaDatTour) |
| MaKhachHang | Mã khách có Hộ chiếu số, dùng cho người đặt | VARCHAR2(50) | Mã đã tồn tại hoặc NULL | FK tham chiếu HOCHIEUSO(MaKhachHang) |
| MaNguoiDongHanh | Mã người đi kèm không có hồ sơ | VARCHAR2(50) | Mã đã tồn tại hoặc NULL | FK tham chiếu DSNGUOIDONGHANH(MaNguoiDongHanh) |
| LoaiKhach | Loại hành khách | VARCHAR2(30) | `NGUOI_DAT`, `NGUOI_DONG_HANH` | NOT NULL, DEFAULT `NGUOI_DAT`, CHECK |
| GiaTaiThoiDiemDat | Giá tour chốt cho hành khách | NUMBER(18,2) | >= 0 | NOT NULL, CHECK |

*Ràng buộc nghiệp vụ: dòng `NGUOI_DAT` phải có `MaKhachHang` và không có `MaNguoiDongHanh`; dòng `NGUOI_DONG_HANH` theo chiều ngược lại.*

### **Bảng CHITIETDICHVU (Chi tiết dịch vụ đã đặt)**

Bảng … : Thành phần dữ liệu bảng CHITIETDICHVU (Chi tiết dịch vụ đã đặt)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaChiTietDichVu | Mã dòng dịch vụ đặt thêm | VARCHAR2(50) | Không rỗng | PK |
| MaDatTour | Mã đơn đặt tour | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu DONDATTOUR(MaDatTour) |
| MaDichVuThem | Mã dịch vụ bổ sung | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu DICHVUTHEM(MaDichVuThem) |
| SoLuong | Số lượng dịch vụ | NUMBER(10) | > 0 | NOT NULL, CHECK |
| DonGia | Đơn giá tại thời điểm đặt | NUMBER(18,2) | >= 0 | NOT NULL, CHECK |
| ThanhTien | Thành tiền dịch vụ | NUMBER(18,2) | = SoLuong * DonGia; >= 0 | NOT NULL, CHECK |

### **Bảng VOUCHER (Khuyến mãi)**

Bảng … : Thành phần dữ liệu bảng VOUCHER (Khuyến mãi)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaVoucher | Mã bản ghi voucher | VARCHAR2(50) | Không rỗng | PK |
| MaCode | Mã code hiển thị cho khách | VARCHAR2(50) | Duy nhất | UNIQUE, NOT NULL |
| LoaiUuDai | Loại giảm giá | VARCHAR2(20) | `PHAN_TRAM`, `SO_TIEN` | NOT NULL, CHECK |
| GiaTriGiam | Giá trị giảm | NUMBER(18,2) | >= 0; nếu phần trăm thì <= 100 | NOT NULL, CHECK |
| MucGiamToiDa | Trần giảm tiền cho ưu đãi phần trăm | NUMBER(18,2) | NULL hoặc > 0 | CHECK |
| DieuKienApDung | Mô tả điều kiện áp dụng | VARCHAR2(2000) | Tối đa 2000 ký tự |  |
| SoLuotPhatHanh | Tổng lượt có thể phân bổ/sử dụng | NUMBER(10) | > 0 | NOT NULL, DEFAULT 1, CHECK |
| SoLuotDaDung | Số lượt đã áp dụng | NUMBER(10) | 0 - SoLuotPhatHanh | NOT NULL, DEFAULT 0, CHECK |
| NgayHieuLuc | Ngày bắt đầu hiệu lực | DATE | <= NgayHetHan | NOT NULL, CHECK |
| NgayHetHan | Ngày hết hiệu lực | DATE | >= NgayHieuLuc | NOT NULL, CHECK |
| TrangThai | Trạng thái voucher master | VARCHAR2(20) | `SAN_SANG`, `VO_HIEU_HOA` | NOT NULL, DEFAULT `SAN_SANG`, CHECK |

### **Bảng KHUYENMAI_KH (Khuyến mãi - khách hàng)**

Bảng … : Thành phần dữ liệu bảng KHUYENMAI_KH (Khuyến mãi - khách hàng)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaKhachHang | Khách sở hữu voucher trong ví | VARCHAR2(50) | Mã đã tồn tại | PK, FK tham chiếu HOCHIEUSO(MaKhachHang) |
| MaVoucher | Voucher được phân bổ | VARCHAR2(50) | Mã đã tồn tại | PK, FK tham chiếu VOUCHER(MaVoucher) |
| NgayHetHan | Hạn sử dụng riêng trong ví khách | DATE | Giá trị ngày hoặc NULL |  |
| NgayNhan | Thời điểm nhận voucher | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |
| TrangThai | Trạng thái voucher trong ví | VARCHAR2(20) | `CO_HIEU_LUC`, `DA_SU_DUNG`, `DA_THU_HOI`, `HET_HAN` | NOT NULL, DEFAULT `CO_HIEU_LUC`, CHECK |

### **Bảng DATTOUR_UUDAI (Ưu đãi đơn đặt tour)**

Bảng … : Thành phần dữ liệu bảng DATTOUR_UUDAI (Ưu đãi đơn đặt tour)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaDatTour | Mã đơn được áp voucher | VARCHAR2(50) | Mã đã tồn tại | PK, FK tham chiếu DONDATTOUR(MaDatTour) |
| MaVoucher | Mã voucher áp dụng | VARCHAR2(50) | Mã đã tồn tại | PK, FK tham chiếu VOUCHER(MaVoucher) |
| SoTienUuDai | Số tiền giảm thực tế | NUMBER(18,2) | >= 0 | NOT NULL, CHECK |
| NgayApDung | Thời điểm áp dụng voucher | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |

### **Bảng GIAODICH (Giao dịch thanh toán và hoàn tiền)**

Bảng … : Thành phần dữ liệu bảng GIAODICH (Giao dịch thanh toán và hoàn tiền)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaGiaoDich | Mã giao dịch nội bộ | VARCHAR2(50) | Không rỗng | PK |
| MaDatTour | Mã đơn liên quan | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu DONDATTOUR(MaDatTour) |
| LoaiGiaoDich | Loại dòng tiền | VARCHAR2(50) | `THANH_TOAN`, `HOAN_TIEN` | NOT NULL, CHECK |
| PhuongThuc | Phương thức thanh toán/hoàn tiền | VARCHAR2(50) | Không rỗng | NOT NULL |
| SoTien | Số tiền giao dịch | NUMBER(18,2) | >= 0 | NOT NULL, CHECK |
| MaGDNH | Mã tham chiếu giao dịch ngân hàng/cổng thanh toán | VARCHAR2(200) | Tối đa 200 ký tự |  |
| TrangThai | Trạng thái giao dịch | VARCHAR2(30) | `CHO_THANH_TOAN`, `THANH_CONG`, `THAT_BAI`, `DA_HOAN_TIEN` | NOT NULL, DEFAULT `CHO_THANH_TOAN`, CHECK |
| NgayThanhToan | Thời điểm thanh toán/hoàn tiền hoàn tất | TIMESTAMP | Giá trị thời gian |  |

### **Bảng NHANVIEN (Nhân viên)**

Bảng … : Thành phần dữ liệu bảng NHANVIEN (Nhân viên)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaNhanVien | Mã nhân viên | VARCHAR2(50) | Không rỗng | PK |
| MaTaiKhoan | Tài khoản nhân viên | VARCHAR2(50) | Mỗi tài khoản gắn tối đa một nhân viên | NOT NULL, UNIQUE, FK tham chiếu TAIKHOAN(MaTaiKhoan) |
| LoaiNhanVien | Loại nhân viên nghiệp vụ | VARCHAR2(50) | Theo vai trò nghiệp vụ, ví dụ `DIEUHANH`, `SANPHAM`, `KINHDOANH`, `KETOAN`, `HDV` |  |
| NgayVaoLam | Ngày vào làm | DATE | Giá trị ngày |  |
| TrangThaiLamViec | Trạng thái làm việc | VARCHAR2(20) | `HOAT_DONG`, `BAN`, `NGHI` | NOT NULL, DEFAULT `HOAT_DONG`, CHECK |

### **Bảng NANGLUCNHANVIEN (Năng lực nhân viên)**

Bảng … : Thành phần dữ liệu bảng NANGLUCNHANVIEN (Năng lực nhân viên)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaNangLucNhanVien | Mã hồ sơ năng lực | VARCHAR2(50) | Không rỗng | PK |
| MaNhanVien | Mã nhân viên/HDV | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu NHANVIEN(MaNhanVien) |
| NgonNgu | Ngôn ngữ phục vụ | VARCHAR2(200) | Tối đa 200 ký tự |  |
| ChungChi | Chứng chỉ nghề nghiệp | VARCHAR2(500) | Tối đa 500 ký tự |  |
| ChuyenMon | Tuyến/chuyên môn thế mạnh | VARCHAR2(500) | Tối đa 500 ký tự |  |
| DanhGia | Điểm trung bình năng lực | NUMBER(3,2) | 0 - 5 | DEFAULT 0, CHECK |
| SoDanhGia | Số lượt đánh giá HDV | NUMBER(10) | >= 0 | DEFAULT 0, CHECK |

### **Bảng PHANCONGTOUR (Phân công tour)**

Bảng … : Thành phần dữ liệu bảng PHANCONGTOUR (Phân công tour)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaPhanCongTour | Mã phân công | VARCHAR2(50) | Không rỗng | PK |
| MaTourThucTe | Mã chuyến được phân công | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu TOURTHUCTE(MaTourThucTe) |
| MaNhanVien | Mã hướng dẫn viên nhận phân công | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu NHANVIEN(MaNhanVien) |
| NgayPhanCong | Thời điểm gửi phân công | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |
| TrangThaiChapNhan | Phản hồi phân công | VARCHAR2(30) | `CHO_PHAN_HOI`, `DA_DONG_Y`, `TU_CHOI` | NOT NULL, DEFAULT `CHO_PHAN_HOI`, CHECK |
| NgayPhanHoi | Thời điểm HDV phản hồi | TIMESTAMP | Giá trị thời gian |  |

*Ràng buộc duy nhất: một nhân viên không lặp phân công trên cùng một tour thực tế.*

### **Bảng DIEMDANH (Điểm danh hành khách)**

Bảng … : Thành phần dữ liệu bảng DIEMDANH (Điểm danh hành khách)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaDiemDanh | Mã điểm danh | VARCHAR2(50) | Không rỗng | PK |
| MaTourThucTe | Mã chuyến đang vận hành | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu TOURTHUCTE(MaTourThucTe) |
| MaKhachHang | Mã khách có Hộ chiếu số | VARCHAR2(50) | Mã đã tồn tại hoặc NULL | FK tham chiếu HOCHIEUSO(MaKhachHang) |
| MaNguoiDongHanh | Mã người đồng hành | VARCHAR2(50) | Mã đã tồn tại hoặc NULL | FK tham chiếu DSNGUOIDONGHANH(MaNguoiDongHanh) |
| LoaiKhach | Loại người được điểm danh | VARCHAR2(30) | `NGUOI_DAT`, `NGUOI_DONG_HANH` | NOT NULL, DEFAULT `NGUOI_DAT`, CHECK |
| MaNhanVien | HDV thực hiện điểm danh | VARCHAR2(50) | Nhân viên được phân công tour | NOT NULL, FK tham chiếu NHANVIEN và PHANCONGTOUR |
| ThoiGian | Thời điểm điểm danh | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |
| DiaDiem | Địa điểm điểm danh | VARCHAR2(500) | Tối đa 500 ký tự |  |
| TrangThai | Trạng thái tham gia | VARCHAR2(30) | `DA_DIEM_DANH`, `CHUA_DIEM_DANH`, `VANG` | NOT NULL, DEFAULT `CHUA_DIEM_DANH`, CHECK |

### **Bảng HANHDONG (Nhật ký ghi nhận hành động xanh)**

Bảng … : Thành phần dữ liệu bảng HANHDONG (Nhật ký ghi nhận hành động xanh)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaGhiNhanHanhDong | Mã ghi nhận hành động | VARCHAR2(50) | Không rỗng | PK |
| MaTourThucTe | Mã chuyến phát sinh hành động | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu TOURTHUCTE(MaTourThucTe) |
| MaKhachHang | Khách được cộng điểm xanh | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu HOCHIEUSO(MaKhachHang) |
| MaHanhDongXanh | Loại hành động xanh | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu HANHDONGXANH(MaHanhDongXanh) |
| MaNhanVienXacMinh | HDV xác minh hành động | VARCHAR2(50) | Nhân viên được phân công tour | NOT NULL, FK tham chiếu NHANVIEN và PHANCONGTOUR |
| ThoiGian | Thời điểm xác minh | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |
| MinhChung | Nội dung/đường dẫn minh chứng | VARCHAR2(1000) | Tối đa 1000 ký tự |  |

*Ràng buộc duy nhất: một khách chỉ được ghi nhận một lần cho cùng loại hành động xanh trên cùng một chuyến.*

### **Bảng HANHDONGXANH (Hành động xanh)**

Bảng … : Thành phần dữ liệu bảng HANHDONGXANH (Hành động xanh)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaHanhDongXanh | Mã hành động xanh | VARCHAR2(50) | Không rỗng | PK |
| TenHanhDong | Tên hành động được thưởng | VARCHAR2(200) | Không rỗng | NOT NULL |
| DiemCong | Số điểm xanh được cộng | NUMBER(10) | >= 0 | NOT NULL, CHECK |

### **Bảng NHATKYDOIDIEM (Nhật ký đổi điểm xanh)**

Bảng … : Thành phần dữ liệu bảng NHATKYDOIDIEM (Nhật ký đổi điểm xanh)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaNhatKyDoiDiem | Mã nhật ký quy đổi | VARCHAR2(50) | Không rỗng | PK |
| MaKhachHang | Khách thực hiện đổi điểm | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu HOCHIEUSO(MaKhachHang) |
| MaVoucher | Voucher nhận được khi đổi | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu VOUCHER(MaVoucher) |
| DiemQuyDoi | Số điểm đã sử dụng | NUMBER(15) | > 0 | NOT NULL, CHECK |
| NgayQuyDoi | Thời điểm đổi điểm | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |

### **Bảng NHATKYSUCO (Nhật ký sự cố)**

Bảng … : Thành phần dữ liệu bảng NHATKYSUCO (Nhật ký sự cố)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaNhatKySuCo | Mã sự cố | VARCHAR2(50) | Không rỗng | PK |
| MaTourThucTe | Chuyến xảy ra sự cố | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu TOURTHUCTE(MaTourThucTe) |
| MaNhanVienBaoCao | Nhân viên/HDV báo cáo | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu NHANVIEN(MaNhanVien) |
| MaKhachHang | Khách liên quan nếu có | VARCHAR2(50) | Mã đã tồn tại hoặc NULL | FK tham chiếu HOCHIEUSO(MaKhachHang) |
| MaNguoiDongHanh | Người đồng hành liên quan nếu có | VARCHAR2(50) | Mã đã tồn tại hoặc NULL | FK tham chiếu DSNGUOIDONGHANH(MaNguoiDongHanh) |
| MoTa | Mô tả sự cố | CLOB | Văn bản dài | NOT NULL |
| GiaiPhap | Giải pháp xử lý | CLOB | Văn bản dài |  |
| MucDo | Mức độ sự cố | VARCHAR2(20) | `THAP`, `SOS` | NOT NULL, DEFAULT `THAP`, CHECK |
| LoaiSuCo | Phân loại sự cố | VARCHAR2(30) | `Y_TE`, `THOI_TIET`, `PHUONG_TIEN`, `AN_UONG`, `KHAC` | NOT NULL, DEFAULT `KHAC`, CHECK |
| ThoiGianBaoCao | Thời điểm báo cáo | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |

### **Bảng CHIPHITHUCTE (Chi phí thực tế)**

Bảng … : Thành phần dữ liệu bảng CHIPHITHUCTE (Chi phí thực tế)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaChiPhiThucTe | Mã chi phí thực tế | VARCHAR2(50) | Không rỗng | PK |
| MaTourThucTe | Chuyến phát sinh chi phí | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu TOURTHUCTE(MaTourThucTe) |
| MaNhanVien | Nhân viên kê khai chi phí | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu NHANVIEN(MaNhanVien) |
| DanhMuc | Danh mục/nội dung chi | VARCHAR2(200) | Không rỗng | NOT NULL |
| ThanhTien | Giá trị chi phí | NUMBER(18,2) | >= 0 | NOT NULL, CHECK |
| HoaDonAnh | Đường dẫn ảnh chứng từ | VARCHAR2(1000) | Tối đa 1000 ký tự |  |
| TrangThaiDuyet | Trạng thái duyệt chứng từ | VARCHAR2(20) | `CHO_DUYET`, `DA_DUYET`, `TU_CHOI`, `YEU_CAU_BO_SUNG` | NOT NULL, DEFAULT `CHO_DUYET`, CHECK |
| NgayKhai | Thời điểm HDV kê khai | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |

### **Bảng QUYETTOAN (Quyết toán Tour)**

Bảng … : Thành phần dữ liệu bảng QUYETTOAN (Quyết toán Tour)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaQuyetToan | Mã quyết toán | VARCHAR2(50) | Không rỗng | PK |
| MaTourThucTe | Tour thực tế được quyết toán | VARCHAR2(50) | Một tour có tối đa một quyết toán | NOT NULL, UNIQUE, FK tham chiếu TOURTHUCTE(MaTourThucTe) |
| TongDoanhThu | Tổng doanh thu thanh toán thành công | NUMBER(18,2) | >= 0 | NOT NULL, CHECK |
| TongChiPhi | Tổng chi phí đã duyệt | NUMBER(18,2) | >= 0 | NOT NULL, CHECK |
| GiaCamKet | Chi phí/giá cam kết nếu khai báo | NUMBER(18,2) | NULL hoặc >= 0 | CHECK |
| LoiNhuan | Lợi nhuận của tour | NUMBER(18,2) | = TongDoanhThu - TongChiPhi | NOT NULL, CHECK |
| MaNhanVien | Nhân viên kế toán thực hiện | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu NHANVIEN(MaNhanVien) |
| NgayQuyetToan | Thời điểm quyết toán | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |
| TrangThai | Trạng thái quyết toán | VARCHAR2(20) | `CHUA_QUYET_TOAN`, `DA_QUYET_TOAN` | NOT NULL, DEFAULT `CHUA_QUYET_TOAN`, CHECK |
| GhiChu | Ghi chú quyết toán | CLOB | Văn bản dài |  |
| HoaDonAnh | Ảnh/tài liệu minh chứng tổng hợp | VARCHAR2(1000) | Tối đa 1000 ký tự |  |

### **Bảng YEUCAUHOTRO (Yêu cầu hỗ trợ)**

Bảng … : Thành phần dữ liệu bảng YEUCAUHOTRO (Yêu cầu hỗ trợ)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaYeuCauHoTro | Mã yêu cầu hỗ trợ/khiếu nại | VARCHAR2(50) | Không rỗng | PK |
| MaDatTour | Đơn đặt liên quan nếu có | VARCHAR2(50) | Mã đã tồn tại hoặc NULL | FK tham chiếu DONDATTOUR(MaDatTour) |
| MaKhachHang | Khách tạo/liên quan yêu cầu | VARCHAR2(50) | Mã đã tồn tại | NOT NULL, FK tham chiếu HOCHIEUSO(MaKhachHang) |
| LoaiYeuCau | Loại yêu cầu nghiệp vụ | VARCHAR2(100) | Chuỗi phân loại do nghiệp vụ sử dụng, ví dụ `HUY_TOUR`, `HOAN_TIEN`, `KHIEU_NAI` | NOT NULL |
| NoiDung | Nội dung yêu cầu | CLOB | Văn bản dài | NOT NULL |
| TrangThai | Trạng thái xử lý | VARCHAR2(20) | `CHUA_XU_LY`, `CHO_BO_SUNG`, `CHO_GIAI_TRINH`, `CHO_DUYET`, `DA_XU_LY`, `TU_CHOI` | NOT NULL, DEFAULT `CHUA_XU_LY`, CHECK |
| MaNhanVienXuLy | Nhân viên tiếp nhận/xử lý | VARCHAR2(50) | Mã đã tồn tại hoặc NULL | FK tham chiếu NHANVIEN(MaNhanVien) |

### **Bảng DANHGIAKH (Đánh giá khách hàng)**

Bảng … : Thành phần dữ liệu bảng DANHGIAKH (Đánh giá khách hàng)

| Thuộc tính | Diễn giải | Kiểu dữ liệu | Miền giá trị | Ràng buộc |
| :---- | :---- | :---- | :---- | :---- |
| MaDanhGiaKhachHang | Mã đánh giá | VARCHAR2(50) | Không rỗng | PK |
| MaTourThucTe | Tour thực tế được đánh giá | VARCHAR2(50) | Tour khách đã tham gia | NOT NULL, FK tham chiếu TOURTHUCTE(MaTourThucTe) |
| MaKhachHang | Khách gửi đánh giá | VARCHAR2(50) | Khách có lịch sử tham gia tour | NOT NULL, FK tham chiếu HOCHIEUSO(MaKhachHang) |
| SoSao | Số sao đánh giá | NUMBER(1) | 1 - 5 | NOT NULL, CHECK |
| NhanXet | Nội dung nhận xét | CLOB | Văn bản dài |  |
| NgayDanhGia | Thời điểm gửi đánh giá | TIMESTAMP | Giá trị thời gian | NOT NULL, DEFAULT SYSTIMESTAMP |

*Ràng buộc tham chiếu ghép: (`MaKhachHang`, `MaTourThucTe`) phải tồn tại trong LICHSUTOUR; backend chỉ cho đánh giá tour đã `KET_THUC` hoặc `DA_QUYET_TOAN` và chưa đánh giá trước đó.*
