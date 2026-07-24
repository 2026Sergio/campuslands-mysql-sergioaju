USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS skins_shooter (
    skin_id INT NOT NULL AUTO_INCREMENT,
    nombre_skin VARCHAR(100) NOT NULL,
    rareza VARCHAR(50) NOT NULL,
    tipo_arma VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (skin_id)
);

CREATE TABLE IF NOT EXISTS inventario_skins_shooter (
    inventario_id INT NOT NULL AUTO_INCREMENT,
    skin_id INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (inventario_id),
    FOREIGN KEY (skin_id) REFERENCES skins_shooter(skin_id)
);