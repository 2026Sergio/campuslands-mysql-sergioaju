SELECT 
    nombre_cliente,
    ciudad
FROM clientes_taller
WHERE cliente_id IN (
    SELECT cliente_id
    FROM servicios_taller_motos
    WHERE costo > (
        SELECT AVG(costo)
        FROM servicios_taller_motos
    )
);

SELECT 
    nombre_cliente,
    telefono
FROM clientes_taller
WHERE cliente_id IN (
    SELECT cliente_id
    FROM servicios_taller_motos
    WHERE estado = 'Pendiente'
);

SELECT 
    nombre_cliente,
    ciudad
FROM clientes_taller c
WHERE EXISTS (
    SELECT 1
    FROM servicios_taller_motos s
    WHERE s.cliente_id = c.cliente_id
    AND s.tipo_servicio = 'Mantenimiento general'
);

SELECT 
    nombre_cliente,
    ciudad
FROM clientes_taller
WHERE cliente_id IN (
    SELECT cliente_id
    FROM servicios_taller_motos
    GROUP BY cliente_id
    HAVING COUNT(*) > 1
);

SELECT 
    nombre_cliente,
    ciudad
FROM clientes_taller
WHERE cliente_id IN (
    SELECT cliente_id
    FROM servicios_taller_motos
    WHERE costo = (
        SELECT MAX(costo)
        FROM servicios_taller_motos
    )
);