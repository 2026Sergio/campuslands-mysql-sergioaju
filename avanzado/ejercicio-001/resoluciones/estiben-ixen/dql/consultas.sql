SELECT
    nombre,
    nickname,
    puntaje
FROM participantes
ORDER BY puntaje DESC;

SELECT
    escuadras.nombre AS nombre_escuadra,
    COUNT(participantes.id_participante) AS cantidad_participantes
FROM escuadras
INNER JOIN participantes
ON escuadras.id_escuadra = participantes.id_escuadra
GROUP BY escuadras.nombre;

SELECT
    escuadras.nombre AS nombre_escuadra,
    AVG(participantes.puntaje) AS promedio_puntaje
FROM escuadras
INNER JOIN participantes
ON escuadras.id_escuadra = participantes.id_escuadra
GROUP BY escuadras.nombre
ORDER BY promedio_puntaje DESC;

SELECT
    nombre,
    nickname,
    puntaje
FROM participantes
WHERE puntaje > 90
ORDER BY puntaje DESC;

SELECT
    rol,
    COUNT(*) AS cantidad_participantes
FROM participantes
GROUP BY rol;

SELECT
    nombre,
    region
FROM escuadras
WHERE estado = 'Activo';