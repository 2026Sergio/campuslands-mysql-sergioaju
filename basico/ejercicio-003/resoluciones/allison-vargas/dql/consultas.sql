-- DQL: 5 Consultas para reporte de inventario
USE campuslands_mysql;

-- 1. Listado completo ordenado por la Primary Key
SELECT 
    skin_id,
    nombre_skin,
    tipo_arma,
    rareza,
    precio_usd
FROM skins_basico
ORDER BY skin_id ASC;

-- 2. Búsqueda directa por Primary Key (Consulta de punto único)
SELECT 
    skin_id,
    nombre_skin,
    tipo_arma,
    precio_usd,
    IF(equipada, 'Sí', 'No') AS en_uso
FROM skins_basico
WHERE skin_id = 1;

-- 3. Resumen de Valor total y promedio agrupado por Rareza
SELECT 
    rareza,
    COUNT(*) AS total_skins,
    ROUND(AVG(precio_usd), 2) AS precio_promedio,
    SUM(precio_usd) AS valor_total
FROM skins_basico
GROUP BY rareza
ORDER BY valor_total DESC;

-- 4. Skins actualmente Equipadas en armamento
SELECT 
    skin_id,
    CONCAT(tipo_arma, ' - ', nombre_skin) AS arma_con_skin,
    precio_usd
FROM skins_basico
WHERE equipada = TRUE AND estado = 'disponible';

-- 5. Top 3 Skins de mayor valor económico
SELECT 
    skin_id,
    nombre_skin,
    tipo_arma,
    rareza,
    precio_usd
FROM skins_basico
ORDER BY precio_usd DESC
LIMIT 3;
