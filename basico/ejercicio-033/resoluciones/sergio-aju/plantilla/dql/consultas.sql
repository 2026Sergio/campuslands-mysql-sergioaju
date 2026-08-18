USE campuslands_mysql;

-- 1. Listar el inventario completo ordenado por el precio de mercado de forma descendente
SELECT 
    id,
    codigo_skin,
    nombre_skin,
    arma_asociada,
    rareza,
    precio_mercado,
    estado_inventario
FROM skins_shooter
ORDER BY precio_mercado DESC;

-- 2. Filtrar únicamente las skins que se encuentran disponibles en el inventario
SELECT 
    codigo_skin,
    nombre_skin,
    arma_asociada,
    rareza,
    precio_mercado
FROM skins_shooter
WHERE estado_inventario = 'disponible'
ORDER BY precio_mercado ASC;

-- 3. Agrupación y estadísticas por rareza de las skins (conteo y valor total de mercado)
SELECT 
    rareza,
    COUNT(*) AS total_skins,
    SUM(precio_mercado) AS valor_total_mercado,
    ROUND(AVG(precio_mercado), 2) AS precio_promedio
FROM skins_shooter
GROUP BY rareza
ORDER BY valor_total_mercado DESC;

-- 4. Top 3 de las skins más caras registradas en el inventario del shooter
SELECT 
    nombre_skin,
    arma_asociada,
    rareza,
    precio_mercado,
    estado_inventario
FROM skins_shooter
ORDER BY precio_mercado DESC
LIMIT 3;

-- 5. Reporte analítico de skins agrupadas por su estado actual en el inventario
SELECT 
    estado_inventario,
    COUNT(*) AS cantidad_skins,
    SUM(precio_mercado) AS valor_acumulado_estado
FROM skins_shooter
GROUP BY estado_inventario
ORDER BY cantidad_skins DESC;