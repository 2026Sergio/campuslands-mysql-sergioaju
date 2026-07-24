-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    COUNT(*) AS total_participantes
FROM participantes_carreras;

SELECT
    categoria,
    COUNT(*) AS cantidad_participantes
FROM participantes_carreras
GROUP BY categoria;

SELECT
    SUM(inscripcion) AS ingresos_totales
FROM participantes_carreras;

SELECT
    categoria,
    COUNT(*) AS participantes,
    SUM(inscripcion) AS ingresos_categoria
FROM participantes_carreras
GROUP BY categoria
ORDER BY ingresos_categoria DESC;

SELECT
    COUNT(*) AS participantes_finalizados
FROM participantes_carreras
WHERE estado = 'Finalizo';

SELECT
    COUNT(*) AS total_registros,
    SUM(inscripcion) AS dinero_recaudado
FROM participantes_carreras
WHERE estado IN ('Finalizo','Registrado');