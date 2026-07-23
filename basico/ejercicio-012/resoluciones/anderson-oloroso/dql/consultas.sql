SELECT * FROM playlist_musical
WHERE estado = 'Publica';

SELECT * FROM playlist_musical
WHERE cantidad_canciones >= 25;

SELECT * FROM playlist_musical
WHERE duracion_minutos > 100;

SELECT genero_principal, COUNT(*) AS cantidad_playlists
FROM playlist_musical
GROUP BY genero_principal;

SELECT nombre_playlist, creador, cantidad_canciones, duracion_minutos
FROM playlist_musical
WHERE estado = 'Publica'
ORDER BY cantidad_canciones DESC;