SELECT
    nombre,
    region,
    puntaje
FROM equipos
WHERE estado = 'Activo';

SELECT
    nombre,
    puntaje
FROM equipos
ORDER BY puntaje DESC
LIMIT 5;


SELECT
    region,
    COUNT(*) AS total_equipos
FROM equipos
GROUP BY region;

SELECT
    estado,
    AVG(puntaje) AS promedio_puntaje
FROM equipos
GROUP BY estado;


SELECT
    nombre,
    victorias,
    derrotas
FROM equipos
WHERE victorias > 10
ORDER BY victorias DESC;