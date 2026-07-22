-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    m.marca,
    m.modelo,
    m.propietario,
    (
        SELECT SUM(s.costo)
        FROM servicios s
        WHERE s.moto_id = m.id
    ) AS total_gastado
FROM motos m
WHERE
(
    SELECT SUM(s.costo)
    FROM servicios s
    WHERE s.moto_id = m.id
) >
(
    SELECT AVG(total_servicio)
    FROM
    (
        SELECT SUM(costo) AS total_servicio
        FROM servicios
        GROUP BY moto_id
    ) AS resumen
);


SELECT
    m.marca,
    m.modelo,
    s.descripcion,
    s.costo
FROM servicios s
INNER JOIN motos m
    ON s.moto_id = m.id
WHERE s.costo =
(
    SELECT MAX(costo)
    FROM servicios
);

SELECT
    m.marca,
    m.modelo,
    COUNT(s.id) AS cantidad_servicios
FROM motos m
INNER JOIN servicios s
    ON m.id = s.moto_id
GROUP BY
    m.id,
    m.marca,
    m.modelo
HAVING COUNT(s.id) >
(
    SELECT AVG(total_servicios)
    FROM
    (
        SELECT COUNT(id) AS total_servicios
        FROM servicios
        GROUP BY moto_id
    ) AS cantidad_por_moto
);


SELECT
    mecanico,
    descripcion,
    costo
FROM servicios
WHERE costo >
(
    SELECT AVG(costo)
    FROM servicios
)
ORDER BY costo DESC;

SELECT
    m.marca,
    m.modelo,
    m.propietario,
    (
        SELECT SUM(costo)
        FROM servicios s
        WHERE s.moto_id = m.id
    ) AS inversion_total
FROM motos m
ORDER BY inversion_total DESC
LIMIT 1;