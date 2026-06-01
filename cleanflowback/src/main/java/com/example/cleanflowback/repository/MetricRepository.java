package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.MetricEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MetricRepository extends JpaRepository<MetricEntity, Long> {
    @Query("""
        SELECT m FROM MetricEntity m
        WHERE m.container.id IN :containerIds
        AND m.timestamp = (
            SELECT max(m2.timestamp) FROM MetricEntity m2
            WHERE m2.container.id = m.container.id
        )
    """)
    List<MetricEntity> findLatestByContainerIds(@Param("containerIds") List<Long> containerIds);
}
