-- DML: Registro de 8 skins aplicando autoincremento en PRIMARY KEY
USE campuslands_mysql;

INSERT INTO skins_basico (nombre_skin, tipo_arma, rareza, precio_usd, equipada, estado) VALUES
('Dragonfire', 'AWM', 'Legendaria', 250.00, TRUE, 'disponible'),
('CyberPunk', 'M416', 'Épica', 45.50, FALSE, 'disponible'),
('Neon Cobra', 'AKM', 'Legendaria', 120.00, TRUE, 'disponible'),
('Desert Camo', 'Kar98k', 'Común', 5.00, FALSE, 'disponible'),
('Gold Viper', 'Desert Eagle', 'Rara', 18.00, FALSE, 'bloqueada'),
('Glacier', 'M416', 'Legendaria', 310.00, TRUE, 'disponible'),
('Bloodline', 'UMP45', 'Rara', 12.50, FALSE, 'disponible'),
('Phantom', 'Vector', 'Épica', 35.00, FALSE, 'bloqueada');
