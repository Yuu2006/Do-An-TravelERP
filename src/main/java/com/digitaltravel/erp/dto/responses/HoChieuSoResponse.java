package com.digitaltravel.erp.dto.responses;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class HoChieuSoResponse {
    String maKhachHang;
    String maTaiKhoan;
    String tenDangNhap;
    String hoTen;
    String email;
    String cccd;
    String soDienThoai;
    String diUng;
    String ghiChuYTe;
    String hangThanhVien;
    Long diemXanh;
}
