package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.in.ViewportRequestDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.model.UserEntity;
import com.example.cleanflowback.model.ViewportEntity;
import com.example.cleanflowback.repository.UserRepository;
import com.example.cleanflowback.repository.ViewportRepository;
import com.example.cleanflowback.service.ViewportService;
import lombok.AllArgsConstructor;
import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Polygon;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@AllArgsConstructor
public class ViewportServiceImpl implements ViewportService {
    private final UserRepository userRepository;
    private final GeometryFactory geometryFactory;
    private final ViewportRepository viewportRepository;

    @Override
    @Transactional
    public void createOrUpdateViewport(ViewportRequestDTO requestDTO, UserEntity user) {
        UserEntity userEntity = userRepository.findByUsername(user.getUsername())
            .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        double north = requestDTO.north();
        double south = requestDTO.south();
        double east = requestDTO.east();
        double west = requestDTO.west();

        Coordinate[] coordinates = new Coordinate[] {
            new Coordinate(west, south),
            new Coordinate(east, south),
            new Coordinate(east, north),
            new Coordinate(west, north),
            new Coordinate(west, south)
        };

        Polygon polygon =  geometryFactory.createPolygon(coordinates);
        polygon.setSRID(4326);

        ViewportEntity viewport = viewportRepository.findByUser(userEntity).orElse(
            ViewportEntity.builder().user(userEntity).build()
        );

        viewport.setViewport(polygon);
        viewport.setActive(true);
        viewport.setLastSeen(LocalDateTime.now());

        viewportRepository.save(viewport);
    }
}
