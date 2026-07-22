-- intermedio/ejercicio-011 - maria-montepeque
USE campuslands_mysql;

INSERT INTO jugadores_pingpong_intermedio
    (nombre, edad, categoria, ranking_puntos, partidos_jugados, partidos_ganados, sets_favor, sets_contra)
VALUES
    ('Kairo Spin', 27, 'adulto', 1850, 30, 26, 88, 42),
    ('Zara Topspin', 24, 'adulto', 1780, 28, 22, 79, 51),
    ('Rex Smash', 16, 'juvenil', 1600, 20, 20, 60, 18),
    ('Luna Slice', 15, 'juvenil', 1420, 18, 10, 45, 40),
    ('Mika Block', 11, 'infantil', 1100, 10, 6, 24, 20),
    ('Tahoe Drive', 52, 'veterano', 1500, 25, 15, 55, 48),
    ('Skye Chop', 30, 'adulto', 1690, 22, 17, 58, 33),
    ('Byte Loop', 9, 'infantil', 1050, 8, 3, 15, 22),
    ('Pixel Serve', 61, 'veterano', 1300, 15, 5, 20, 38),
    ('Nova Rally', 17, 'juvenil', 1550, 19, 14, 50, 34);
