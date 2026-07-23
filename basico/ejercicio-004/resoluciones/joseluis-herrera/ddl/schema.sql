USE EjerciciosPrAndre;

CREATE TABLE motos (
	id_moto INT AUTO_INCREMENT PRIMARY KEY,
    marca varchar(50),
    modelo varchar(60),
	placa varchar(60),
    cilindrada INT, 
    pais_origin varchar(60),
    velocidad_maxima INT
);