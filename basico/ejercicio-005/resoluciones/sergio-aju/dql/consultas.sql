USE db_taller_motos;

-- 1. Ver reparaciones completadas ordenadas del costo mayor al menor
SELECT cliente, moto_modelo, servicio, costo_mano_obra 
FROM reparaciones 
WHERE estado = 'Completado' 
ORDER BY costo_mano_obra DESC;

-- 2. Ver el promedio del costo de mano de obra agrupado por estado de la reparacion
SELECT estado, COUNT(*) AS total_reparaciones, ROUND(AVG(costo_mano_obra), 2) AS costo_promedio 
FROM reparaciones 
GROUP BY estado 
ORDER BY costo_promedio DESC;

-- 3. Top 3 de reparaciones más costosas del taller
SELECT cliente, moto_modelo, servicio, costo_mano_obra 
FROM reparaciones 
ORDER BY costo_mano_obra DESC 
LIMIT 3;

-- 4. Contar cuántas reparaciones hay agrupadas por cada estado
SELECT estado, COUNT(*) AS cantidad 
FROM reparaciones 
GROUP BY estado;

-- 5. Buscar reparaciones cuyo costo de mano de obra sea mayor a 100 y no estén pendientes
SELECT cliente, moto_modelo, servicio, costo_mano_obra, estado 
FROM reparaciones 
WHERE costo_mano_obra > 100.00 AND estado != 'Pendiente' 
ORDER BY costo_mano_obra ASC;