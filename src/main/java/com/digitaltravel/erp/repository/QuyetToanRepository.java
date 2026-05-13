package com.digitaltravel.erp.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.QuyetToan;

@Repository
public interface QuyetToanRepository extends JpaRepository<QuyetToan, String> {

    Optional<QuyetToan> findByTourThucTe_MaTourThucTe(String maTour);

    boolean existsByTourThucTe_MaTourThucTe(String maTour);

    @Query("""
            SELECT qt FROM QuyetToan qt JOIN FETCH qt.tourThucTe tt
            WHERE (:trangThai IS NULL OR qt.TrangThai = :trangThai)
            ORDER BY qt.NgayQuyetToan DESC
            """)
    Page<QuyetToan> findByTrangThai(@Param("trangThai") String trangThai, Pageable pageable);

    // Thống kê doanh thu theo khoảng thời gian (quyết toán đã chốt)
    @Query("""
            SELECT SUM(qt.TongDoanhThu), COUNT(qt)
            FROM QuyetToan qt
            WHERE qt.TrangThai = 'DA_CHOT'
              AND qt.NgayQuyetToan BETWEEN :tuNgay AND :denNgay
            """)
    List<Object[]> thongKeDoanhThu(
            @Param("tuNgay") java.time.LocalDateTime tuNgay,
            @Param("denNgay") java.time.LocalDateTime denNgay
    );

    // Top tour doanh thu
    @Query("""
            SELECT qt.tourThucTe.MaTourThucTe, qt.tourThucTe.tourMau.TieuDe, COUNT(dt), SUM(qt.TongDoanhThu)
            FROM QuyetToan qt
            JOIN qt.tourThucTe tt
            JOIN tt.tourMau tm
            LEFT JOIN DonDatTour dt ON dt.tourThucTe.MaTourThucTe = qt.tourThucTe.MaTourThucTe
            WHERE qt.TrangThai = 'DA_CHOT'
              AND qt.NgayQuyetToan BETWEEN :tuNgay AND :denNgay
            GROUP BY qt.tourThucTe.MaTourThucTe, qt.tourThucTe.tourMau.TieuDe
            ORDER BY SUM(qt.TongDoanhThu) DESC
            """)
    List<Object[]> topTourDoanhThu(
            @Param("tuNgay") java.time.LocalDateTime tuNgay,
            @Param("denNgay") java.time.LocalDateTime denNgay
    );
}
