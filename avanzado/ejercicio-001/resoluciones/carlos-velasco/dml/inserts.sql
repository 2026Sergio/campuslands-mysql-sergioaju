-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO equipos
(nombre,region,entrenador,presupuesto,estado)
VALUES
('Dragons','Norte','Carlos Ruiz',50000,'Activo'),
('Titans','Sur','Ana López',45000,'Activo'),
('Phoenix','Este','Luis Pérez',60000,'Activo'),
('Shadow','Oeste','María Díaz',30000,'Activo');

INSERT INTO jugadores
(nombre,nickname,rol,valor,equipo_id)
VALUES
('Juan Pérez','DragonX','Top',8000,1),
('Luis Gómez','FireWolf','Jungla',9000,1),
('Ana Torres','TitanGirl','Mid',9500,2),
('Pedro López','TitanPro','ADC',7000,2),
('Sofía Díaz','PhoenixQueen','Support',8500,3),
('Miguel Castro','DarkMage','Mid',10000,3),
('Laura Ramos','ShadowGirl','ADC',6500,4),
('Carlos Méndez','NightKing','Top',6000,4);