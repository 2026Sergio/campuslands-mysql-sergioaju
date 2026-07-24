-- DQL: 5 Consultas con INNER JOIN
USE campuslands_mysql;

-- 1. Reporte completo de Jugadores y sus Equipos
SELECT 
    j.nickname,
    j.rol,
    e.nombre AS equipo,
    e.region,
    CONCAT('$ ', FORMAT(j.salario_mensual, 2)) AS salario
FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.equipo_id
ORDER BY e.nombre ASC;

-- 2. Masa Salarial Total y Cantidad de Jugadores por Equipo
SELECT 
    e.nombre AS equipo,
    COUNT(j.jugador_id) AS total_jugadores,
    CONCAT('$ ', FORMAT(SUM(j.salario_mensual), 2)) AS inversion_salarios,
    CONCAT('$ ', FORMAT(AVG(j.salario_mensual), 2)) AS salario_promedio
FROM equipos e
INNER JOIN jugadores j ON e.equipo_id = j.equipo_id
GROUP BY e.equipo_id, e.nombre
ORDER BY SUM(j.salario_mensual) DESC;

-- 3. Jugadores titulares de la región LATAM
SELECT 
    j.nickname,
    j.rol,
    e.nombre AS equipo,
    e.patrocinador
FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.equipo_id
WHERE e.region = 'LATAM' AND j.estado = 'titular'
ORDER BY j.nickname ASC;

-- 4. Promedio de partidas jugadas por rol en cada equipo
SELECT 
    e.nombre AS equipo,
    j.rol,
    ROUND(AVG(j.partidas_jugadas), 0) AS promedio_partidas
FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.equipo_id
GROUP BY e.nombre, j.rol
ORDER BY promedio_partidas DESC;

-- 5. Top 3 Jugadores con mayor salario y su información de equipo
SELECT 
    j.nickname,
    e.nombre AS equipo,
    e.region,
    CONCAT('$ ', FORMAT(j.salario_mensual, 2)) AS salario
FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.equipo_id
ORDER BY j.salario_mensual DESC
LIMIT 3;
