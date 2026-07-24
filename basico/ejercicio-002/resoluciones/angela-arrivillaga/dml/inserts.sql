use campuslands_mysql;

-- agregamos 9 jugadores de prueba con diferentes rangos y estados
insert into basico_ejercicio_002 (nickname, rango, bajas_totales, ratio_victorias, puntaje_ranking, estado) values
('ninja_pro', 'heroe', 450, 68.50, 3450.00, 'activo'),
('shadow_sniper', 'diamante', 320, 52.10, 2800.50, 'activo'),
('pixel_queen', 'heroe', 510, 75.00, 3900.25, 'activo'),
('hacker_x', 'platino', 150, 20.00, 1100.00, 'baneado'),
('ghost_rider', 'oro', 95, 35.40, 950.00, 'activo'),
('cyber_samurai', 'diamante', 280, 48.00, 2550.75, 'activo'),
('noob_master', 'bronce', 20, 10.50, 200.00, 'inactivo'),
('valkyrie_88', 'heroe', 480, 71.20, 3720.00, 'activo'),
('dark_phoenix', 'platino', 190, 41.30, 1850.50, 'activo');