USE campuslands_mysql;

-- 1. Cantidad de skins por arma.

SELECT
    arma,
    COUNT(*) AS total_skins
FROM skins
GROUP BY arma;

---------------------------------------------------------

-- 2. Precio promedio por rareza.

SELECT
    rareza,
    AVG(precio) AS precio_promedio
FROM skins
GROUP BY rareza
ORDER BY precio_promedio DESC;

---------------------------------------------------------

-- 3. Valor total del inventario por arma.

SELECT
    arma,
    SUM(precio) AS valor_total
FROM skins
GROUP BY arma
ORDER BY valor_total DESC;

---------------------------------------------------------

-- 4. Cantidad de skins disponibles por estado.

SELECT
    estado,
    COUNT(*) AS cantidad
FROM skins
GROUP BY estado;

---------------------------------------------------------

-- 5. Precio máximo por rareza.

SELECT
    rareza,
    MAX(precio) AS precio_maximo
FROM skins
GROUP BY rareza;

---------------------------------------------------------

-- 6. Precio mínimo por arma.

SELECT
    arma,
    MIN(precio) AS precio_minimo
FROM skins
GROUP BY arma;

---------------------------------------------------------

-- 7. Cantidad de skins por rareza.

SELECT
    rareza,
    COUNT(*) AS total
FROM skins
GROUP BY rareza
ORDER BY total DESC;

---------------------------------------------------------

-- 8. Valor promedio de skins por arma.

SELECT
    arma,
    AVG(precio) AS promedio_precio
FROM skins
GROUP BY arma
ORDER BY promedio_precio DESC;