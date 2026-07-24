-- consultas agrupadas usando HAVING
USE campuslands_mysql;

-- 1. marcas que tienen mas de 2 motos registradas en el garaje
SELECT 
    marca,
    COUNT(*) AS total_motos
FROM motos
GROUP BY marca
HAVING COUNT(*) > 2;

-- 2. marcas cuyo precio promedio de motos sea mayor a 6000
SELECT 
    marca,
    AVG(precio) AS precio_promedio
FROM motos
GROUP BY marca
HAVING AVG(precio) > 6000.00;

-- 3. estados de motos que sumen un valor total en inventario superior a 15000
SELECT 
    estado,
    SUM(precio) AS valor_total
FROM motos
GROUP BY estado
HAVING SUM(precio) > 15000.00;

-- 4. marcas con cilindraje maximo superior a 500 cc
SELECT 
    marca,
    MAX(cilindraje) AS mayor_cilindraje
FROM motos
GROUP BY marca
HAVING MAX(cilindraje) > 500;

-- 5. marcas con un precio minimo mayor a 4000 entre las motos disponibles
SELECT 
    marca,
    MIN(precio) AS precio_minimo
FROM motos
WHERE estado = 'disponible'
GROUP BY marca
HAVING MIN(precio) > 4000.00;