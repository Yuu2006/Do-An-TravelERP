package com.digitaltravel.erp.dto.responses;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class TourThucTeResponse {
    String maTourThucTe;
    String maTourMau;
    String tieuDeTour;
    LocalDate ngayKhoiHanh;
    LocalDate ngayKetThuc;
    BigDecimal giaHienHanh;
    Integer soKhachToiDa;
    Integer soKhachToiThieu;
    Integer choConLai;
    String trangThai;
    LocalDateTime thoiDiemTao;
    LocalDateTime capNhatVao;
    String taoBoi;
}
