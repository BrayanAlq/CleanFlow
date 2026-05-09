package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.ReportEntity;
import org.springframework.data.domain.Limit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository<ReportEntity, Long> {
    List<ReportEntity> findAllByContainer_Id(Long id);
    Page<ReportEntity> findAllByContainer_Id(Long containerId, Pageable pageable);

    List<ReportEntity> findAllByContainer_IdOrderByIdDesc(Long containerId, Limit limit);
    List<ReportEntity> findAllByContainer_IdAndIdLessThanOrderByIdDesc(Long containerId, Long idIsLessThan, Limit limit);
}
