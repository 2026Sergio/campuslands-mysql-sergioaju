-- basico/ejercicio-005 - maria-montepeque
USE campuslands_mysql;

-- 1. Ordenes pendientes o en proceso, mas recientes primero
SELECT
    numero_orden,
    cliente,
    tipo_servicio,
    estado,
    fecha_ingreso
FROM ordenes_taller_motos
WHERE estado IN ('pendiente', 'en_proceso')
ORDER BY fecha_ingreso DESC;

-- 2. Ordenes con costo entre 50 y 300
SELECT
    numero_orden,
    cliente,
    costo
FROM ordenes_taller_motos
WHERE costo BETWEEN 50 AND 300
ORDER BY costo DESC;

-- 3. Ordenes asignadas a mecanicos cuyo nombre empieza con "Ju" (busqueda con LIKE)
SELECT
    numero_orden,
    mecanico,
    tipo_servicio,
    costo
FROM ordenes_taller_motos
WHERE mecanico LIKE 'Ju%'
ORDER BY costo DESC;

-- 4. Top 5 ordenes mas costosas
SELECT
    numero_orden,
    cliente,
    tipo_servicio,
    costo
FROM ordenes_taller_motos
ORDER BY costo DESC
LIMIT 5;

-- 5. Cantidad de ordenes y costo promedio por tipo de servicio (solo tipos con mas de 1 orden)
SELECT
    tipo_servicio,
    COUNT(*) AS total_ordenes,
    ROUND(AVG(costo), 2) AS costo_promedio
FROM ordenes_taller_motos
GROUP BY tipo_servicio
HAVING COUNT(*) > 1
ORDER BY costo_promedio DESC;

-- 6. Clientes con mas de una orden registrada
SELECT
    cliente,
    COUNT(*) AS total_ordenes
FROM ordenes_taller_motos
GROUP BY cliente
HAVING COUNT(*) > 1
ORDER BY total_ordenes DESC;
