-- basico/ejercicio-002 - maria-montepeque
USE campuslands_mysql;

INSERT INTO jugadores_ranking_battle_royale
    (nickname, escuadra, plataforma, partidas_jugadas, victorias, eliminaciones, puntaje_temporada, estado, fecha_ultima_partida)
VALUES
    ('NovaStrike', 'Escuadra Fenix', 'pc', 120, 18, 340, 2450.75, 'activo', '2026-07-18'),
    ('KairoShot', 'Escuadra Fenix', 'pc', 95, 22, 410, 2680.00, 'activo', '2026-07-20'),
    ('LunaFrag', 'Lobos Nocturnos', 'consola', 80, 9, 190, 1520.50, 'activo', '2026-07-15'),
    ('ByteHunter', 'Lobos Nocturnos', 'consola', 60, 4, 95, 980.25, 'inactivo', '2026-06-30'),
    ('ZaraDrop', 'Tormenta Movil', 'movil', 150, 30, 500, 3120.90, 'activo', '2026-07-21'),
    ('PixelWolf', 'Tormenta Movil', 'movil', 40, 2, 55, 610.00, 'inactivo', '2026-05-12'),
    ('RexCombo', 'Escuadra Fenix', 'pc', 70, 6, 140, 1105.40, 'baneado', '2026-06-01'),
    ('MikaSurge', 'Lobos Nocturnos', 'consola', 110, 25, 380, 2790.60, 'activo', '2026-07-19'),
    ('TahoBlast', 'Tormenta Movil', 'movil', 55, 3, 70, 720.15, 'activo', '2026-07-10'),
    ('SkyeVortex', 'Escuadra Fenix', 'pc', 130, 28, 460, 2995.35, 'activo', '2026-07-22');
