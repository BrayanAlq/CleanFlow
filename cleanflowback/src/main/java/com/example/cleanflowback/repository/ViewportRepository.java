package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.UserEntity;
import com.example.cleanflowback.model.ViewportEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ViewportRepository extends JpaRepository<ViewportEntity, Long> {
    Optional<ViewportEntity> findByUser(UserEntity user);

    @Query(value = """
        SELECT *
        FROM user_viewports uv
        WHERE uv.active = true
        AND ST_Contains(
            uv.viewport,
            ST_SetSRID(ST_Point(:lng, :lat), 4326)
        )
    """, nativeQuery = true)
    List<ViewportEntity> findVisibleUsers(
        @Param("lat") double lat,
        @Param("lng") double lng
    );
}
