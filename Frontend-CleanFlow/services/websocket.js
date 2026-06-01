import { Client } from "@stomp/stompjs";
import { WS_URL } from "../config";

let client = null;

export function connect(token, onConnect, onError) {
  if (client?.active) return;

  client = new Client({
    brokerURL: WS_URL,
    connectHeaders: { Authorization: `Bearer ${token}` },
    heartbeatIncoming: 10000,
    heartbeatOutgoing: 10000,
    onConnect: () => {
      if (onConnect) onConnect(client);
    },
    onStompError: (frame) => {
      if (onError) onError(frame);
    },
  });

  client.activate();
}

export function disconnect() {
  if (client && client.active) {
    client.deactivate();
    client = null;
  }
}

export function subscribe(destination, callback) {
  if (!client || !client.active) return null;
  try {
    return client.subscribe(destination, (message) => {
      try {
        const body = JSON.parse(message.body);
        callback(body);
      } catch (e) {
        console.log("Error parseando mensaje WS:", e?.message);
      }
    });
  } catch (e) {
    console.log("Error en subscribe WS:", e?.message);
    return null;
  }
}

export function publish(destination, body) {
  if (!client || !client.active) return;
  try {
    client.publish({ destination, body: JSON.stringify(body) });
  } catch (e) {
    console.log("Error en publish WS:", e?.message);
  }
}

export function isConnected() {
  return client && client.active;
}
