-- intermedio/ejercicio-007 - maria-montepeque
USE campuslands_mysql;

INSERT INTO jugadores_liga_futbol
    (nombre, equipo, posicion)
VALUES
    ('Mateo Rivas', 'Aguilas Doradas', 'delantero'),
    ('Santi Belmonte', 'Aguilas Doradas', 'medio'),
    ('Diego Palma', 'Tigres del Sur', 'delantero'),
    ('Ruben Casal', 'Tigres del Sur', 'defensa'),
    ('Nico Farias', 'Leones FC', 'delantero'),
    ('Andres Roble', 'Leones FC', 'medio');

INSERT INTO partidos_liga_futbol
    (equipo_local, equipo_visitante, fecha_partido, estadio)
VALUES
    ('Aguilas Doradas', 'Tigres del Sur', '2026-05-10', 'Estadio Norte'),
    ('Leones FC', 'Aguilas Doradas', '2026-05-24', 'Estadio Centro'),
    ('Tigres del Sur', 'Leones FC', '2026-06-07', 'Estadio Sur'),
    ('Aguilas Doradas', 'Leones FC', '2026-06-21', 'Estadio Norte');

INSERT INTO goles_partido_liga
    (partido_id, jugador_id, minuto, tipo_gol)
VALUES
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-05-10'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Mateo Rivas'), 15, 'normal'),
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-05-10'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Diego Palma'), 33, 'normal'),
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-05-10'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Mateo Rivas'), 78, 'penal'),
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-05-24'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Nico Farias'), 10, 'normal'),
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-05-24'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Santi Belmonte'), 45, 'normal'),
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-05-24'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Nico Farias'), 60, 'normal'),
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-06-07'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Ruben Casal'), 20, 'autogol'),
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-06-07'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Andres Roble'), 55, 'normal'),
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-06-21'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Mateo Rivas'), 5, 'normal'),
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-06-21'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Mateo Rivas'), 88, 'normal'),
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-06-21'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Andres Roble'), 40, 'normal'),
    ((SELECT id FROM partidos_liga_futbol WHERE fecha_partido = '2026-06-21'), (SELECT id FROM jugadores_liga_futbol WHERE nombre = 'Nico Farias'), 90, 'penal');
