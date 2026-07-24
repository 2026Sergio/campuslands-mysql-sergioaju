-- insercion de datos de prueba para inventario de skins
USE campuslands_mysql;

-- agregamos 9 registros de skins para probar agrupaciones
INSERT INTO skins (nombre, tipo_arma, rareza, precio, estado) VALUES
('ak-47 fuego draconico', 'rifle', 'legendario', 45.00, 'disponible'),
('m4a1 sombra nocturna', 'rifle', 'epico', 25.50, 'disponible'),
('awp trueno dorado', 'francotirador', 'legendario', 60.00, 'disponible'),
('awp hielo eterno', 'francotirador', 'epico', 30.00, 'disponible'),
('deagle titanio', 'pistola', 'raro', 12.00, 'disponible'),
('glock camuflaje urbano', 'pistola', 'comun', 5.00, 'disponible'),
('mp5 neon ruidoso', 'subfusil', 'raro', 15.00, 'bloqueado'),
('ak-47 oxidada', 'rifle', 'comun', 8.50, 'descatalogado'),
('kar98 spectro', 'francotirador', 'raro', 18.00, 'disponible');