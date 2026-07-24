SELECT
placa,
marca,
modelo
FROM motos
WHERE id_moto IN (
    SELECT id_moto
    FROM reparaciones
    WHERE costo > (
        SELECT AVG(costo)
        FROM reparaciones
    )
);

SELECT
nombre
FROM clientes
WHERE id_cliente IN (
    SELECT id_cliente
    FROM motos
    WHERE id_moto IN (
        SELECT id_moto
        FROM reparaciones
    )
);

SELECT
nombre,
especialidad
FROM mecanicos
WHERE id_mecanico IN (
    SELECT id_mecanico
    FROM reparaciones
    WHERE costo > 500
);

SELECT
placa,
marca,
modelo
FROM motos
WHERE id_moto NOT IN (
    SELECT id_moto
    FROM reparaciones
);

SELECT
descripcion,
costo
FROM reparaciones
WHERE costo = (
    SELECT MAX(costo)
    FROM reparaciones
);