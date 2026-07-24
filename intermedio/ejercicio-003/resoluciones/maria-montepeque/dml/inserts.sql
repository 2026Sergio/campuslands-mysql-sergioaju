-- intermedio/ejercicio-003 - maria-montepeque
USE campuslands_mysql;

INSERT INTO coleccion_skins_shooter
    (codigo_skin, nombre_skin, arma, rareza, precio, propietario, estado, fecha_obtencion)
VALUES
    ('SK-001', 'Dragon Carmesi', 'Rifle de Asalto', 'legendario', 89.99, 'NovaStrike', 'equipada', '2026-01-15'),
    ('SK-002', 'Sombra Urbana', 'Subfusil', 'raro', 24.50, 'NovaStrike', 'inventario', '2026-02-02'),
    ('SK-003', 'Furia Ardiente', 'Rifle de Asalto', 'epico', 55.00, 'NovaStrike', 'inventario', '2026-03-10'),
    ('SK-004', 'Filo Glacial', 'Cuchillo', 'epico', 45.00, 'KairoShot', 'equipada', '2025-11-18'),
    ('SK-005', 'Camuflaje Selva', 'Rifle de Asalto', 'comun', 3.99, 'KairoShot', 'vendida', '2025-12-20'),
    ('SK-006', 'Neon Nocturno', 'Escopeta', 'epico', 39.90, 'KairoShot', 'equipada', '2026-04-01'),
    ('SK-007', 'Oro Imperial', 'Pistola', 'legendario', 74.25, 'LunaFrag', 'inventario', '2026-01-05'),
    ('SK-008', 'Ceniza de Guerra', 'Rifle de Asalto', 'poco_comun', 12.75, 'LunaFrag', 'inventario', '2026-05-28'),
    ('SK-009', 'Fantasma Artico', 'Francotirador', 'legendario', 95.00, 'ZaraDrop', 'equipada', '2026-07-15'),
    ('SK-010', 'Grafiti Toxico', 'Subfusil', 'comun', 2.50, 'ZaraDrop', 'inventario', '2025-06-10'),
    ('SK-011', 'Relampago Purpura', 'Escopeta', 'raro', 27.80, 'MikaSurge', 'inventario', '2026-07-19'),
    ('SK-012', 'Pulso Digital', 'Pistola', 'poco_comun', 15.40, 'MikaSurge', 'vendida', '2025-09-22');
