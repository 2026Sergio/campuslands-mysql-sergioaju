-- DML: Registros de skins para shooter
USE campuslands_mysql;

INSERT INTO inventario_skins 
(nombre_skin, arma, rareza, precio_base, float_wear, stattrak, fecha_adquisicion, estado) 
VALUES
('Dragon Lore', 'AWP', 'Definitiva', 1500.00, 0.0125, TRUE, '2025-01-10', 'disponible'),
('Asiimov', 'M4A4', 'Legendaria', 120.00, 0.1850, FALSE, '2025-03-15', 'disponible'),
('Hyper Beast', 'AK-47', 'Épica', 85.50, 0.0540, TRUE, '2025-02-20', 'disponible'),
('Printstream', 'Deagle', 'Legendaria', 95.00, 0.1200, TRUE, '2025-04-01', 'bloqueada_intercambio'),
('Redline', 'AK-47', 'Rara', 25.00, 0.2200, FALSE, '2024-11-05', 'disponible'),
('Vandal Prime', 'Vandal', 'Definitiva', 210.00, 0.0050, FALSE, '2025-05-10', 'disponible'),
('Safari Mesh', 'AWP', 'Común', 1.50, 0.6500, FALSE, '2024-08-12', 'vendida'),
('Neo-Noir', 'USP-S', 'Épica', 45.00, 0.0890, TRUE, '2025-06-01', 'disponible');
