DELIMITER //

CREATE PROCEDURE registrar_resultado_partida(
    IN p_jugador_id INT,
    IN p_posicion_final INT,
    IN p_bajas INT,
    IN p_puntos_cambio INT
)
BEGIN
    DECLARE v_nuevos_puntos INT;
    DECLARE v_nueva_division INT;
    DECLARE v_es_victoria INT DEFAULT 0;

    IF p_posicion_final = 1 THEN
        SET v_es_victoria = 1;
    END IF;

    INSERT INTO historial_partidas (jugador_id, posicion_final, bajas, puntos_ganados_perdidos)
    VALUES (p_jugador_id, p_posicion_final, p_bajas, p_puntos_cambio);

    SELECT GREATEST(0, puntos_mrr + p_puntos_cambio) INTO v_nuevos_puntos
    FROM jugadores
    WHERE jugador_id = p_jugador_id;

    SELECT division_id INTO v_nueva_division
    FROM divisiones
    WHERE v_nuevos_puntos BETWEEN puntos_minimos AND puntos_maximos
    LIMIT 1;

    UPDATE jugadores
    SET puntos_mrr = v_nuevos_puntos,
        partidas_jugadas = partidas_jugadas + 1,
        victorias = victorias + v_es_victoria,
        bajas_totales = bajas_totales + p_bajas,
        division_id = v_nueva_division
    WHERE jugador_id = p_jugador_id;
END //

CREATE PROCEDURE obtener_top_jugadores(
    IN p_limite INT
)
BEGIN
    SELECT 
        j.nickname,
        d.nombre_division,
        j.puntos_mrr,
        j.partidas_jugadas,
        j.victorias,
        j.bajas_totales,
        ROUND((j.victorias / NULLIF(j.partidas_jugadas, 0)) * 100, 2) AS porcentaje_victorias
    FROM jugadores j
    INNER JOIN divisiones d ON j.division_id = d.division_id
    ORDER BY j.puntos_mrr DESC
    LIMIT p_limite;
END //

DELIMITER ;

CALL registrar_resultado_partida(1, 1, 8, 150);
CALL registrar_resultado_partida(2, 45, 0, -30);
CALL registrar_resultado_partida(3, 1, 12, 200);

CALL obtener_top_jugadores(5);

SELECT 
    d.nombre_division,
    COUNT(j.jugador_id) AS total_jugadores,
    SUM(j.bajas_totales) AS bajas_acumuladas,
    MAX(j.puntos_mrr) AS puntaje_maximo
FROM divisiones d
LEFT JOIN jugadores j ON d.division_id = j.division_id
GROUP BY d.division_id, d.nombre_division;