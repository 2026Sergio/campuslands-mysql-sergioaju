-- datos de prueba para el garaje de motos
USE campuslands_mysql;

-- insertamos 9 registros de motos variadas
INSERT INTO motos (marca, modelo, cilindraje, precio, estado) VALUES
('Yamaha', 'MT-07', 689, 8500.00, 'disponible'),
('Yamaha', 'R3', 321, 5200.00, 'disponible'),
('Yamaha', 'FZ25', 249, 3800.00, 'mantenimiento'),
('Honda', 'CB500F', 471, 6900.00, 'disponible'),
('Honda', 'CBR600RR', 599, 11500.00, 'vendida'),
('Kawasaki', 'Ninja 400', 399, 5800.00, 'disponible'),
('Kawasaki', 'Z900', 948, 10200.00, 'disponible'),
('KTM', 'Duke 390', 373, 5500.00, 'disponible'),
('KTM', 'RC 200', 199, 3200.00, 'mantenimiento');