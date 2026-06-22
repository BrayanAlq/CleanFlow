package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.ResidentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResidentRepository extends JpaRepository<ResidentEntity, Long> {
    @Query(value = """
        SELECT
            r.id
        FROM residents r
        WHERE ST_Within(
            r.location::geometry,
            ST_MakeEnvelope(:west, :south, :east, :north, 4326)
        )
    """, nativeQuery = true)
    List<Long> findAllInViewport(
        @Param("north") double north,
        @Param("south") double south,
        @Param("east") double east,
        @Param("west") double west
    );

    @Query(value = """
        SELECT r.id
        FROM residents r
        WHERE ST_DWithin(
            r.location,
            (SELECT location
            FROM containers
            WHERE id = :containerId),
            100
        );
    """, nativeQuery = true)
    List<Long> findAllInRadiusPoint(
        @Param("containerId") Long containerId
    );
}
