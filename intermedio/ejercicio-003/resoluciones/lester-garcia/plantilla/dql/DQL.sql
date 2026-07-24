SELECT
j.nickname,
COUNT(i.id_skin) AS total_skins
FROM jugadores j
INNER JOIN inventario i
ON j.id_jugador = i.id_jugador
GROUP BY j.id_jugador, j.nickname;

SELECT
c.nombre AS categoria,
SUM(i.cantidad) AS total_unidades
FROM categorias_skin c
INNER JOIN skins s
ON c.id_categoria = s.id_categoria
INNER JOIN inventario i
ON s.id_skin = i.id_skin
GROUP BY c.id_categoria, c.nombre;

SELECT
rareza,
AVG(precio) AS precio_promedio
FROM skins
GROUP BY rareza;

SELECT
c.nombre AS categoria,
COUNT(s.id_skin) AS cantidad_skins
FROM categorias_skin c
INNER JOIN skins s
ON c.id_categoria = s.id_categoria
GROUP BY c.id_categoria, c.nombre;