USE campuslands_mysql;

INSERT INTO equipos (nombre, region, fondo_premios, estado) VALUES
('Nexus Gaming', 'LATAM', 15000.00, 'activo'),
('Storm Esports', 'NA', 32000.00, 'activo'),
('Vanguard Arena', 'EU', 45000.00, 'activo'),
('Cyber Dragons', 'KR', 80000.00, 'activo'),
('Shadow Strikers', 'LATAM', 5000.00, 'activo'),
('Apex Predators', 'NA', 22000.00, 'activo'),
('Mythic Titans', 'EU', 12000.00, 'descalificado'),
('Void Hunters', 'KR', 0.00, 'activo');

INSERT INTO partidas (equipo_azul_id, equipo_rojo_id, ganador_id, duracion_segundos, fase) VALUES
(1, 2, 2, 2140, 'Fase de Grupos'),
(3, 4, 4, 1850, 'Fase de Grupos'),
(5, 6, 6, 2410, 'Fase de Grupos'),
(1, 5, 1, 1620, 'Fase de Grupos'),
(2, 4, 4, 2980, 'Cuartos de Final'),
(3, 6, 3, 2100, 'Cuartos de Final'),
(4, 3, 4, 3120, 'Semifinal'),
(1, 6, 6, 1950, 'Eliminatorias');

START TRANSACTION;

INSERT INTO transferencias_premios (equipo_origen_id, equipo_destino_id, monto, concepto)
VALUES (NULL, 4, 10000.00, 'Premio 1er Lugar Semifinal');

UPDATE equipos
SET fondo_premios = fondo_premios + 10000.00
WHERE equipo_id = 4 AND estado = 'activo';

COMMIT;
