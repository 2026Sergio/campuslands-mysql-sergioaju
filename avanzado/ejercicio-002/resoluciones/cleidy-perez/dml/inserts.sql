-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

-- Inserción de 8 jugadores
INSERT INTO jugadores (nickname, region, nivel, estado) VALUES
('ShadowNinja', 'LATAM Norte', 5, 'activo'),
('CyberViper', 'LATAM Sur', 3, 'activo'),
('PhoenixRider', 'NA Este', 12, 'activo'),
('GamerGirl_99', 'LATAM Norte', 8, 'activo'),
('PixelKing', 'Europa', 1, 'inactivo'),
('TitanSmash', 'NA Este', 4, 'activo'),
('GhostRider', 'LATAM Sur', 2, 'suspendido'),
('NoobMaster', 'LATAM Norte', 1, 'activo');

-- Inserción de partidas iniciales
INSERT INTO partidas (id_jugador, categoria, puntaje, posicion_final) VALUES
(1, 'Oro', 1450.50, 2),
(1, 'Platino', 2200.00, 1),
(2, 'Bronce', 850.00, 15),
(3, 'Diamante', 3200.75, 1),
(3, 'Diamante', 3450.00, 1),
(4, 'Platino', 1980.25, 3),
(6, 'Plata', 1120.00, 8),
(6, 'Oro', 1600.00, 4);