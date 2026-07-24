-- intermedio/ejercicio-012 - maria-montepeque
USE campuslands_mysql;

-- 1. Reporte: top 5 canciones mas reproducidas y el % que representan sobre el total de reproducciones
SELECT
    c.titulo,
    a.nombre AS artista,
    c.reproducciones,
    ROUND(c.reproducciones / (SELECT SUM(reproducciones) FROM canciones_playlist_reportes) * 100, 2) AS pct_del_total
FROM canciones_playlist_reportes AS c
JOIN artistas_playlist_reportes AS a ON a.id = c.artista_id
ORDER BY c.reproducciones DESC
LIMIT 5;

-- 2. Reporte por artista: canciones, reproducciones totales y clasificacion de popularidad
SELECT
    a.nombre AS artista,
    a.pais,
    COUNT(c.id) AS total_canciones,
    SUM(c.reproducciones) AS reproducciones_totales,
    CASE
        WHEN SUM(c.reproducciones) >= 50000 THEN 'Popular'
        WHEN SUM(c.reproducciones) >= 20000 THEN 'En crecimiento'
        ELSE 'Emergente'
    END AS clasificacion
FROM artistas_playlist_reportes AS a
JOIN canciones_playlist_reportes AS c ON c.artista_id = a.id
GROUP BY a.nombre, a.pais
ORDER BY reproducciones_totales DESC;

-- 3. Reporte de duracion total (en minutos) de la playlist por genero
SELECT
    genero,
    COUNT(*) AS total_canciones,
    ROUND(SUM(duracion_segundos) / 60, 2) AS duracion_total_minutos
FROM canciones_playlist_reportes
GROUP BY genero
ORDER BY duracion_total_minutos DESC;

-- 4. Reporte de canciones lanzadas por ano, con reproducciones promedio
SELECT
    anio_lanzamiento,
    COUNT(*) AS canciones_lanzadas,
    ROUND(AVG(reproducciones), 2) AS reproducciones_promedio
FROM canciones_playlist_reportes
GROUP BY anio_lanzamiento
ORDER BY anio_lanzamiento ASC;

-- 5. Reporte resumen general de la playlist (una sola fila con los indicadores clave)
SELECT
    (SELECT COUNT(*) FROM artistas_playlist_reportes) AS total_artistas,
    COUNT(*) AS total_canciones,
    SUM(reproducciones) AS reproducciones_totales,
    ROUND(AVG(duracion_segundos), 2) AS duracion_promedio_segundos
FROM canciones_playlist_reportes;

-- 6. Reporte del artista con mas canciones en la playlist (ranking compuesto: canciones y reproducciones)
SELECT
    a.nombre AS artista,
    COUNT(c.id) AS total_canciones,
    SUM(c.reproducciones) AS reproducciones_totales
FROM artistas_playlist_reportes AS a
JOIN canciones_playlist_reportes AS c ON c.artista_id = a.id
GROUP BY a.nombre
ORDER BY total_canciones DESC, reproducciones_totales DESC
LIMIT 1;
