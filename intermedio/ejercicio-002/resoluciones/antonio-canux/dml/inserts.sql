-- Datos de practica para ranking battle royale (Escuadrones).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_002_escuadrones (nombre, region) VALUES
('Alpha Strike', 'NA'),
('Bravo Six', 'EU'),
('Ghost Vanguard', 'LATAM'),
('Lone Wolves', 'NA');

INSERT INTO intermedio_ejercicio_002_jugadores (nickname, nivel, escuadron_id) VALUES
('TangoDown', 45, 1),
('EagleEye', 50, 1),
('MedicBro', 30, 2),
('SilentAssassin', 80, NULL),
('RushB', 25, 3),
('SoloKing', 99, NULL);