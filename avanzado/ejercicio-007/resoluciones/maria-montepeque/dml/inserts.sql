-- avanzado/ejercicio-007 - maria-montepeque
USE campuslands_mysql;

INSERT INTO equipos_liga_futbol_view
    (nombre, ciudad)
VALUES
    ('Aguilas Doradas', 'Ciudad Norte'),
    ('Tigres del Sur', 'Ciudad Sur'),
    ('Leones FC', 'Ciudad Este'),
    ('Halcones United', 'Ciudad Oeste');

-- Ruben Casal (lesionado) y Bruno Salas (suspendido) se dejan a proposito
-- en un estado distinto a "activo", para poder comprobar que
-- vista_jugadores_activos_liga los excluye correctamente.
INSERT INTO jugadores_liga_futbol_view
    (nombre, equipo_id, dorsal, estado)
VALUES
    ('Mateo Rivas', (SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Aguilas Doradas'), 9, 'activo'),
    ('Santi Belmonte', (SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Aguilas Doradas'), 8, 'activo'),
    ('Diego Palma', (SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Tigres del Sur'), 11, 'activo'),
    ('Ruben Casal', (SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Tigres del Sur'), 4, 'lesionado'),
    ('Nico Farias', (SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Leones FC'), 7, 'activo'),
    ('Andres Roble', (SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Leones FC'), 10, 'activo'),
    ('Bruno Salas', (SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Halcones United'), 5, 'suspendido'),
    ('Karla Ibanez', (SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Halcones United'), 6, 'activo');

INSERT INTO partidos_liga_futbol_view
    (equipo_local_id, equipo_visitante_id, fecha_partido, estadio)
VALUES
    ((SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Aguilas Doradas'), (SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Tigres del Sur'), '2026-05-10', 'Estadio Norte'),
    ((SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Leones FC'), (SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Aguilas Doradas'), '2026-05-24', 'Estadio Centro'),
    ((SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Tigres del Sur'), (SELECT id FROM equipos_liga_futbol_view WHERE nombre = 'Leones FC'), '2026-06-07', 'Estadio Sur');

INSERT INTO goles_partido_liga_view
    (partido_id, jugador_id, minuto, tipo_gol)
VALUES
    ((SELECT id FROM partidos_liga_futbol_view WHERE fecha_partido = '2026-05-10'), (SELECT id FROM jugadores_liga_futbol_view WHERE nombre = 'Mateo Rivas'), 15, 'normal'),
    ((SELECT id FROM partidos_liga_futbol_view WHERE fecha_partido = '2026-05-10'), (SELECT id FROM jugadores_liga_futbol_view WHERE nombre = 'Diego Palma'), 33, 'normal'),
    ((SELECT id FROM partidos_liga_futbol_view WHERE fecha_partido = '2026-05-10'), (SELECT id FROM jugadores_liga_futbol_view WHERE nombre = 'Mateo Rivas'), 78, 'penal'),
    ((SELECT id FROM partidos_liga_futbol_view WHERE fecha_partido = '2026-05-24'), (SELECT id FROM jugadores_liga_futbol_view WHERE nombre = 'Nico Farias'), 10, 'normal'),
    ((SELECT id FROM partidos_liga_futbol_view WHERE fecha_partido = '2026-05-24'), (SELECT id FROM jugadores_liga_futbol_view WHERE nombre = 'Santi Belmonte'), 45, 'normal'),
    ((SELECT id FROM partidos_liga_futbol_view WHERE fecha_partido = '2026-05-24'), (SELECT id FROM jugadores_liga_futbol_view WHERE nombre = 'Nico Farias'), 60, 'normal'),
    ((SELECT id FROM partidos_liga_futbol_view WHERE fecha_partido = '2026-06-07'), (SELECT id FROM jugadores_liga_futbol_view WHERE nombre = 'Ruben Casal'), 20, 'autogol'),
    ((SELECT id FROM partidos_liga_futbol_view WHERE fecha_partido = '2026-06-07'), (SELECT id FROM jugadores_liga_futbol_view WHERE nombre = 'Andres Roble'), 55, 'normal');

-- Actualizacion valida A TRAVES DE LA VISTA: cambia el dorsal de un jugador
-- que sigue activo, por lo que WITH CHECK OPTION la permite sin problema.
UPDATE vista_jugadores_activos_liga
SET dorsal = 99
WHERE nombre = 'Mateo Rivas';
