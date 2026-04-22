package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class GanVaiTroRequest {
    @NotBlank(message = "MaVaiTro khong duoc trong")
    String maVaiTro;
}
