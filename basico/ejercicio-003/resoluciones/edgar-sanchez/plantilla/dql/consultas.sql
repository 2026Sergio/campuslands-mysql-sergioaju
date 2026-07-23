-- ============================================================================
-- SCRIPT DE CONSULTAS DE PRUEBA: INVENTARIO DE SKINS
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. CONSULTA DE FILTRADO (WHERE)
-- Descripción: Muestra las skins de rareza 'Legendario' o 'Mítico' que cuentan 
-- con contador 'StatTrak' activo y un float de desgaste en excelente estado (< 0.05).
-- ----------------------------------------------------------------------------
SELECT 
    skin_id, 
    nombre_skin, 
    arma, 
    rareza, 
    precio_monedas, 
    float_wear
FROM skins_inventario
WHERE rareza IN ('Legendario', 'Mítico')
  AND es_stattrak = TRUE
  AND float_wear < 0.05;

-- ----------------------------------------------------------------------------
-- 2. CONSULTA DE AGREGACIÓN Y AGRUPAMIENTO (GROUP BY)
-- Descripción: Muestra un resumen del inventario por nivel de rareza, indicando 
-- el total de piezas distintas, el stock acumulado y el precio promedio.
-- ----------------------------------------------------------------------------
SELECT 
    rareza,
    COUNT(skin_id) AS total_modelos_skins,
    SUM(stock) AS stock_total_unidades,
    ROUND(AVG(precio_monedas), 2) AS precio_promedio
FROM skins_inventario
GROUP BY rareza
ORDER BY precio_promedio DESC;

-- ----------------------------------------------------------------------------
-- 3. CONSULTA DE ACTUALIZACIÓN DE DATOS (UPDATE)
-- Descripción: Aplica un descuento del 15% en el precio a todas las skins de
-- categoría 'Común' que tengan un stock disponible superior a 80 unidades.
-- ----------------------------------------------------------------------------
UPDATE skins_inventario
SET precio_monedas = ROUND(precio_monedas * 0.85, 2)
WHERE rareza = 'Común' 
  AND stock > 80;

-- ----------------------------------------------------------------------------
-- 4. CONSULTA DE ELIMINACIÓN CONDICIONADA (DELETE)
-- Descripción: Depura del catálogo aquellos cosméticos que se quedaron sin stock (0)
-- y cuya fecha de lanzamiento sea anterior al año 2025.
-- ----------------------------------------------------------------------------
DELETE FROM skins_inventario
WHERE stock = 0 
  AND fecha_lanzamiento < '2025-01-01';

-- ----------------------------------------------------------------------------
-- 5. CONSULTA DE ORDENAMIENTO Y LÍMITE (ORDER BY + LIMIT)
-- Descripción: Obtiene el Top 5 de skins de rifle ('AK-47' o 'AWP') más costosas
-- del catálogo para destacarlas en el banner principal de la tienda.
-- ----------------------------------------------------------------------------
SELECT 
    skin_id,
    nombre_skin,
    arma,
    rareza,
    precio_monedas,
    stock
FROM skins_inventario
WHERE arma IN ('AK-47', 'AWP')
ORDER BY precio_monedas DESC
LIMIT 5;