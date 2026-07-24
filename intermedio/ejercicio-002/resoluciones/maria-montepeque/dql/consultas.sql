-- intermedio/ejercicio-002 - maria-montepeque
USE campuslands_mysql;

-- 1. Todas las escuadras con sus partidas (LEFT JOIN: incluye las que no han jugado)
SELECT
    e.nombre AS escuadra,
    p.mapa,
    p.posicion_final,
    p.puntos_obtenidos
FROM escuadras_battle_royale AS e
LEFT JOIN partidas_battle_royale AS p ON p.escuadra_id = e.id
ORDER BY e.nombre, p.fecha_partida;

-- 2. Escuadras que todavia no han disputado ninguna partida
SELECT
    e.nombre AS escuadra,
    e.plataforma,
    e.fecha_creacion
FROM escuadras_battle_royale AS e
LEFT JOIN partidas_battle_royale AS p ON p.escuadra_id = e.id
WHERE p.id IS NULL;

-- 3. Cantidad de partidas jugadas por escuadra (0 para las que no tienen)
SELECT
    e.nombre AS escuadra,
    COUNT(p.id) AS total_partidas
FROM escuadras_battle_royale AS e
LEFT JOIN partidas_battle_royale AS p ON p.escuadra_id = e.id
GROUP BY e.nombre
ORDER BY total_partidas DESC;

-- 4. Puntos totales acumulados por escuadra (0 para las que no tienen partidas)
SELECT
    e.nombre AS escuadra,
    COALESCE(SUM(p.puntos_obtenidos), 0) AS puntos_totales
FROM escuadras_battle_royale AS e
LEFT JOIN partidas_battle_royale AS p ON p.escuadra_id = e.id
GROUP BY e.nombre
ORDER BY puntos_totales DESC;

-- 5. Mejor posicion final obtenida por cada escuadra (NULL si no ha jugado)
SELECT
    e.nombre AS escuadra,
    MIN(p.posicion_final) AS mejor_posicion
FROM escuadras_battle_royale AS e
LEFT JOIN partidas_battle_royale AS p ON p.escuadra_id = e.id
GROUP BY e.nombre
ORDER BY mejor_posicion ASC;

-- 6. Fecha de la ultima partida disputada por cada escuadra (NULL si no ha jugado)
SELECT
    e.nombre AS escuadra,
    MAX(p.fecha_partida) AS ultima_partida
FROM escuadras_battle_royale AS e
LEFT JOIN partidas_battle_royale AS p ON p.escuadra_id = e.id
GROUP BY e.nombre
ORDER BY ultima_partida DESC;
