package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.out.ResidentInfoDTO;
import com.example.cleanflowback.model.ResidentEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ResidentService {
    ResidentInfoDTO getResidentInfo(ResidentEntity residentEntity);
    Page<ResidentInfoDTO> getAllResidentsInfo(Pageable pageable);
}
