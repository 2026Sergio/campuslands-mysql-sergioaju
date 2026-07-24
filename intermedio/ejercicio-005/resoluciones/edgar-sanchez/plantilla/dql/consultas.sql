SELECT 
    r.reparacion_id,
    m.placa,
    m.marca,
    m.modelo,
    (r.costo_repuestos + r.costo_mano_obra) AS costo_total
FROM reparaciones r
INNER JOIN motos m ON r.moto_id = m.moto_id
WHERE (r.costo_repuestos + r.costo_mano_obra) > (
    SELECT AVG(costo_repuestos + costo_mano_obra) 
    FROM reparaciones
);

SELECT 
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.tipo_cliente,
    (
        SELECT COUNT(m.moto_id) 
        FROM motos m 
        WHERE m.cliente_id = c.cliente_id
    ) AS cantidad_motos_registradas,
    (
        SELECT COALESCE(SUM(r.costo_repuestos + r.costo_mano_obra), 0.00)
        FROM motos m
        INNER JOIN reparaciones r ON m.moto_id = r.moto_id
        WHERE m.cliente_id = c.cliente_id
    ) AS total_historico_invertido
FROM clientes c
ORDER BY total_historico_invertido DESC;

SELECT 
    m.moto_id,
    m.placa,
    m.marca,
    m.modelo,
    m.cilindrada
FROM motos m
WHERE EXISTS (
    SELECT 1 
    FROM reparaciones r 
    WHERE r.moto_id = m.moto_id 
      AND r.estado IN ('Pendiente', 'En Proceso')
);

UPDATE clientes
SET tipo_cliente = 'VIP'
WHERE cliente_id IN (
    SELECT m.cliente_id
    FROM motos m
    INNER JOIN reparaciones r ON m.moto_id = r.moto_id
    GROUP BY m.cliente_id
    HAVING SUM(r.costo_repuestos + r.costo_mano_obra) > 1500.00
);

DELETE FROM motos
WHERE moto_id NOT IN (
    SELECT DISTINCT moto_id 
    FROM reparaciones
) AND anio < 2020;

SELECT 
    m.placa,
    m.marca,
    m.modelo,
    c.nombre AS propietario,
    SUM(r.costo_repuestos + r.costo_mano_obra) AS gasto_total_moto
FROM motos m
INNER JOIN clientes c ON m.cliente_id = c.cliente_id
INNER JOIN reparaciones r ON m.moto_id = r.moto_id
GROUP BY m.moto_id, m.placa, m.marca, m.modelo, c.nombre
HAVING gasto_total_moto > (
    SELECT AVG(costo_repuestos + costo_mano_obra) * 1.5 
    FROM reparaciones
)
ORDER BY gasto_total_moto DESC;