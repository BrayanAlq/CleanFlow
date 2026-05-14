package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.in.ActualContainerRequestDTO;

public interface ActualContainerService {
    void createOrUpdateActualContainer(ActualContainerRequestDTO requestDTO);
}
