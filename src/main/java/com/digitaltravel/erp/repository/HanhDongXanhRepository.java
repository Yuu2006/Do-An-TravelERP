package com.digitaltravel.erp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.HanhDongXanh;

@Repository
public interface HanhDongXanhRepository extends JpaRepository<HanhDongXanh, String> {

    @Query("""
            select hdx from HanhDongXanh hdx
            where hdx.tourThucTe is null
               or hdx.tourThucTe.MaTourThucTe = :maTourThucTe
            """)
    List<HanhDongXanh> findAvailableForTour(@Param("maTourThucTe") String maTourThucTe);
}
