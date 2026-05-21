package com.example.cleanflowback.repository.implement;

import com.example.cleanflowback.dto.GeneratedCursorInternalDTO;
import com.example.cleanflowback.model.GeneratedRouteEntity;
import com.example.cleanflowback.repository.GeneratedRouteCustom;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Repository
@AllArgsConstructor
public class GeneratedRouteCustomImpl implements GeneratedRouteCustom {
    private final EntityManager em;

    @Override
    public List<GeneratedRouteEntity> getAllWithSpecs(
        Long driverId, LocalDate date, Integer size, GeneratedCursorInternalDTO cursor
    ) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<GeneratedRouteEntity> cq = cb.createQuery(GeneratedRouteEntity.class);
        Root<GeneratedRouteEntity> root = cq.from(GeneratedRouteEntity.class);

        List<Predicate> predicates = new ArrayList<>();

        if (driverId != null) {
            predicates.add(cb.equal(root.get("driver").get("id"), driverId));
        }

        if (date != null) {
            LocalDateTime startDate = date.atStartOfDay();
            LocalDateTime endDate = date.atStartOfDay().plusDays(1);
            predicates.add(
                cb.greaterThanOrEqualTo(root.get("createdAt"), startDate)
            );
            predicates.add(cb.lessThan(root.get("createdAt"), endDate));
        }

        if (cursor != null) {
            predicates.add(
                cb.or(
                    cb.lessThan(root.get("createdAt"), cursor.createdAt()),
                    cb.and(
                        cb.equal(root.get("createdAt"), cursor.createdAt()),
                        cb.lessThan(root.get("id"), cursor.id())
                    )
                )
            );
        }

        cq.where(predicates.toArray(new Predicate[0]));
        cq.orderBy(cb.desc(root.get("createdAt")), cb.desc(root.get("id")));

        return em
            .createQuery(cq)
            .setMaxResults(size)
            .getResultList();
    }
}
