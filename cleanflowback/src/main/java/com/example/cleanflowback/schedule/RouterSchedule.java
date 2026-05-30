package com.example.cleanflowback.schedule;

import com.example.cleanflowback.service.RouterService;
import org.springframework.stereotype.Component;

@Component
public class RouterSchedule {
    private final RouterService routerService;

    public RouterSchedule(RouterService routerService) {
        this.routerService = routerService;
    }

    // TODO
}
