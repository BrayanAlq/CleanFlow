package com.example.cleanflowback.specification;

import com.example.cleanflowback.model.RouteEntity;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class RouteSpecifications {
    public static Specification<RouteEntity> hasDate(LocalDate date) {
        LocalDateTime start = date.atStartOfDay();
        LocalDateTime end = date.plusDays(1).atStartOfDay();

        return (r, q, cb) ->
            cb.and(
                cb.greaterThanOrEqualTo(r.get("startAt"), start),
                cb.lessThan(r.get("startAt"), end)
            );
    }

    public static Specification<RouteEntity> hasDriverId(Long driverId) {
        return (r, q, cb) ->
            cb.equal(r.get("driver").get("id"), driverId);
    }
}
