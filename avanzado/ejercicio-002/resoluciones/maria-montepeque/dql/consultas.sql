-- avanzado/ejercicio-002 - maria-montepeque
USE campuslands_mysql;

-- 1. Resumen de una escuadra con partidas jugadas
CALL sp_resumen_escuadra_br('Escuadra Fenix');

-- 2. Resumen de una escuadra SIN partidas jugadas (debe mostrar 0 partidas,
--    0 puntos y mejor_posicion en NULL, gracias al LEFT JOIN + COALESCE del procedimiento)
CALL sp_resumen_escuadra_br('Vortice Digital');

-- 3. Top 3 escuadras por puntos totales (SQL dinamico con LIMIT parametrizado)
CALL sp_top_escuadras_br(3);

-- 4. Ranking completo de las 6 escuadras (mismo procedimiento, distinto parametro)
CALL sp_top_escuadras_br(6);

-- 5. Verificar que las 10 partidas se cargaron correctamente via el procedimiento
SELECT COUNT(*) AS total_partidas_cargadas
FROM partidas_battle_royale_sp;

-- 6. Listado completo de partidas con el nombre de su escuadra (consulta directa
--    de verificacion, para confirmar que los datos insertados por el
--    procedimiento son consistentes)
SELECT
    e.nombre AS escuadra,
    p.mapa,
    p.posicion_final,
    p.puntos_obtenidos
FROM partidas_battle_royale_sp AS p
JOIN escuadras_battle_royale_sp AS e ON e.id = p.escuadra_id
ORDER BY e.nombre, p.fecha_partida;
