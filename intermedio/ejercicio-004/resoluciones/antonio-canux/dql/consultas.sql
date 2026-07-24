-- Consultas base e indicadores usando HAVING.
USE campuslands_mysql;

SELECT m.nombre AS marca, COUNT(v.id) AS total_motos 
    FROM intermedio_ejercicio_004_marcas 
    m JOIN intermedio_ejercicio_004_motos 
    v ON m.id = v.marca_id 
    GROUP BY m.id, m.nombre 
    HAVING total_motos > 1;

SELECT m.nombre AS marca, ROUND(AVG(v.precio), 2) AS precio_promedio 
    FROM intermedio_ejercicio_004_marcas 
    m JOIN intermedio_ejercicio_004_motos 
    v ON m.id = v.marca_id 
    GROUP BY m.id, m.nombre 
    HAVING precio_promedio > 10000;

SELECT estado, SUM(precio) AS valor_total, COUNT(id) AS cantidad 
    FROM intermedio_ejercicio_004_motos 
    GROUP BY estado 
    HAVING valor_total > 20000;

SELECT m.nombre AS marca, MAX(v.cilindraje) AS cilindraje_maximo 
    FROM intermedio_ejercicio_004_marcas 
    m JOIN intermedio_ejercicio_004_motos 
    v ON m.id = v.marca_id 
    GROUP BY m.id, m.nombre 
    HAVING cilindraje_maximo >= 900;

SELECT m.nombre AS marca, SUM(v.precio) AS valor_inventario 
    FROM intermedio_ejercicio_004_marcas 
    m JOIN intermedio_ejercicio_004_motos 
    v ON m.id = v.marca_id 
    GROUP BY m.id, m.nombre 
    HAVING valor_inventario 
    BETWEEN 10000 AND 30000;