package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.ReportImageEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReportImageRepository extends JpaRepository<ReportImageEntity, Long> {
}
