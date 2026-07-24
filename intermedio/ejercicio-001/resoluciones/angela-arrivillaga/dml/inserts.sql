-- insercion de datos de prueba para torneo moba
USE campuslands_mysql;

-- agregamos 4 equipos
INSERT INTO equipos (nombre, region, estado) VALUES
('dragones del sur', 'latam', 'activo'),
('sombras nocturnas', 'na', 'activo'),
('titanes de fuego', 'latam', 'activo'),
('furia marina', 'eu', 'eliminado');

-- agregamos 8 jugadores vinculados a los equipos
INSERT INTO jugadores (equipo_id, nickname, rol, puntos) VALUES
(1, 'vortex', 'mid', 1500.50),
(1, 'shadow', 'adc', 1850.00),
(2, 'blaze', 'top', 1200.00),
(2, 'frost', 'support', 980.25),
(3, 'titan_x', 'jungla', 2100.00),
(3, 'viper', 'mid', 1650.75),
(4, 'kraken', 'top', 800.00),
(4, 'storm', 'adc', 750.50);