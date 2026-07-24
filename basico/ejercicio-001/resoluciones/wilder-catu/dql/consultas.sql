USE campuslands_mysql;

SELECT
    nombre_equipo AS Equipo,
    puntaje AS Puntaje
FROM equipos
ORDER BY puntaje DESC
LIMIT 5;

SELECT
    nombre_equipo AS Equipo,
    region AS Region,
    puntaje AS Puntaje
FROM equipos
WHERE estado = 'Activo'
ORDER BY puntaje DESC;


SELECT
    estado AS Estado,
    COUNT(*) AS Cantidad
FROM equipos
GROUP BY estado;


SELECT
    region AS Region,
    AVG(puntaje) AS Promedio_Puntaje
FROM equipos
GROUP BY region
ORDER BY Promedio_Puntaje DESC;


SELECT
    nombre_equipo AS Equipo,
    puntaje AS Puntaje
FROM equipos
ORDER BY puntaje DESC
LIMIT 1;