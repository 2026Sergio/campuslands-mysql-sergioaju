USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS autos_hiperdeportivos (
    auto_id INT NOT NULL AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    velocidad_maxima INT NOT NULL,
    potencia_hp INT NOT NULL,
    precio DECIMAL(15,2) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL,
    PRIMARY KEY (auto_id)
);