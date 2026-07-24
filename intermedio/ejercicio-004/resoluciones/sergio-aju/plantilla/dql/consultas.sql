USE db_garaje_motos;

FROM motos 
GROUP BY marca 
HAVING COUNT(*) > 1;

SELECT marca, ROUND(AVG(precio_reparacion), 2) AS costo_promedio 
FROM motos 
GROUP BY marca 
HAVING AVG(precio_reparacion) > 300.00;

SELECT marca, ROUND(AVG(cilindrada), 0) AS cilindrada_promedio, ROUND(SUM(precio_reparacion), 2) AS gasto_total 
FROM motos 
GROUP BY marca 
HAVING SUM(precio_reparacion) > 500.00;

SELECT estado, MAX(precio_reparacion) AS reparacion_mas_alta, COUNT(*) AS cantidad_motos 
FROM motos 
GROUP BY estado 
HAVING MAX(precio_reparacion) > 400.00;

SELECT marca, COUNT(*) AS motos_finalizadas, ROUND(SUM(precio_reparacion), 2) AS total_recaudado 
FROM motos 
WHERE estado = 'Finalizada' 
GROUP BY marca 
HAVING COUNT(*) >= 1 AND SUM(precio_reparacion) > 400.00;
