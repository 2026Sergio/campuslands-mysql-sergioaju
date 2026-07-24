-- DML: Registros de motocicletas y prueba del Trigger mediante UPDATES
USE campuslands_mysql;

INSERT INTO motos (placa, modelo, cilindraje, kilometraje, costo_mantenimiento, estado_mantenimiento) VALUES
('M-101AAA', 'Yamaha MT-07', 689, 15000, 150.00, 'en_revision'),
('M-202BBB', 'Honda CB500X', 471, 28000, 210.50, 'en_reparacion'),
('M-303CCC', 'Kawasaki Z900', 948, 8500, 320.00, 'listo'),
('M-404DDD', 'BMW R1250GS', 1254, 42000, 550.00, 'en_revision'),
('M-505EEE', 'KTM Duke 390', 373, 12000, 95.00, 'en_reparacion'),
('M-606FFF', 'Suzuki V-Strom 650', 645, 31000, 180.00, 'listo'),
('M-777GGG', 'Ducati Monster 821', 821, 5000, 410.00, 'en_revision'),
('M-808HHH', 'Royal Enfield Himalayan', 411, 19000, 125.00, 'entregado');

-- Actualizaciones para disparar el Trigger y generar registros en auditoria_mantenimiento
UPDATE motos SET estado_mantenimiento = 'en_reparacion' WHERE moto_id = 1;
UPDATE motos SET estado_mantenimiento = 'listo' WHERE moto_id = 2;
UPDATE motos SET estado_mantenimiento = 'entregado' WHERE moto_id = 3;
UPDATE motos SET estado_mantenimiento = 'listo' WHERE moto_id = 1;
