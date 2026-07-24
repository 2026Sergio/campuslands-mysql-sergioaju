START TRANSACTION;
	INSERT INTO juegos(nombre_juego) VALUES ('Apex Legends');
    INSERT INTO equipos (nombre, victorias, derrotas, puntuaje, fecha_registro, id_juego) 
	VALUES ('DarkZero', 4, 1, 12, '2026-07-23', 4);
    
    COMMIT;

START TRANSACTION;
	INSERT INTO juegos (nombre_juego) VALUES ('Overwatch 2');
	INSERT INTO equipos (nombre, victorias, derrotas, puntuaje, fecha_registro, id_juego) 
	VALUES ('T1', 5, 5, 15, '2026-07-23', 4);

ROLLBACK;