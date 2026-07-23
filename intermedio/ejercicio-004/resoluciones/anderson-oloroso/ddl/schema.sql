USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS garaje_motos (
    moto_id INT NOT NULL AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindraje INT NOT NULL,
    anio INT NOT NULL,
    precio DECIMAL(12,2) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (moto_id)
);