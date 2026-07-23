USE db_garaje_motos;

SELECT marca, modelo, cilindrada, precio_alquiler_dia 
FROM motos 
WHERE disponible = TRUE 
ORDER BY precio_alquiler_dia DESC;

SELECT marca, COUNT(*) AS total_motos, ROUND(AVG(precio_alquiler_dia), 2) AS promedio_alquiler 
FROM motos 
GROUP BY marca 
ORDER BY promedio_alquiler DESC;

SELECT marca, modelo, cilindrada 
FROM motos 
ORDER BY cilindrada DESC 
LIMIT 3;

SELECT disponible, COUNT(*) AS cantidad 
FROM motos 
GROUP BY disponible;

SELECT marca, modelo, cilindrada, precio_alquiler_dia 
FROM motos 
WHERE cilindrada > 150 AND disponible = TRUE 
ORDER BY cilindrada ASC;