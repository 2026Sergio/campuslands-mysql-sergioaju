-- intermedio/ejercicio-014 - maria-montepeque
USE campuslands_mysql;

-- 1. Peliculas estrenadas, en orden cronologico (usando la vista)
SELECT *
FROM vista_peliculas_estrenadas_saga
ORDER BY fecha_estreno ASC;

-- 2. Resumen por saga: cantidad de peliculas, recaudacion total y duracion promedio (usando la vista)
SELECT *
FROM vista_resumen_saga
ORDER BY recaudacion_total DESC;

-- 3. Proximos estrenos (usando la vista)
SELECT *
FROM vista_proximos_estrenos_saga
ORDER BY fecha_estreno ASC;

-- 4. Saga con mayor recaudacion total (filtrando la vista de resumen)
SELECT *
FROM vista_resumen_saga
ORDER BY recaudacion_total DESC
LIMIT 1;

-- 5. Peliculas estrenadas con recaudacion superior al promedio general (usando la vista de estrenadas)
SELECT
    titulo,
    saga,
    recaudacion_millones
FROM vista_peliculas_estrenadas_saga
WHERE recaudacion_millones > (
    SELECT AVG(recaudacion_millones) FROM vista_peliculas_estrenadas_saga
)
ORDER BY recaudacion_millones DESC;

-- 6. Cantidad de proximos estrenos a partir de la fecha actual (usando la vista)
SELECT COUNT(*) AS total_proximos_estrenos
FROM vista_proximos_estrenos_saga
WHERE fecha_estreno > CURDATE();
