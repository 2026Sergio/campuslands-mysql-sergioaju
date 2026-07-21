-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO clanes
(nombre,region,lider,estado)
VALUES
('Shadow Wolves','Norte','Carlos Ruiz','Activo'),
('Fire Legends','Sur','Ana López','Activo'),
('Storm Kings','Este','Luis Pérez','Activo'),
('Night Ravens','Oeste','María Díaz','Activo');

CALL registrar_jugador('Juan Pérez','ShadowFox',82,5400.50,1);
CALL registrar_jugador('Laura Ramos','DarkNova',74,4800.20,1);
CALL registrar_jugador('Miguel Castro','FireStorm',91,6900.40,2);
CALL registrar_jugador('Sofía Morales','RedQueen',80,5900.10,2);
CALL registrar_jugador('Pedro López','SkyHunter',65,3600.30,3);
CALL registrar_jugador('Ana Torres','StormGirl',77,5100.80,3);
CALL registrar_jugador('Luis Gómez','NightWolf',69,4200.00,4);
CALL registrar_jugador('María Pérez','SilentShot',84,6100.60,NULL);
