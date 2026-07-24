use campuslands_mysql;

-- insertamos 9 motos variadas para probar los diferentes casos
insert into basico_ejercicio_004 (marca_modelo, tipo_moto, cilindrada_cc, precio_alquiler_dia, estado) values
('yamaha mt-07', 'naked', 689, 85.00, 'disponible'),
('kawasaki ninja 400', 'deportiva', 399, 70.00, 'disponible'),
('honda cb500x', 'adventure', 471, 75.50, 'alquilada'),
('bmw r 1250 gs', 'adventure', 1254, 150.00, 'disponible'),
('ktm duke 390', 'naked', 373, 65.00, 'mantenimiento'),
('ducati panigale v2', 'deportiva', 955, 180.00, 'disponible'),
('suzuki v-strom 650', 'adventure', 645, 80.00, 'alquilada'),
('royal enfield meteor 350', 'cruiser', 349, 50.00, 'disponible'),
('yamaha r3', 'deportiva', 321, 60.00, 'disponible');