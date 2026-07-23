-- Campuslands MySQL - avanzado ejercicio 002
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza de tablas existentes
DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS jugadores;

-- Tabla 1: Jugadores
CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    region VARCHAR(30) NOT NULL,
    nivel INT NOT NULL DEFAULT 1,
    estado ENUM('activo', 'inactivo', 'suspendido') NOT NULL DEFAULT 'activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabla 2: Partidas / Historial de Battle Royale
CREATE TABLE partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    puntaje DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    posicion_final INT NOT NULL,
    fecha_partida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_partidas_jugadores_adv 
        FOREIGN KEY (id_jugador) 
        REFERENCES jugadores(id_jugador) 
        ON DELETE CASCADE
);

-- ==============================================================================
-- PROCEDIMIENTOS ALMACENADOS (STORED PROCEDURES)
-- ==============================================================================

DELIMITER //

-- SP 1: Registrar una nueva partida y actualizar el nivel del jugador si supera 2000 pts
CREATE PROCEDURE sp_registrar_partida(
    IN p_id_jugador INT,
    IN p_categoria VARCHAR(50),
    IN p_puntaje DECIMAL(10,2),
    IN p_posicion INT
)
BEGIN
    INSERT INTO partidas (id_jugador, categoria, puntaje, posicion_final)
    VALUES (p_id_jugador, p_categoria, p_puntaje, p_posicion);

    -- Si el puntaje es alto, aumentamos nivel
    IF p_puntaje >= 2000.00 THEN
        UPDATE jugadores 
        SET nivel = nivel + 1 
        WHERE id_jugador = p_id_jugador;
    END IF;
END //

-- SP 2: Obtener ranking Top N por Región
CREATE PROCEDURE sp_obtener_ranking_region(
    IN p_region VARCHAR(30),
    IN p_top_limit INT
)
BEGIN
    SELECT 
        j.nickname,
        j.region,
        j.nivel,
        COALESCE(SUM(p.puntaje), 0) AS puntaje_total,
        COUNT(p.id_partida) AS total_partidas
    FROM jugadores j
    LEFT JOIN partidas p ON j.id_jugador = p.id_jugador
    WHERE j.region = p_region AND j.estado = 'activo'
    GROUP BY j.id_jugador, j.nickname, j.region, j.nivel
    ORDER BY puntaje_total DESC
    LIMIT p_top_limit;
END //

DELIMITER ;