USE campuslands_mysql;

-- 1. Mostrar todos los jugadores y sus partidas.

SELECT
    j.nickname,
    p.mapa,
    p.posicion,
    p.puntos
FROM jugadores AS j
LEFT JOIN partidas AS p
ON j.id_jugador = p.id_jugador;

-- 2. Mostrar los jugadores que aún no han participado en ninguna partida.

SELECT
    j.nickname,
    j.pais
FROM jugadores AS j
LEFT JOIN partidas AS p
ON j.id_jugador = p.id_jugador
WHERE p.id_partida IS NULL;

-- 3. Mostrar el total de puntos obtenidos por cada jugador.

SELECT
    j.nickname,
    IFNULL(SUM(p.puntos),0) AS total_puntos
FROM jugadores AS j
LEFT JOIN partidas AS p
ON j.id_jugador = p.id_jugador
GROUP BY j.id_jugador, j.nickname
ORDER BY total_puntos DESC;

-- 4. Mostrar la cantidad de partidas jugadas por cada jugador.

SELECT
    j.nickname,
    COUNT(p.id_partida) AS partidas_jugadas
FROM jugadores AS j
LEFT JOIN partidas AS p
ON j.id_jugador = p.id_jugador
GROUP BY j.id_jugador, j.nickname;

-- 5. Mostrar el Top 5 de jugadores con mayor puntaje acumulado.

SELECT
    j.nickname,
    IFNULL(SUM(p.puntos),0) AS total_puntos
FROM jugadores AS j
LEFT JOIN partidas AS p
ON j.id_jugador = p.id_jugador
GROUP BY j.id_jugador, j.nickname
ORDER BY total_puntos DESC
LIMIT 5;

-- 6. Mostrar los jugadores activos con sus partidas.

SELECT
    j.nickname,
    j.estado,
    p.mapa,
    p.puntos
FROM jugadores AS j
LEFT JOIN partidas AS p
ON j.id_jugador = p.id_jugador
WHERE j.estado = 'Activo';

-- 7. Mostrar el promedio de puntos por jugador.

SELECT
    j.nickname,
    IFNULL(AVG(p.puntos),0) AS promedio_puntos
FROM jugadores AS j
LEFT JOIN partidas AS p
ON j.id_jugador = p.id_jugador
GROUP BY j.id_jugador, j.nickname;

-- 8. Mostrar los jugadores ordenados por nivel.

SELECT
    j.nickname,
    j.nivel,
    p.mapa
FROM jugadores AS j
LEFT JOIN partidas AS p
ON j.id_jugador = p.id_jugador
ORDER BY j.nivel DESC;