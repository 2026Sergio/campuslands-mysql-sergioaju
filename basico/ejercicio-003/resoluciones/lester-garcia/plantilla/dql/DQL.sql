SELECT *
FROM jugadores;

SELECT *
FROM armas;

SELECT
    s.nombre AS skin,
    a.nombre AS arma,
    s.rareza,
    s.precio
FROM skins s
INNER JOIN armas a
ON s.id_arma = a.id_arma;


SELECT
j.nickname,
s.nombre
FROM inventario i
INNER JOIN jugadores j
ON i.id_jugador=j.id_jugador
INNER JOIN skins s
ON i.id_skin=s.id_skin
WHERE equipada=TRUE;

SELECT
nickname,
nivel
FROM jugadores
WHERE nivel>40;

SELECT
nombre,
rareza,
precio
FROM skins
ORDER BY precio DESC;