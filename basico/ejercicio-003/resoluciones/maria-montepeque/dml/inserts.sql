-- basico/ejercicio-003 - maria-montepeque
USE campuslands_mysql;

INSERT INTO inventario_skins_shooter
    (codigo_skin, nombre_skin, arma, rareza, precio, propietario, fecha_obtencion, estado)
VALUES
    ('SK-001', 'Dragon Carmesi', 'Rifle de Asalto', 'legendario', 89.99, 'NovaStrike', '2026-05-10', 'equipada'),
    ('SK-002', 'Sombra Urbana', 'Subfusil', 'raro', 24.50, 'NovaStrike', '2026-06-02', 'inventario'),
    ('SK-003', 'Filo Glacial', 'Cuchillo', 'epico', 45.00, 'KairoShot', '2026-04-18', 'equipada'),
    ('SK-004', 'Camuflaje Selva', 'Rifle de Asalto', 'comun', 3.99, 'KairoShot', '2026-06-20', 'vendida'),
    ('SK-005', 'Oro Imperial', 'Pistola', 'legendario', 74.25, 'LunaFrag', '2026-03-05', 'inventario'),
    ('SK-006', 'Neon Nocturno', 'Escopeta', 'epico', 39.90, 'LunaFrag', '2026-07-01', 'equipada'),
    ('SK-007', 'Ceniza de Guerra', 'Rifle de Asalto', 'poco_comun', 12.75, 'ZaraDrop', '2026-05-28', 'inventario'),
    ('SK-008', 'Fantasma Artico', 'Francotirador', 'legendario', 95.00, 'ZaraDrop', '2026-07-15', 'equipada'),
    ('SK-009', 'Grafiti Toxico', 'Subfusil', 'comun', 2.50, 'MikaSurge', '2026-06-10', 'inventario'),
    ('SK-010', 'Relampago Purpura', 'Escopeta', 'raro', 27.80, 'MikaSurge', '2026-07-19', 'inventario');
