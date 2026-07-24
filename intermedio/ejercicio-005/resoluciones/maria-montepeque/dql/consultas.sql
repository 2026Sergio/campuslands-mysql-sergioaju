-- intermedio/ejercicio-005 - maria-montepeque
USE campuslands_mysql;

-- 1. Ordenes con costo mayor al promedio general (subconsulta escalar)
SELECT
    numero_orden,
    cliente,
    costo
FROM servicios_taller_motos
WHERE costo > (SELECT AVG(costo) FROM servicios_taller_motos)
ORDER BY costo DESC;

-- 2. La orden (u ordenes) con el costo mas alto de todo el taller
SELECT
    numero_orden,
    cliente,
    costo
FROM servicios_taller_motos
WHERE costo = (SELECT MAX(costo) FROM servicios_taller_motos);

-- 3. Ordenes de clientes que tienen mas de una orden registrada (subconsulta con IN)
SELECT
    numero_orden,
    cliente,
    costo
FROM servicios_taller_motos
WHERE cliente IN (
    SELECT cliente
    FROM servicios_taller_motos
    GROUP BY cliente
    HAVING COUNT(*) > 1
)
ORDER BY cliente, numero_orden;

-- 4. Ordenes cuyo costo supera el promedio de su propio tipo de servicio (subconsulta correlacionada)
SELECT
    t1.numero_orden,
    t1.tipo_servicio,
    t1.costo
FROM servicios_taller_motos AS t1
WHERE t1.costo > (
    SELECT AVG(t2.costo)
    FROM servicios_taller_motos AS t2
    WHERE t2.tipo_servicio = t1.tipo_servicio
)
ORDER BY t1.tipo_servicio;

-- 5. Clientes que nunca han solicitado un servicio de tipo "reparacion" (subconsulta con NOT IN)
SELECT DISTINCT cliente
FROM servicios_taller_motos
WHERE cliente NOT IN (
    SELECT cliente
    FROM servicios_taller_motos
    WHERE tipo_servicio = 'reparacion'
)
ORDER BY cliente;

-- 6. Mecanico con el mayor costo total facturado (subconsulta en el FROM)
SELECT
    totales_por_mecanico.mecanico,
    totales_por_mecanico.costo_total
FROM (
    SELECT mecanico, SUM(costo) AS costo_total
    FROM servicios_taller_motos
    GROUP BY mecanico
) AS totales_por_mecanico
WHERE totales_por_mecanico.costo_total = (
    SELECT MAX(sub.costo_total)
    FROM (
        SELECT mecanico, SUM(costo) AS costo_total
        FROM servicios_taller_motos
        GROUP BY mecanico
    ) AS sub
);
