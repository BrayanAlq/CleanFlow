package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.out.RouterResponseDTO;

import java.util.List;

public interface RouterService {
    List<RouterResponseDTO> kMeansGroupByDistance();
}
