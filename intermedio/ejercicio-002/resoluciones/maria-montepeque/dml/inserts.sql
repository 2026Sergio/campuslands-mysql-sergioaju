-- intermedio/ejercicio-002 - maria-montepeque
USE campuslands_mysql;

-- 6 escuadras registradas; 2 de ellas (Vortice Digital y Eclipse Squad) son
-- nuevas y todavia no han disputado ninguna partida (a proposito, para poder
-- practicar LEFT JOIN y detectar filas sin coincidencia).
INSERT INTO escuadras_battle_royale
    (nombre, plataforma, fecha_creacion)
VALUES
    ('Escuadra Fenix', 'pc', '2025-01-10'),
    ('Lobos Nocturnos', 'consola', '2025-02-14'),
    ('Tormenta Movil', 'movil', '2025-03-01'),
    ('Sombra Real', 'pc', '2025-04-20'),
    ('Vortice Digital', 'consola', '2026-06-01'),
    ('Eclipse Squad', 'movil', '2026-07-15');

INSERT INTO partidas_battle_royale
    (escuadra_id, mapa, posicion_final, eliminaciones, puntos_obtenidos, fecha_partida)
VALUES
    ((SELECT id FROM escuadras_battle_royale WHERE nombre = 'Escuadra Fenix'), 'Isla Norte', 1, 12, 350, '2026-06-01'),
    ((SELECT id FROM escuadras_battle_royale WHERE nombre = 'Escuadra Fenix'), 'Desierto Rojo', 3, 8, 220, '2026-06-10'),
    ((SELECT id FROM escuadras_battle_royale WHERE nombre = 'Escuadra Fenix'), 'Isla Norte', 2, 10, 280, '2026-07-05'),
    ((SELECT id FROM escuadras_battle_royale WHERE nombre = 'Lobos Nocturnos'), 'Ciudad Fantasma', 5, 4, 120, '2026-06-15'),
    ((SELECT id FROM escuadras_battle_royale WHERE nombre = 'Lobos Nocturnos'), 'Desierto Rojo', 1, 15, 400, '2026-07-01'),
    ((SELECT id FROM escuadras_battle_royale WHERE nombre = 'Tormenta Movil'), 'Isla Norte', 2, 9, 260, '2026-06-05'),
    ((SELECT id FROM escuadras_battle_royale WHERE nombre = 'Tormenta Movil'), 'Ciudad Fantasma', 4, 6, 150, '2026-06-25'),
    ((SELECT id FROM escuadras_battle_royale WHERE nombre = 'Tormenta Movil'), 'Isla Norte', 1, 14, 380, '2026-07-15'),
    ((SELECT id FROM escuadras_battle_royale WHERE nombre = 'Sombra Real'), 'Desierto Rojo', 6, 3, 90, '2026-06-18'),
    ((SELECT id FROM escuadras_battle_royale WHERE nombre = 'Sombra Real'), 'Ciudad Fantasma', 2, 11, 300, '2026-07-08');
