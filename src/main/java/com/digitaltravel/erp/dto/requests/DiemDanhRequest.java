package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class DiemDanhRequest {
    @NotBlank
    private String maKhachHang;

    // DA_DIEM_DANH | CHUA_DIEM_DANH | VANG; null mac dinh DA_DIEM_DANH
    private String trangThai;

    private String diaDiem;
}
