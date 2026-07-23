USE campuslands_mysql;

-- 1. Listado general
SELECT * FROM garaje_motos;

-- 2. Motos listas para entrega
SELECT id_moto, propietario, marca, modelo
FROM garaje_motos
WHERE lista_para_entrega = TRUE;

-- 3. Costo total de reparacion por marca
SELECT marca, COUNT(*) AS total_motos, SUM(costo_reparacion) AS costo_total
FROM garaje_motos
GROUP BY marca
ORDER BY costo_total DESC;

-- 4. Top 5 reparaciones mas costosas
SELECT propietario, modelo, costo_reparacion
FROM garaje_motos
ORDER BY costo_reparacion DESC
LIMIT 5;

-- 5. Motos sin costo asignado, esperando repuesto (caso limite)
SELECT id_moto, propietario, modelo, estado
FROM garaje_motos
WHERE costo_reparacion = 0.00 AND estado = 'esperando_repuesto';