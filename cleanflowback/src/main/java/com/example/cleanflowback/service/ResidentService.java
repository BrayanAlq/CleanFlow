package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.out.ResidentInfoDTO;
import com.example.cleanflowback.model.ResidentEntity;

public interface ResidentService {
    ResidentInfoDTO getResidentInfo(ResidentEntity residentEntity);
}
