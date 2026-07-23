-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO jugadores (nickname, region, estado) VALUES
('ShadowNinja', 'LATAM Norte', 'activo'),
('CyberViper', 'LATAM Sur', 'activo'),
('PhoenixRider', 'NA Este', 'activo'),
('GamerGirl_99', 'LATAM Norte', 'activo'),
('PixelKing', 'Europa', 'inactivo'),
('TitanSmash', 'NA Este', 'activo'),
('GhostRider', 'LATAM Sur', 'suspendido'),
('NoobMaster', 'LATAM Norte', 'activo');


INSERT INTO partidas (id_jugador, categoria, puntaje, modo_juego) VALUES
(1, 'Oro', 1450.50, 'solo'),
(1, 'Platino', 2100.00, 'squad'),
(2, 'Bronce', 850.00, 'duo'),
(3, 'Diamante', 3200.75, 'solo'),
(3, 'Diamante', 3450.00, 'squad'),
(4, 'Platino', 1980.25, 'duo'),
(6, 'Plata', 1120.00, 'solo'),
(6, 'Oro', 1600.00, 'duo');
