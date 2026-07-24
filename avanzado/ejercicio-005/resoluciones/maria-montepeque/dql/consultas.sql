-- avanzado/ejercicio-005 - maria-montepeque
USE campuslands_mysql;

-- 1. EXPLAIN "ANTES": buscar las ordenes de un cliente sin ningun indice en
--    esa columna. Se espera type = ALL (recorrido completo de la tabla) y
--    rows cercano al total de filas de la tabla.
EXPLAIN
SELECT *
FROM servicios_taller_motos_idx
WHERE cliente = 'Carlos Reyes';

-- 2. Se crea el indice sobre "cliente" y se repite EXACTAMENTE la misma
--    consulta. Ahora se espera type = ref (busqueda por indice) y rows
--    mucho menor, ademas de key = idx_cliente_taller.
CREATE INDEX idx_cliente_taller ON servicios_taller_motos_idx (cliente);

EXPLAIN
SELECT *
FROM servicios_taller_motos_idx
WHERE cliente = 'Carlos Reyes';

-- 3. EXPLAIN "ANTES" de un indice compuesto: filtrar por mecanico Y estado
--    a la vez, sin indice sobre esas columnas.
EXPLAIN
SELECT *
FROM servicios_taller_motos_idx
WHERE mecanico = 'Julio Sanchez' AND estado = 'finalizada';

-- 4. Se crea un indice compuesto (mecanico, estado) y se repite la consulta.
--    Ahora deberia usar el indice (key = idx_mecanico_estado_taller) con
--    muchas menos filas examinadas.
CREATE INDEX idx_mecanico_estado_taller ON servicios_taller_motos_idx (mecanico, estado);

EXPLAIN
SELECT *
FROM servicios_taller_motos_idx
WHERE mecanico = 'Julio Sanchez' AND estado = 'finalizada';

-- 5. Consulta de negocio que ahora se beneficia del indice de cliente:
--    top 5 clientes con mas ordenes registradas.
SELECT
    cliente,
    COUNT(*) AS total_ordenes
FROM servicios_taller_motos_idx
GROUP BY cliente
ORDER BY total_ordenes DESC
LIMIT 5;

-- 6. Listado de todos los indices activos en la tabla (PK, UNIQUE de
--    numero_orden, y los dos indices creados en esta sesion)
SHOW INDEX FROM servicios_taller_motos_idx;
