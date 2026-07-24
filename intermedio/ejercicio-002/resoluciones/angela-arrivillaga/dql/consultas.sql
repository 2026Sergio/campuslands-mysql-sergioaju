-- consultas con left join para reportes de battle royale
USE campuslands_mysql;

-- 1. listar todos los jugadores y sus partidas (incluyendo los que no han jugado)
SELECT 
    j.nickname,
    j.rango,
    p.bajas,
    p.posicion_final,
    p.puntos_ganados
FROM jugadores j
LEFT JOIN partidas p ON j.id = p.jugador_id;

-- 2. detectar jugadores inactivos (jugadores sin ninguna partida registrada)
SELECT 
    j.nickname,
    j.rango,
    j.nivel,
    j.creado_en
FROM jugadores j
LEFT JOIN partidas p ON j.id = p.jugador_id
WHERE p.id IS NULL;

-- 3. total de partidas jugadas y puntos acumulados por cada jugador
SELECT 
    j.nickname,
    j.rango,
    COUNT(p.id) AS partidas_jugadas,
    IFNULL(SUM(p.puntos_ganados), 0) AS total_puntos
FROM jugadores j
LEFT JOIN partidas p ON j.id = p.jugador_id
GROUP BY j.id, j.nickname, j.rango;

-- 4. promedio de bajas por jugador en sus partidas
SELECT 
    j.nickname,
    IFNULL(AVG(p.bajas), 0) AS promedio_bajas
FROM jugadores j
LEFT JOIN partidas p ON j.id = p.jugador_id
GROUP BY j.id, j.nickname;

-- 5. ranking general de jugadores ordenados por total de puntos ganados
SELECT 
    j.nickname,
    j.rango,
    IFNULL(SUM(p.puntos_ganados), 0) AS puntos_totales
FROM jugadores j
LEFT JOIN partidas p ON j.id = p.jugador_id
GROUP BY j.id, j.nickname, j.rango
ORDER BY puntos_totales DESC;