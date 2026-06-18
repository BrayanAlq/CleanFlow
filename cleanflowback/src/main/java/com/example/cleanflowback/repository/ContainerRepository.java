package com.example.cleanflowback.repository;

import com.example.cleanflowback.dto.ContainerNearByPointRawDTO;
import com.example.cleanflowback.model.ContainerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContainerRepository extends JpaRepository<ContainerEntity, Long> {
    boolean existsByName(String name);
    @Query(value = """
        SELECT * FROM containers
        WHERE ST_Within(
            location::geometry,
            ST_MakeEnvelope(:west, :south, :east, :north, 4326)
        )
    """, nativeQuery = true)
    List<ContainerEntity> findAllInViewport(
        @Param("north") double north,
        @Param("south") double south,
        @Param("east") double east,
        @Param("west") double west
    );

    ContainerEntity findByApiKey(String apiKey);
    boolean existsByApiKey(String apiKey);

    @Query(value = """
        WITH distances AS (
            SELECT 
                c.id,
                c.name,
                c.address_name,
                ci.url,
                ST_Distance(c.location::geography, ST_Point(:longitude, :latitude)::geography) as distance
            FROM containers c
            JOIN container_images ci ON ci.id = c.container_image_id
        )
        SELECT * FROM distances
        WHERE (
            :cursor_distance IS NULL
            OR distance > :cursor_distance
            OR (distance = :cursor_distance AND id > :cursor_id)
        )
        ORDER BY distance ASC, id ASC
        LIMIT :size
    """, nativeQuery = true)
    List<ContainerNearByPointRawDTO> findAllOrderedByPointDistance(
        @Param("latitude") double latitude,
        @Param("longitude") double longitude,
        @Param("cursor_distance") Double cursorDistance,
        @Param("cursor_id") Long cursorId,
        @Param("size") int size
    );
}
