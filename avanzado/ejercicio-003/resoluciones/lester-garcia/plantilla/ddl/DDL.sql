DROP DATABASE IF EXISTS inventario_skins_shooter;
CREATE DATABASE inventario_skins_shooter;
USE inventario_skins_shooter;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    pais VARCHAR(50),
    fecha_registro DATE
);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(120)
);

CREATE TABLE skins (
    id_skin INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    rareza ENUM('Comun','Rara','Epica','Legendaria') NOT NULL,
    precio DECIMAL(10,2),
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);

CREATE TABLE inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_skin INT NOT NULL,
    fecha_adquisicion DATE,
    equipada BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_jugador)
        REFERENCES jugadores(id_jugador),
    FOREIGN KEY (id_skin)
        REFERENCES skins(id_skin)
);

CREATE TABLE compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    fecha DATETIME,
    total DECIMAL(10,2),
    metodo_pago VARCHAR(40),
    FOREIGN KEY (id_jugador)
        REFERENCES jugadores(id_jugador)
);