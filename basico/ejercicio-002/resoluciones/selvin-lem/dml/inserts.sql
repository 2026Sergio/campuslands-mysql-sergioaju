USE campuslands_mysql;

INSERT INTO basico_ejercicio_002
(jugador, plataforma, kills, posicion_final, tiempo_supervivencia, premio_ganado, es_victoria, fecha_partida, estado) 
VALUES
('Zephyra',  'pc',      12, 1,  '00:24:15', 150.00, TRUE,  '2026-07-01', 'valida'),
('Kron',     'consola', 8,  3,  '00:19:40', 40.00,  FALSE, '2026-07-01', 'valida'),
('Voss',     'movil',   2,  15, '00:07:12', 0.00,   FALSE, '2026-07-02', 'valida'),
('Ilyra',    'pc',      6,  5,  '00:16:05', 20.00,  FALSE, '2026-07-02', 'valida'),
('Draken',   'consola', 15, 1,  '00:27:50', 150.00, TRUE,  '2026-07-03', 'valida'),
('Nimue',    'pc',      0,  1,  '00:22:00', 150.00, TRUE,  '2026-07-03', 'revision'),
('Baraz',    'movil',   4,  10, '00:12:30', 0.00,   FALSE, '2026-07-04', 'valida'),
('Skye',     'pc',      9,  22, '00:05:45', 0.00,   FALSE, '2026-07-04', 'descalificado');