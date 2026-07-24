CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS inventario_skins;

CREATE TABLE inventario_skins (
    id_skin INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(100) NOT NULL,
    arma VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    rareza VARCHAR(30) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,

    CONSTRAINT chk_precio_positivo 
    CHECK (precio >= 0),

    CONSTRAINT chk_estado_skin
    CHECK (estado IN ('activo','retirado'))
);