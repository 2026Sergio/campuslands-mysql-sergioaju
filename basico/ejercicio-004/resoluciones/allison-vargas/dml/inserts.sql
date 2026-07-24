-- DML: Sentencias INSERT INTO para poblar el garaje (8 registros)
USE campuslands_mysql;

INSERT INTO motos_basico 
(placa, marca, modelo, anio, precio_alquiler_dia, disponible, estado) 
VALUES
('M-101AAA', 'Yamaha', 'MT-03', 2023, 45.00, TRUE, 'excelente'),
('M-202BBB', 'Honda', 'CB500F', 2022, 55.00, TRUE, 'bueno'),
('M-303CCC', 'Kawasaki', 'Ninja 400', 2024, 60.00, FALSE, 'mantenimiento'),
('M-404DDD', 'BMW', 'G310GS', 2023, 65.00, TRUE, 'excelente'),
('M-505EEE', 'KTM', 'Duke 200', 2021, 35.00, TRUE, 'bueno'),
('M-606FFF', 'Suzuki', 'Gixxer 250', 2022, 40.00, FALSE, 'mantenimiento'),
('M-777GGG', 'Ducati', 'Scrambler 800', 2023, 110.00, TRUE, 'excelente'),
('M-808HHH', 'Royal Enfield', 'Meteor 350', 2022, 50.00, TRUE, 'bueno');
