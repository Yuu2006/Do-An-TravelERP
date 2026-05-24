package com.digitaltravel.erp.dto.responses;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class PhanCongResponse {
    String maPhanCong;
    String maTourThucTe;
    String tenTour;
    String maNhanVien;
    String tenNhanVien;
    String trangThaiChapNhan;
    LocalDateTime ngayPhanCong;
    LocalDate ngayKhoiHanh;
    LocalDate ngayKetThuc;
    String trangThaiTour;
    Integer soKhachToiDa;
    Integer choConLai;
    List<ThanhVienDoanResponse> danhSachHanhKhach;
}
