-- insercion de datos de prueba para battle royale
USE campuslands_mysql;

-- agregamos 5 jugadores
INSERT INTO jugadores (nickname, rango, nivel) VALUES
('shadow_hunter', 'diamante', 45),
('pixel_queen', 'platino', 32),
('ghost_sniper', 'oro', 20),
('neo_runner', 'plata', 12),
('rookie_one', 'bronce', 1);

-- agregamos 8 registros de partidas (dejamos a rookie_one sin partidas para probar el left join)
INSERT INTO partidas (jugador_id, bajas, posicion_final, puntos_ganados) VALUES
(1, 12, 1, 150.00),
(1, 8, 3, 90.50),
(2, 5, 10, 40.00),
(2, 9, 2, 110.00),
(3, 2, 25, 10.00),
(3, 4, 15, 25.50),
(4, 0, 50, 0.00),
(4, 1, 38, 5.00);