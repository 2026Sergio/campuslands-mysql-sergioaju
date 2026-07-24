USE campuslands_mysql;

INSERT INTO jugadores_ranking (nombre_jugador, plataforma, puntos_ranking, temporada, estado) VALUES
('Zephyra', 'pc',      2450, 'temporada-5', 'activo'),
('Kron',    'consola', 2100, 'temporada-5', 'activo'),
('Voss',    'movil',   980,  'temporada-5', 'activo'),
('Ilyra',   'pc',      1750, 'temporada-5', 'activo'),
('Draken',  'consola', 2600, 'temporada-5', 'activo'),
('Nimue',   'pc',      1300, 'temporada-5', 'inactivo'),
('Baraz',   'movil',   700,  'temporada-5', 'activo'),
('Skye',    'pc',      450,  'temporada-5', 'inactivo');

-- Solo algunos jugadores recibieron premio; el resto queda sin fila en esta tabla (caso limite del LEFT JOIN)
INSERT INTO premios_temporada (id_jugador, nombre_premio, monto, fecha_entrega) VALUES
(1, 'Top 1 Global',       500.00, '2026-07-01'),
(5, 'Mayor racha kills',  200.00, '2026-07-01'),
(2, 'Top 5 Regional',     100.00, '2026-07-01');