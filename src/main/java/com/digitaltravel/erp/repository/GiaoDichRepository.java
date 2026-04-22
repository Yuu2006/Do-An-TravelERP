package com.digitaltravel.erp.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.GiaoDich;

@Repository
public interface GiaoDichRepository extends JpaRepository<GiaoDich, String> {

    // Tìm giao dịch thanh toán đang chờ/đã hoàn thành của 1 đơn
    @Query("SELECT g FROM GiaoDich g WHERE g.donDatTour.MaDatTour = :maDatTour AND g.loaiGiaoDich = 'THANH_TOAN' ORDER BY g.ngayThanhToan DESC")
    List<GiaoDich> findByMaDatTour(@Param("maDatTour") String maDatTour);

    // Kiểm tra idempotency: transId đã xử lý chưa
    Optional<GiaoDich> findByMaGDNH(String maGDNH);

    // Lấy giao dịch thanh toán thành công của 1 đơn
    @Query("SELECT g FROM GiaoDich g WHERE g.donDatTour.MaDatTour = :maDatTour AND g.trangThai = 'THANH_CONG'")
    Optional<GiaoDich> findThanhCongByMaDatTour(@Param("maDatTour") String maDatTour);
}
