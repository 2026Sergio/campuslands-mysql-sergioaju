-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

-- 1. Insertar Pilotos
INSERT INTO pilotos (alias, patrocinador, categoria, licencia_activa) VALUES
('ApexPredator', 'Nitrous Express', 'Pro', TRUE),
('GhostDrifter', 'Red Line Synthetic', 'Leyenda', TRUE),
('StreetKing', 'Independiente', 'Amateur', TRUE),
('NeonRider', 'Mishimoto', 'Pro', FALSE);

-- 2. Insertar Vehículos (Uso de CHAR(8), INT UNSIGNED y DECIMAL(6,2))
INSERT INTO vehiculos (vin_carreras, id_piloto, modelo, potencia_hp, peso_kg) VALUES
('RAC-1001', 1, 'Nissan GT-R R35', 600, 1740.50),
('RAC-1002', 2, 'Mazda RX-7 FD', 450, 1280.00),
('RAC-1003', 3, 'Honda Civic Type R', 320, 1380.25),
('RAC-1004', 4, 'Toyota Supra A80', 700, 1570.80);

-- 3. Insertar Telemetría con datos JSON, TIME y DATETIME
INSERT INTO telemetria_carrera (id_vehiculo, fecha_evento, tiempo_vuelta, velocidad_max_kmh, metricas_sensores) VALUES
(1, '2026-03-10 22:15:00', '00:01:24', 285.45, '{"presion_llantas_psi": 32.5, "temperatura_motor_c": 98.2, "nos_activado": true}'),
(1, '2026-03-10 22:30:00', '00:01:21', 298.10, '{"presion_llantas_psi": 33.0, "temperatura_motor_c": 102.5, "nos_activado": true}'),
(2, '2026-03-11 21:00:00', '00:01:20', 275.60, '{"presion_llantas_psi": 30.0, "temperatura_motor_c": 95.0, "nos_activado": false}'),
(3, '2026-03-11 21:15:00', '00:01:32', 240.20, '{"presion_llantas_psi": 31.2, "temperatura_motor_c": 92.4, "nos_activado": false}'),
(4, '2026-03-12 23:00:00', '00:01:19', 310.50, '{"presion_llantas_psi": 34.1, "temperatura_motor_c": 105.1, "nos_activado": true}');