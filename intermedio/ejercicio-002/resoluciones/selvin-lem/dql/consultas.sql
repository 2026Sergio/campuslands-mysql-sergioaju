USE campuslands_mysql;

-- 1. Todos los jugadores con su premio (o NULL si no tienen)
SELECT j.nombre_jugador, j.puntos_ranking, p.nombre_premio, p.monto
FROM jugadores_ranking j
LEFT JOIN premios_temporada p ON j.id_jugador = p.id_jugador;

-- 2. Jugadores SIN premio asignado (caso limite explicito)
SELECT j.nombre_jugador, j.puntos_ranking, j.estado
FROM jugadores_ranking j
LEFT JOIN premios_temporada p ON j.id_jugador = p.id_jugador
WHERE p.id_premio IS NULL;

-- 3. Monto total entregado por plataforma
SELECT j.plataforma, COUNT(p.id_premio) AS premios_entregados, SUM(p.monto) AS monto_total
FROM jugadores_ranking j
LEFT JOIN premios_temporada p ON j.id_jugador = p.id_jugador
GROUP BY j.plataforma
ORDER BY monto_total DESC;

-- 4. Ranking completo ordenado por puntos, con premio si existe
SELECT j.nombre_jugador, j.puntos_ranking, p.nombre_premio
FROM jugadores_ranking j
LEFT JOIN premios_temporada p ON j.id_jugador = p.id_jugador
ORDER BY j.puntos_ranking DESC;

-- 5. Jugadores activos sin premio, candidatos a incentivo
SELECT j.nombre_jugador, j.puntos_ranking
FROM jugadores_ranking j
LEFT JOIN premios_temporada p ON j.id_jugador = p.id_jugador
WHERE j.estado = 'activo' AND p.id_premio IS NULL;