USE campuslands_mysql;

-- 1. Marcas con costo total mayor a 100
SELECT marca, SUM(costo) AS costo_total
FROM garaje_reparaciones
GROUP BY marca
HAVING costo_total > 100
ORDER BY costo_total DESC;

-- 2. Propietarios con mas de 1 reparacion registrada
SELECT propietario, COUNT(*) AS total_reparaciones
FROM garaje_reparaciones
GROUP BY propietario
HAVING total_reparaciones > 1;

-- 3. Marcas con costo promedio mayor a 80
SELECT marca, AVG(costo) AS costo_promedio
FROM garaje_reparaciones
GROUP BY marca
HAVING costo_promedio > 80
ORDER BY costo_promedio DESC;

-- 4. Marcas cuyo costo total supera 100, filtrando primero finalizadas (WHERE + HAVING juntos)
SELECT marca, SUM(costo) AS costo_total
FROM garaje_reparaciones
WHERE estado = 'finalizada'
GROUP BY marca
HAVING costo_total > 100
ORDER BY costo_total DESC;

-- 5. Marcas con costo total bajo, candidatas a revision de precios (caso limite)
SELECT marca, SUM(costo) AS costo_total, COUNT(*) AS total_servicios
FROM garaje_reparaciones
GROUP BY marca
HAVING costo_total <= 100;