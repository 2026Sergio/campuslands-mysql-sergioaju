-- avanzado/ejercicio-006 - maria-montepeque
USE campuslands_mysql;

-- 1. Busqueda por clave unica: se espera type = const (el mejor caso posible,
--    MySQL sabe que como maximo hay una fila que puede coincidir)
EXPLAIN
SELECT *
FROM autos_hiperdeportivos_explain
WHERE placa = 'HPC-000500';

-- 2. Rango sobre columna indexada: se espera type = range, usando idx_precio_auto_explain
EXPLAIN
SELECT *
FROM autos_hiperdeportivos_explain
WHERE precio BETWEEN 300000 AND 800000;

-- 3. LIKE con comodin solo al final ('Ferrari%'): es "sargable", MySQL SI
--    puede usar el indice de marca porque el prefijo es conocido.
--    Se espera type = range, key = idx_marca_auto_explain.
EXPLAIN
SELECT *
FROM autos_hiperdeportivos_explain
WHERE marca LIKE 'Ferrari%';

-- 4. LIKE con comodin al INICIO ('%rrari%'): aunque existe idx_marca_auto_explain,
--    MySQL no puede usarlo porque no sabe por donde empieza el valor a buscar.
--    Se espera type = ALL (recorrido completo) a pesar de que el indice existe.
EXPLAIN
SELECT *
FROM autos_hiperdeportivos_explain
WHERE marca LIKE '%rrari%';

-- 5. Funcion aplicada sobre la columna indexada (UPPER(marca)): el indice se
--    creo sobre los valores originales de "marca", no sobre el resultado de
--    UPPER(), asi que MySQL no puede usarlo. Se espera type = ALL, a pesar
--    de que idx_marca_auto_explain existe.
EXPLAIN
SELECT *
FROM autos_hiperdeportivos_explain
WHERE UPPER(marca) = 'FERRARI';

-- 6. OR entre dos columnas distintas, cada una con su propio indice: MySQL
--    puede resolverlo con index_merge (unir los resultados de ambos indices)
--    o decidir que un recorrido completo es mas barato, segun cuantas filas
--    coincidan. El plan real queda documentado en la evidencia.
EXPLAIN
SELECT *
FROM autos_hiperdeportivos_explain
WHERE marca = 'Rimac' OR pais_origen = 'Croacia';
