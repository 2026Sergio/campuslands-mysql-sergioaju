-- campuslands mysql - avanzado ejercicio 002
-- creacion de tabla y procedimientos almacenados para ranking battle royale

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- desactivamos temporales de llaves foraneas por limpieza
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS jugadores_br;
DROP PROCEDURE IF EXISTS registrar_partida;
DROP PROCEDURE IF EXISTS obtener_top_jugadores;
SET FOREIGN_KEY_CHECKS = 1;

-- tabla principal: jugadores de battle royale
CREATE TABLE jugadores_br (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(100) NOT NULL UNIQUE,
    rango VARCHAR(50) NOT NULL DEFAULT 'Bronce',
    bajas_totales INT NOT NULL DEFAULT 0,
    puntos INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'suspendido', 'inactivo') NOT NULL DEFAULT 'activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- procedimiento 1: actualizar estadisticas de un jugador tras una partida
DELIMITER //
CREATE PROCEDURE registrar_partida(
    IN p_jugador_id INT,
    IN p_bajas INT,
    IN p_puntos_ganados INT
)
BEGIN
    UPDATE jugadores_br
    SET bajas_totales = bajas_totales + p_bajas,
        puntos = puntos + p_puntos_ganados
    WHERE id = p_jugador_id AND estado = 'activo';
END //
DELIMITER ;

-- procedimiento 2: obtener el top de jugadores por rango
DELIMITER //
CREATE PROCEDURE obtener_top_jugadores(
    IN p_rango VARCHAR(50),
    IN p_limite INT
)
BEGIN
    SELECT 
        nickname,
        rango,
        bajas_totales,
        puntos
    FROM jugadores_br
    WHERE rango = p_rango AND estado = 'activo'
    ORDER BY puntos DESC
    LIMIT p_limite;
END //
DELIMITER ;