package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.out.RouterResponseDTO;
import com.example.cleanflowback.service.RouterService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/router")
public class RouterController {
    private final RouterService routerService;

    public RouterController(RouterService routerService) {
        this.routerService = routerService;
    }

    @GetMapping("")
    public ResponseEntity<List<RouterResponseDTO>> createRoutes() {
        return ResponseEntity.ok(routerService.kMeansGroupByDistance());
    }
}
