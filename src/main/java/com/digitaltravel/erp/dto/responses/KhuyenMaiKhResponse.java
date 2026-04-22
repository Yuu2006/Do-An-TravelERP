package com.digitaltravel.erp.dto.responses;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class KhuyenMaiKhResponse {
    String maVoucher;
    String maCode;
    String loaiUuDai;
    BigDecimal giaTriGiam;
    String dieuKienApDung;
    String trangThai;
    LocalDate ngayHetHan;
    LocalDateTime ngayNhan;
}
