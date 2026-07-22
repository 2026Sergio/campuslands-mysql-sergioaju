-- basico/ejercicio-010 - maria-montepeque
USE campuslands_mysql;

-- 1. Cantidad de carreras disputadas por piloto
SELECT
    piloto,
    COUNT(*) AS total_carreras
FROM participaciones_carreras_urbanas
GROUP BY piloto
ORDER BY total_carreras DESC;

-- 2. Total de premios ganados por piloto
SELECT
    piloto,
    SUM(premio_ganado) AS total_premios
FROM participaciones_carreras_urbanas
GROUP BY piloto
ORDER BY total_premios DESC;

-- 3. Cantidad de carreras realizadas por circuito
SELECT
    circuito,
    COUNT(*) AS total_carreras
FROM participaciones_carreras_urbanas
GROUP BY circuito
ORDER BY total_carreras DESC;

-- 4. Total de penalizaciones acumuladas por piloto
SELECT
    piloto,
    SUM(penalizaciones) AS total_penalizaciones
FROM participaciones_carreras_urbanas
GROUP BY piloto
ORDER BY total_penalizaciones DESC;

-- 5. Cantidad de carreras por estado
SELECT
    estado,
    COUNT(*) AS total_carreras
FROM participaciones_carreras_urbanas
GROUP BY estado
ORDER BY total_carreras DESC;

-- 6. Resumen global: total de carreras registradas y total de premios repartidos
SELECT
    COUNT(*) AS total_carreras_registradas,
    SUM(premio_ganado) AS total_premios_repartidos
FROM participaciones_carreras_urbanas;
