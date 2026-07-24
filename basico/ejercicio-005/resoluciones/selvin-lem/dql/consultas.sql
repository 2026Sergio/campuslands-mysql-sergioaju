USE campuslands_mysql;

-- 1. Listado general
SELECT * FROM taller_ordenes_servicio;

-- 2. Ordenes con garantia activa
SELECT id_orden, cliente, tipo_servicio, costo_total
FROM taller_ordenes_servicio
WHERE garantia = TRUE;

-- 3. Total facturado y horas trabajadas por mecanico
SELECT mecanico, COUNT(*) AS total_ordenes, SUM(horas_trabajo) AS horas_totales, SUM(costo_total) AS total_facturado
FROM taller_ordenes_servicio
GROUP BY mecanico
ORDER BY total_facturado DESC;

-- 4. Top 5 ordenes con mayor costo
SELECT cliente, tipo_servicio, costo_total
FROM taller_ordenes_servicio
ORDER BY costo_total DESC
LIMIT 5;

-- 5. Ordenes pendientes sin costo asignado (caso limite)
SELECT id_orden, cliente, tipo_servicio, estado
FROM taller_ordenes_servicio
WHERE estado = 'pendiente' AND costo_total = 0.00;