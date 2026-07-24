USE campuslands_mysql;

-- 1. Busqueda por mecanico (usa idx_mecanico)
SELECT cliente, tipo_servicio, costo
FROM taller_servicios_indexados
WHERE mecanico = 'Edwin Us';

-- 2. EXPLAIN de la consulta anterior, para verificar que usa el indice
EXPLAIN SELECT cliente, tipo_servicio, costo
FROM taller_servicios_indexados
WHERE mecanico = 'Edwin Us';

-- 3. Servicios finalizados ordenados por fecha (usa idx_estado_fecha)
SELECT cliente, tipo_servicio, fecha_servicio
FROM taller_servicios_indexados
WHERE estado = 'finalizada'
ORDER BY fecha_servicio;

-- 4. EXPLAIN de la consulta anterior, para confirmar uso del indice compuesto
EXPLAIN SELECT cliente, tipo_servicio, fecha_servicio
FROM taller_servicios_indexados
WHERE estado = 'finalizada'
ORDER BY fecha_servicio;

-- 5. Listado de todos los indices creados sobre la tabla (caso de verificacion)
SHOW INDEX FROM taller_servicios_indexados;