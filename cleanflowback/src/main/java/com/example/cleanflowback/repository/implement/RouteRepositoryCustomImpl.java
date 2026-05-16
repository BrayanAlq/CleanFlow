package com.example.cleanflowback.repository.implement;

import com.example.cleanflowback.model.RouteEntity;
import com.example.cleanflowback.repository.RouteRepositoryCustom;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.AllArgsConstructor;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@AllArgsConstructor
public class RouteRepositoryCustomImpl implements RouteRepositoryCustom {
    private final EntityManager em;

    @Override
    public List<RouteEntity> findAllRoutes(
        Specification<RouteEntity> specs, Long cursor, Integer size
    ) {
        CriteriaBuilder cb = em.getCriteriaBuilder();

        CriteriaQuery<RouteEntity> query = cb.createQuery(RouteEntity.class);
        Root<RouteEntity> root = query.from(RouteEntity.class);

        Predicate predicate = specs == null
            ? cb.conjunction()
            : specs.toPredicate(root, query, cb);

        if (predicate == null) {
            predicate = cb.conjunction();
        }

        if (cursor != null) {
            predicate = cb.and(
                predicate,
                cb.lessThan(root.get("id"), cursor)
            );
        }

        query.where(predicate);
        query.orderBy(cb.desc(root.get("id")));

        return em.createQuery(query)
            .setMaxResults(size)
            .getResultList();

    }
}
