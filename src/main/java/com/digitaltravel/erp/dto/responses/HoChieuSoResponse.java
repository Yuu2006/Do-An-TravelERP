package com.digitaltravel.erp.dto.responses;

import java.time.LocalDateTime;

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
    String soDienThoai;
    String diUng;
    String ghiChuYTe;
    String hangThanhVien;
    Long diemXanh;
    LocalDateTime thoiDiemTao;
    LocalDateTime capNhatVao;
}
