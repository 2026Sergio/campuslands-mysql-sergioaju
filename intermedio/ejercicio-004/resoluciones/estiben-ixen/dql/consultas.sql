USE campuslands_mysql;

-- 1. Marcas con más de dos motos registradas.

SELECT
    marca,
    COUNT(*) AS total_motos
FROM motos
GROUP BY marca
HAVING COUNT(*) > 2;

---------------------------------------------------------

-- 2. Tipos de servicio cuyo costo promedio supera los Q200.

SELECT
    tipo_servicio,
    AVG(costo) AS promedio_costo
FROM motos
GROUP BY tipo_servicio
HAVING AVG(costo) > 200;

---------------------------------------------------------

-- 3. Marcas cuyo costo total supera los Q500.

SELECT
    marca,
    SUM(costo) AS costo_total
FROM motos
GROUP BY marca
HAVING SUM(costo) > 500;

---------------------------------------------------------

-- 4. Estados con más de un servicio registrado.

SELECT
    estado,
    COUNT(*) AS total_servicios
FROM motos
GROUP BY estado
HAVING COUNT(*) > 1;

---------------------------------------------------------

-- 5. Marcas cuyo servicio más costoso supera los Q450.

SELECT
    marca,
    MAX(costo) AS mayor_costo
FROM motos
GROUP BY marca
HAVING MAX(costo) > 450;

---------------------------------------------------------

-- 6. Tipos de servicio cuyo costo mínimo es mayor a Q100.

SELECT
    tipo_servicio,
    MIN(costo) AS costo_minimo
FROM motos
GROUP BY tipo_servicio
HAVING MIN(costo) > 100;

---------------------------------------------------------

-- 7. Marcas con un costo promedio mayor a Q200.

SELECT
    marca,
    AVG(costo) AS promedio_costo
FROM motos
GROUP BY marca
HAVING AVG(costo) > 200;

---------------------------------------------------------

-- 8. Tipos de servicio con un costo total superior a Q600.

SELECT
    tipo_servicio,
    SUM(costo) AS total_facturado
FROM motos
GROUP BY tipo_servicio
HAVING SUM(costo) > 600;