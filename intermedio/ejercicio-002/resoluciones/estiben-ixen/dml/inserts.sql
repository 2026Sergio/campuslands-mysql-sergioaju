USE campuslands_mysql;

INSERT INTO jugadores(nickname,pais,nivel,estado)
VALUES
('Shadow','Guatemala',52,'Activo'),
('Hunter','México',61,'Activo'),
('Nova','Costa Rica',45,'Activo'),
('Blaze','El Salvador',39,'Activo'),
('Ghost','Honduras',58,'Activo'),
('Falcon','Nicaragua',47,'Activo'),
('Storm','Panamá',50,'Inactivo'),
('Titan','Belice',41,'Activo');

INSERT INTO partidas(id_jugador,mapa,posicion,eliminaciones,puntos)
VALUES
(1,'Isla',2,8,180.50),
(2,'Desierto',1,10,220.00),
(3,'Ciudad',5,4,120.75),
(4,'Bosque',3,7,165.20),
(5,'Isla',4,5,140.00),
(6,'Ciudad',6,2,90.50);