-- avanzado/ejercicio-003 - maria-montepeque
USE campuslands_mysql;

-- 1. Cada skin con su categoria de precio calculada por la funcion
SELECT
    codigo_skin,
    nombre_skin,
    precio,
    fn_categoria_precio_skin(precio) AS categoria
FROM coleccion_skins_shooter_fn
ORDER BY precio DESC;

-- 2. Dias en inventario de cada skin, calculados con la funcion de fechas
SELECT
    codigo_skin,
    fecha_obtencion,
    fn_dias_en_inventario_skin(fecha_obtencion) AS dias_en_inventario
FROM coleccion_skins_shooter_fn
ORDER BY dias_en_inventario DESC;

-- 3. Valor total invertido por cada propietario, usando la funcion en vez de repetir el SUM
SELECT DISTINCT
    propietario,
    fn_valor_total_propietario_skin(propietario) AS valor_total
FROM coleccion_skins_shooter_fn
ORDER BY valor_total DESC;

-- 4. Skins clasificadas como "Premium" o "Legendaria" (funcion usada dentro de un WHERE)
SELECT
    codigo_skin,
    nombre_skin,
    precio,
    fn_categoria_precio_skin(precio) AS categoria
FROM coleccion_skins_shooter_fn
WHERE fn_categoria_precio_skin(precio) IN ('Premium', 'Legendaria')
ORDER BY precio DESC;

-- 5. Propietario con el mayor valor total invertido (funcion usada para ordenar)
SELECT DISTINCT
    propietario,
    fn_valor_total_propietario_skin(propietario) AS valor_total
FROM coleccion_skins_shooter_fn
ORDER BY valor_total DESC
LIMIT 1;

-- 6. Skins con mas de 200 dias en el inventario (funcion de fechas usada en un WHERE)
SELECT
    codigo_skin,
    nombre_skin,
    fecha_obtencion,
    fn_dias_en_inventario_skin(fecha_obtencion) AS dias_en_inventario
FROM coleccion_skins_shooter_fn
WHERE fn_dias_en_inventario_skin(fecha_obtencion) > 200
ORDER BY dias_en_inventario DESC;
