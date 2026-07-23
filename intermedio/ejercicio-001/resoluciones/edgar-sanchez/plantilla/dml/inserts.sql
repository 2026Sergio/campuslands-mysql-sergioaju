-- Inserción de Equipos
INSERT INTO equipos (nombre_equipo, tag, region, fecha_creacion) VALUES
('T1 Gaming', 'T1', 'KR', '2019-02-25'),
('G2 Esports', 'G2', 'EUW', '2015-10-15'),
('Cloud9', 'C9', 'NA', '2013-01-08'),
('Top Esports', 'TES', 'CN', '2017-12-21'),
('KRÜ Esports', 'KRU', 'LAS', '2020-10-15');

-- Inserción de Jugadores (20 registros)
INSERT INTO jugadores (equipo_id, nickname, rol, kda_promedio, salario_mensual) VALUES
(1, 'Faker', 'Mid', 5.80, 15000.00),
(1, 'Zeus', 'Top', 4.10, 8500.00),
(1, 'Oner', 'Jungle', 4.50, 8000.00),
(1, 'Gumayusi', 'ADC', 5.20, 9500.00),
(1, 'Keria', 'Support', 6.10, 9000.00),
(2, 'Caps', 'Mid', 4.90, 11000.00),
(2, 'BrokenBlade', 'Top', 3.80, 7500.00),
(2, 'Yike', 'Jungle', 4.20, 6500.00),
(2, 'Hans Sama', 'ADC', 4.70, 8200.00),
(2, 'Mikyx', 'Support', 5.00, 7800.00),
(3, 'Blaber', 'Jungle', 3.90, 7000.00),
(3, 'Fudge', 'Top', 3.50, 6000.00),
(3, 'Jojopyun', 'Mid', 4.10, 8000.00),
(3, 'Berserker', 'ADC', 4.80, 7500.00),
(3, 'VULCAN', 'Support', 3.70, 5500.00),
(4, 'JackeyLove', 'ADC', 5.50, 13000.00),
(4, '369', 'Top', 4.30, 9000.00),
(4, 'Tian', 'Jungle', 4.00, 8800.00),
(4, 'Creme', 'Mid', 4.60, 7900.00),
(4, 'Meiko', 'Support', 5.10, 8500.00);