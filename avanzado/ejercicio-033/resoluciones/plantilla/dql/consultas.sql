USE campuslands_mysql;

-- 1. Uso de funciones de cadenas y formato para mostrar nombres en mayúsculas y códigos limpios
SELECT 
    UPPER(nombre_skin) AS nombre_mayuscula,
    LOWER(arma_asociada) AS arma_minuscula,
    CONCAT('[', codigo_skin, '] - ', rareza) AS etiqueta_completa,
    precio_mercado
FROM skins_shooter_funciones;

-- 2. Uso de funciones de fecha (DATEDIFF, YEAR, MONTH) para calcular antigüedad de la skin en el inventario
SELECT 
    nombre_skin,
    fecha_adquisicion,
    DATEDIFF(CURRENT_DATE(), fecha_adquisicion) AS dias_en_inventario,
    YEAR(fecha_adquisicion) AS anio_adquisicion
FROM skins_shooter_funciones
ORDER BY dias_en_inventario DESC;

-- 3. Uso de la función almacenada personalizada `fn_calcular_valoracion_skin` para categorizar el valor comercial
SELECT 
    nombre_skin,
    rareza,
    precio_mercado,
    fn_calcular_valoracion_skin(precio_mercado, rareza) AS clasificacion_comercial
FROM skins_shooter_funciones
ORDER BY precio_mercado DESC;

-- 4. Uso de funciones condicionales (CASE / IF) y funciones numéricas (ROUND, SQRT) para cálculos analíticos
SELECT 
    nombre_skin,
    precio_mercado,
    ROUND(precio_mercado * 0.85, 2) AS precio_estimado_venta_rapida,
    IF(precio_mercado > 500, 'Inversión Alta', 'Inversión Moderada') AS nivel_inversion
FROM skins_shooter_funciones
ORDER BY precio_mercado DESC;

-- 5. Agrupación avanzada aplicando funciones agregadas y formato de totales financieros
SELECT 
    estado_inventario,
    COUNT(*) AS total_items,
    FORMAT(SUM(precio_mercado), 2) AS valor_total_formateado,
    ROUND(AVG(precio_mercado), 2) AS precio_promedio
FROM skins_shooter_funciones
GROUP BY estado_inventario
ORDER BY SUM(precio_mercado) DESC;