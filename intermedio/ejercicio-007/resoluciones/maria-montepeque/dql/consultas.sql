-- intermedio/ejercicio-007 - maria-montepeque
USE campuslands_mysql;

-- 1. Goles con el nombre del jugador y los datos del partido (JOIN de las 3 tablas)
SELECT
    j.nombre AS jugador,
    p.equipo_local,
    p.equipo_visitante,
    p.fecha_partido,
    g.minuto,
    g.tipo_gol
FROM goles_partido_liga AS g
JOIN jugadores_liga_futbol AS j ON j.id = g.jugador_id
JOIN partidos_liga_futbol AS p ON p.id = g.partido_id
ORDER BY p.fecha_partido, g.minuto;

-- 2. Ranking de goleadores
SELECT
    j.nombre AS jugador,
    j.equipo,
    COUNT(*) AS total_goles
FROM goles_partido_liga AS g
JOIN jugadores_liga_futbol AS j ON j.id = g.jugador_id
GROUP BY j.nombre, j.equipo
ORDER BY total_goles DESC;

-- 3. Partidos con mas de 2 goles registrados
SELECT
    p.equipo_local,
    p.equipo_visitante,
    p.fecha_partido,
    COUNT(*) AS total_goles
FROM goles_partido_liga AS g
JOIN partidos_liga_futbol AS p ON p.id = g.partido_id
GROUP BY p.equipo_local, p.equipo_visitante, p.fecha_partido
HAVING COUNT(*) > 2
ORDER BY total_goles DESC;

-- 4. Goles marcados despues del minuto 80
SELECT
    j.nombre AS jugador,
    p.fecha_partido,
    g.minuto,
    g.tipo_gol
FROM goles_partido_liga AS g
JOIN jugadores_liga_futbol AS j ON j.id = g.jugador_id
JOIN partidos_liga_futbol AS p ON p.id = g.partido_id
WHERE g.minuto > 80
ORDER BY g.minuto DESC;

-- 5. Jugadores que anotaron en mas de un partido distinto
SELECT
    j.nombre AS jugador,
    COUNT(DISTINCT g.partido_id) AS partidos_distintos_con_gol
FROM goles_partido_liga AS g
JOIN jugadores_liga_futbol AS j ON j.id = g.jugador_id
GROUP BY j.nombre
HAVING COUNT(DISTINCT g.partido_id) > 1
ORDER BY partidos_distintos_con_gol DESC;

-- 6. Cantidad de goles por tipo
SELECT
    tipo_gol,
    COUNT(*) AS total_goles
FROM goles_partido_liga
GROUP BY tipo_gol
ORDER BY total_goles DESC;
