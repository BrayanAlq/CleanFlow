package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.CreateMetricRequestDTO;
import com.example.cleanflowback.dto.out.MetricResponseDTO;
import com.example.cleanflowback.service.MetricService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// this class is for test only
@RestController
@RequestMapping("/metric")
public class MetricController {
    private final MetricService metricService;

    public MetricController(MetricService metricService) {
        this.metricService = metricService;
    }

    @PostMapping("")
    public ResponseEntity<MetricResponseDTO> postMetric(
        @Valid @RequestBody CreateMetricRequestDTO requestDTO
    ) {
       return ResponseEntity.ok(metricService.createMetric(requestDTO));
    }
}
