-- intermedio/ejercicio-009 - maria-montepeque
USE campuslands_mysql;

-- 1. Peleadores con el nombre y ciudad de su gimnasio (JOIN a traves de la FK)
SELECT
    p.nombre AS peleador,
    g.nombre AS gimnasio,
    g.ciudad
FROM peleadores_kickboxing AS p
JOIN gimnasios_kickboxing AS g ON g.id = p.gimnasio_id
ORDER BY g.nombre, p.nombre;

-- 2. Cantidad de peleadores por gimnasio
SELECT
    g.nombre AS gimnasio,
    COUNT(p.id) AS total_peleadores
FROM gimnasios_kickboxing AS g
JOIN peleadores_kickboxing AS p ON p.gimnasio_id = g.id
GROUP BY g.nombre
ORDER BY total_peleadores DESC;

-- 3. Gimnasios sin ningun peleador registrado (LEFT JOIN evidencia la relacion opcional)
SELECT
    g.nombre AS gimnasio,
    g.ciudad
FROM gimnasios_kickboxing AS g
LEFT JOIN peleadores_kickboxing AS p ON p.gimnasio_id = g.id
WHERE p.id IS NULL;

-- 4. Peleador con mas victorias de cada gimnasio
SELECT
    g.nombre AS gimnasio,
    p.nombre AS peleador,
    p.peleas_ganadas
FROM peleadores_kickboxing AS p
JOIN gimnasios_kickboxing AS g ON g.id = p.gimnasio_id
WHERE p.peleas_ganadas = (
    SELECT MAX(p2.peleas_ganadas)
    FROM peleadores_kickboxing AS p2
    WHERE p2.gimnasio_id = p.gimnasio_id
)
ORDER BY p.peleas_ganadas DESC;

-- 5. Gimnasios ordenados por el total de victorias de sus peleadores
SELECT
    g.nombre AS gimnasio,
    SUM(p.peleas_ganadas) AS victorias_totales
FROM gimnasios_kickboxing AS g
JOIN peleadores_kickboxing AS p ON p.gimnasio_id = g.id
GROUP BY g.nombre
ORDER BY victorias_totales DESC;

-- 6. Peleadores retirados, con su gimnasio
SELECT
    p.nombre AS peleador,
    g.nombre AS gimnasio,
    p.peleas_ganadas,
    p.peleas_perdidas
FROM peleadores_kickboxing AS p
JOIN gimnasios_kickboxing AS g ON g.id = p.gimnasio_id
WHERE p.estado = 'retirado';
