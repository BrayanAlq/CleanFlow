package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.in.CreateMetricRequestDTO;
import com.example.cleanflowback.dto.out.MetricResponseDTO;

public interface MetricService {
    MetricResponseDTO createMetric(CreateMetricRequestDTO requestDTO);
}
