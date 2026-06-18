package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Point;

@Entity
@Table(name = "residents")
@PrimaryKeyJoinColumn(name = "id")
@Getter
@Setter
@NoArgsConstructor
public class ResidentEntity extends UserEntity {
    @Column(columnDefinition = "geography(Point, 4326)", nullable = true)
    private Point location;

    @Column(nullable = false)
    private int reportCount;

    @Column(nullable = false)
    private int badgeCount;

    @Column(nullable = false)
    private String address;

    public void setLocation(double latitude, double longitude) {
        GeometryFactory gf = new GeometryFactory();
        Coordinate coordinate = new Coordinate(longitude, latitude);

        this.location = gf.createPoint(coordinate);
    }

    public double getLatitude() { return location.getCoordinate().getY(); }

    public double getLongitude() { return location.getCoordinate().getX(); }

    @Override
    @PrePersist
    public void prePersist() {
        super.prePersist();
        this.reportCount = 0;
        this.badgeCount = 0;
    }
}
