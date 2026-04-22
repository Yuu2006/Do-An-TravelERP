package com.digitaltravel.erp.dto.responses;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class DiemDanhResponse {
    private String maDiemDanh;
    private String maKhachHang;
    private String hoTenKhachHang;
    private String diaDiem;
    private LocalDateTime thoiGian;
}
