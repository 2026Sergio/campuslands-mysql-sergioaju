USE campuslands_mysql;

-- 1. Servicios con costo mayor al promedio general (subconsulta escalar en WHERE)
SELECT cliente, tipo_servicio, costo
FROM taller_servicios_registro
WHERE costo > (SELECT AVG(costo) FROM taller_servicios_registro)
ORDER BY costo DESC;

-- 2. El servicio mas caro registrado (subconsulta con MAX)
SELECT cliente, tipo_servicio, costo
FROM taller_servicios_registro
WHERE costo = (SELECT MAX(costo) FROM taller_servicios_registro);

-- 3. Mecanicos que atendieron servicios finalizados (subconsulta con IN)
SELECT DISTINCT mecanico
FROM taller_servicios_registro
WHERE mecanico IN (
    SELECT mecanico FROM taller_servicios_registro WHERE estado = 'finalizada'
);

-- 4. Clientes cuyo costo total supera el promedio de costo total por cliente (subconsulta en HAVING)
SELECT cliente, SUM(costo) AS costo_total
FROM taller_servicios_registro
GROUP BY cliente
HAVING SUM(costo) > (
    SELECT AVG(total_por_cliente) FROM (
        SELECT SUM(costo) AS total_por_cliente
        FROM taller_servicios_registro
        GROUP BY cliente
    ) AS sub
);

-- 5. Servicios con costo por debajo del promedio, caso limite incluido
SELECT cliente, tipo_servicio, costo, estado
FROM taller_servicios_registro
WHERE costo < (SELECT AVG(costo) FROM taller_servicios_registro)
ORDER BY costo ASC;