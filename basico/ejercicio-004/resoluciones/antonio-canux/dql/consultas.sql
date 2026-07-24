-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT estado, SUM(precio) AS valor_total, COUNT(id) AS cantidad_motos 
    FROM basico_ejercicio_004 
    WHERE estado = 'disponible' 
    GROUP BY estado;

SELECT marca, ROUND(AVG(precio), 2) AS precio_promedio, COUNT(*) AS total_motos 
    FROM basico_ejercicio_004 
    GROUP BY marca 
    ORDER BY precio_promedio DESC;

SELECT marca, modelo, cilindraje, precio 
    FROM basico_ejercicio_004 
    WHERE estado = 'mantenimiento' AND cilindraje > 600;

SELECT estado, SUM(precio) AS ingresos_totales 
    FROM basico_ejercicio_004 
    WHERE estado = 'vendido' GROUP BY estado;

SELECT marca, modelo, precio 
    FROM basico_ejercicio_004 
    WHERE estado = 'disponible' 
    ORDER BY precio ASC LIMIT 1;
