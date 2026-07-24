SELECT
nickname,
edad
FROM jugadores
WHERE edad>21;

SELECT
id_partida,
mapa,
duracion_minutos
FROM partidas
WHERE duracion_minutos>30;

SELECT
j.nickname,
r.puntos,
r.posicion
FROM ranking r
INNER JOIN jugadores j
ON r.id_jugador=j.id_jugador
ORDER BY r.posicion
LIMIT 3;