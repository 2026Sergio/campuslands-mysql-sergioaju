-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

DELETE FROM combates_kickboxing
WHERE estado = 'Retirado';

DELETE FROM combates_kickboxing
WHERE estado = 'Suspendido'
AND victorias < 10;

DELETE FROM combates_kickboxing
WHERE estado = 'Suspendido'
AND victorias < 10;

SELECT
    id,
    nombre_luchador,
    categoria,
    victorias,
    derrotas,
    estado
FROM combates_kickboxing;

SELECT
    nombre_luchador,
    fecha_ultimo_combate,
    estado
FROM combates_kickboxing
WHERE estado = 'Activo'
ORDER BY fecha_ultimo_combate ASC;

DELETE FROM combates_kickboxing
WHERE id = 4;