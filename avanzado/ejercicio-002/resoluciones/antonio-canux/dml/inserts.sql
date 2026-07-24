-- Datos de practica para ranking battle royale (10 por tabla).
USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_002_jugadores (nickname, nivel, puntos_rango) 
    VALUES ('NinjaPro', 50, 1500),
    ('CamperK', 30, 800),
    ('SniperWolf', 45, 1200),
    ('NoobMaster', 10, 200),
    ('GhostRider', 60, 2500),
    ('TTV_Tryhard', 99, 5000),
    ('SoloQHero', 25, 600),
    ('LootGoblin', 40, 1100),
    ('BushWookie', 35, 950),
    ('AimBotZ', 80, 4200);
    
INSERT INTO avanzado_ejercicio_002_partidas (jugador_id, posicion, eliminaciones, puntos_obtenidos) 
    VALUES (1, 1, 12, 279),
    (2, 50, 0, 50),
    (3, 2, 8, 218),
    (4, 99, 0, 1),
    (5, 5, 5, 170),
    (6, 1, 20, 399),
    (7, 10, 2, 120),
    (8, 25, 1, 90),
    (9, 15, 3, 130),
    (10, 3, 10, 247);