package com.digitaltravel.erp.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.TourThucTe;

@Repository
public interface TourThucTeRepository extends JpaRepository<TourThucTe, String> {

    @Query("""
            SELECT COUNT(ttt) > 0 FROM TourThucTe ttt
            WHERE ttt.tourMau.MaTourMau = :maTourMau
              AND ttt.TrangThai = 'MO_BAN'
            """)
    boolean existsTourThucTeMoBanByTourMau(@Param("maTourMau") String maTourMau);

    @Query("""
            SELECT ttt FROM TourThucTe ttt JOIN FETCH ttt.tourMau
            WHERE (:trangThai IS NULL OR ttt.TrangThai = :trangThai)
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
}
