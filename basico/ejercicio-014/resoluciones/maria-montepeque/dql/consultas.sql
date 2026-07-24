-- basico/ejercicio-014 - maria-montepeque
USE campuslands_mysql;

-- 1. Peliculas estrenadas en orden cronologico
SELECT
    titulo,
    saga,
    fecha_estreno
FROM peliculas_saga_ciencia_ficcion
WHERE estado = 'estrenada'
ORDER BY fecha_estreno ASC;

-- 2. Cantidad de peliculas estrenadas por ano
SELECT
    YEAR(fecha_estreno) AS anio_estreno,
    COUNT(*) AS total_peliculas
FROM peliculas_saga_ciencia_ficcion
WHERE estado = 'estrenada'
GROUP BY anio_estreno
ORDER BY anio_estreno ASC;

-- 3. Peliculas estrenadas con mas de 15 anos de antiguedad
SELECT
    titulo,
    fecha_estreno,
    TIMESTAMPDIFF(YEAR, fecha_estreno, CURDATE()) AS antiguedad_anios
FROM peliculas_saga_ciencia_ficcion
WHERE estado = 'estrenada' AND TIMESTAMPDIFF(YEAR, fecha_estreno, CURDATE()) > 15
ORDER BY fecha_estreno ASC;

-- 4. Antiguedad en anos de cada pelicula estrenada, de la mas reciente a la mas antigua
SELECT
    titulo,
    fecha_estreno,
    TIMESTAMPDIFF(YEAR, fecha_estreno, CURDATE()) AS antiguedad_anios
FROM peliculas_saga_ciencia_ficcion
WHERE estado = 'estrenada'
ORDER BY antiguedad_anios ASC;

-- 5. Peliculas estrenadas entre 2010 y 2020
SELECT
    titulo,
    fecha_estreno
FROM peliculas_saga_ciencia_ficcion
WHERE fecha_estreno BETWEEN '2010-01-01' AND '2020-12-31'
ORDER BY fecha_estreno ASC;

-- 6. Proximos estrenos, con los dias restantes hasta la fecha de estreno
SELECT
    titulo,
    fecha_estreno,
    DATEDIFF(fecha_estreno, CURDATE()) AS dias_restantes
FROM peliculas_saga_ciencia_ficcion
WHERE fecha_estreno > CURDATE()
ORDER BY fecha_estreno ASC;
