USE campuslands_mysql;

-- 1. Cada skin con su clasificacion de valor (funcion en SELECT)
SELECT nombre_skin, precio, clasificar_valor_skin(precio) AS categoria
FROM skins_inventario_avanzado
ORDER BY precio DESC;

-- 2. Precio con descuento aplicado segun antiguedad
SELECT nombre_skin, precio, fecha_obtencion,
       calcular_precio_con_descuento(precio, fecha_obtencion) AS precio_con_descuento
FROM skins_inventario_avanzado
ORDER BY precio_con_descuento DESC;

-- 3. Cantidad de skins por categoria de valor (funcion + GROUP BY)
SELECT clasificar_valor_skin(precio) AS categoria, COUNT(*) AS total_skins
FROM skins_inventario_avanzado
GROUP BY clasificar_valor_skin(precio)
ORDER BY total_skins DESC;

-- 4. Skins de categoria alta, disponibles
SELECT nombre_skin, precio
FROM skins_inventario_avanzado
WHERE clasificar_valor_skin(precio) = 'alto' AND estado = 'disponible';

-- 5. Skins sin tasar (caso limite via funcion)
SELECT nombre_skin, jugador, estado
FROM skins_inventario_avanzado
WHERE clasificar_valor_skin(precio) = 'sin_tasar';