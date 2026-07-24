USE db_battle_royale_procs;

-- Insertar clanes (mínimo necesario para la relación)
INSERT INTO clanes (nombre, region) VALUES
('Shadow Phantoms', 'Norteamérica'),
('Apex Predators', 'Europa'),
('Ghost Squad', 'Latinoamérica'),
('Lone Wolves', 'Asia');

-- Insertar jugadores (mínimo 8 registros requeridos)
INSERT INTO jugadores (alias, eliminaciones, puntos_ranking, id_clan) VALUES
('SniperKing', 45, 2500.50, 1),
('ShadowGhost', 38, 2300.00, 1),
('Vortex', 52, 2800.75, 2),
('BlazeRunner', 29, 1950.25, 2),
('Titanium', 41, 2450.00, 3),
('VenomStrike', 33, 2100.80, 3),
('CyberNinja', 60, 3100.00, NULL),
('NeonValkyrie', 47, 2750.40, NULL),
('StormRider', 25, 1800.00, 3),
('AlphaWolf', 55, 2950.10, 2);

-- Creación de Procedimientos Almacenados (Stored Procedures)
DELIMITER //

-- Procedimiento 1: Registrar un nuevo jugador validando puntos y clan
CREATE PROCEDURE sp_registrar_jugador(
    IN p_alias VARCHAR(40),
    IN p_eliminaciones INT,
    IN p_puntos DECIMAL(6,2),
    IN p_id_clan INT
)
BEGIN
    INSERT INTO jugadores (alias, eliminaciones, puntos_ranking, id_clan) 
    VALUES (p_alias, p_eliminaciones, p_puntos, p_id_clan);
END //

-- Procedimiento 2: Actualizar el puntaje de ranking de un jugador por su ID
CREATE PROCEDURE sp_actualizar_puntos(
    IN p_id_jugador INT,
    IN p_nuevos_puntos DECIMAL(6,2)
)
BEGIN
    UPDATE jugadores 
    SET puntos_ranking = p_nuevos_puntos 
    WHERE id = p_id_jugador;
END //

DELIMITER ;