EXPLAIN SELECT 
    c.nombre_completo,
    c.telefono,
    m.placa,
    m.marca,
    m.modelo
FROM clientes c
INNER JOIN motos_taller m ON c.cliente_id = m.cliente_id
WHERE c.documento_identidad = '109823411';

EXPLAIN SELECT 
    o.orden_id,
    m.placa,
    m.marca,
    o.estado_orden,
    o.fecha_ingreso,
    (o.costo_repuestos + o.costo_mano_obra) AS total_facturado
FROM ordenes_reparacion o
INNER JOIN motos_taller m ON o.moto_id = m.moto_id
WHERE o.estado_orden = 'En Proceso' 
  AND o.fecha_ingreso >= '2026-06-01'
ORDER BY o.fecha_ingreso DESC;

SELECT 
    m.marca,
    COUNT(o.orden_id) AS total_ordenes,
    SUM(o.costo_repuestos + o.costo_mano_obra) AS facturacion_total
FROM motos_taller m
INNER JOIN ordenes_reparacion o ON m.moto_id = o.moto_id
GROUP BY m.marca
ORDER BY facturacion_total DESC;