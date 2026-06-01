package com.example.cleanflowback.repository.implement;

import com.example.cleanflowback.dto.GeneratedCursorInternalDTO;
import com.example.cleanflowback.model.ReportEntity;
import com.example.cleanflowback.model.ResidentEntity;
import com.example.cleanflowback.repository.ReportRepositoryCustom;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class ReportRepositoryCustomImpl implements ReportRepositoryCustom {
    private final EntityManager em;

    @Override
    public List<ReportEntity> getReportsByResidentWithCursor(
        ResidentEntity resident, GeneratedCursorInternalDTO cursor, int size
    ) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<ReportEntity> cq = cb.createQuery(ReportEntity.class);
        Root<ReportEntity> root = cq.from(ReportEntity.class);

        List<Predicate> predicates = new ArrayList<>();

        if (resident != null) {
            predicates.add(cb.equal(root.get("user").get("id"), resident.getId()));
        }

        if (cursor != null) {
            predicates.add(
                cb.or(
                    cb.lessThan(root.get("timestamp"), cursor.createdAt()),
                    cb.and(
                        cb.equal(root.get("timestamp"), cursor.createdAt()),
                        cb.lessThan(root.get("id"), cursor.id())
                    )
                )
            );
        }

        cq.where(predicates.toArray(new Predicate[0]));
        cq.orderBy(cb.desc(root.get("timestamp")), cb.desc(root.get("id")));

        return em
            .createQuery(cq)
            .setMaxResults(size)
            .getResultList();
    }

    @Override
    public List<ReportEntity> getReportsByContainerWithCursor(Long containerId, GeneratedCursorInternalDTO cursor, int size) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<ReportEntity> cq = cb.createQuery(ReportEntity.class);
        Root<ReportEntity> root = cq.from(ReportEntity.class);

        List<Predicate> predicates = new ArrayList<>();

        if (containerId != null) {
            predicates.add(cb.equal(root.get("container").get("id"), containerId));
        }

        if (cursor != null) {
            predicates.add(
                cb.or(
                    cb.lessThan(root.get("timestamp"), cursor.createdAt()),
                    cb.and(
                        cb.equal(root.get("timestamp"), cursor.createdAt()),
                        cb.lessThan(root.get("id"), cursor.id())
                    )
                )
            );
        }

        cq.where(predicates.toArray(new Predicate[0]));
        cq.orderBy(cb.desc(root.get("timestamp")), cb.desc(root.get("id")));

        return em
            .createQuery(cq)
            .setMaxResults(size)
            .getResultList();
    }
}
