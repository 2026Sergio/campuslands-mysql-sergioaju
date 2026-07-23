-- avanzado/ejercicio-015 - maria-montepeque
-- Cada par de consultas usa EXPLAIN ANALYZE (que SI ejecuta la consulta y
-- reporta el tiempo real medido, no solo un estimado) para comparar el
-- "antes" (consulta mal escrita / sin indice) contra el "despues"
-- (consulta reescrita y/o con indice). Los tiempos reales quedan en la
-- evidencia.
USE campuslands_mysql;

-- =====================================================================
-- PAR A: subconsulta correlacionada (se ejecuta una vez POR CADA fila de
-- desarrolladoras_biblioteca_opt) vs LEFT JOIN + GROUP BY (una sola pasada).
-- =====================================================================

-- A1. ANTES: subconsulta correlacionada
EXPLAIN ANALYZE
SELECT
    d.nombre,
    (SELECT COUNT(*) FROM juegos_biblioteca_opt AS j WHERE j.desarrolladora_id = d.id) AS total_juegos
FROM desarrolladoras_biblioteca_opt AS d;

-- A2. DESPUES: misma respuesta, reescrita como JOIN + GROUP BY
EXPLAIN ANALYZE
SELECT
    d.nombre,
    COUNT(j.id) AS total_juegos
FROM desarrolladoras_biblioteca_opt AS d
LEFT JOIN juegos_biblioteca_opt AS j ON j.desarrolladora_id = d.id
GROUP BY d.nombre;

-- =====================================================================
-- PAR B: NOT IN con subconsulta vs NOT EXISTS. Ambas responden lo mismo
-- ("desarrolladoras sin ningun juego cargado"), pero NOT IN necesita
-- materializar y recorrer la lista completa de desarrolladora_id de la
-- tabla de juegos por cada fila candidata, mientras NOT EXISTS puede
-- cortar en cuanto encuentra la primera coincidencia (o confirmar que no
-- hay ninguna) usando el indice de la FOREIGN KEY.
-- =====================================================================

-- B1. ANTES: NOT IN
EXPLAIN ANALYZE
SELECT d.nombre
FROM desarrolladoras_biblioteca_opt AS d
WHERE d.id NOT IN (SELECT j.desarrolladora_id FROM juegos_biblioteca_opt AS j);

-- B2. DESPUES: NOT EXISTS (misma respuesta)
EXPLAIN ANALYZE
SELECT d.nombre
FROM desarrolladoras_biblioteca_opt AS d
WHERE NOT EXISTS (
    SELECT 1 FROM juegos_biblioteca_opt AS j WHERE j.desarrolladora_id = d.id
);

-- =====================================================================
-- PAR C: ORDER BY sobre una columna SIN indice (obliga a un filesort de
-- las 4000 filas para poder aplicar el LIMIT) vs la misma consulta despues
-- de indexar esa columna.
-- =====================================================================

-- C1. ANTES: ORDER BY fecha_lanzamiento sin indice (se espera "Using filesort")
EXPLAIN ANALYZE
SELECT titulo, fecha_lanzamiento
FROM juegos_biblioteca_opt
ORDER BY fecha_lanzamiento DESC
LIMIT 20;

-- Se crea el indice que faltaba
CREATE INDEX idx_fecha_lanzamiento_opt ON juegos_biblioteca_opt (fecha_lanzamiento);

-- C2. DESPUES de crear el indice, SIN forzarlo: resultado real y sorprendente
--    (documentado en el readme) -- el optimizador sigue eligiendo el mismo
--    plan de table scan + sort, incluso despues de ANALYZE TABLE.
ANALYZE TABLE juegos_biblioteca_opt;

EXPLAIN ANALYZE
SELECT titulo, fecha_lanzamiento
FROM juegos_biblioteca_opt
ORDER BY fecha_lanzamiento DESC
LIMIT 20;

-- C3. Forzando el uso del indice con FORCE INDEX: aqui si se ve el plan
--    optimo (index scan en reversa, sin sort y sin recorrer las 4000 filas)
--    y el costo estimado baja de 404 a 5.01, con menos tiempo real medido.
EXPLAIN ANALYZE
SELECT titulo, fecha_lanzamiento
FROM juegos_biblioteca_opt FORCE INDEX (idx_fecha_lanzamiento_opt)
ORDER BY fecha_lanzamiento DESC
LIMIT 20;
