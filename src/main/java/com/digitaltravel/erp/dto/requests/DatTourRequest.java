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

    // Tuỳ chọn: người đồng hành không có tài khoản/hồ chiếu số
    @Valid
    List<NguoiDongHanhRequest> danhSachNguoiDongHanh;

    // Tuỳ chọn: hành động xanh khách chọn trước khi tham gia tour
    @Size(max = 20, message = "Chi duoc chon toi da 20 hanh dong xanh")
    List<String> danhSachHanhDongXanh;

    @Size(max = 2000, message = "Ghi chu khong duoc vuot qua 2000 ky tu")
    String ghiChu;
}
