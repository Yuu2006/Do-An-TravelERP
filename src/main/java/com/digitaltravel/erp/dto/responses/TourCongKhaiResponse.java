package com.digitaltravel.erp.dto.responses;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class TourCongKhaiResponse {
    String maTourThucTe;
    String maTourMau;
    String tieuDeTour;
    String moTa;
    LocalDate ngayKhoiHanh;
    Integer thoiLuong;
    BigDecimal giaHienHanh;
    Integer soKhachToiDa;
    Integer choConLai;
    String trangThai;
    BigDecimal diemDanhGia;
    Integer soDanhGia;
    List<LichTrinhResponse> lichTrinh;
    LocalDateTime thoiDiemTao;
}
