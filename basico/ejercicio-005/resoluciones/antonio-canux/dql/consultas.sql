-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT estado, SUM(costo) AS ingresos_totales, COUNT(id) AS servicios_realizados 
    FROM basico_ejercicio_005 
    WHERE estado = 'completado' 
    GROUP BY estado;

SELECT estado, ROUND(AVG(costo), 2) AS costo_promedio, COUNT(*) AS total_servicios 
    FROM basico_ejercicio_005 
    GROUP BY estado 
    ORDER BY total_servicios DESC;

SELECT cliente, moto_modelo, tipo_servicio, costo 
    FROM basico_ejercicio_005 
    WHERE estado = 'en_proceso' AND costo > 100;

SELECT cliente, moto_modelo, tipo_servicio, costo 
    FROM basico_ejercicio_005 
    WHERE estado = 'pendiente' 
    ORDER BY costo DESC;

SELECT cliente, moto_modelo, tipo_servicio, costo 
    FROM basico_ejercicio_005 
    WHERE estado = 'completado' 
    ORDER BY costo ASC 
    LIMIT 1;
