-- Datos de practica para torneo esports MOBA (10 por tabla).
USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_001_equipos (nombre, region, presupuesto) 
    VALUES ('T1', 'KR', 5000000.00),
    ('Gen.G', 'KR', 4000000.00),
    ('G2 Esports', 'EU', 3000000.00),
    ('Fnatic', 'EU', 2500000.00),
    ('Cloud9', 'NA', 3500000.00),
    ('Team Liquid', 'NA', 4500000.00),
    ('EDward Gaming', 'CN', 6000000.00),
    ('RNG', 'CN', 5500000.00),
    ('PSG Talon', 'PCS', 1500000.00),
    ('LOUD', 'BR', 1000000.00);

INSERT INTO avanzado_ejercicio_001_jugadores (nickname, rol, equipo_id) 
    VALUES ('Faker', 'Mid', 1),
    ('Oner', 'Jungle', 1),
    ('Chovy', 'Mid', 2),
    ('Caps', 'Mid', 3),
    ('Rekkles', 'ADC', 4),
    ('Blaber', 'Jungle', 5),
    ('CoreJJ', 'Support', 6),
    ('Scout', 'Mid', 7),
    ('Xiaohu', 'Mid', 8),
    ('Robo', 'Top', 10);