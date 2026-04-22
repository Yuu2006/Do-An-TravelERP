package com.digitaltravel.erp.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.LichSuTour;

@Repository
public interface LichSuTourRepository extends JpaRepository<LichSuTour, String> {

    // Kiểm tra KH đã tham gia tour chưa (dùng cho đánh giá)
    @Query("""
            SELECT lst FROM LichSuTour lst
            WHERE lst.khachHang.MaKhachHang = :maKhachHang
              AND lst.tourThucTe.MaTourThucTe = :maTourThucTe
            """)
    Optional<LichSuTour> findByMaKhachHangAndMaTourThucTe(
            @Param("maKhachHang") String maKhachHang,
            @Param("maTourThucTe") String maTourThucTe
    );
}
