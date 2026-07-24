-- basico/ejercicio-009 - maria-montepeque
USE campuslands_mysql;

-- 1. Listado final de peleadores (confirma que los de prueba y el descalificado ya no estan)
SELECT
    nombre,
    categoria_peso,
    gimnasio,
    estado
FROM peleadores_kickboxing
ORDER BY nombre ASC;

-- 2. Confirmar que no quedan registros de prueba
SELECT COUNT(*) AS registros_prueba_restantes
FROM peleadores_kickboxing
WHERE gimnasio = 'Gimnasio QA';

-- 3. Ranking de peleadores por peleas ganadas
SELECT
    nombre,
    gimnasio,
    peleas_ganadas
FROM peleadores_kickboxing
ORDER BY peleas_ganadas DESC
LIMIT 5;

-- 4. Peleadores por categoria de peso
SELECT
    categoria_peso,
    COUNT(*) AS total_peleadores
FROM peleadores_kickboxing
GROUP BY categoria_peso
ORDER BY total_peleadores DESC;

-- 5. Efectividad (peleas ganadas vs total de peleas) por peleador
SELECT
    nombre,
    peleas_ganadas,
    peleas_perdidas,
    ROUND(peleas_ganadas / (peleas_ganadas + peleas_perdidas) * 100, 2) AS pct_efectividad
FROM peleadores_kickboxing
ORDER BY pct_efectividad DESC;

-- 6. Conteo de peleadores por estado y gimnasio
SELECT
    gimnasio,
    estado,
    COUNT(*) AS total_peleadores
FROM peleadores_kickboxing
GROUP BY gimnasio, estado
ORDER BY gimnasio, estado;
