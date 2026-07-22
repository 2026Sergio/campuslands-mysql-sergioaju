-- intermedio/ejercicio-009 - maria-montepeque
USE campuslands_mysql;

-- "Gimnasio Vacio" se deja a proposito sin peleadores, para poder
-- comprobar el comportamiento de la FK con LEFT JOIN.
INSERT INTO gimnasios_kickboxing
    (nombre, ciudad, fecha_apertura)
VALUES
    ('Gimnasio Fenix', 'Ciudad Norte', '2015-03-01'),
    ('Gimnasio Lobos', 'Ciudad Sur', '2017-08-15'),
    ('Gimnasio Tormenta', 'Ciudad Este', '2019-01-20'),
    ('Gimnasio Vacio', 'Ciudad Oeste', '2022-11-10');

INSERT INTO peleadores_kickboxing
    (nombre, gimnasio_id, categoria_peso, peleas_ganadas, peleas_perdidas, estado)
VALUES
    ('KaidoFist', (SELECT id FROM gimnasios_kickboxing WHERE nombre = 'Gimnasio Fenix'), 'pluma', 15, 3, 'activo'),
    ('ZaraKick', (SELECT id FROM gimnasios_kickboxing WHERE nombre = 'Gimnasio Fenix'), 'medio', 12, 5, 'activo'),
    ('SkyeVenom', (SELECT id FROM gimnasios_kickboxing WHERE nombre = 'Gimnasio Fenix'), 'pesado', 18, 1, 'activo'),
    ('KairoPhantom', (SELECT id FROM gimnasios_kickboxing WHERE nombre = 'Gimnasio Fenix'), 'pluma', 9, 5, 'activo'),
    ('RexStrike', (SELECT id FROM gimnasios_kickboxing WHERE nombre = 'Gimnasio Lobos'), 'pesado', 20, 2, 'activo'),
    ('LunaBlaze', (SELECT id FROM gimnasios_kickboxing WHERE nombre = 'Gimnasio Lobos'), 'pluma', 8, 6, 'activo'),
    ('ByteCrusher', (SELECT id FROM gimnasios_kickboxing WHERE nombre = 'Gimnasio Lobos'), 'ligero', 0, 1, 'retirado'),
    ('MikaThunder', (SELECT id FROM gimnasios_kickboxing WHERE nombre = 'Gimnasio Tormenta'), 'medio', 10, 4, 'activo'),
    ('TahoShadow', (SELECT id FROM gimnasios_kickboxing WHERE nombre = 'Gimnasio Tormenta'), 'ligero', 5, 9, 'retirado'),
    ('PixelRage', (SELECT id FROM gimnasios_kickboxing WHERE nombre = 'Gimnasio Tormenta'), 'medio', 14, 3, 'activo');
