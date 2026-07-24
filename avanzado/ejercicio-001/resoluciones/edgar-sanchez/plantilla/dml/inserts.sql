-- Inserción de Equipos
INSERT INTO equipos (nombre_equipo, tag, presupuesto_fichajes, estado) VALUES
('T1 Esports', 'T1', 500000.00, 'Activo'),
('G2 Esports', 'G2', 350000.00, 'Activo'),
('Cloud9', 'C9', 200000.00, 'Activo'),
('Fnatic', 'FNC', 180000.00, 'Activo'),
('Agente Libre Org', 'FREE', 0.00, 'Inactivo');

-- Inserción de Jugadores (20 registros)
INSERT INTO jugadores (equipo_id, nickname, rol, clausula_rescision, salario_mensual, estado_fichable) VALUES
(1, 'Faker', 'Mid', 250000.00, 20000.00, FALSE),
(1, 'Zeus', 'Top', 120000.00, 10000.00, TRUE),
(1, 'Oner', 'Jungle', 100000.00, 9500.00, TRUE),
(1, 'Gumayusi', 'ADC', 110000.00, 10500.00, TRUE),
(1, 'Keria', 'Support', 130000.00, 11000.00, TRUE),
(2, 'Caps', 'Mid', 150000.00, 15000.00, TRUE),
(2, 'BrokenBlade', 'Top', 80000.00, 8000.00, TRUE),
(2, 'Yike', 'Jungle', 70000.00, 7000.00, TRUE),
(2, 'Hans Sama', 'ADC', 90000.00, 8500.00, TRUE),
(2, 'Mikyx', 'Support', 8500.00, 8200.00, TRUE),
(3, 'Blaber', 'Jungle', 75000.00, 7500.00, TRUE),
(3, 'Jojopyun', 'Mid', 95000.00, 9000.00, TRUE),
(3, 'Berserker', 'ADC', 100000.00, 9500.00, TRUE),
(4, 'Humanoid', 'Mid', 85000.00, 8000.00, TRUE),
(4, 'Razork', 'Jungle', 80000.00, 7800.00, TRUE),
(NULL, 'RookieFree', 'Mid', 40000.00, 4000.00, TRUE),
(NULL, 'ScoutFree', 'Mid', 50000.00, 5000.00, TRUE),
(NULL, 'ChovyFree', 'Mid', 180000.00, 16000.00, TRUE),
(NULL, 'ViperFree', 'ADC', 16000.00, 14000.00, TRUE),
(NULL, 'BeryLFree', 'Support', 60000.00, 6000.00, TRUE);