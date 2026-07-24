-- DQL: 5 Consultas analíticas aplicando GROUP BY y filtros aglomerados con HAVING
USE campuslands_mysql;

-- 1. Marcas cuyo costo total facturado (mano de obra + repuestos) supere los $200 USD
SELECT 
    marca_moto,
    COUNT(*) AS total_servicios,
    SUM(costo_mano_obra + costo_repuestos) AS facturacion_total
FROM servicios_motos_intermedio
WHERE estado_servicio = 'completado'
GROUP BY marca_moto
HAVING facturacion_total > 200.00
ORDER BY facturacion_total DESC;

-- 2. Mecánicos que hayan completado más de 1 servicio
SELECT 
    mecanico_asignado,
    COUNT(*) AS servicios_atendidos,
    ROUND(AVG(costo_mano_obra), 2) AS promedio_mano_obra
FROM servicios_motos_intermedio
WHERE estado_servicio = 'completado'
GROUP BY mecanico_asignado
HAVING servicios_atendidos > 1
ORDER BY servicios_atendidos DESC;

-- 3. Tipos de servicio con un costo promedio de repuestos superior a $50 USD
SELECT 
    tipo_servicio,
    COUNT(*) AS cantidad,
    ROUND(AVG(costo_repuestos), 2) AS repuestos_promedio,
    MAX(costo_repuestos) AS repuesto_mas_costoso
FROM servicios_motos_intermedio
GROUP BY tipo_servicio
HAVING repuestos_promedio > 50.00
ORDER BY repuestos_promedio DESC;

-- 4. Marcas de motos que registren un costo promedio de mano de obra superior a $100 USD
SELECT 
    marca_moto,
    COUNT(*) AS registros,
    ROUND(AVG(costo_mano_obra), 2) AS mano_obra_promedio
FROM servicios_motos_intermedio
GROUP BY marca_moto
HAVING mano_obra_promedio > 100.00;

-- 5. Mecánicos cuyos servicios generen un gasto promedio total (Mano de Obra + Repuestos) mayor a $150 USD
SELECT 
    mecanico_asignado,
    COUNT(*) AS total_trabajos,
    ROUND(AVG(costo_mano_obra + costo_repuestos), 2) AS costo_promedio_trabajo
FROM servicios_motos_intermedio
GROUP BY mecanico_asignado
HAVING costo_promedio_trabajo > 150.00
ORDER BY costo_promedio_trabajo DESC;
