-- basico/ejercicio-007 - maria-montepeque
USE campuslands_mysql;

INSERT INTO equipos_liga_futbol
    (equipo, ciudad, partidos_jugados, victorias, empates, derrotas, goles_favor, goles_contra, puntos, estado)
VALUES
    ('Aguilas Doradas', 'Ciudad Norte', 20, 12, 5, 3, 38, 20, 41, 'activo'),
    ('Tigres del Sur', 'Ciudad Sur', 20, 11, 6, 3, 35, 18, 39, 'activo'),
    ('Leones FC', 'Ciudad Este', 20, 10, 4, 6, 30, 25, 34, 'activo'),
    ('Halcones United', 'Ciudad Oeste', 20, 9, 5, 6, 28, 24, 32, 'activo'),
    ('Panteras FC', 'Ciudad Norte', 20, 8, 7, 5, 26, 22, 31, 'activo'),
    ('Cobras Real', 'Ciudad Sur', 20, 7, 6, 7, 24, 26, 27, 'activo'),
    ('Toros Bravos', 'Ciudad Este', 20, 6, 5, 9, 20, 30, 23, 'sancionado'),
    ('Lobos FC', 'Ciudad Oeste', 20, 5, 8, 7, 18, 24, 23, 'activo'),
    ('Delfines Azules', 'Ciudad Norte', 20, 4, 6, 10, 16, 32, 18, 'activo'),
    ('Escorpiones', 'Ciudad Sur', 20, 3, 4, 13, 14, 38, 13, 'activo');
