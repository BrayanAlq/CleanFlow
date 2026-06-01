export const getColor = (percent) => {
  if (percent >= 85) return "#e53935";
  if (percent >= 60) return "#f9a825";
  return "#2e7d32";
};
