USE campuslands_mysql;

DROP PROCEDURE IF EXISTS obtenerRankingPorRango;
DROP PROCEDURE IF EXISTS obtenerJugadoresPorVictorias;
DROP PROCEDURE IF EXISTS actualizarPuntosJugador;
DROP PROCEDURE IF EXISTS obtenerTopJugadores;
DROP PROCEDURE IF EXISTS obtenerEstadisticasRango;

DELIMITER $$

CREATE PROCEDURE obtenerRankingPorRango(IN rango_buscado VARCHAR(50))
BEGIN
    SELECT
        id_jugador,
        nombre_jugador,
        rango,
        puntos,
        partidas_jugadas,
        victorias,
        porcentaje_victoria,
        fecha_actualizacion
    FROM rankingBattleRoyale
    WHERE rango = rango_buscado
    ORDER BY puntos DESC;
END $$

CREATE PROCEDURE obtenerJugadoresPorVictorias(IN minimo_victorias INT)
BEGIN
    SELECT
        nombre_jugador,
        rango,
        puntos,
        victorias,
        porcentaje_victoria
    FROM rankingBattleRoyale
    WHERE victorias >= minimo_victorias
    ORDER BY victorias DESC, puntos DESC;
END $$

CREATE PROCEDURE actualizarPuntosJugador(
    IN jugador_id INT,
    IN nuevos_puntos INT
)
BEGIN
    UPDATE rankingBattleRoyale
    SET puntos = nuevos_puntos,
        fecha_actualizacion = CURDATE()
    WHERE id_jugador = jugador_id;
END $$

CREATE PROCEDURE obtenerTopJugadores(IN cantidad_jugadores INT)
BEGIN
    SELECT
        id_jugador,
        nombre_jugador,
        rango,
        puntos,
        victorias,
        porcentaje_victoria
    FROM rankingBattleRoyale
    ORDER BY puntos DESC
    LIMIT cantidad_jugadores;
END $$

CREATE PROCEDURE obtenerEstadisticasRango(IN rango_buscado VARCHAR(50))
BEGIN
    SELECT
        rango,
        COUNT(*) AS cantidad_jugadores,
        AVG(puntos) AS promedio_puntos,
        MAX(puntos) AS mayor_puntaje,
        MIN(puntos) AS menor_puntaje,
        SUM(victorias) AS total_victorias
    FROM rankingBattleRoyale
    WHERE rango = rango_buscado
    GROUP BY rango;
END $$

DELIMITER ;

CALL obtenerRankingPorRango('Diamante');

CALL obtenerJugadoresPorVictorias(150);

CALL actualizarPuntosJugador(1, 10000);

CALL obtenerTopJugadores(5);

CALL obtenerEstadisticasRango('Maestro');