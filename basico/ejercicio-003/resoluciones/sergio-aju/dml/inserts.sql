USE db_inventario_skins;
TRUNCATE TABLE skins;

INSERT INTO skins (nombre_skin, arma, rareza, precio_dolares, disponible) VALUES
('Dragon Lore', 'AWP', 'Legendaria', 1500.00, TRUE),
('Asiimov', 'M4A4', 'Epica', 85.50, TRUE),
('Fire Serpent', 'AK-47', 'Legendaria', 450.00, FALSE),
('Redline', 'AK-47', 'Rara', 15.25, TRUE),
('Hyper Beast', 'M4A1-S', 'Epica', 45.00, TRUE),
('Fade', 'Knife', 'Legendaria', 950.00, FALSE),
('Safari Mesh', 'P250', 'Comun', 1.50, TRUE),
('Royal Blue', 'USP-S', 'Rara', 8.75, TRUE);