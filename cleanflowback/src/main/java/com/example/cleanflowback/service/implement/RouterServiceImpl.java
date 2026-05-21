package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.out.RouterResponseDTO;
import com.example.cleanflowback.exception.KMeansConflictException;
import com.example.cleanflowback.model.*;
import com.example.cleanflowback.repository.ContainerEdgeRepository;
import com.example.cleanflowback.repository.ContainerRepository;
import com.example.cleanflowback.repository.DriverRepository;
import com.example.cleanflowback.repository.GeneratedRouteRepository;
import com.example.cleanflowback.service.RouterService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import smile.clustering.KMeans;

import java.util.*;
import java.util.List;

@Service
@AllArgsConstructor
public class RouterServiceImpl implements RouterService {
    private final ContainerRepository containerRepository;
    private final DriverRepository driverRepository;
    private final ContainerEdgeRepository containerEdgeRepository;
    private final GeneratedRouteRepository generatedRouteRepository;

    @Override
    @Transactional
    public List<RouterResponseDTO> kMeansGroupByDistance() {
        List<ContainerEntity> allContainers = containerRepository.findAll();
        List<DriverEntity> allDrivers = driverRepository.findAll();

        if (allContainers.isEmpty() || allDrivers.isEmpty()) {
            throw new KMeansConflictException("No drivers or containers were found");
        }

        double[][] data = allContainers.stream()
            .map(c -> new double[]{c.getLatitude(), c.getLongitude()})
            .toArray(double[][]::new);
        int k = allDrivers.size();

        KMeans model = KMeans.fit(data, k);
        int[] labels = model.y;

        List<RouterResponseDTO> generatedRoutesDTO = new ArrayList<>();

        Map<Integer, DriverEntity> clusterDriverMap = new HashMap<>();

        for (int i = 0; i < allDrivers.size(); i++) {
            clusterDriverMap.put(i, allDrivers.get(i));
        }

        Map<Integer, List<ContainerEntity>> clusterMap = new HashMap<>();
        for (int i = 0; i < allContainers.size(); i++) {
            int cluster = labels[i];
            clusterMap
                .computeIfAbsent(cluster, c -> new ArrayList<>())
                .add(allContainers.get(i));
        }

        // save


        for (Map.Entry<Integer, List<ContainerEntity>> entry : clusterMap.entrySet()) {
            Integer cluster = entry.getKey();
            DriverEntity driver = clusterDriverMap.get(cluster);

            double[][] duration = buildDurationMatrix(entry.getValue());

            List<ContainerEntity> nearestOrder = nearestNeighbour(entry.getValue(), duration);
            List<String> polylines = getPolylines(nearestOrder);

            // save
            GeneratedRouteEntity generatedRouteEntity = new GeneratedRouteEntity();
            List<PolylineEntity> polylineEntityList = new ArrayList<>();
            List<GeneratedContainerEntity> generatedContainerEntityList = new ArrayList<>();

            for  (int i = 0; i < polylines.size(); i++) {
                PolylineEntity polylineEntity = new PolylineEntity();
                polylineEntity.setPolyline(polylines.get(i));
                polylineEntity.setSegmentOrder(i);
                polylineEntity.setGeneratedRoute(generatedRouteEntity);
                polylineEntityList.add(polylineEntity);
            }

            for (int i = 0; i < nearestOrder.size(); i++) {
                GeneratedContainerEntity generatedContainerEntity = new GeneratedContainerEntity();
                generatedContainerEntity.setContainer(nearestOrder.get(i));
                generatedContainerEntity.setGeneratedRoute(generatedRouteEntity);
                generatedContainerEntity.setVisitOrder(i);
                generatedContainerEntityList.add(generatedContainerEntity);
            }

            generatedRouteEntity.setDriver(driver);
            generatedRouteEntity.setPolylines(polylineEntityList);
            generatedRouteEntity.setGeneratedContainers(generatedContainerEntityList);
            generatedRouteRepository.save(generatedRouteEntity);
        }

        return generatedRoutesDTO;
    }

    private double[][] buildDurationMatrix(
        List<ContainerEntity> containers
    ) {
        int size = containers.size();
        double[][] matrix = new double[size][size];

        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                matrix[i][j] = Double.MAX_VALUE;
                if (i == j) {
                    matrix[i][j] = 0;
                }
            }
        }

        // fill with real data
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                if (i != j) {
                    ContainerEntity firstContainer = containers.get(i);
                    ContainerEntity secondContainer = containers.get(j);
                    double duration = containerEdgeRepository
                        .findByFirstContainerAndSecondContainer(firstContainer, secondContainer)
                        .getDuration();
                    matrix[i][j] = duration;
                }
            }
        }

        return matrix;
    }

    private List<ContainerEntity> nearestNeighbour(List<ContainerEntity> containerEntities, double[][] durationMatrix) {
        int size = containerEntities.size();
        System.out.println("Nearest Neighbour: " + size);

        boolean[] visited = new boolean[size];
        List<ContainerEntity> orderedRoute = new ArrayList<>();

        int currentIndex = 0;
        visited[currentIndex] = true;

        orderedRoute.add(containerEntities.get(currentIndex));

        for (int step = 1; step < size; step++) {
            int nextIndex = -1;
            double bestDuration = Double.MAX_VALUE;

            for (int candidateIndex = 0; candidateIndex < size; candidateIndex++) {
                if (visited[candidateIndex]) continue;

                double duration = durationMatrix[currentIndex][candidateIndex];

                if (duration < bestDuration) {
                    bestDuration = duration;
                    nextIndex = candidateIndex;
                }
            }

            if (nextIndex == -1) {
                break;
            }

            visited[nextIndex] = true;
            orderedRoute.add(containerEntities.get(nextIndex));
            currentIndex = nextIndex;
        }

        return orderedRoute;
    }

    private List<String> getPolylines (
        List<ContainerEntity> orderedRoute
    ) {
        List<String> polylines = new ArrayList<>();

        for (int i = 0; i < orderedRoute.size() - 1; i++) {
            String polyline = containerEdgeRepository.findByFirstContainerAndSecondContainer(
                orderedRoute.get(i), orderedRoute.get(i + 1)
            ).getPolyline();

            polylines.add(polyline);
        }

        return polylines;
    }
}
