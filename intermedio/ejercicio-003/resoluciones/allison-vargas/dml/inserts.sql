-- DML: Registro de 8 skins variadas para agregación y reportes
USE campuslands_mysql;

INSERT INTO inventario_skins_intermedio 
(nombre_skin, categoria_arma, rareza, precio_mercado, stock_disponible, estado) 
VALUES
('Asiimov', 'Rifle', 'Legendaria', 120.50, 5, 'en_venta'),
('Dragon Lore', 'Sniper', 'Legendaria', 1450.00, 1, 'en_venta'),
('Hyper Beast', 'Rifle', 'Épica', 85.00, 12, 'en_venta'),
('Printstream', 'Pistola', 'Épica', 60.00, 8, 'en_venta'),
('Redline', 'Subfusil', 'Rara', 22.50, 0, 'agotado'),
('Karambit Fade', 'Cuchillo', 'Legendaria', 890.00, 2, 'en_venta'),
('Glock Candy', 'Pistola', 'Común', 3.50, 25, 'en_venta'),
('Fade Striker', 'Subfusil', 'Rara', 18.00, 0, 'descatalogado');
