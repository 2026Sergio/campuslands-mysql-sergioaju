SELECT
j.nombre,
j.nickname,
r.posicion,
r.puntos
FROM jugadores j
LEFT JOIN rankings r
ON j.id_jugador = r.id_jugador;

SELECT
j.nickname,
t.nombre AS temporada
FROM jugadores j
LEFT JOIN rankings r
ON j.id_jugador=r.id_jugador
LEFT JOIN temporadas t
ON r.id_temporada=t.id_temporada;

SELECT
j.nombre,
j.nickname,
r.victorias
FROM jugadores j
LEFT JOIN rankings r
ON j.id_jugador=r.id_jugador;

SELECT
j.nombre,
t.nombre AS temporada,
r.puntos
FROM jugadores j
LEFT JOIN rankings r
ON j.id_jugador=r.id_jugador
LEFT JOIN temporadas t
ON r.id_temporada=t.id_temporada
ORDER BY j.nombre;

SELECT
j.nombre,
j.nickname,
IFNULL(r.posicion,'Sin participación') AS posicion
FROM jugadores j
LEFT JOIN rankings r
ON j.id_jugador=r.id_jugador;