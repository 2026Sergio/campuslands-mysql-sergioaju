-- basico/ejercicio-008 - maria-montepeque
USE campuslands_mysql;

-- Estado inicial: todos los jugadores arrancan la jornada activos y sin estadisticas.
INSERT INTO jugadores_futbol_sala
    (nombre, equipo, posicion, goles, tarjetas_amarillas, tarjetas_rojas, estado, fecha_registro)
VALUES
    ('NovaKick', 'Halcones Sala', 'pivote', 0, 0, 0, 'activo', '2026-01-10'),
    ('ZaraFive', 'Halcones Sala', 'ala', 0, 0, 0, 'activo', '2026-01-10'),
    ('RexPivot', 'Halcones Sala', 'pivote', 0, 0, 0, 'activo', '2026-01-10'),
    ('MikaWall', 'Halcones Sala', 'portero', 0, 0, 0, 'activo', '2026-01-10'),
    ('TahoAla', 'Halcones Sala', 'ala', 0, 0, 0, 'activo', '2026-01-10'),
    ('SkyeCierre', 'Cobras FS', 'cierre', 0, 0, 0, 'activo', '2026-01-12'),
    ('LunaGoal', 'Cobras FS', 'pivote', 0, 0, 0, 'activo', '2026-01-12'),
    ('ByteAla', 'Cobras FS', 'ala', 0, 0, 0, 'activo', '2026-01-12'),
    ('PixelPortero', 'Cobras FS', 'portero', 0, 0, 0, 'activo', '2026-01-12'),
    ('KairoCierre', 'Cobras FS', 'cierre', 0, 0, 0, 'activo', '2026-01-12');

-- Eventos de la jornada: los UPDATE reflejan lo ocurrido durante el partido.

-- 1. NovaKick anota doblete
UPDATE jugadores_futbol_sala
SET goles = goles + 2
WHERE nombre = 'NovaKick';

-- 2. ZaraFive anota y recibe una tarjeta amarilla
UPDATE jugadores_futbol_sala
SET goles = goles + 1,
    tarjetas_amarillas = tarjetas_amarillas + 1
WHERE nombre = 'ZaraFive';

-- 3. RexPivot ve doble amarilla y queda expulsado (roja) y suspendido
UPDATE jugadores_futbol_sala
SET tarjetas_amarillas = tarjetas_amarillas + 2,
    tarjetas_rojas = tarjetas_rojas + 1,
    estado = 'suspendido'
WHERE nombre = 'RexPivot';

-- 4. MikaWall se lesiona durante el partido
UPDATE jugadores_futbol_sala
SET estado = 'lesionado'
WHERE nombre = 'MikaWall';

-- 5. Regla general: cualquier jugador con tarjeta roja queda suspendido (por si acaso)
UPDATE jugadores_futbol_sala
SET estado = 'suspendido'
WHERE tarjetas_rojas >= 1;

-- 6. MikaWall se recupera de la lesion antes de la siguiente jornada
UPDATE jugadores_futbol_sala
SET estado = 'activo'
WHERE nombre = 'MikaWall' AND estado = 'lesionado';
