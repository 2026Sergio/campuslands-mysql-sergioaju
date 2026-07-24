-- Consultas base y Procedimientos Almacenados.
USE campuslands_mysql;

-- 1. Creacion del Procedimiento Almacenado para registrar una partida y actualizar puntos
DELIMITER //
CREATE PROCEDURE RegistrarPartidaBattleRoyale(IN p_jugador_id INT, IN p_posicion INT, IN p_eliminaciones INT)
BEGIN
  DECLARE v_puntos_calculados INT;
  SET v_puntos_calculados = (p_eliminaciones * 15) + (100 - p_posicion);
  INSERT INTO avanzado_ejercicio_002_partidas (jugador_id, posicion, eliminaciones, puntos_obtenidos) VALUES (p_jugador_id, p_posicion, p_eliminaciones, v_puntos_calculados);
  UPDATE avanzado_ejercicio_002_jugadores SET puntos_rango = puntos_rango + v_puntos_calculados WHERE id = p_jugador_id;
END //
DELIMITER ;

-- 2. Estado del jugador 'NinjaPro' (ID 1) ANTES de ejecutar el procedimiento
SELECT nickname, puntos_rango 
    FROM avanzado_ejercicio_002_jugadores 
    WHERE id = 1;

-- 3. Ejecucion del Procedimiento Almacenado: NinjaPro (ID 1) queda 1ro con 10 eliminaciones
CALL RegistrarPartidaBattleRoyale(1, 1, 10);

-- 4. Estado del jugador 'NinjaPro' (ID 1) DESPUES de ejecutar el procedimiento
SELECT nickname, puntos_rango 
    FROM avanzado_ejercicio_002_jugadores 
    WHERE id = 1;

-- 5. Top 5 jugadores del ranking general ordenados por puntos_rango acumulados
SELECT nickname, nivel, puntos_rango 
    FROM avanzado_ejercicio_002_jugadores 
    ORDER BY puntos_rango 
    DESC LIMIT 5;