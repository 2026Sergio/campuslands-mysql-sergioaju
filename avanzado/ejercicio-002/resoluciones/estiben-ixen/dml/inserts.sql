USE campuslands_mysql;

START TRANSACTION;

INSERT INTO jugadores_battle 
(nombre_jugador, nickname, nivel, partidas_jugadas, victorias, puntaje, estado)
VALUES
('Carlos Mendoza','ShadowKing',50,120,45,9850.50,'Activo'),
('Ana Lopez','FireQueen',45,100,38,8700.00,'Activo'),
('Luis Ramirez','TitanShot',40,95,30,7600.75,'Activo'),
('Mario Castillo','SniperPro',35,80,20,6500.20,'Activo'),
('Sofia Hernandez','StormGirl',48,110,42,9200.40,'Activo'),
('Kevin Morales','WolfHunter',30,70,15,5200.00,'Activo'),
('Andrea Perez','NightBlade',25,60,10,4300.50,'Activo'),
('Jose Garcia','RapidKill',20,50,8,3500.75,'Inactivo');

COMMIT;