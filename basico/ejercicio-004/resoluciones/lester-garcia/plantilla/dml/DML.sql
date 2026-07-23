USE garaje_motos;

INSERT INTO propietarios(nombre,dpi,telefono,ciudad)
VALUES
('Luis García','3012456780101','55112233','Guatemala'),
('Ana López','3023456780202','55223344','Mixco'),
('Carlos Pérez','3034456780303','55334455','Villa Nueva'),
('María Torres','3045456780404','55445566','Antigua Guatemala'),
('Pedro Gómez','3056456780505','55556677','Escuintla'),
('Laura Díaz','3067456780606','55667788','Quetzaltenango'),
('Miguel Castro','3078456780707','55778899','Cobán'),
('Sofía Herrera','3089456780808','55889900','Chiquimula'),
('José Morales','3091456780909','55990011','Jalapa'),
('Kevin Ruiz','3102456781010','55001122','Retalhuleu');

INSERT INTO marcas(nombre,pais_origen)
VALUES
('Honda','Japón'),
('Yamaha','Japón'),
('Suzuki','Japón'),
('Kawasaki','Japón'),
('Bajaj','India'),
('KTM','Austria'),
('Ducati','Italia'),
('BMW','Alemania'),
('Harley-Davidson','Estados Unidos'),
('CFMoto','China');

INSERT INTO motos(placa,modelo,anio,color,cilindraje,id_marca,id_propietario)
VALUES
('M001ABC','CB190R',2022,'Rojo',190,1,1),
('M002BCD','FZ25',2021,'Azul',250,2,2),
('M003CDE','Gixxer 250',2023,'Negro',250,3,3),
('M004DEF','Ninja 400',2022,'Verde',400,4,4),
('M005EFG','Pulsar NS200',2021,'Gris',200,5,5),
('M006FGH','Duke 390',2023,'Naranja',390,6,6),
('M007GHI','Monster',2020,'Rojo',937,7,7),
('M008HIJ','G310R',2022,'Blanco',310,8,8),
('M009IJK','Iron 883',2019,'Negro',883,9,9),
('M010JKL','NK300',2024,'Azul',300,10,10);

INSERT INTO mantenimientos(id_moto,fecha,tipo_servicio,costo,observaciones)
VALUES
(1,'2025-01-10','Cambio de aceite',180.00,'Servicio preventivo'),
(2,'2025-01-18','Cambio de llantas',850.00,'Llanta delantera'),
(3,'2025-02-05','Revisión general',300.00,'Sin novedades'),
(4,'2025-02-15','Cambio de cadena',420.00,'Cadena nueva'),
(5,'2025-03-02','Cambio de aceite',170.00,'Incluye filtro'),
(6,'2025-03-20','Ajuste de frenos',250.00,'Frenos calibrados'),
(7,'2025-04-08','Revisión eléctrica',380.00,'Cambio de batería'),
(8,'2025-04-25','Cambio de aceite',190.00,'Aceite sintético'),
(9,'2025-05-11','Lavado premium',90.00,'Lavado completo'),
(10,'2025-05-28','Revisión general',320.00,'Moto en buen estado');