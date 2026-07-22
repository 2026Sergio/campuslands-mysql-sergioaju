-- basico/ejercicio-003 - maria-montepeque
USE campuslands_mysql;

-- 1. Top 5 skins mas caras
SELECT
    codigo_skin,
    nombre_skin,
    precio
FROM inventario_skins_shooter
ORDER BY precio DESC
LIMIT 5;

-- 2. Cantidad y precio promedio de skins por rareza
SELECT
    rareza,
    COUNT(*) AS total_skins,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM inventario_skins_shooter
GROUP BY rareza
ORDER BY precio_promedio DESC;

-- 3. Cantidad y precio promedio de skins por arma
SELECT
    arma,
    COUNT(*) AS total_skins,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM inventario_skins_shooter
GROUP BY arma
ORDER BY precio_promedio DESC;

-- 4. Total invertido por propietario
SELECT
    propietario,
    COUNT(*) AS total_skins,
    SUM(precio) AS total_invertido
FROM inventario_skins_shooter
GROUP BY propietario
ORDER BY total_invertido DESC;

-- 5. Conteo de skins por estado
SELECT
    estado,
    COUNT(*) AS total_skins
FROM inventario_skins_shooter
GROUP BY estado
ORDER BY total_skins DESC;

-- 6. Skins legendarias equipadas, ordenadas por precio
SELECT
    codigo_skin,
    nombre_skin,
    propietario,
    precio
FROM inventario_skins_shooter
WHERE rareza = 'legendario' AND estado = 'equipada'
ORDER BY precio DESC;
