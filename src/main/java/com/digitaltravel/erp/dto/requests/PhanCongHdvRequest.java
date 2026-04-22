package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class PhanCongHdvRequest {

    @NotBlank(message = "Ma tour thuc te khong duoc de trong")
    String maTourThucTe;

    @NotBlank(message = "Ma nhan vien khong duoc de trong")
    String maNhanVien;

    String ghiChu;
}
