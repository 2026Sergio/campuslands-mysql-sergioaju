USE campuslands_mysql;

-- Inserción de al menos 8 registros realistas distribuidos entre diversas armas, rarezas y estados
INSERT INTO skins_shooter_groupby (codigo_skin, nombre_skin, arma_asociada, rareza, precio_mercado, desgaste, estado_inventario) VALUES
('SKN-AK47-01', 'AK-47 | Fire Serpent', 'AK-47', 'Contrabando', 850.50, 'Field-Tested', 'equipado'),
('SKN-AWP-02', 'AWP | Dragon Lore', 'AWP', 'Legendaria', 2500.00, 'Factory New', 'en_venta'),
('SKN-M4A4-03', 'M4A4 | Howl', 'M4A4', 'Contrabando', 1800.75, 'Minimal Wear', 'archivado'),
('SKN-GLOCK-04', 'Glock-18 | Fade', 'Glock-18', 'Épica', 450.25, 'Factory New', 'disponible'),
('SKN-USP-05', 'USP-S | Kill Confirmed', 'USP-S', 'Legendaria', 120.00, 'Field-Tested', 'equipado'),
('SKN-DESERT-06', 'Desert Eagle | Printstream', 'Desert Eagle', 'Épica', 95.50, 'Factory New', 'disponible'),
('SKN-KNIFE-07', 'Karambit | Doppler', 'Cuchillo', 'Legendaria', 1100.00, 'Minimal Wear', 'en_venta'),
('SKN-M4A1-08', 'M4A1-S | Hyper Beast', 'M4A1-S', 'Rara', 45.00, 'Well-Worn', 'disponible');