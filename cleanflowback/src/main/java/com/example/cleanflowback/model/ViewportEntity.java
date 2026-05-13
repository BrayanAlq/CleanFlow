package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.*;
import org.locationtech.jts.geom.Polygon;

import java.time.LocalDateTime;

@Entity
@Table(name = "user_viewports")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ViewportEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(
        columnDefinition = "geometry(Polygon,4326)",
        nullable = false
    )
    private Polygon viewport;

    @Column(nullable = false)
    private boolean active;

    @Column(nullable = false)
    private LocalDateTime lastSeen;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private UserEntity user;
}
