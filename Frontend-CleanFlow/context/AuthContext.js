import { createContext, useState, useEffect, useCallback } from "react";
import AsyncStorage from "@react-native-async-storage/async-storage";
import api from "../services/api";

export const AuthContext = createContext({
  user: null,
  token: null,
  isLoading: true,
  login: async () => {},
  registerResident: async () => {},
  registerDriver: async () => {},
  logout: async () => {},
});

const JWT_KEY = "jwt_token";
const USER_KEY = "user_data";

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [token, setToken] = useState(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    (async () => {
      try {
        const savedToken = await AsyncStorage.getItem(JWT_KEY);
        const savedUser = await AsyncStorage.getItem(USER_KEY);
        if (savedToken && savedUser) {
          global.jwtToken = savedToken;
          setToken(savedToken);
          setUser(JSON.parse(savedUser));
        }
      } catch (e) {
        console.log("Error leyendo AsyncStorage:", e?.message);
      } finally {
        setIsLoading(false);
      }
    })();
  }, []);

  const login = useCallback(async (username, password) => {
    global.jwtToken = null;
    const res = await api.post("/auth/login", { username, password });
    const { token: jwt } = res.data;

    let payload;
    try {
      payload = JSON.parse(atob(jwt.split(".")[1]));
    } catch {
      throw new Error("Error al decodificar el token recibido del servidor");
    }
    const userData = {
      id: payload.id,
      username: payload.username,
      firstName: payload.first_name,
      lastName: payload.last_name,
      role: payload.role,
    };

    global.jwtToken = jwt;
    await AsyncStorage.setItem(JWT_KEY, jwt);
    await AsyncStorage.setItem(USER_KEY, JSON.stringify(userData));

    setToken(jwt);
    setUser(userData);
    return userData;
  }, []);

  const registerResident = useCallback(async (data) => {
    await api.post("/auth/resident", data);
  }, []);

  const registerDriver = useCallback(async (data) => {
    await api.post("/auth/driver", data);
  }, []);

  const logout = useCallback(async () => {
    global.jwtToken = null;
    await AsyncStorage.removeItem(JWT_KEY);
    await AsyncStorage.removeItem(USER_KEY);
    setToken(null);
    setUser(null);
  }, []);

  return (
    <AuthContext.Provider
      value={{ user, token, isLoading, login, registerResident, registerDriver, logout }}
    >
      {children}
    </AuthContext.Provider>
  );
}
