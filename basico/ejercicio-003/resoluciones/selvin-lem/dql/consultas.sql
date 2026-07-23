USE campuslands_mysql;

-- 1. Listado general
SELECT * FROM inventario_skins;

-- 2. Skins equipadas actualmente
SELECT id_skin, jugador, nombre_skin, arma
FROM inventario_skins
WHERE equipada = TRUE;

-- 3. Valor total del inventario por jugador
SELECT jugador, COUNT(*) AS total_skins, SUM(precio) AS valor_total
FROM inventario_skins
GROUP BY jugador
ORDER BY valor_total DESC;

-- 4. Top 5 skins mas caras
SELECT id_skin, nombre_skin, rareza, precio
FROM inventario_skins
ORDER BY precio DESC
LIMIT 5;

-- 5. Skins bloqueadas o en revision (caso limite)
SELECT id_skin, jugador, nombre_skin, estado
FROM inventario_skins
WHERE estado IN ('bloqueada', 'en_revision');