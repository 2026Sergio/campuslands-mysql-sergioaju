-- DQL: Consultas de gestión del garaje y validación del Trigger
USE campuslands_mysql;

-- 1. Estado actual del Garaje
SELECT 
    moto_id,
    placa,
    modelo,
    CONCAT(cilindraje, ' cc') AS cilindraje,
    kilometraje,
    costo_mantenimiento,
    estado_mantenimiento
FROM motos
ORDER BY moto_id ASC;

-- 2. Reporte de Auditoría (Verificación de disparos del Trigger)
SELECT 
    a.auditoria_id,
    m.placa,
    m.modelo,
    a.estado_anterior,
    a.estado_nuevo,
    a.fecha_cambio
FROM auditoria_mantenimiento a
JOIN motos m ON a.moto_id = m.moto_id
ORDER BY a.fecha_cambio DESC;

-- 3. Resumen de Motos y Costo Total de Mantenimiento por Estado
SELECT 
    estado_mantenimiento,
    COUNT(*) AS total_motos,
    SUM(costo_mantenimiento) AS costo_total_estado,
    ROUND(AVG(costo_mantenimiento), 2) AS costo_promedio
FROM motos
GROUP BY estado_mantenimiento
ORDER BY costo_total_estado DESC;

-- 4. Motos de Alto Cilindraje (> 600 cc) con Mantenimientos Pendientes
SELECT 
    placa,
    modelo,
    cilindraje,
    costo_mantenimiento,
    estado_mantenimiento
FROM motos
WHERE cilindraje > 600 AND estado_mantenimiento != 'entregado'
ORDER BY cilindraje DESC;

-- 5. Top 3 Motos con los Mantenimientos más Costosos
SELECT 
    placa,
    modelo,
    kilometraje,
    costo_mantenimiento
FROM motos
ORDER BY costo_mantenimiento DESC
LIMIT 3;
