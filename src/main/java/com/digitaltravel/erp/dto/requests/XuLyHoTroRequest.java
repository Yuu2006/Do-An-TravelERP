package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class XuLyHoTroRequest {
    // Optional: gán nhân viên xử lý
    String maNhanVienXuLy;

    @NotBlank(message = "TrangThai khong duoc trong")
    // CHUA_XU_LY | DA_XU_LY | TU_CHOI
    String trangThai;

    String ghiChu;
}
