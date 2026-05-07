package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.PrecisionModel;

import java.util.List;

@Entity
@Table(name = "containers")
@Getter
@Setter
@NoArgsConstructor
public class ContainerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(columnDefinition = "geography(Point, 4326)", nullable = false)
    private Point location;

    @OneToMany(mappedBy = "container")
    private List<ReportEntity> reports;

    @OneToMany(mappedBy = "container")
    private List<MetricEntity> metrics;

    public void setLocation(double latitude, double longitude) {
        GeometryFactory gf = new GeometryFactory(new PrecisionModel(), 4326);
        Coordinate coordinate = new Coordinate(longitude, latitude);

        this.location = gf.createPoint(coordinate);
    }

    public double getLatitude() { return this.location.getY(); }
    public double getLongitude() { return this.location.getX(); }
}
