CREATE TABLE catalogo_skins (
    id_skin INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(60) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    rareza VARCHAR(30) NOT NULL,
    precio INT DEFAULT 0,
    desgaste VARCHAR(30) DEFAULT 'Factory New'
);