CREATE TABLE colecciones (
    coleccion_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_coleccion VARCHAR(100) NOT NULL UNIQUE,
    temporada VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Activa' CHECK (estado IN ('Activa', 'Retirada', 'Evento')),
    fecha_lanzamiento DATE NOT NULL
);

CREATE TABLE skins (
    skin_id INT AUTO_INCREMENT PRIMARY KEY,
    coleccion_id INT NOT NULL,
    nombre_skin VARCHAR(100) NOT NULL,
    arma_tipo VARCHAR(50) NOT NULL CHECK (arma_tipo IN ('Rifle', 'Pistola', 'Francotirador', 'Subfusil', 'Cuchillo')),
    rareza VARCHAR(20) NOT NULL CHECK (rareza IN ('Común', 'Raro', 'Épico', 'Legendario', 'Mítico')),
    precio_mercado DECIMAL(10,2) NOT NULL CHECK (precio_mercado >= 0.00),
    stock_disponible INT NOT NULL DEFAULT 0 CHECK (stock_disponible >= 0),
    es_stattrak BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_skins_colecciones 
        FOREIGN KEY (coleccion_id) REFERENCES colecciones(coleccion_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);