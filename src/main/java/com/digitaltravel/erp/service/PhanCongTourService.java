package com.digitaltravel.erp.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.config.VaiTroConst;
import com.digitaltravel.erp.dto.requests.PhanCongHdvRequest;
import com.digitaltravel.erp.dto.responses.NhanVienResponse;
import com.digitaltravel.erp.dto.responses.PhanCongResponse;
import com.digitaltravel.erp.entity.NhanVien;
import com.digitaltravel.erp.entity.PhanCongTour;
import com.digitaltravel.erp.entity.TourThucTe;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.DiemDanhRepository;
import com.digitaltravel.erp.repository.HanhDongRepository;
import com.digitaltravel.erp.repository.NhanVienRepository;
import com.digitaltravel.erp.repository.PhanCongTourRepository;
import com.digitaltravel.erp.repository.TourThucTeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PhanCongTourService {

    private final PhanCongTourRepository phanCongTourRepository;
    private final NhanVienRepository nhanVienRepository;
    private final TourThucTeRepository tourThucTeRepository;
    private final DiemDanhRepository diemDanhRepository;
    private final HanhDongRepository hanhDongRepository;

    // ── UC38: Tìm HDV khả dụng ────────────────────────────────────────────
    public List<NhanVienResponse> timHdvKhaDung(String maTourThucTe) {
        TourThucTe tour = tourThucTeRepository.findById(maTourThucTe)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour: " + maTourThucTe));

        LocalDate ngayKhoiHanh = tour.getNgayKhoiHanh();
        // Dùng ngayKhoiHanh làm cả start + end nếu không có NgayKetThuc
        List<String> maNhanViens = phanCongTourRepository.findMaNhanVienKhaDung(ngayKhoiHanh, ngayKhoiHanh);

        return maNhanViens.stream()
                .map(ma -> nhanVienRepository.findById(ma).orElse(null))
                .filter(nv -> nv != null)
                .map(this::toNhanVienResponse)
                .toList();
    }

    // ── UC37: Phân công HDV ────────────────────────────────────────────────
    @Transactional
    public PhanCongResponse phanCong(PhanCongHdvRequest request, String taoBoi) {
        TourThucTe tour = tourThucTeRepository.findById(request.getMaTourThucTe())
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour: " + request.getMaTourThucTe()));

        NhanVien hdv = nhanVienRepository.findById(request.getMaNhanVien())
                .orElseThrow(() -> AppException.notFound("Khong tim thay nhan vien: " + request.getMaNhanVien()));

        // Validate HDV role
        String maVaiTro = hdv.getTaiKhoan().getVaiTro().getMaVaiTro();
        if (!VaiTroConst.HDV.equals(maVaiTro)) {
            throw AppException.badRequest("Nhan vien " + request.getMaNhanVien() + " khong phai HDV.");
        }

        // Kiểm tra trùng lịch
        LocalDate ngayKhoiHanh = tour.getNgayKhoiHanh();
        boolean trungLich = !phanCongTourRepository
                .findMaNhanVienKhaDung(ngayKhoiHanh, ngayKhoiHanh)
                .contains(request.getMaNhanVien());
        if (trungLich) {
            throw AppException.badRequest("HDV da bi phan cong cho tour khac trong cung thoi gian.");
        }

        PhanCongTour pc = new PhanCongTour();
        pc.setMaPhanCongTour("PC_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        pc.setTourThucTe(tour);
        pc.setNhanVien(hdv);
        pc.setNgayPhanCong(LocalDateTime.now());
        pc.setTaoBoi(taoBoi);
        phanCongTourRepository.save(pc);

        // Đánh dấu HDV đang bận
        hdv.setTrangThaiLamViec("BAN");
        nhanVienRepository.save(hdv);

        return toResponse(pc);
    }

    // ── Hủy phân công ─────────────────────────────────────────────────────
    @Transactional
    public void huyPhanCong(String maPhanCong) {
        PhanCongTour pc = phanCongTourRepository.findById(maPhanCong)
                .orElseThrow(() -> AppException.notFound("Khong tim thay phan cong: " + maPhanCong));

        String maTour = pc.getTourThucTe().getMaTourThucTe();
        String maNhanVien = pc.getNhanVien().getMaNhanVien();
        if (diemDanhRepository.existsByMaTourAndMaNhanVien(maTour, maNhanVien)
                || hanhDongRepository.existsByMaTourAndMaNhanVien(maTour, maNhanVien)) {
            throw AppException.badRequest("Khong the huy phan cong da co du lieu van hanh.");
        }

        phanCongTourRepository.delete(pc);

        // Nếu HDV không còn phân công hiệu lực nào thì về SAN_SANG
        NhanVien hdv = pc.getNhanVien();
        boolean conTourKhac = phanCongTourRepository.findByMaNhanVien(hdv.getMaNhanVien()).stream()
                .anyMatch(other -> !other.getMaPhanCongTour().equals(maPhanCong));
        if (!conTourKhac) {
            hdv.setTrangThaiLamViec("SAN_SANG");
            nhanVienRepository.save(hdv);
        }
    }

    // ── HDV xem tour của mình ─────────────────────────────────────────────
    public List<PhanCongResponse> tourCuaToi(String maTaiKhoan) {
        NhanVien hdv = nhanVienRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so nhan vien"));
        return phanCongTourRepository.findByMaNhanVien(hdv.getMaNhanVien()).stream()
                .map(this::toResponse)
                .toList();
    }

    // ── Mappers ───────────────────────────────────────────────────────────
    private PhanCongResponse toResponse(PhanCongTour pc) {
        NhanVien nv = pc.getNhanVien();
        TourThucTe tt = pc.getTourThucTe();
        return PhanCongResponse.builder()
                .maPhanCong(pc.getMaPhanCongTour())
                .maTourThucTe(tt.getMaTourThucTe())
                .tenTour(tt.getTourMau() != null ? tt.getTourMau().getTieuDe() : "")
                .maNhanVien(nv.getMaNhanVien())
                .tenNhanVien(nv.getTaiKhoan().getHoTen())
                .ngayPhanCong(pc.getNgayPhanCong())
                .build();
    }

    private NhanVienResponse toNhanVienResponse(NhanVien nv) {
        return NhanVienResponse.builder()
                .maNhanVien(nv.getMaNhanVien())
                .maTaiKhoan(nv.getTaiKhoan().getMaTaiKhoan())
                .hoTen(nv.getTaiKhoan().getHoTen())
                .email(nv.getTaiKhoan().getEmail())
                .soDienThoai(nv.getTaiKhoan().getSoDienThoai())
                .maVaiTro(nv.getTaiKhoan().getVaiTro().getMaVaiTro())
                .trangThaiTaiKhoan(nv.getTaiKhoan().getTrangThai())
                .trangThaiLamViec(nv.getTrangThaiLamViec())
                .ngayVaoLam(nv.getNgayVaoLam())
                .build();
    }
}
