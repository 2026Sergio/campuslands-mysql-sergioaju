-- basico/ejercicio-011 - maria-montepeque
USE campuslands_mysql;

INSERT INTO jugadores_pingpong
    (nombre, club, categoria, mano_dominante, ranking_puntos, partidos_jugados, partidos_ganados, estado, fecha_afiliacion)
VALUES
    ('Kairo Spin', 'Club Rebote', 'adulto', 'diestra', 1850, 30, 26, 'activo', '2024-02-10'),
    ('Zara Topspin', 'Club Rebote', 'adulto', 'zurda', 1780, 28, 22, 'activo', '2024-03-15'),
    ('Rex Smash', 'Paleta Rapida', 'juvenil', 'diestra', 1600, 20, 20, 'activo', '2025-01-05'),
    ('Luna Slice', 'Paleta Rapida', 'juvenil', 'zurda', 1420, 18, 10, 'activo', '2025-01-05'),
    ('Mika Block', 'Club Rebote', 'infantil', 'diestra', 1100, 10, 6, 'activo', '2025-06-20'),
    ('Tahoe Drive', 'Mesa Veloz', 'veterano', 'diestra', 1500, 25, 15, 'inactivo', '2023-05-11'),
    ('Skye Chop', 'Mesa Veloz', 'adulto', 'zurda', 1690, 22, 17, 'activo', '2024-07-01'),
    ('Byte Loop', 'Paleta Rapida', 'infantil', 'diestra', 1050, 8, 3, 'activo', '2026-01-14'),
    ('Pixel Serve', 'Mesa Veloz', 'veterano', 'diestra', 1300, 15, 5, 'inactivo', '2022-11-30'),
    ('Nova Rally', 'Club Rebote', 'juvenil', 'zurda', 1550, 19, 14, 'activo', '2025-04-08');
