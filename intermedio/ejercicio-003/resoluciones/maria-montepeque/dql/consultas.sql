-- intermedio/ejercicio-003 - maria-montepeque
USE campuslands_mysql;

-- 1. Cantidad y precio promedio agrupando por rareza y arma (GROUP BY compuesto)
SELECT
    rareza,
    arma,
    COUNT(*) AS total_skins,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM coleccion_skins_shooter
GROUP BY rareza, arma
ORDER BY rareza, precio_promedio DESC;

-- 2. Propietarios con 3 o mas skins en su coleccion (GROUP BY + HAVING)
SELECT
    propietario,
    COUNT(*) AS total_skins
FROM coleccion_skins_shooter
GROUP BY propietario
HAVING COUNT(*) >= 3
ORDER BY total_skins DESC;

-- 3. Armas cuyo precio promedio de skins supera los 30 (GROUP BY + HAVING)
SELECT
    arma,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM coleccion_skins_shooter
GROUP BY arma
HAVING AVG(precio) > 30
ORDER BY precio_promedio DESC;

-- 4. Cantidad de skins por estado y rareza (GROUP BY compuesto tipo tabla cruzada)
SELECT
    estado,
    rareza,
    COUNT(*) AS total_skins
FROM coleccion_skins_shooter
GROUP BY estado, rareza
ORDER BY estado, rareza;

-- 5. Precio minimo, maximo y total invertido por propietario
SELECT
    propietario,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo,
    SUM(precio) AS total_invertido
FROM coleccion_skins_shooter
GROUP BY propietario
ORDER BY total_invertido DESC;

-- 6. Cantidad de skins obtenidas por ano
SELECT
    YEAR(fecha_obtencion) AS anio_obtencion,
    COUNT(*) AS total_skins
FROM coleccion_skins_shooter
GROUP BY anio_obtencion
ORDER BY anio_obtencion ASC;
