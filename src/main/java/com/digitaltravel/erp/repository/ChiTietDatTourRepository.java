package com.digitaltravel.erp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.ChiTietDatTour;

@Repository
public interface ChiTietDatTourRepository extends JpaRepository<ChiTietDatTour, String> {

    @Query("""
            SELECT ct FROM ChiTietDatTour ct
            JOIN FETCH ct.khachHang hcs
            JOIN FETCH hcs.taiKhoan
            WHERE ct.donDatTour.MaDatTour = :maDatTour
            """)
    List<ChiTietDatTour> findByMaDatTour(@Param("maDatTour") String maDatTour);

    boolean existsByDonDatTour_MaDatTourAndKhachHang_MaKhachHang(
            String maDatTour, String maKhachHang);
}
