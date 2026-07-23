-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT categoria, ROUND(AVG(puntaje), 2) AS promedio_puntaje 
	FROM basico_ejercicio_002 
	GROUP BY categoria;
    
SELECT estado, COUNT(*) AS total_elementos 
    FROM basico_ejercicio_002 
    GROUP BY estado 
    ORDER BY total_elementos DESC;

SELECT nombre, puntaje 
    FROM basico_ejercicio_002 
    WHERE categoria = 'principal' AND puntaje > 50.00 
    ORDER BY puntaje DESC;

SELECT categoria, SUM(puntaje) AS puntaje_total_activo 
    FROM basico_ejercicio_002 
    WHERE estado = 'activo' 
    GROUP BY categoria;

SELECT nombre, categoria, puntaje 
    FROM basico_ejercicio_002 
    WHERE estado = 'revision' 
    ORDER BY puntaje DESC 
    LIMIT 1;
