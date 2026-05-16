package com.digitaltravel.erp.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.TourThucTe;

import jakarta.persistence.LockModeType;

@Repository
public interface TourThucTeRepository extends JpaRepository<TourThucTe, String> {

    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("SELECT ttt FROM TourThucTe ttt WHERE ttt.MaTourThucTe = :maTourThucTe")
    Optional<TourThucTe> findByIdForUpdate(@Param("maTourThucTe") String maTourThucTe);

    @Query("""
            SELECT COUNT(ttt) > 0 FROM TourThucTe ttt
            WHERE ttt.tourMau.MaTourMau = :maTourMau
              AND ttt.TrangThai = 'MO_BAN'
            """)
    boolean existsTourThucTeMoBanByTourMau(@Param("maTourMau") String maTourMau);

    @Query("""
            SELECT COUNT(ttt) > 0 FROM TourThucTe ttt
            WHERE ttt.tourMau.MaTourMau = :maTourMau
            """)
    boolean existsByMaTourMau(@Param("maTourMau") String maTourMau);

    @Query("""
            SELECT ttt FROM TourThucTe ttt JOIN FETCH ttt.tourMau
            WHERE ((:trangThai IS NULL AND ttt.TrangThai <> 'HUY') OR ttt.TrangThai = :trangThai)
              AND (:maTourMau IS NULL OR ttt.tourMau.MaTourMau = :maTourMau)
              AND (:giaTu IS NULL OR ttt.GiaHienHanh >= :giaTu)
              AND (:giaDen IS NULL OR ttt.GiaHienHanh <= :giaDen)
            """)
    Page<TourThucTe> timKiem(
            @Param("trangThai") String trangThai,
            @Param("maTourMau") String maTourMau,
            @Param("giaTu") java.math.BigDecimal giaTu,
            @Param("giaDen") java.math.BigDecimal giaDen,
            Pageable pageable
    );

    @Query("""
            SELECT ttt FROM TourThucTe ttt JOIN FETCH ttt.tourMau
            WHERE ttt.TrangThai = 'MO_BAN'
              AND ttt.ChoConLai > 0
              AND ttt.NgayKhoiHanh > CURRENT_DATE
              AND (:giaTu IS NULL OR ttt.GiaHienHanh >= :giaTu)
              AND (:giaDen IS NULL OR ttt.GiaHienHanh <= :giaDen)
              AND (:thoiLuongMin IS NULL OR ttt.tourMau.ThoiLuong >= :thoiLuongMin)
              AND (:thoiLuongMax IS NULL OR ttt.tourMau.ThoiLuong <= :thoiLuongMax)
            """)
    Page<TourThucTe> timKiemCongKhai(
            @Param("giaTu") java.math.BigDecimal giaTu,
            @Param("giaDen") java.math.BigDecimal giaDen,
            @Param("thoiLuongMin") Integer thoiLuongMin,
            @Param("thoiLuongMax") Integer thoiLuongMax,
            Pageable pageable
    );

    // Đếm số tour đã kết thúc trong khoảng thời gian (báo cáo)
    @Query("""
            SELECT COUNT(ttt) FROM TourThucTe ttt
            WHERE ttt.TrangThai IN ('KET_THUC', 'DA_QUYET_TOAN')
              AND ttt.NgayKhoiHanh BETWEEN :tuNgay AND :denNgay
            """)
    long demTourKetThuc(
            @Param("tuNgay") java.time.LocalDateTime tuNgay,
            @Param("denNgay") java.time.LocalDateTime denNgay
    );

    // Lấy tất cả tour đang bán để tính dynamic pricing (JOIN FETCH tourMau để đọc GiaSan)
    @Query("""
            SELECT ttt FROM TourThucTe ttt JOIN FETCH ttt.tourMau
            WHERE ttt.TrangThai IN ('MO_BAN', 'SAP_DIEN_RA')
            """)
    java.util.List<TourThucTe> findForDynamicPricing();

    @Query("""
            SELECT ttt FROM TourThucTe ttt
            WHERE ttt.tourMau.MaTourMau = :maTourMau
              AND ttt.TrangThai <> 'HUY'
            """)
    List<TourThucTe> findActiveByTourMau(@Param("maTourMau") String maTourMau);
}
