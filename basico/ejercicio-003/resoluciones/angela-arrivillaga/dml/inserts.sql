use campuslands_mysql;

-- agregamos 9 skins de armas clasicas de shooters
insert into basico_ejercicio_003 (nombre_skin, tipo_arma, rareza, precio_monedas, estado) values
('ak47 dragon fire', 'rifle de asalto', 'legendario', 2500.00, 'disponible'),
('m4a1 neon rider', 'rifle de asalto', 'epico', 1800.50, 'disponible'),
('awp dragon lore', 'francotirador', 'legendario', 5000.00, 'disponible'),
('desert eagle printstream', 'pistola', 'raro', 750.00, 'disponible'),
('glock water elemental', 'pistola', 'comun', 300.00, 'disponible'),
('mp5 sub zero', 'subfusil', 'raro', 600.25, 'revision'),
('karambit doppler', 'cuchillo', 'legendario', 4200.00, 'disponible'),
('vandal reaver', 'rifle de asalto', 'epico', 2100.00, 'agotado'),
('spectre prime', 'subfusil', 'epico', 1450.00, 'disponible');