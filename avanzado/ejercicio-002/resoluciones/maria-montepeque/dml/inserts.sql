-- avanzado/ejercicio-002 - maria-montepeque
USE campuslands_mysql;

-- 6 escuadras; 2 de ellas (Vortice Digital y Eclipse Squad) no jugaran
-- ninguna partida, para probar que los procedimientos manejan bien ese caso.
INSERT INTO escuadras_battle_royale_sp
    (nombre, plataforma, fecha_creacion)
VALUES
    ('Escuadra Fenix', 'pc', '2025-01-10'),
    ('Lobos Nocturnos', 'consola', '2025-02-14'),
    ('Tormenta Movil', 'movil', '2025-03-01'),
    ('Sombra Real', 'pc', '2025-04-20'),
    ('Vortice Digital', 'consola', '2026-06-01'),
    ('Eclipse Squad', 'movil', '2026-07-15');

-- Las partidas se cargan llamando al procedimiento sp_registrar_partida_br,
-- no con INSERT directo: el procedimiento resuelve el escuadra_id por
-- nombre, evitando tener que conocer los ids generados por AUTO_INCREMENT.
CALL sp_registrar_partida_br('Escuadra Fenix', 'Isla Norte', 1, 12, 350, '2026-06-01');
CALL sp_registrar_partida_br('Escuadra Fenix', 'Desierto Rojo', 3, 8, 220, '2026-06-10');
CALL sp_registrar_partida_br('Escuadra Fenix', 'Isla Norte', 2, 10, 280, '2026-07-05');
CALL sp_registrar_partida_br('Lobos Nocturnos', 'Ciudad Fantasma', 5, 4, 120, '2026-06-15');
CALL sp_registrar_partida_br('Lobos Nocturnos', 'Desierto Rojo', 1, 15, 400, '2026-07-01');
CALL sp_registrar_partida_br('Tormenta Movil', 'Isla Norte', 2, 9, 260, '2026-06-05');
CALL sp_registrar_partida_br('Tormenta Movil', 'Ciudad Fantasma', 4, 6, 150, '2026-06-25');
CALL sp_registrar_partida_br('Tormenta Movil', 'Isla Norte', 1, 14, 380, '2026-07-15');
CALL sp_registrar_partida_br('Sombra Real', 'Desierto Rojo', 6, 3, 90, '2026-06-18');
CALL sp_registrar_partida_br('Sombra Real', 'Ciudad Fantasma', 2, 11, 300, '2026-07-08');
