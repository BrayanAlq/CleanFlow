package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.ContainerEdgeEntity;
import com.example.cleanflowback.model.ContainerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

@Service
public interface ContainerEdgeRepository extends JpaRepository<ContainerEdgeEntity, Long> {
    @Query("""
        SELECT e
        FROM ContainerEdgeEntity e
        WHERE
        (e.firstContainer.id = :a AND e.secondContainer.id = :b)
        OR
        (e.firstContainer.id = :b AND e.secondContainer.id = :a)
    """)
    ContainerEdgeEntity findEdgeBetween(@Param("a") Long a, @Param("b") Long b);

    ContainerEdgeEntity findByFirstContainerAndSecondContainer(ContainerEntity firstContainer, ContainerEntity secondContainer);
}
