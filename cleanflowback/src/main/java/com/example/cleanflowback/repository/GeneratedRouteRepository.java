package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.GeneratedRouteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GeneratedRouteRepository extends
    JpaRepository<GeneratedRouteEntity, Long>, GeneratedRouteCustom {
}
