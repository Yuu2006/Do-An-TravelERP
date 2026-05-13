package com.digitaltravel.erp.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.PhanCongTour;

@Repository
public interface PhanCongTourRepository extends JpaRepository<PhanCongTour, String> {

    // Lấy tất cả phân công của 1 tour
    @Query("SELECT pc FROM PhanCongTour pc JOIN FETCH pc.nhanVien nv JOIN FETCH nv.taiKhoan WHERE pc.tourThucTe.MaTourThucTe = :maTour AND pc.TrangThai != 'HUY'")
    List<PhanCongTour> findActiveByMaTour(@Param("maTour") String maTour);

    // HDV xem tour được giao (đang hiệu lực)
    @Query("""
            SELECT pc FROM PhanCongTour pc
            JOIN FETCH pc.tourThucTe tt
            JOIN FETCH tt.tourMau
            WHERE pc.nhanVien.MaNhanVien = :maNhanVien
              AND pc.TrangThai != 'HUY'
            ORDER BY tt.NgayKhoiHanh DESC
            """)
    List<PhanCongTour> findByMaNhanVien(@Param("maNhanVien") String maNhanVien);

    // Tìm HDV khả dụng: không bị phân công trùng lịch
    @Query("""
            SELECT nv.MaNhanVien FROM NhanVien nv
            JOIN nv.taiKhoan tk
            WHERE nv.TrangThaiLamViec = 'SAN_SANG'
              AND tk.vaiTro.MaVaiTro = 'HDV'
              AND tk.TrangThai = 'HOAT_DONG'
              AND nv.MaNhanVien NOT IN (
                  SELECT pc.nhanVien.MaNhanVien FROM PhanCongTour pc
                  JOIN pc.tourThucTe tt
                  WHERE pc.TrangThai != 'HUY'
                    AND tt.NgayKhoiHanh <= :ngayKetThuc
                    AND tt.NgayKhoiHanh >= :ngayKhoiHanh
              )
            """)
    List<String> findMaNhanVienKhaDung(
            @Param("ngayKhoiHanh") LocalDate ngayKhoiHanh,
            @Param("ngayKetThuc") LocalDate ngayKetThuc
    );
}
