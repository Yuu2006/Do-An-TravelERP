package com.digitaltravel.erp.repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.DonDatTour;

@Repository
public interface DonDatTourRepository extends JpaRepository<DonDatTour, String> {

    // Lấy tất cả đơn đặt tour của một khách hàng (theo maKhachHang của HoChieuSo)
    @Query("""
            SELECT d FROM DonDatTour d
            JOIN FETCH d.tourThucTe ttt
            JOIN FETCH ttt.tourMau
            WHERE d.khachHang.MaKhachHang = :maKhachHang
            """)
    Page<DonDatTour> findByMaKhachHang(@Param("maKhachHang") String maKhachHang, Pageable pageable);

    // Lấy chi tiết đơn đặt tour đảm bảo thuộc về khách hàng đang đăng nhập (chống IDOR)
    @Query("""
            SELECT d FROM DonDatTour d
            JOIN FETCH d.tourThucTe ttt
            JOIN FETCH ttt.tourMau
            WHERE d.MaDatTour = :maDatTour
              AND d.khachHang.MaKhachHang = :maKhachHang
            """)
    Optional<DonDatTour> findByIdAndMaKhachHang(
            @Param("maDatTour") String maDatTour,
            @Param("maKhachHang") String maKhachHang
    );

    // Dành cho nhân viên: tất cả đơn (filter theo trạng thái)
    @Query("""
            SELECT d FROM DonDatTour d
            JOIN FETCH d.tourThucTe ttt
            JOIN FETCH ttt.tourMau
            JOIN FETCH d.khachHang
            WHERE (:trangThai IS NULL OR d.TrangThai = :trangThai)
              AND (:maTourThucTe IS NULL OR d.tourThucTe.MaTourThucTe = :maTourThucTe)
            """)
    Page<DonDatTour> timKiem(
            @Param("trangThai") String trangThai,
            @Param("maTourThucTe") String maTourThucTe,
            Pageable pageable
    );

    // Dùng cho Scheduler: lấy đơn CHO_XAC_NHAN đã hết hạn giữ chỗ
    @Query("SELECT d FROM DonDatTour d WHERE d.TrangThai = :trangThai AND d.ThoiGianHetHan < :thoiGian")
    List<DonDatTour> findAllByTrangThaiAndThoiGianHetHanBefore(
            @Param("trangThai") String trangThai,
            @Param("thoiGian") LocalDateTime thoiGian
    );

    // Kiểm tra đơn theo maDatTour (không lọc khách hàng) — dùng cho thanh toán
    @Query("""
            SELECT d FROM DonDatTour d
            JOIN FETCH d.tourThucTe ttt
            JOIN FETCH ttt.tourMau
            JOIN FETCH d.khachHang
            WHERE d.MaDatTour = :maDatTour
            """)
    Optional<DonDatTour> findByIdWithDetails(@Param("maDatTour") String maDatTour);

    // Đếm số đơn đặt tour trong khoảng thời gian (báo cáo)
    @Query("SELECT COUNT(d) FROM DonDatTour d WHERE d.ThoiDiemTao BETWEEN :tuNgay AND :denNgay")
    long demDonDatTour(
            @Param("tuNgay") LocalDateTime tuNgay,
            @Param("denNgay") LocalDateTime denNgay
    );
}
