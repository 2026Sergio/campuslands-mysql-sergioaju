USE db_shooter_skins;

SELECT rareza, COUNT(*) AS total_skins 
FROM skins 
GROUP BY rareza 
ORDER BY total_skins DESC;

SELECT arma, COUNT(*) AS cantidad, ROUND(AVG(precio), 2) AS precio_promedio, MAX(precio) AS precio_maximo 
FROM skins 
GROUP BY arma 
ORDER BY precio_promedio DESC;

SELECT estado, COUNT(*) AS total_skins, ROUND(SUM(precio), 2) AS valor_total_inventario 
FROM skins 
GROUP BY estado 
ORDER BY valor_total_inventario DESC;

SELECT rareza, ROUND(AVG(precio), 2) AS promedio_precio 
FROM skins 
GROUP BY rareza 
HAVING AVG(precio) > 50.00 
ORDER BY promedio_precio DESC;

SELECT rareza, estado, COUNT(*) AS cantidad, ROUND(SUM(precio), 2) AS costo_acumulado 
FROM skins 
GROUP BY rareza, estado 
ORDER BY rareza ASC, costo_acumulado DESC;