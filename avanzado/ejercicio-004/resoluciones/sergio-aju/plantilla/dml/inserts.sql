USE db_garaje_motos_triggers;

DELIMITER //
CREATE TRIGGER trg_moto_insert AFTER INSERT ON motos FOR EACH ROW
BEGIN
    INSERT INTO bitacora_motos (id_moto, detalle) 
    VALUES (NEW.id, CONCAT('Registro: ', NEW.marca, ' ', NEW.modelo));
END //
DELIMITER ;

INSERT INTO motos (marca, modelo, cilindrada, precio_reparacion, estado) VALUES
('Yamaha', 'MT-07', 689, 350.00, 'Finalizada'),
('Yamaha', 'YZF-R3', 321, 150.50, 'En Reparación'),
('Honda', 'CB500F', 471, 280.00, 'Finalizada'),
('Honda', 'CBR 600RR', 599, 650.00, 'Pendiente'),
('Kawasaki', 'Ninja 400', 399, 210.00, 'Finalizada'),
('Kawasaki', 'Z900', 948, 850.00, 'En Reparación'),
('Suzuki', 'GSX-S750', 749, 420.00, 'Finalizada'),
('Suzuki', 'V-Strom 650', 645, 310.00, 'Pendiente'),
('Ducati', 'Monster 821', 821, 950.00, 'Finalizada'),
('KTM', 'Duke 390', 373, 190.00, 'En Reparación');