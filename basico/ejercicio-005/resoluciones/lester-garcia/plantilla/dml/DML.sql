USE taller_mecanico_motos;

INSERT INTO clientes(nombre,telefono,ciudad)
VALUES
('Luis García','55112233','Guatemala'),
('Ana López','55223344','Mixco'),
('Carlos Pérez','55334455','Villa Nueva'),
('María Torres','55445566','Antigua Guatemala'),
('Pedro Gómez','55556677','Escuintla'),
('Laura Díaz','55667788','Quetzaltenango'),
('Miguel Castro','55778899','Cobán'),
('Sofía Herrera','55889900','Chiquimula'),
('José Morales','55990011','Jalapa'),
('Kevin Ruiz','55001122','Retalhuleu');

INSERT INTO mecanicos(nombre,especialidad,experiencia_anios)
VALUES
('Carlos Méndez','Motor',10),
('Jorge Morales','Suspensión',8),
('Luis Herrera','Electricidad',6),
('Pedro Ramírez','Frenos',12),
('Miguel Díaz','Transmisión',9),
('Andrés López','Diagnóstico',7),
('Mario Castro','Mantenimiento',5),
('José Pérez','Inyección',11),
('Kevin Flores','Carburación',4),
('Ricardo Soto','Llantas',6);

INSERT INTO motocicletas(placa,marca,modelo,anio,id_cliente)
VALUES
('M001ABC','Honda','CB190R',2022,1),
('M002BCD','Yamaha','FZ25',2021,2),
('M003CDE','Suzuki','Gixxer 250',2023,3),
('M004DEF','Kawasaki','Ninja 400',2022,4),
('M005EFG','Bajaj','Pulsar NS200',2021,5),
('M006FGH','KTM','Duke 390',2023,6),
('M007GHI','Ducati','Monster',2020,7),
('M008HIJ','BMW','G310R',2022,8),
('M009IJK','Harley-Davidson','Iron 883',2019,9),
('M010JKL','CFMoto','NK300',2024,10);

INSERT INTO reparaciones(id_motocicleta,id_mecanico,fecha,servicio,costo,estado)
VALUES
(1,1,'2025-01-10','Cambio de aceite',180.00,'Finalizada'),
(2,2,'2025-01-18','Cambio de suspensión',950.00,'Finalizada'),
(3,3,'2025-02-05','Diagnóstico eléctrico',320.00,'En proceso'),
(4,4,'2025-02-15','Cambio de frenos',420.00,'Finalizada'),
(5,5,'2025-03-02','Cambio de cadena',350.00,'Pendiente'),
(6,6,'2025-03-20','Revisión general',280.00,'Finalizada'),
(7,7,'2025-04-08','Afinación',250.00,'En proceso'),
(8,8,'2025-04-25','Limpieza de inyectores',300.00,'Finalizada'),
(9,9,'2025-05-11','Ajuste de carburador',210.00,'Pendiente'),
(10,10,'2025-05-28','Cambio de llantas',780.00,'Finalizada');