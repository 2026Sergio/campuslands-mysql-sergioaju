/* Script unificado de consultas SQL para el taller mecánico de motos (Filtrado SELECT, Agregación GROUP BY, Actualización UPDATE, Eliminación DELETE y Ordenamiento LIMIT) */

SELECT 
    orden_id, 
    cliente_nombre, 
    moto_modelo, 
    tipo_servicio, 
    (costo_repuestos + costo_mano_obra) AS total_facturado
FROM ordenes_taller
WHERE estado_orden = 'Completado' 
  AND (costo_repuestos + costo_mano_obra) >= 200.00;

SELECT 
    tipo_servicio,
    COUNT(orden_id) AS total_ordenes,
    ROUND(AVG(costo_repuestos + costo_mano_obra), 2) AS costo_promedio,
    SUM(costo_repuestos + costo_mano_obra) AS facturacion_total
FROM ordenes_taller
WHERE estado_orden != 'Cancelado'
GROUP BY tipo_servicio
HAVING total_ordenes >= 3;

UPDATE ordenes_taller
SET estado_orden = 'Completado'
WHERE estado_orden = 'En Proceso' 
  AND tipo_servicio = 'Cambio de Aceite';

DELETE FROM ordenes_taller
WHERE estado_orden = 'Cancelado' 
  AND fecha_ingreso < '2026-07-15 00:00:00';

SELECT 
    orden_id,
    cliente_nombre,
    moto_modelo,
    tipo_servicio,
    costo_repuestos,
    costo_mano_obra,
    (costo_repuestos + costo_mano_obra) AS total_orden
FROM ordenes_taller
ORDER BY total_orden DESC
LIMIT 5;