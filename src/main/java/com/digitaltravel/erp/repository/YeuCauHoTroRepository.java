package com.digitaltravel.erp.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.YeuCauHoTro;

@Repository
public interface YeuCauHoTroRepository extends JpaRepository<YeuCauHoTro, String> {

    // Lấy yêu cầu hoàn tiền của 1 đơn đặt tour
    @Query("SELECT y FROM YeuCauHoTro y WHERE y.donDatTour.MaDatTour = :maDatTour AND y.LoaiYeuCau = :loaiYeuCau")
    List<YeuCauHoTro> findByMaDatTourAndLoaiYeuCau(
            @Param("maDatTour") String maDatTour,
            @Param("loaiYeuCau") String loaiYeuCau
    );

    // Nhân viên SALES xem tất cả yêu cầu theo loại + trạng thái
    @Query("""
            SELECT y FROM YeuCauHoTro y
            JOIN FETCH y.khachHang kh
            LEFT JOIN FETCH y.donDatTour
            WHERE (:loaiYeuCau IS NULL OR y.LoaiYeuCau = :loaiYeuCau)
              AND (:trangThai IS NULL OR y.TrangThai = :trangThai)
            ORDER BY y.MaYeuCauHoTro DESC
            """)
    Page<YeuCauHoTro> timKiem(
            @Param("loaiYeuCau") String loaiYeuCau,
            @Param("trangThai") String trangThai,
            Pageable pageable
    );

    // KH xem yêu cầu của chính mình
    @Query("""
            SELECT y FROM YeuCauHoTro y
            JOIN FETCH y.khachHang kh
            LEFT JOIN FETCH y.donDatTour
            WHERE kh.MaKhachHang = :maKhachHang
              AND (:loaiYeuCau IS NULL OR y.LoaiYeuCau = :loaiYeuCau)
            ORDER BY y.MaYeuCauHoTro DESC
            """)
    Page<YeuCauHoTro> timKiemTheoKhachHang(
            @Param("maKhachHang") String maKhachHang,
            @Param("loaiYeuCau") String loaiYeuCau,
            Pageable pageable
    );
}
