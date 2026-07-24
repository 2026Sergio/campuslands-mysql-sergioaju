
SELECT *
FROM equipos;

SELECT
    j.nickname,
    j.rol,
    e.nombre AS equipo
FROM jugadores j
INNER JOIN equipos e
ON j.id_equipo = e.id_equipo;

SELECT COUNT(*) AS total_jugadores
FROM jugadores;

SELECT
    e.nombre,
    COUNT(p.id_partida) AS victorias
FROM equipos e
LEFT JOIN partidas p
ON e.id_equipo = p.ganador
GROUP BY e.id_equipo, e.nombre
ORDER BY victorias DESC;