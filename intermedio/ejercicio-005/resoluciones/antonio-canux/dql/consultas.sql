-- Consultas base e indicadores usando subconsultas.
USE campuslands_mysql;

SELECT nombre_completo, telefono 
    FROM intermedio_ejercicio_005_clientes 
    WHERE id IN (SELECT cliente_id 
        FROM intermedio_ejercicio_005_reparaciones 
        WHERE costo > (SELECT AVG(costo) 
            FROM intermedio_ejercicio_005_reparaciones));

SELECT r.moto_modelo, r.descripcion, r.costo, c.nombre_completo 
    FROM intermedio_ejercicio_005_reparaciones 
    r JOIN intermedio_ejercicio_005_clientes 
    c ON r.cliente_id = c.id 
    WHERE r.costo = (SELECT MAX(costo) 
        FROM intermedio_ejercicio_005_reparaciones);

SELECT nombre_completo 
    FROM intermedio_ejercicio_005_clientes 
    WHERE id NOT IN (SELECT cliente_id 
        FROM intermedio_ejercicio_005_reparaciones 
        WHERE estado = 'pendiente');

SELECT moto_modelo, descripcion, costo, ROUND(costo - (SELECT AVG(costo) 
    FROM intermedio_ejercicio_005_reparaciones), 2) AS diferencia_vs_promedio 
    FROM intermedio_ejercicio_005_reparaciones;

SELECT c.nombre_completo, totales.gasto_total 
    FROM intermedio_ejercicio_005_clientes 
    c JOIN (SELECT cliente_id, SUM(costo) AS gasto_total 
    FROM intermedio_ejercicio_005_reparaciones 
    GROUP BY cliente_id) AS totales ON c.id = totales.cliente_id 
    WHERE totales.gasto_total > 200;