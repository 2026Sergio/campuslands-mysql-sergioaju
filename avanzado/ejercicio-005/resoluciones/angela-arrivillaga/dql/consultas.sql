-- campuslands mysql - avanzado ejercicio 005
-- dql/consultas.sql

USE campuslands_mysql;

-- 1. Consultar historial de servicios de una moto por su placa (aprovecha idx_placa)
SELECT 
    id,
    placa_moto,
    mecanico,
    tipo_servicio,
    costo,
    estado,
    fecha_servicio
FROM servicios_taller
WHERE placa_moto = 'ABC-123'
ORDER BY fecha_servicio DESC;

-- 2. Consultar servicios pendientes o en proceso (aprovecha idx_estado)
SELECT 
    placa_moto,
    mecanico,
    tipo_servicio,
    costo,
    fecha_servicio
FROM servicios_taller
WHERE estado = 'en_proceso'
ORDER BY fecha_servicio ASC;

-- 3. Total de ingresos acumulados y cantidad de servicios por mecanico (aprovecha idx_mecanico)
SELECT 
    mecanico,
    COUNT(*) AS total_servicios,
    SUM(costo) AS ingresos_totales,
    AVG(costo) AS promedio_por_servicio
FROM servicios_taller
WHERE estado = 'completado'
GROUP BY mecanico
ORDER BY ingresos_totales DESC;

-- 4. Conteo de servicios por estado en el taller
SELECT 
    estado,
    COUNT(*) AS cantidad
FROM servicios_taller
GROUP BY estado;

-- 5. Resumen general de costos de mantenimiento del taller
SELECT 
    COUNT(*) AS total_registros,
    SUM(costo) AS total_facturado,
    MIN(costo) AS servicio_mas_economico,
    MAX(costo) AS servicio_mas_costoso
FROM servicios_taller;