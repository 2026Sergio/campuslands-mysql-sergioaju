-- intermedio/ejercicio-008 - maria-montepeque
USE campuslands_mysql;

INSERT INTO equipos_futbol_sala
    (nombre, ciudad, entrenador)
VALUES
    ('Halcones Sala', 'Ciudad Norte', 'Marcos Vidal'),
    ('Cobras FS', 'Ciudad Sur', 'Elena Ruiz'),
    ('Titanes Cubierta', 'Ciudad Este', 'Bruno Salas'),
    ('Rayos Interior', 'Ciudad Oeste', 'Carla Nunez');

INSERT INTO jugadores_futbol_sala
    (nombre, equipo_id, posicion, goles, tarjetas_amarillas, estado)
VALUES
    ('NovaKick', (SELECT id FROM equipos_futbol_sala WHERE nombre = 'Halcones Sala'), 'pivote', 12, 1, 'activo'),
    ('ZaraFive', (SELECT id FROM equipos_futbol_sala WHERE nombre = 'Halcones Sala'), 'ala', 8, 2, 'activo'),
    ('MikaWall', (SELECT id FROM equipos_futbol_sala WHERE nombre = 'Halcones Sala'), 'portero', 0, 0, 'activo'),
    ('SkyeCierre', (SELECT id FROM equipos_futbol_sala WHERE nombre = 'Cobras FS'), 'cierre', 3, 0, 'activo'),
    ('LunaGoal', (SELECT id FROM equipos_futbol_sala WHERE nombre = 'Cobras FS'), 'pivote', 15, 1, 'activo'),
    ('ByteAla', (SELECT id FROM equipos_futbol_sala WHERE nombre = 'Cobras FS'), 'ala', 6, 3, 'suspendido'),
    ('RexPivot', (SELECT id FROM equipos_futbol_sala WHERE nombre = 'Titanes Cubierta'), 'pivote', 10, 2, 'lesionado'),
    ('TahoAla', (SELECT id FROM equipos_futbol_sala WHERE nombre = 'Titanes Cubierta'), 'ala', 4, 1, 'activo'),
    ('PixelPortero', (SELECT id FROM equipos_futbol_sala WHERE nombre = 'Rayos Interior'), 'portero', 0, 0, 'activo'),
    ('KairoCierre', (SELECT id FROM equipos_futbol_sala WHERE nombre = 'Rayos Interior'), 'cierre', 5, 0, 'activo');
