-- basico/ejercicio-013 - maria-montepeque
USE campuslands_mysql;

-- 1. Peliculas disponibles en el catalogo, mejor calificadas primero
SELECT
    titulo,
    subgenero,
    calificacion
FROM catalogo_peliculas_miedo
WHERE estado = 'disponible'
ORDER BY calificacion DESC;

-- 2. Peliculas proximamente en el catalogo
SELECT
    titulo,
    director,
    anio_estreno
FROM catalogo_peliculas_miedo
WHERE estado = 'proximamente'
ORDER BY anio_estreno ASC;

-- 3. Cantidad de peliculas por estado
SELECT
    estado,
    COUNT(*) AS total_peliculas
FROM catalogo_peliculas_miedo
GROUP BY estado
ORDER BY total_peliculas DESC;

-- 4. Peliculas disponibles con calificacion mayor a 8
SELECT
    titulo,
    calificacion,
    estado
FROM catalogo_peliculas_miedo
WHERE estado = 'disponible' AND calificacion > 8
ORDER BY calificacion DESC;

-- 5. Peliculas retiradas del catalogo
SELECT
    titulo,
    director,
    fecha_agregada
FROM catalogo_peliculas_miedo
WHERE estado = 'retirado';

-- 6. Peliculas que aun no estan disponibles (en revision o proximamente)
SELECT
    titulo,
    estado
FROM catalogo_peliculas_miedo
WHERE estado IN ('en_revision', 'proximamente')
ORDER BY estado;
