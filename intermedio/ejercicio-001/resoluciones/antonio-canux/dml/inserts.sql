-- Datos de practica para ranking battle royale.
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_001_jugadores (nickname, rango) 
    VALUES ('NinjaPro', 'Diamante'),
    ('CamperK', 'Oro'),
    ('SniperWolf', 'Platino'),
    ('NoobMaster', 'Bronce'),
    ('GhostRider', 'Plata');

INSERT INTO intermedio_ejercicio_001_partidas (jugador_id, posicion, eliminaciones) 
    VALUES (1, 1, 12),
    (1, 5, 4),
    (2, 50, 0),
    (3, 2, 8),
    (3, 10, 3);