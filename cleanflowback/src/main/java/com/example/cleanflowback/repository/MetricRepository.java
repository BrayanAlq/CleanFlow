package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.MetricEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MetricRepository extends JpaRepository<MetricEntity, Long> {
}
