-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO clanes
(nombre, region, lider, estado)
VALUES
('Shadow Wolves','Norte','Carlos Ruiz','Activo'),
('Fire Legends','Sur','Ana López','Activo'),
('Storm Kings','Este','Luis Pérez','Activo'),
('Night Ravens','Oeste','María Díaz','Activo'),
('Ice Titans','Centro','Pedro Gómez','Inactivo');

INSERT INTO jugadores
(nombre,nickname,nivel,puntos,clan_id)
VALUES
('Juan Pérez','ShadowFox',82,5400.50,1),
('Laura Ramos','DarkNova',74,4800.20,1),
('Miguel Castro','FireStorm',91,6900.40,2),
('Sofía Morales','RedQueen',80,5900.10,2),
('Pedro López','SkyHunter',65,3600.30,3),
('Ana Torres','StormGirl',77,5100.80,3),
('Luis Gómez','NightWolf',69,4200.00,4),
('María Pérez','SilentShot',84,6100.60,NULL);