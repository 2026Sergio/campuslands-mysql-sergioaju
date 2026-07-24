SELECT
j.nombre AS jugador,
j.nickname,
j.rol,
e.nombre AS equipo
FROM jugadores j
INNER JOIN equipos e
ON j.id_equipo = e.id_equipo;

SELECT
t.nombre,
t.premio,
e.nombre AS equipo
FROM participaciones p
INNER JOIN equipos e
ON p.id_equipo=e.id_equipo
INNER JOIN torneos t
ON p.id_torneo=t.id_torneo;


SELECT
e.nombre AS equipo,
t.nombre AS torneo,
p.victorias,
p.derrotas
FROM participaciones p
INNER JOIN equipos e
ON p.id_equipo=e.id_equipo
INNER JOIN torneos t
ON p.id_torneo=t.id_torneo;

SELECT
e.nombre AS equipo,
t.nombre AS torneo,
p.victorias,
p.derrotas
FROM participaciones p
INNER JOIN equipos e
ON p.id_equipo=e.id_equipo
INNER JOIN torneos t
ON p.id_torneo=t.id_torneo;