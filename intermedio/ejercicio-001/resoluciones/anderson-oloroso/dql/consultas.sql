SELECT 
    e.nombre_equipo,
    e.region,
    e.entrenador,
    j.nombre_jugador,
    j.rol
FROM equipos_moba e
INNER JOIN jugadores_moba j
    ON e.equipo_id = j.equipo_id;

SELECT 
    e.nombre_equipo,
    e.region,
    j.nombre_jugador
FROM equipos_moba e
INNER JOIN jugadores_moba j
    ON e.equipo_id = j.equipo_id
WHERE e.region = 'Latinoamerica';

SELECT 
    e.nombre_equipo,
    j.nombre_jugador,
    j.rol
FROM equipos_moba e
INNER JOIN jugadores_moba j
    ON e.equipo_id = j.equipo_id
WHERE j.rol = 'Mid';

SELECT 
    e.nombre_equipo,
    e.entrenador,
    j.nombre_jugador
FROM equipos_moba e
INNER JOIN jugadores_moba j
    ON e.equipo_id = j.equipo_id
WHERE e.region = 'Corea del Sur'
ORDER BY e.nombre_equipo ASC;

SELECT 
    e.nombre_equipo,
    e.region,
    COUNT(j.jugador_id) AS cantidad_jugadores
FROM equipos_moba e
INNER JOIN jugadores_moba j
    ON e.equipo_id = j.equipo_id
GROUP BY e.equipo_id, e.nombre_equipo, e.region
ORDER BY cantidad_jugadores DESC;