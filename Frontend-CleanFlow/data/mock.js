export const CITIZEN = {
  name: "María Vásquez",
  zone: "Zona Norte",
  address: "Av. Los Olivos 245",
};

export const DRIVER = {
  id: 1,
  username: "driver1",
  firstName: "Carlos",
  lastName: "Lima",
  email: "carlos.lima@example.com",
  role: "DRIVER",
};

export const BINS = [
  {
    id: "1",
    name: "Av. Los Olivos 245",
    percent: 92,
    status: "Lleno",
    type: "Orgánica",
    latitude: -11.9905,
    longitude: -77.065,
    collected: false,
  },
  {
    id: "2",
    name: "Jr. Lampa 480",
    percent: 64,
    status: "Disponible",
    type: "Reciclable",
    latitude: -12.046,
    longitude: -77.030,
    collected: false,
  },
  {
    id: "3",
    name: "Av. Benavides 1820",
    percent: 28,
    status: "Disponible",
    type: "General",
    latitude: -12.135,
    longitude: -77.020,
    collected: false,
  },
  {
    id: "4",
    name: "Av. La Molina 540",
    percent: 88,
    status: "Lleno",
    type: "General",
    latitude: -12.085,
    longitude: -76.945,
    collected: false,
  },
  {
    id: "5",
    name: "Av. Los Olivos 410",
    percent: 18,
    status: "Disponible",
    type: "Reciclable",
    latitude: -11.991,
    longitude: -77.070,
    collected: false,
  },
  {
    id: "6",
    name: "Jr. Union 150",
    percent: 45,
    status: "Disponible",
    type: "Orgánica",
    latitude: -12.050,
    longitude: -77.038,
    collected: false,
  },
  {
    id: "7",
    name: "Av. Arequipa 320",
    percent: 75,
    status: "Disponible",
    type: "General",
    latitude: -12.070,
    longitude: -77.015,
    collected: false,
  },
  {
    id: "8",
    name: "Calle Las Flores 200",
    percent: 10,
    status: "Disponible",
    type: "Reciclable",
    latitude: -12.030,
    longitude: -77.055,
    collected: false,
  },
];

export const INITIAL_DRIVER_LOCATION = {
  latitude: -12.0464,
  longitude: -77.0428,
};

export const getColor = (percent) => {
  if (percent >= 85) return "#e53935";
  if (percent >= 60) return "#f9a825";
  return "#2e7d32";
};

export const validateLogin = (username, password) => {
  return username === "driver1" && password === "password";
};
