package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.RouteEntity;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

public interface RouteRepositoryCustom {
    List<RouteEntity> findAllRoutes(
        Specification<RouteEntity> specs,
        Long cursor,
        Integer limit
    );
}
