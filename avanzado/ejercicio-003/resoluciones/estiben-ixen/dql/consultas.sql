USE campuslands_mysql;


-- Consulta 1: Mostrar todas las skins activas ordenadas por precio
SELECT
    id_skin,
    nombre_skin,
    arma,
    rareza,
    precio
FROM inventario_skins
WHERE estado = 'activo'
ORDER BY precio DESC;



-- Consulta 2: Cantidad de skins agrupadas por rareza
SELECT
    rareza,
    COUNT(*) AS cantidad_skins
FROM inventario_skins
GROUP BY rareza
ORDER BY cantidad_skins DESC;



-- Consulta 3: Precio promedio por arma
SELECT
    arma,
    ROUND(AVG(precio),2) AS precio_promedio
FROM inventario_skins
GROUP BY arma
ORDER BY precio_promedio DESC;



-- Consulta 4: Top 5 skins mas costosas
SELECT
    nombre_skin,
    arma,
    rareza,
    precio
FROM inventario_skins
ORDER BY precio DESC
LIMIT 5;



-- Consulta 5: Valor total del inventario activo
SELECT
    COUNT(*) AS total_skins_activas,
    ROUND(SUM(precio),2) AS valor_total_inventario
FROM inventario_skins
WHERE estado = 'activo';



-- Consulta 6: Buscar skins legendarias activas
SELECT
    nombre_skin,
    arma,
    precio
FROM inventario_skins
WHERE rareza = 'Legendaria'
AND estado = 'activo';