-- Consultas base e indicadores usando GROUP BY.
USE campuslands_mysql;

SELECT a.tipo, COUNT(s.id) AS total_skins 
    FROM intermedio_ejercicio_003_armas 
    a JOIN intermedio_ejercicio_003_skins 
    s ON a.id = s.arma_id 
    GROUP BY a.tipo 
    ORDER BY total_skins DESC;

SELECT rareza, COUNT(id) AS cantidad, ROUND(AVG(precio), 2) AS precio_promedio, MAX(precio) AS precio_maximo, MIN(precio) AS precio_minimo 
    FROM intermedio_ejercicio_003_skins 
    GROUP BY rareza 
    ORDER BY precio_promedio DESC;

SELECT a.nombre AS arma, SUM(s.precio) AS valor_total 
    FROM intermedio_ejercicio_003_armas 
    a JOIN intermedio_ejercicio_003_skins 
    s ON a.id = s.arma_id 
    GROUP BY a.id, a.nombre 
    ORDER BY valor_total DESC;

SELECT a.nombre, COUNT(s.id) AS cantidad_skins 
    FROM intermedio_ejercicio_003_armas 
    a JOIN intermedio_ejercicio_003_skins 
    s ON a.id = s.arma_id 
    GROUP BY a.id, a.nombre 
    HAVING cantidad_skins > 1;

SELECT tipo, COUNT(id) AS total_armas 
    FROM intermedio_ejercicio_003_armas 
    GROUP BY tipo 
    ORDER BY total_armas DESC;