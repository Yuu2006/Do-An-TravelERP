package com.digitaltravel.erp.dto.requests;

import java.util.List;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class DatTourRequest {

    @NotBlank(message = "Ma tour thuc te khong duoc de trong")
    String maTourThucTe;

    // Tuỳ chọn: danh sách dịch vụ bổ sung
    @Valid
    List<DichVuThemDatRequest> danhSachDichVu;

    @Size(max = 2000, message = "Ghi chu khong duoc vuot qua 2000 ky tu")
    String ghiChu;
}
