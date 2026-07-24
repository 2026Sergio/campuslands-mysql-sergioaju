-- basico/ejercicio-015 - maria-montepeque
USE campuslands_mysql;

-- 1. Juegos con el nombre de su desarrolladora, ordenados por precio
SELECT
    j.titulo,
    d.nombre AS desarrolladora,
    j.genero,
    j.precio
FROM juegos_biblioteca_gamer AS j
JOIN desarrolladoras_biblioteca_gamer AS d ON j.desarrolladora_id = d.id
ORDER BY j.precio DESC;

-- 2. Cantidad de juegos por desarrolladora
SELECT
    d.nombre AS desarrolladora,
    COUNT(*) AS total_juegos
FROM desarrolladoras_biblioteca_gamer AS d
JOIN juegos_biblioteca_gamer AS j ON j.desarrolladora_id = d.id
GROUP BY d.nombre
ORDER BY total_juegos DESC;

-- 3. Horas jugadas totales por desarrolladora
SELECT
    d.nombre AS desarrolladora,
    SUM(j.horas_jugadas) AS horas_totales
FROM desarrolladoras_biblioteca_gamer AS d
JOIN juegos_biblioteca_gamer AS j ON j.desarrolladora_id = d.id
GROUP BY d.nombre
ORDER BY horas_totales DESC;

-- 4. Juegos completados con su desarrolladora
SELECT
    j.titulo,
    d.nombre AS desarrolladora,
    j.fecha_compra
FROM juegos_biblioteca_gamer AS j
JOIN desarrolladoras_biblioteca_gamer AS d ON j.desarrolladora_id = d.id
WHERE j.estado = 'completado'
ORDER BY j.fecha_compra ASC;

-- 5. Top 3 juegos mas caros con su desarrolladora y pais de origen
SELECT
    j.titulo,
    d.nombre AS desarrolladora,
    d.pais,
    j.precio
FROM juegos_biblioteca_gamer AS j
JOIN desarrolladoras_biblioteca_gamer AS d ON j.desarrolladora_id = d.id
ORDER BY j.precio DESC
LIMIT 3;

-- 6. Cantidad de generos distintos que desarrolla cada estudio
SELECT
    d.nombre AS desarrolladora,
    d.pais,
    COUNT(DISTINCT j.genero) AS generos_distintos
FROM desarrolladoras_biblioteca_gamer AS d
JOIN juegos_biblioteca_gamer AS j ON j.desarrolladora_id = d.id
GROUP BY d.nombre, d.pais
ORDER BY generos_distintos DESC;
