-- DML: Inserción de 8 registros cruzados
USE campuslands_mysql;

-- Inserción de equipos
INSERT INTO equipos (nombre, region, patrocinador) VALUES
('Red Canids', 'LATAM', 'Red Bull'),
('KRÜ Esports', 'LATAM', 'Aorus'),
('Fnatic', 'EU', 'BMW'),
('T1', 'KR', 'Razer');

-- Inserción de jugadores con relación a equipos
INSERT INTO jugadores (equipo_id, nickname, rol, salario_mensual, partidas_jugadas, estado) VALUES
(1, 'FuriousOne', 'Mid', 2500.00, 42, 'titular'),
(1, 'WallProtector', 'Top', 2100.00, 38, 'titular'),
(2, 'KlausG', 'ADC', 3200.00, 50, 'titular'),
(2, 'Nagzet', 'Jungle', 2800.00, 45, 'titular'),
(3, 'Humanoid', 'Mid', 6500.00, 60, 'titular'),
(3, 'Razork', 'Jungle', 5800.00, 58, 'titular'),
(4, 'Faker', 'Mid', 12000.00, 85, 'titular'),
(4, 'Keria', 'Support', 9500.00, 80, 'titular');
