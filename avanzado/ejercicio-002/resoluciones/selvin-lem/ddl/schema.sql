CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP PROCEDURE IF EXISTS registrar_resultado_partida;
DROP PROCEDURE IF EXISTS obtener_estadisticas_jugador;
DROP TABLE IF EXISTS jugadores_battle_royale;

CREATE TABLE jugadores_battle_royale (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  nombre_jugador VARCHAR(50) NOT NULL UNIQUE,
  plataforma ENUM('pc','consola','movil') NOT NULL,
  partidas_jugadas INT UNSIGNED NOT NULL DEFAULT 0,
  victorias INT UNSIGNED NOT NULL DEFAULT 0,
  puntos_ranking INT NOT NULL DEFAULT 0,
  estado ENUM('activo','inactivo') NOT NULL DEFAULT 'activo'
);

DELIMITER //

-- Procedimiento 1: registra el resultado de una partida y actualiza puntos
CREATE PROCEDURE registrar_resultado_partida (
  IN p_id_jugador INT,
  IN p_posicion_final SMALLINT,
  IN p_kills TINYINT
)
BEGIN
  DECLARE v_puntos_ganados INT DEFAULT 0;

  -- Regla de puntaje: victoria da bono fijo + puntos por kill
  IF p_posicion_final = 1 THEN
    SET v_puntos_ganados = 50 + (p_kills * 2);
  ELSE
    SET v_puntos_ganados = (p_kills * 2) - p_posicion_final;
  END IF;

  IF v_puntos_ganados < 0 THEN
    SET v_puntos_ganados = 0;
  END IF;

  UPDATE jugadores_battle_royale
  SET partidas_jugadas = partidas_jugadas + 1,
      victorias = victorias + IF(p_posicion_final = 1, 1, 0),
      puntos_ranking = puntos_ranking + v_puntos_ganados
  WHERE id_jugador = p_id_jugador;
END //

-- Procedimiento 2: devuelve estadisticas de un jugador via parametros OUT
CREATE PROCEDURE obtener_estadisticas_jugador (
  IN p_id_jugador INT,
  OUT p_nombre VARCHAR(50),
  OUT p_win_rate DECIMAL(5,2),
  OUT p_puntos INT
)
BEGIN
  SELECT
    nombre_jugador,
    IF(partidas_jugadas = 0, 0.00, (victorias / partidas_jugadas) * 100),
    puntos_ranking
  INTO p_nombre, p_win_rate, p_puntos
  FROM jugadores_battle_royale
  WHERE id_jugador = p_id_jugador;
END //

DELIMITER ;