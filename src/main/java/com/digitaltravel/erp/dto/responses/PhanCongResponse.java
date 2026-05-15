package com.digitaltravel.erp.dto.responses;

import java.time.LocalDateTime;

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
    LocalDateTime ngayPhanCong;
}
