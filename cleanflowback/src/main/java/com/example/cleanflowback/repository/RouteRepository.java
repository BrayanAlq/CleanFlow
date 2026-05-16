package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.DriverEntity;
import com.example.cleanflowback.model.RouteEntity;
import com.example.cleanflowback.model.RouteStatusEnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RouteRepository extends
    JpaRepository<RouteEntity, Long>, JpaSpecificationExecutor<RouteEntity>, RouteRepositoryCustom {
    boolean existsByDriverAndStatus(DriverEntity driver, RouteStatusEnum status);
}
