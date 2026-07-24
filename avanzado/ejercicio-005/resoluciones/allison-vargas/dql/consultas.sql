-- DQL: 5 Consultas diseñadas para aprovechar los índices creados
USE campuslands_mysql;

-- 1. Búsqueda por placa (Aprovecha `idx_placa`)
SELECT 
    orden_id,
    placa_moto,
    cliente,
    fecha_ingreso,
    costo_total,
    estado_orden
FROM ordenes_taller_avanzado
WHERE placa_moto = 'M-101AAA';

-- 2. Filtrado rápido por Estado de Orden (Aprovecha `idx_estado`)
SELECT 
    orden_id,
    placa_moto,
    mecanico,
    costo_total
FROM ordenes_taller_avanzado
WHERE estado_orden = 'reparando';

-- 3. Búsqueda combinada por Mecánico y Rango de Fechas (Aprovecha `idx_mecanico_fecha`)
SELECT 
    orden_id,
    mecanico,
    placa_moto,
    fecha_ingreso,
    costo_total
FROM ordenes_taller_avanzado
WHERE mecanico = 'Carlos Ruiz' AND fecha_ingreso >= '2026-03-01'
ORDER BY fecha_ingreso DESC;

-- 4. Reporte agrupado de facturación y promedio por Estado de la Orden
SELECT 
    estado_orden,
    COUNT(*) AS total_ordenes,
    SUM(costo_total) AS facturacion_acumulada,
    ROUND(AVG(costo_total), 2) AS costo_promedio
FROM ordenes_taller_avanzado
GROUP BY estado_orden
ORDER BY facturacion_acumulada DESC;

-- 5. Top 3 órdenes con mayor costo que están pendientes o en taller
SELECT 
    orden_id,
    placa_moto,
    cliente,
    mecanico,
    costo_total,
    estado_orden
FROM ordenes_taller_avanzado
WHERE estado_orden NOT IN ('entregada')
ORDER BY costo_total DESC
LIMIT 3;
