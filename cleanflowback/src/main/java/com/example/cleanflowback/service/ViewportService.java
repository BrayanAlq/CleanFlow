package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.in.ViewportRequestDTO;
import com.example.cleanflowback.model.UserEntity;

public interface ViewportService {
    void createOrUpdateViewport(ViewportRequestDTO requestDTO, UserEntity user);
}
