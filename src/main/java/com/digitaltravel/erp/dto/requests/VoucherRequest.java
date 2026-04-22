package com.digitaltravel.erp.dto.requests;

import java.math.BigDecimal;
import java.time.LocalDate;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

@Getter
public class VoucherRequest {
    @NotBlank(message = "MaCode khong duoc trong")
    String maCode;

    @NotBlank(message = "LoaiUuDai khong duoc trong")
    // PHAN_TRAM | SO_TIEN
    String loaiUuDai;

    @NotNull(message = "GiaTriGiam khong duoc trong")
    @DecimalMin(value = "0", message = "GiaTriGiam phai >= 0")
    BigDecimal giaTriGiam;

    String dieuKienApDung;

    @NotNull(message = "SoLuotPhatHanh khong duoc trong")
    @Min(value = 1, message = "SoLuotPhatHanh phai >= 1")
    Integer soLuotPhatHanh;

    @NotNull(message = "NgayHieuLuc khong duoc trong")
    LocalDate ngayHieuLuc;

    @NotNull(message = "NgayHetHan khong duoc trong")
    LocalDate ngayHetHan;
}
