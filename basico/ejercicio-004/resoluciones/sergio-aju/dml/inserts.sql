USE db_garaje_motos;
TRUNCATE TABLE motos;

INSERT INTO motos (marca, modelo, cilindrada, precio_alquiler_dia, disponible) VALUES
('Yamaha', 'FZ 250', 250, 150.00, TRUE),
('Honda', 'Navi 110', 110, 75.50, TRUE),
('Suzuki', 'GN 125', 125, 90.00, FALSE),
('Bajaj', 'Pulsar NS 200', 200, 130.00, TRUE),
('Kawasaki', 'Ninja 400', 400, 350.00, TRUE),
('Yamaha', 'MT-03', 321, 280.00, FALSE),
('Honda', 'XR 190L', 190, 160.00, TRUE),
('TVS', 'Apache RTR 160', 160, 110.00, TRUE);