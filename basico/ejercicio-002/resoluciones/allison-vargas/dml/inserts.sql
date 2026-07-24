-- DML: Carga de 8 registros con diversidad de tipos de datos
USE campuslands_mysql;

INSERT INTO estadisticas_br 
(tag_jugador, nivel_cuenta, porcentaje_precisión, puntuacion_temporada, modo_preferido, pase_batalla_activo, estado) 
VALUES
('AlphaHunter#1', 85, 48.50, 3420.50, 'Squads', TRUE, 'activo'),
('PixelValkyrie#2', 120, 62.15, 5100.00, 'Solo', TRUE, 'activo'),
('GhostRider#3', 42, 31.80, 1250.75, 'Duos', FALSE, 'activo'),
('StormTrooper#4', 15, 18.20, 450.00, 'Squads', FALSE, 'inactivo'),
('NeonNinja#5', 98, 55.40, 4120.25, 'Solo', TRUE, 'activo'),
('ShadowSniper#6', 150, 78.90, 6890.00, 'Solo', TRUE, 'activo'),
('ToxicPlayer#7', 30, 22.10, 890.00, 'Duos', FALSE, 'penalizado'),
('ShieldMaiden#8', 64, 41.30, 2300.50, 'Squads', TRUE, 'activo');
