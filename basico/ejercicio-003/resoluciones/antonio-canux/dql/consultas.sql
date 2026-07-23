-- Consultas base e indicadores. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT rareza, COUNT(id) AS cantidad_skins, SUM(precio) AS valor_total_acumulado
    FROM basico_ejercicio_003
    GROUP BY rareza
    ORDER BY valor_total_acumulado DESC;

SELECT rareza, COUNT(*) AS total_skins, ROUND(AVG(precio), 2) AS precio_promedio
    FROM basico_ejercicio_003
    GROUP BY rareza
    ORDER BY precio_promedio DESC;

SELECT nombre_skin, precio 
    FROM basico_ejercicio_003 
    WHERE rareza = 'Legendaria' AND estado_uso = 'equipado';

SELECT SUM(precio) AS valor_total_inventario 
    FROM basico_ejercicio_003 
    WHERE estado_uso IN ('equipado', 'inventario');

SELECT nombre_skin, rareza, precio 
    FROM basico_ejercicio_003 
    WHERE estado_uso = 'inventario'
    ORDER BY precio DESC;

SELECT rareza, COUNT(id) AS cantidad_skins, SUM(precio) AS valor_total_acumulado
    FROM basico_ejercicio_003
    GROUP BY rareza
    ORDER BY valor_total_acumulado DESC;
