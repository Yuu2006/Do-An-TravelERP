package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class DiemDanhRequest {
    @NotBlank
    private String maKhachHang;

    private String diaDiem;
}
