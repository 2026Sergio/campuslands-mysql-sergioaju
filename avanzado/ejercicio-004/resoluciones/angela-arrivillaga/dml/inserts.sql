-- campuslands mysql - avanzado ejercicio 004
-- dml/inserts.sql

USE campuslands_mysql;

-- 1. Insertamos 8 registros de prueba en la tabla motos
INSERT INTO motos (id, marca, modelo, cilindraje, precio, estado) VALUES
(1, 'Yamaha', 'MT-07', 689, 35000.00, 'disponible'),
(2, 'Honda', 'CB500F', 471, 28000.00, 'disponible'),
(3, 'Kawasaki', 'Ninja 400', 399, 24000.00, 'disponible'),
(4, 'Ducati', 'Monster', 937, 58000.00, 'mantenimiento'),
(5, 'KTM', 'Duke 390', 373, 21000.00, 'disponible'),
(6, 'BMW', 'G 310 R', 313, 22500.00, 'vendida'),
(7, 'Suzuki', 'GIXR 150', 150, 9500.00, 'disponible'),
(8, 'Royal Enfield', 'Himalayan', 411, 18500.00, 'mantenimiento');

-- 2. Simulamos el registro de auditoria/historial
INSERT INTO historial_motos (moto_id, mensaje) VALUES
(1, 'Nueva moto ingresada al garaje: Yamaha MT-07'),
(2, 'Nueva moto ingresada al garaje: Honda CB500F'),
(3, 'Nueva moto ingresada al garaje: Kawasaki Ninja 400'),
(4, 'Moto enviada a revision: Ducati Monster'),
(5, 'Nueva moto ingresada al garaje: KTM Duke 390'),
(6, 'Moto registrada como vendida: BMW G 310 R'),
(7, 'Nueva moto ingresada al garaje: Suzuki GIXR 150'),
(8, 'Moto enviada a revision: Royal Enfield Himalayan');