-- DDL: Esquema y Stored Procedures para Ranking Battle Royale
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP PROCEDURE IF EXISTS registrar_resultado_partida;
DROP TABLE IF EXISTS historial_partidas;
DROP TABLE IF EXISTS jugadores_br;

-- Tabla de Jugadores de Battle Royale
CREATE TABLE jugadores_br (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(30) NOT NULL UNIQUE,
    rango VARCHAR(20) NOT NULL DEFAULT 'Bronce',
    puntos_totales INT NOT NULL DEFAULT 0 CHECK (puntos_totales >= 0),
    bajas_totales INT NOT NULL DEFAULT 0 CHECK (bajas_totales >= 0),
    partidas_jugadas INT NOT NULL DEFAULT 0 CHECK (partidas_jugadas >= 0),
    victorias INT NOT NULL DEFAULT 0 CHECK (victorias >= 0),
    estado ENUM('activo', 'baneado') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB;

-- Tabla de Historial de Partidas
CREATE TABLE historial_partidas (
    partida_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    posicion_final INT NOT NULL CHECK (posicion_final >= 1),
    bajas_partida INT NOT NULL DEFAULT 0 CHECK (bajas_partida >= 0),
    puntos_obtenidos INT NOT NULL CHECK (puntos_obtenidos >= 0),
    fecha_partida DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (jugador_id) REFERENCES jugadores_br(jugador_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Procedimiento Almacenado: Registrar Partida y Actualizar Stats/Rango
DELIMITER //
CREATE PROCEDURE registrar_resultado_partida(
    IN p_jugador_id INT,
    IN p_posicion INT,
    IN p_bajas INT
)
BEGIN
    DECLARE v_puntos INT DEFAULT 0;
    
    -- Cálculo de puntos: (Bajas * 10) + Bonus por posición (Victoria = +100, Top 5 = +50, Top 10 = +20)
    SET v_puntos = (p_bajas * 10) + 
        CASE 
            WHEN p_posicion = 1 THEN 100
            WHEN p_posicion <= 5 THEN 50
            WHEN p_posicion <= 10 THEN 20
            ELSE 5
        END;
        
    -- Insertar en el historial
    INSERT INTO historial_partidas (jugador_id, posicion_final, bajas_partida, puntos_obtenidos)
    VALUES (p_jugador_id, p_posicion, p_bajas, v_puntos);
    
    -- Actualizar acumulados del jugador
    UPDATE jugadores_br
    SET puntos_totales = puntos_totales + v_puntos,
        bajas_totales = bajas_totales + p_bajas,
        partidas_jugadas = partidas_jugadas + 1,
        victorias = victorias + IF(p_posicion = 1, 1, 0)
    WHERE jugador_id = p_jugador_id;
    
    -- Actualizar Rango según Puntos Totales
    UPDATE jugadores_br
    SET rango = CASE 
        WHEN puntos_totales >= 500 THEN 'Depredador'
        WHEN puntos_totales >= 300 THEN 'Diamante'
        WHEN puntos_totales >= 150 THEN 'Oro'
        WHEN puntos_totales >= 50 THEN 'Plata'
        ELSE 'Bronce'
    END
    WHERE jugador_id = p_jugador_id;
END //
DELIMITER ;
