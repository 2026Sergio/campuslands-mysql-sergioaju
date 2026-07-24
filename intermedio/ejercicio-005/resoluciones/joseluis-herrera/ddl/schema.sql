CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar (50),
    apellido varchar(50)
);

CREATE TABLE motos (
	id_moto INT AUTO_INCREMENT PRIMARY KEY,
    marca varchar(50),
    modelo varchar(60),
	placa varchar(60),
    cilindrada INT, 
    pais_origin varchar(60),
    velocidad_maxima INT,
    id_cliente INT,
    CONSTRAINT fk_moto_cliente FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
); 


