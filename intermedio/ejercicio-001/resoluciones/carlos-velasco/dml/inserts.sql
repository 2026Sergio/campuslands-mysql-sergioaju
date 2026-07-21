USE campuslands_mysql;

INSERT INTO equipos
(nombre, region, entrenador, estado, fecha_registro)
VALUES
('Dragons', 'Norte', 'Carlos Ruiz', 'Activo', '2026-01-10'),
('Titans', 'Sur', 'Ana López', 'Activo', '2026-01-12'),
('Phoenix', 'Este', 'Luis Pérez', 'Activo', '2026-01-15'),
('Shadow', 'Oeste', 'María Díaz', 'Eliminado', '2026-01-18');

INSERT INTO jugadores
(nombre, nickname, rol, edad, puntaje, equipo_id)
VALUES
('Juan Pérez', 'DragonX', 'Top', 19, 95.50, 1),
('Luis Gómez', 'FireWolf', 'Jungla', 20, 89.30, 1),
('Ana Torres', 'TitanGirl', 'Mid', 18, 93.20, 2),
('Pedro López', 'TitanPro', 'ADC', 21, 85.40, 2),
('Sofía Díaz', 'PhoenixQueen', 'Support', 19, 91.70, 3),
('Miguel Castro', 'DarkMage', 'Mid', 22, 82.60, 3),
('Laura Ramos', 'ShadowGirl', 'ADC', 18, 78.50, 4),
('Carlos Méndez', 'NightKing', 'Top', 23, 75.80, 4);