package com.digitaltravel.erp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.NhatKySuCo;

@Repository
public interface NhatKySuCoRepository extends JpaRepository<NhatKySuCo, String> {

    @Query("SELECT n FROM NhatKySuCo n WHERE n.tourThucTe.MaTourThucTe = :maTour ORDER BY n.ThoiGianBaoCao DESC")
    List<NhatKySuCo> findByMaTour(@Param("maTour") String maTour);
}
