-- intermedio/ejercicio-001 - maria-montepeque
USE campuslands_mysql;

-- 1. Jugadores con el nombre y region de su escuadra (INNER JOIN)
SELECT
    j.gamer_tag,
    e.nombre AS escuadra,
    e.region,
    j.rol
FROM jugadores_escuadra_moba AS j
INNER JOIN escuadras_torneo_moba AS e ON j.escuadra_id = e.id
ORDER BY e.nombre, j.gamer_tag;

-- 2. Jugadores de rol "medio" con su escuadra
SELECT
    j.gamer_tag,
    e.nombre AS escuadra,
    j.kda
FROM jugadores_escuadra_moba AS j
INNER JOIN escuadras_torneo_moba AS e ON j.escuadra_id = e.id
WHERE j.rol = 'medio'
ORDER BY j.kda DESC;

-- 3. KDA promedio por escuadra
SELECT
    e.nombre AS escuadra,
    e.region,
    ROUND(AVG(j.kda), 2) AS kda_promedio
FROM escuadras_torneo_moba AS e
INNER JOIN jugadores_escuadra_moba AS j ON j.escuadra_id = e.id
GROUP BY e.nombre, e.region
ORDER BY kda_promedio DESC;

-- 4. Top 5 jugadores con mas victorias, junto a su escuadra
SELECT
    j.gamer_tag,
    e.nombre AS escuadra,
    j.victorias
FROM jugadores_escuadra_moba AS j
INNER JOIN escuadras_torneo_moba AS e ON j.escuadra_id = e.id
ORDER BY j.victorias DESC
LIMIT 5;

-- 5. Cantidad de jugadores activos por escuadra
SELECT
    e.nombre AS escuadra,
    COUNT(*) AS jugadores_activos
FROM escuadras_torneo_moba AS e
INNER JOIN jugadores_escuadra_moba AS j ON j.escuadra_id = e.id
WHERE j.estado = 'activo'
GROUP BY e.nombre
ORDER BY jugadores_activos DESC;

-- 6. Jugadores de escuadras fundadas antes de 2021, con la fecha de fundacion
SELECT
    j.gamer_tag,
    e.nombre AS escuadra,
    e.fecha_fundacion
FROM jugadores_escuadra_moba AS j
INNER JOIN escuadras_torneo_moba AS e ON j.escuadra_id = e.id
WHERE e.fecha_fundacion < '2021-01-01'
ORDER BY e.fecha_fundacion ASC;
