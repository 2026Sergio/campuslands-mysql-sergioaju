USE db_garaje_motos_triggers;

SELECT * FROM bitacora_motos ORDER BY fecha DESC;

SELECT marca, COUNT(*) AS total 
FROM motos GROUP BY marca HAVING COUNT(*) > 1;

SELECT marca, ROUND(AVG(precio_reparacion), 2) AS promedio 
FROM motos GROUP BY marca HAVING AVG(precio_reparacion) > 300;

SELECT marca, ROUND(SUM(precio_reparacion), 2) AS gasto 
FROM motos GROUP BY marca HAVING SUM(precio_reparacion) > 500;

SELECT marca, modelo, precio_reparacion 
FROM motos ORDER BY precio_reparacion DESC LIMIT 3;