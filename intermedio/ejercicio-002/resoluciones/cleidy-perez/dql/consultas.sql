-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    j.id_jugador,
    j.nickname,
    j.region,
    COALESCE(SUM(p.puntaje), 0) AS puntaje_total,
    COUNT(p.id_partida) AS total_partidas
FROM jugadores j
LEFT JOIN partidas p ON j.id_jugador = p.id_jugador
WHERE j.estado = 'activo'
GROUP BY j.id_jugador, j.nickname, j.region
ORDER BY puntaje_total DESC;

SELECT 
    j.nickname,
    j.region,
    AVG(p.puntaje) AS promedio_puntaje,
    MAX(p.puntaje) AS maximo_puntaje
FROM jugadores j
LEFT JOIN partidas p ON j.id_jugador = p.id_jugador
WHERE j.region = 'LATAM Norte' AND j.estado = 'activo'
GROUP BY j.id_jugador, j.nickname, j.region
ORDER BY promedio_puntaje DESC
LIMIT 3;

SELECT 
    j.id_jugador,
    j.nickname,
    j.region,
    j.estado
FROM jugadores j
LEFT JOIN partidas p ON j.id_jugador = p.id_jugador
WHERE p.id_partida IS NULL;

SELECT 
    COALESCE(p.modo_juego, 'Sin Registro') AS modo,
    COUNT(DISTINCT j.id_jugador) AS total_jugadores,
    AVG(p.puntaje) AS promedio_puntaje
FROM jugadores j
LEFT JOIN partidas p ON j.id_jugador = p.id_jugador
GROUP BY p.modo_juego
ORDER BY promedio_puntaje DESC;



SELECT 
    j.nickname,
    j.estado,
    COUNT(p.id_partida) AS partidas_historicas,
    COALESCE(MAX(p.fecha_partida), 'Sin actividad') AS ultima_partida
FROM jugadores j
LEFT JOIN partidas p ON j.id_jugador = p.id_jugador
WHERE j.estado != 'activo'
GROUP BY j.id_jugador, j.nickname, j.estado;
