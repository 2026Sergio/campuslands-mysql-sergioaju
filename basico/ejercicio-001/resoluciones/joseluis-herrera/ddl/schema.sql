USE EjerciciosPrAndre;

CREATE TABLE equipos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
victorias INT NOT NULL, 
derrotas INT NOT NULL, 
puntuaje INT NOT NULL, 
fecha_registro DATE NOT NULL, 
UNIQUE(nombre)
);