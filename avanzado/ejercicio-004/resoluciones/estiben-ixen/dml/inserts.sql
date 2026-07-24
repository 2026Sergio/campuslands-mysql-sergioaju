USE campuslands_mysql;


INSERT INTO garaje_motos
(placa, marca, modelo, cilindrada, propietario, espacio_parqueo)
VALUES
('ABC123','Yamaha','MT-03',321,'Carlos Mendoza','P01'),
('DEF456','Honda','CB190R',184,'Ana Lopez','P02'),
('GHI789','Suzuki','GSX150',150,'Pedro Castillo','P03'),
('JKL321','Kawasaki','Ninja 400',399,'Luis Ramirez','P04'),
('MNO654','BMW','G310R',313,'Maria Torres','P05'),
('PQR987','Honda','XR150L',149,'Jose Herrera','P06'),
('STU741','Yamaha','FZ25',249,'Laura Diaz','P07'),
('VWX852',' KTM','Duke 390',373,'Miguel Perez','P08');


UPDATE garaje_motos
SET estado = 'retirada',
    fecha_salida = NOW()
WHERE placa = 'DEF456';