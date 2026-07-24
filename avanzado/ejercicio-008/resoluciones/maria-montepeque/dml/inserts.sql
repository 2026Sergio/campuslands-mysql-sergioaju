-- avanzado/ejercicio-008 - maria-montepeque
-- Esta parte si la puede ejecutar el usuario normal de la aplicacion (campus).
USE campuslands_mysql;

INSERT INTO equipos_futbol_sala_roles
    (nombre, ciudad)
VALUES
    ('Halcones Sala', 'Ciudad Norte'),
    ('Cobras FS', 'Ciudad Sur'),
    ('Titanes Cubierta', 'Ciudad Este'),
    ('Rayos Interior', 'Ciudad Oeste');

INSERT INTO jugadores_futbol_sala_roles
    (nombre, equipo_id, goles, estado)
VALUES
    ('NovaKick', (SELECT id FROM equipos_futbol_sala_roles WHERE nombre = 'Halcones Sala'), 12, 'activo'),
    ('ZaraFive', (SELECT id FROM equipos_futbol_sala_roles WHERE nombre = 'Halcones Sala'), 8, 'activo'),
    ('MikaWall', (SELECT id FROM equipos_futbol_sala_roles WHERE nombre = 'Halcones Sala'), 0, 'activo'),
    ('SkyeCierre', (SELECT id FROM equipos_futbol_sala_roles WHERE nombre = 'Cobras FS'), 3, 'activo'),
    ('LunaGoal', (SELECT id FROM equipos_futbol_sala_roles WHERE nombre = 'Cobras FS'), 15, 'activo'),
    ('ByteAla', (SELECT id FROM equipos_futbol_sala_roles WHERE nombre = 'Cobras FS'), 6, 'suspendido'),
    ('RexPivot', (SELECT id FROM equipos_futbol_sala_roles WHERE nombre = 'Titanes Cubierta'), 10, 'lesionado'),
    ('TahoAla', (SELECT id FROM equipos_futbol_sala_roles WHERE nombre = 'Titanes Cubierta'), 4, 'activo'),
    ('PixelPortero', (SELECT id FROM equipos_futbol_sala_roles WHERE nombre = 'Rayos Interior'), 0, 'activo'),
    ('KairoCierre', (SELECT id FROM equipos_futbol_sala_roles WHERE nombre = 'Rayos Interior'), 5, 'activo');
