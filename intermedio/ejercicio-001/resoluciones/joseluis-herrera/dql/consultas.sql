SELECT equipos.nombre AS equipo, equipos.puntuaje, juegos.nombre_juego 
FROM equipos
INNER JOIN juegos ON equipos.id_juego = juegos.id_juego;

SELECT equipos.nombre AS equipo, juegos.nombre_juego 
FROM equipos
INNER JOIN juegos ON equipos.id_juego = juegos.id_juego
WHERE juegos.nombre_juego = 'League of Legends';

SELECT equipos.nombre AS equipo, equipos.puntuaje, juegos.nombre_juego 
FROM equipos
INNER JOIN juegos ON equipos.id_juego = juegos.id_juego
ORDER BY equipos.puntuaje DESC;