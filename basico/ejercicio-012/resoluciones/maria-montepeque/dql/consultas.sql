-- basico/ejercicio-012 - maria-montepeque
USE campuslands_mysql;

-- 1. Top 5 canciones mas reproducidas
SELECT
    titulo,
    artista,
    reproducciones
FROM canciones_playlist_musical
ORDER BY reproducciones DESC
LIMIT 5;

-- 2. Canciones marcadas como favoritas
SELECT
    titulo,
    artista,
    genero
FROM canciones_playlist_musical
WHERE favorita = TRUE
ORDER BY titulo ASC;

-- 3. Cantidad de canciones y duracion promedio por genero
SELECT
    genero,
    COUNT(*) AS total_canciones,
    ROUND(AVG(duracion_segundos), 2) AS duracion_promedio_segundos
FROM canciones_playlist_musical
GROUP BY genero
ORDER BY total_canciones DESC;

-- 4. Total de reproducciones y canciones por artista
SELECT
    artista,
    COUNT(*) AS total_canciones,
    SUM(reproducciones) AS reproducciones_totales
FROM canciones_playlist_musical
GROUP BY artista
ORDER BY reproducciones_totales DESC;

-- 5. Canciones activas en la playlist (no archivadas)
SELECT
    titulo,
    artista,
    album,
    estado
FROM canciones_playlist_musical
WHERE estado = 'activa'
ORDER BY artista ASC;

-- 6. Canciones lanzadas desde 2022 en adelante, mas recientes primero
SELECT
    titulo,
    artista,
    anio_lanzamiento
FROM canciones_playlist_musical
WHERE anio_lanzamiento >= 2022
ORDER BY anio_lanzamiento DESC;
