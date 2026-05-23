package com.digitaltravel.erp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.digitaltravel.erp.entity.HdxTourThucTe;
import com.digitaltravel.erp.entity.HdxTourThucTeId;

public interface HdxTourThucTeRepository extends JpaRepository<HdxTourThucTe, HdxTourThucTeId> {
    void deleteByHanhDongXanh_MaHanhDongXanh(String maHanhDongXanh);

    void deleteByTourThucTe_MaTourThucTe(String maTourThucTe);

    @Query("""
            select link from HdxTourThucTe link
            join fetch link.hanhDongXanh
            where link.tourThucTe.MaTourThucTe = :maTourThucTe
            order by link.hanhDongXanh.MaHanhDongXanh
            """)
    List<HdxTourThucTe> findByMaTourThucTe(@Param("maTourThucTe") String maTourThucTe);

    @Query("""
            select link.tourThucTe.MaTourThucTe from HdxTourThucTe link
            where link.hanhDongXanh.MaHanhDongXanh = :maHanhDongXanh
            order by link.tourThucTe.MaTourThucTe
            limit 1
            """)
    List<String> findMaTourThucTe(@Param("maHanhDongXanh") String maHanhDongXanh);
}
