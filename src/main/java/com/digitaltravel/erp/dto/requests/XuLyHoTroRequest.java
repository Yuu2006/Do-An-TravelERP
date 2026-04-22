package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class XuLyHoTroRequest {
    // Optional: gán nhân viên xử lý
    String maNhanVienXuLy;

    @NotBlank(message = "TrangThai khong duoc trong")
    // DANG_XU_LY | DA_DONG
    String trangThai;

    String ghiChu;
}
