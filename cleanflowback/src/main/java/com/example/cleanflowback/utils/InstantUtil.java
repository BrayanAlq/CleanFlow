package com.example.cleanflowback.utils;

import com.example.cleanflowback.dto.FromToInstant;

import java.time.LocalDate;
import java.time.ZoneId;

public class InstantUtil {
    public static FromToInstant getFromToInstant(String zone) {
        ZoneId zoneId = ZoneId.of(zone);
        LocalDate now =  LocalDate.now(zoneId);
        return new FromToInstant(
            now.atStartOfDay(zoneId).toInstant(),
            now.atStartOfDay(zoneId).plusDays(1).toInstant()
        );
    }
}
