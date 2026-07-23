USE campuslands_mysql;

DROP PROCEDURE IF EXISTS obtener_ranking;

DELIMITER //

CREATE PROCEDURE obtener_ranking()
BEGIN
    SELECT
        nombre_jugador,
        nickname,
        nivel,
        victorias,
        puntaje
    FROM jugadores_battle
    WHERE estado = 'Activo'
    ORDER BY puntaje DESC;
END //

DELIMITER ;


DROP PROCEDURE IF EXISTS buscar_por_nivel;

DELIMITER //

CREATE PROCEDURE buscar_por_nivel(IN nivel_minimo INT)
BEGIN
    SELECT
        nombre_jugador,
        nickname,
        nivel,
        puntaje
    FROM jugadores_battle
    WHERE nivel >= nivel_minimo
    ORDER BY nivel DESC;
END //

DELIMITER ;


DROP PROCEDURE IF EXISTS top_jugadores;

DELIMITER //

CREATE PROCEDURE top_jugadores(IN cantidad_jugadores INT)
BEGIN
    SELECT
        nombre_jugador,
        nickname,
        puntaje
    FROM jugadores_battle
    ORDER BY puntaje DESC
    LIMIT cantidad_jugadores;
END //

DELIMITER ;


DROP PROCEDURE IF EXISTS actualizar_puntaje;

DELIMITER //

CREATE PROCEDURE actualizar_puntaje(
    IN jugador_id INT,
    IN nuevo_puntaje DECIMAL(8,2)
)
BEGIN
    UPDATE jugadores_battle
    SET puntaje = nuevo_puntaje
    WHERE id_jugador = jugador_id;
END //

DELIMITER ;


CALL obtener_ranking();

CALL buscar_por_nivel(40);

CALL top_jugadores(5);

CALL actualizar_puntaje(3,8000);

SELECT *
FROM jugadores_battle;