-- intermedio/ejercicio-013 - maria-montepeque
USE campuslands_mysql;

-- 1. Reparto completo de una pelicula (JOIN a traves de la tabla puente)
SELECT
    p.titulo,
    a.nombre AS actor,
    r.personaje
FROM reparto_pelicula_miedo AS r
JOIN peliculas_miedo_puente AS p ON p.id = r.pelicula_id
JOIN actores_miedo AS a ON a.id = r.actor_id
WHERE p.titulo = 'Sombra en el Atico'
ORDER BY a.nombre;

-- 2. Todas las peliculas en las que aparece un actor especifico (lado inverso de la relacion N:M)
SELECT
    a.nombre AS actor,
    p.titulo,
    r.personaje
FROM reparto_pelicula_miedo AS r
JOIN actores_miedo AS a ON a.id = r.actor_id
JOIN peliculas_miedo_puente AS p ON p.id = r.pelicula_id
WHERE a.nombre = 'Elena Vasquez'
ORDER BY p.anio_estreno;

-- 3. Actores que han participado en mas de una pelicula
SELECT
    a.nombre AS actor,
    COUNT(DISTINCT r.pelicula_id) AS total_peliculas
FROM actores_miedo AS a
JOIN reparto_pelicula_miedo AS r ON r.actor_id = a.id
GROUP BY a.nombre
HAVING COUNT(DISTINCT r.pelicula_id) > 1
ORDER BY total_peliculas DESC;

-- 4. Cantidad de actores en el reparto de cada pelicula
SELECT
    p.titulo,
    COUNT(r.actor_id) AS total_actores
FROM peliculas_miedo_puente AS p
JOIN reparto_pelicula_miedo AS r ON r.pelicula_id = p.id
GROUP BY p.titulo
ORDER BY total_actores DESC;

-- 5. Pares de peliculas que comparten al menos un actor en comun (self-join sobre la tabla puente)
SELECT DISTINCT
    p1.titulo AS pelicula_1,
    p2.titulo AS pelicula_2,
    a.nombre AS actor_en_comun
FROM reparto_pelicula_miedo AS r1
JOIN reparto_pelicula_miedo AS r2
    ON r1.actor_id = r2.actor_id AND r1.pelicula_id < r2.pelicula_id
JOIN peliculas_miedo_puente AS p1 ON p1.id = r1.pelicula_id
JOIN peliculas_miedo_puente AS p2 ON p2.id = r2.pelicula_id
JOIN actores_miedo AS a ON a.id = r1.actor_id
ORDER BY pelicula_1, pelicula_2;

-- 6. Actor con mas apariciones totales en el catalogo
SELECT
    a.nombre AS actor,
    COUNT(r.id) AS total_apariciones
FROM actores_miedo AS a
JOIN reparto_pelicula_miedo AS r ON r.actor_id = a.id
GROUP BY a.nombre
ORDER BY total_apariciones DESC
LIMIT 1;
