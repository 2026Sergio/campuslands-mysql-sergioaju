-- intermedio/ejercicio-001 - maria-montepeque
USE campuslands_mysql;

INSERT INTO escuadras_torneo_moba
    (nombre, region, entrenador, fecha_fundacion)
VALUES
    ('Dragones Rojos', 'LATAM Norte', 'Camila Duarte', '2021-03-15'),
    ('Fenix Digital', 'LATAM Sur', 'Hector Molina', '2020-07-01'),
    ('Lobos del Sur', 'LATAM Sur', 'Renata Paz', '2022-01-20'),
    ('Titanes de Acero', 'LATAM Norte', 'Bruno Salas', '2019-11-05'),
    ('Espectros Nova', 'LATAM Centro', 'Ivana Cruz', '2023-02-10');

INSERT INTO jugadores_escuadra_moba
    (gamer_tag, escuadra_id, rol, partidas_jugadas, victorias, kda, estado)
VALUES
    ('FerNova', (SELECT id FROM escuadras_torneo_moba WHERE nombre = 'Dragones Rojos'), 'medio', 60, 42, 6.20, 'activo'),
    ('DiegoHex', (SELECT id FROM escuadras_torneo_moba WHERE nombre = 'Dragones Rojos'), 'tirador', 58, 39, 5.85, 'activo'),
    ('JulianRune', (SELECT id FROM escuadras_torneo_moba WHERE nombre = 'Fenix Digital'), 'soporte', 55, 34, 4.90, 'activo'),
    ('CamiSpark', (SELECT id FROM escuadras_torneo_moba WHERE nombre = 'Fenix Digital'), 'tirador', 50, 22, 2.10, 'suplente'),
    ('RickTide', (SELECT id FROM escuadras_torneo_moba WHERE nombre = 'Lobos del Sur'), 'medio', 47, 21, 3.60, 'activo'),
    ('ValStorm', (SELECT id FROM escuadras_torneo_moba WHERE nombre = 'Lobos del Sur'), 'jungla', 45, 20, 2.95, 'activo'),
    ('BrunoAxe', (SELECT id FROM escuadras_torneo_moba WHERE nombre = 'Titanes de Acero'), 'top', 62, 38, 4.10, 'activo'),
    ('NoraSteel', (SELECT id FROM escuadras_torneo_moba WHERE nombre = 'Titanes de Acero'), 'soporte', 40, 15, 2.50, 'retirado'),
    ('IvanFrost', (SELECT id FROM escuadras_torneo_moba WHERE nombre = 'Espectros Nova'), 'jungla', 30, 19, 5.40, 'activo'),
    ('LiaGhost', (SELECT id FROM escuadras_torneo_moba WHERE nombre = 'Espectros Nova'), 'top', 28, 12, 3.20, 'activo');
