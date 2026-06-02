package com.example.cleanflowback.service;

import java.util.List;

public interface PushNotificationService {
    void sendToDevice(String expoToken, String title, String body);
    void sendBatch(List<String> expoTokens, String title, String body);
}
