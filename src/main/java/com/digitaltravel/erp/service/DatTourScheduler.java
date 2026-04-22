package com.digitaltravel.erp.service;

import java.time.LocalDateTime;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.entity.DonDatTour;
import com.digitaltravel.erp.repository.DonDatTourRepository;

import lombok.RequiredArgsConstructor;

/**
 * Scheduler tự động hủy đơn đặt tour hết thời gian giữ chỗ.
 * Chạy mỗi 60 giây, tìm đơn CHO_XAC_NHAN có ThoiGianHetHan < NOW()
 * và đặt TrangThai = HET_HAN_GIU_CHO.
 * Không cần hoàn ChoConLai vì ChoConLai chưa bị trừ (chỉ trừ sau thanh toán).
 */
@Component
@RequiredArgsConstructor
public class DatTourScheduler {

    private static final Logger log = LoggerFactory.getLogger(DatTourScheduler.class);

    private final DonDatTourRepository donDatTourRepository;

    @Scheduled(fixedDelay = 60_000)
    @Transactional
    public void huyDonHetHan() {
        List<DonDatTour> donHetHan = donDatTourRepository
                .findAllByTrangThaiAndThoiGianHetHanBefore("CHO_XAC_NHAN", LocalDateTime.now());

        if (donHetHan.isEmpty()) return;

        for (DonDatTour don : donHetHan) {
            don.setTrangThai("HET_HAN_GIU_CHO");
        }
        donDatTourRepository.saveAll(donHetHan);
        log.info("[Scheduler] Da huy {} don dat tour het han giu cho", donHetHan.size());
    }
}
