SELECT pais_origin, COUNT(*) AS total_motos, AVG(velocidad_maxima) AS velocidad_promedio
FROM motos
GROUP BY pais_origin
HAVING COUNT(*) > 1 AND AVG(velocidad_maxima) > 160;