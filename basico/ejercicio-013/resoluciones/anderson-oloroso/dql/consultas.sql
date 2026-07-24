SELECT * FROM catalogo_peliculas_miedo
WHERE estado = 'Disponible';

SELECT * FROM catalogo_peliculas_miedo
WHERE estado = 'No disponible';

SELECT titulo, director, subgenero
FROM catalogo_peliculas_miedo
WHERE estado = 'Disponible'
ORDER BY titulo ASC;

SELECT subgenero, COUNT(*) AS cantidad_peliculas
FROM catalogo_peliculas_miedo
WHERE estado = 'Disponible'
GROUP BY subgenero;

SELECT * FROM catalogo_peliculas_miedo
WHERE estado = 'Disponible'
AND duracion_minutos > 110
ORDER BY duracion_minutos DESC;