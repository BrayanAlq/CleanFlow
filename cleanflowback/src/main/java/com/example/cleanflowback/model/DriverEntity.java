package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "drivers")
@PrimaryKeyJoinColumn(name = "id")
@Getter
@Setter
@NoArgsConstructor
public class DriverEntity extends UserEntity {
    @OneToMany(mappedBy = "driver", fetch = FetchType.LAZY)
    private List<RouteEntity> routes;

    @OneToMany(mappedBy = "driver", fetch = FetchType.LAZY)
    private List<GeneratedRouteEntity>  generatedRoutes;
}
