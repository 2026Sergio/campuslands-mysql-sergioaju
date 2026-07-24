USE taller_mecanico_motos;

INSERT INTO clientes(nombre,documento,telefono) VALUES
('Juan Pérez','100001','5555-1001'),
('Luis Gómez','100002','5555-1002'),
('Carlos Díaz','100003','5555-1003'),
('María López','100004','5555-1004'),
('Ana Morales','100005','5555-1005'),
('Pedro Castillo','100006','5555-1006');

INSERT INTO motos(placa,marca,modelo,anio,id_cliente) VALUES
('MTA101','Yamaha','FZ25',2022,1),
('MTA102','Honda','CB190R',2021,2),
('MTA103','Suzuki','Gixxer',2023,3),
('MTA104','KTM','Duke 200',2022,4),
('MTA105','Bajaj','Pulsar NS200',2020,5),
('MTA106','TVS','Apache RTR 200',2021,6);

INSERT INTO mecanicos(nombre,especialidad) VALUES
('José Ramírez','Motor'),
('Mario López','Electricidad'),
('Kevin Díaz','Suspensión'),
('Andrés Torres','Frenos'),
('Daniel Castro','Transmisión'),
('Luis Herrera','Diagnóstico');

INSERT INTO reparaciones(id_moto,id_mecanico,descripcion,costo,fecha) VALUES
(1,1,'Cambio de aceite',180.00,'2026-01-10'),
(2,2,'Revisión eléctrica',350.00,'2026-01-15'),
(3,3,'Cambio de suspensión',950.00,'2026-02-01'),
(1,4,'Cambio de frenos',450.00,'2026-02-18'),
(5,1,'Afinación general',650.00,'2026-03-08'),
(6,5,'Cambio de transmisión',1200.00,'2026-03-20'),
(4,6,'Diagnóstico completo',300.00,'2026-04-05'),
(3,3,'Alineación',220.00,'2026-04-18');