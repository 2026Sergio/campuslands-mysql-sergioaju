-- avanzado/ejercicio-012 - maria-montepeque
USE campuslands_mysql;

-- 1. RANK() vs DENSE_RANK() sobre reproducciones: con los empates a proposito
--    (9800 y 22300), RANK() deja huecos en la numeracion tras un empate y
--    DENSE_RANK() no.
SELECT
    titulo,
    reproducciones,
    RANK() OVER (ORDER BY reproducciones DESC) AS posicion_rank,
    DENSE_RANK() OVER (ORDER BY reproducciones DESC) AS posicion_dense_rank
FROM canciones_playlist_window
ORDER BY reproducciones DESC;

-- 2. Ranking POR GENERO (PARTITION BY): la numeracion se reinicia en cada genero.
SELECT
    genero,
    titulo,
    reproducciones,
    RANK() OVER (PARTITION BY genero ORDER BY reproducciones DESC) AS posicion_en_su_genero
FROM canciones_playlist_window
ORDER BY genero, posicion_en_su_genero;

-- 3. LAG() / LEAD(): para cada cancion (ordenada por reproducciones), cuantas
--    reproducciones tiene la cancion inmediatamente mejor y peor posicionada.
SELECT
    titulo,
    reproducciones,
    LAG(reproducciones) OVER (ORDER BY reproducciones DESC) AS reproducciones_anterior,
    LEAD(reproducciones) OVER (ORDER BY reproducciones DESC) AS reproducciones_siguiente
FROM canciones_playlist_window
ORDER BY reproducciones DESC;

-- 4. Total acumulado (running total) de reproducciones a medida que se
--    recorre el ranking, y el porcentaje que representa sobre el total.
SELECT
    titulo,
    reproducciones,
    SUM(reproducciones) OVER (ORDER BY reproducciones DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS acumulado,
    ROUND(
        SUM(reproducciones) OVER (ORDER BY reproducciones DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
        / SUM(reproducciones) OVER () * 100,
        2
    ) AS pct_acumulado
FROM canciones_playlist_window
ORDER BY reproducciones DESC;

-- 5. Promedio movil de reproducciones (ventana de 3 canciones: la actual y
--    las 2 anteriores por ano de lanzamiento).
SELECT
    titulo,
    anio_lanzamiento,
    reproducciones,
    ROUND(
        AVG(reproducciones) OVER (ORDER BY anio_lanzamiento, id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),
        2
    ) AS promedio_movil_3
FROM canciones_playlist_window
ORDER BY anio_lanzamiento, id;

-- 6. NTILE(4): divide las canciones en 4 grupos de popularidad (cuartiles)
--    segun sus reproducciones, de mas a menos escuchadas.
SELECT
    titulo,
    reproducciones,
    NTILE(4) OVER (ORDER BY reproducciones DESC) AS cuartil_popularidad
FROM canciones_playlist_window
ORDER BY reproducciones DESC;
