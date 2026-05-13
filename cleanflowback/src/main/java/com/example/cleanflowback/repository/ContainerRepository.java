package com.example.cleanflowback.repository;

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
}
