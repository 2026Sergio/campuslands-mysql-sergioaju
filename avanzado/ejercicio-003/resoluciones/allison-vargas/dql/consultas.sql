-- DQL: Consultas aprovechando Funciones SQL integradas y personalizadas
USE campuslands_mysql;

-- 1. Reporte de Inventario aplicando la Función Personalizada y formateo de texto
SELECT 
    UPPER(nombre_skin) AS skin,
    arma,
    rareza,
    IF(stattrak, 'StatTrak™', 'Estándar') AS tecnologia,
    precio_base,
    calcular_valor_mercado(precio_base, rareza, stattrak) AS valor_estimado_mercado
FROM inventario_skins
WHERE estado != 'vendida'
ORDER BY valor_estimado_mercado DESC;

-- 2. Clasificación de condición de desgaste (Wear) con la función CASE
SELECT 
    nombre_skin,
    arma,
    float_wear,
    CASE 
        WHEN float_wear < 0.07 THEN 'Recién Fabricado (FN)'
        WHEN float_wear < 0.15 THEN 'Casi Nuevo (MW)'
        WHEN float_wear < 0.38 THEN 'Algo Desgastado (FT)'
        ELSE 'Bastante Desgastado (BS)'
    END AS condicion
FROM inventario_skins
ORDER BY float_wear ASC;

-- 3. Días transcurridos desde la adquisición (Funciones de Fecha)
SELECT 
    nombre_skin,
    fecha_adquisicion,
    DATEDIFF(CURRENT_DATE, fecha_adquisicion) AS dias_en_inventario,
    estado
FROM inventario_skins
ORDER BY dias_en_inventario DESC;

-- 4. Valorización Total del Inventario agrupado por Rareza
SELECT 
    rareza,
    COUNT(*) AS total_skins,
    ROUND(AVG(precio_base), 2) AS precio_promedio,
    SUM(calcular_valor_mercado(precio_base, rareza, stattrak)) AS valor_total_grupo
FROM inventario_skins
GROUP BY rareza
ORDER BY valor_total_grupo DESC;

-- 5. Top Skins de Alto Valor (Valor estimado de mercado > $150 USD)
SELECT 
    CONCAT(arma, ' | ', nombre_skin) AS nombre_completo,
    rareza,
    calcular_valor_mercado(precio_base, rareza, stattrak) AS valor_mercado
FROM inventario_skins
HAVING valor_mercado > 150.00
ORDER BY valor_mercado DESC;
