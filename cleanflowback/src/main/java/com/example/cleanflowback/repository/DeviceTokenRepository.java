package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.DeviceTokenEntity;
import com.example.cleanflowback.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface DeviceTokenRepository extends JpaRepository<DeviceTokenEntity, Long> {
    Optional<DeviceTokenEntity> findByToken(String token);
    List<DeviceTokenEntity> findByUser(UserEntity user);
    void deleteByToken(String token);

    @Query(value = """
        SELECT d from DeviceTokenEntity d
        WHERE d.user.id IN :userIds
    """)
    List<DeviceTokenEntity> findAllByUserIds(
        @Param("userIds") List<Long> userIds
    );
}
