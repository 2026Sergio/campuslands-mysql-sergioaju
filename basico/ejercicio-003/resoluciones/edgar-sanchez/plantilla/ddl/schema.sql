CREATE TABLE skins_inventario (
    skin_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(100) NOT NULL,
    arma VARCHAR(50) NOT NULL,
    rareza VARCHAR(20) NOT NULL CHECK (rareza IN ('Común', 'Raro', 'Épico', 'Legendario', 'Mítico')),
    precio_monedas DECIMAL(10,2) NOT NULL CHECK (precio_monedas >= 0.00),
    float_wear DECIMAL(4,3) NOT NULL DEFAULT 0.000 CHECK (float_wear BETWEEN 0.000 AND 1.000),
    es_stattrak BOOLEAN NOT NULL DEFAULT FALSE,
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    fecha_lanzamiento DATE NOT NULL
);