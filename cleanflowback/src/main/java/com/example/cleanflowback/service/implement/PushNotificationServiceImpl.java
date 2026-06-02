package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.service.PushNotificationService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class PushNotificationServiceImpl implements PushNotificationService {
    private final RestTemplate restTemplate;

    @Override
    public void sendToDevice(String expoToken, String title, String body) {
        Map<String, Object> payload = Map.of(
            "to", expoToken,
            "title", title,
            "body", body,
            "sound", "default",
            "priority", "high"
        );

        sendRequest(payload);
    }

    @Override
    public void sendBatch(List<String> expoTokens, String title, String body) {
        List<Map<String, Object>> payload = expoTokens.stream()
            .map(token -> Map.<String, Object>of(
                "to", token,
                "title", title,
                "body", body,
                "sound", "default",
                "priority", "high"
            )).toList();

        sendRequest(payload);
    }

    private void sendRequest(Object payload) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Object> request = new HttpEntity<>(payload, headers);

        try {
            restTemplate.postForEntity("https://exp.host/--/api/v2/push/send", request, String.class);
        } catch (Exception e) {
            System.out.println("Error sending push notification: " + e.getMessage());
        }
    }
}
