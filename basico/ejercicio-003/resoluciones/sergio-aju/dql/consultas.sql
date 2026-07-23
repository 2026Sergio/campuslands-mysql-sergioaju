USE db_inventario_skins;

SELECT nombre_skin, arma, rareza, precio_dolares 
FROM skins 
WHERE disponible = TRUE 
ORDER BY precio_dolares DESC;

SELECT rareza, COUNT(*) AS total_skins, ROUND(AVG(precio_dolares), 2) AS precio_promedio 
FROM skins 
GROUP BY rareza 
ORDER BY precio_promedio DESC;

SELECT nombre_skin, arma, precio_dolares 
FROM skins 
ORDER BY precio_dolares DESC 
LIMIT 3;

SELECT disponible, COUNT(*) AS cantidad 
FROM skins 
GROUP BY disponible;

SELECT nombre_skin, arma, rareza, precio_dolares 
FROM skins 
WHERE rareza = 'Epica' AND precio_dolares < 100.00;