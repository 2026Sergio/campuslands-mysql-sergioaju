-- basico/ejercicio-003 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS inventario_skins_shooter;

CREATE TABLE inventario_skins_shooter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_skin VARCHAR(20) NOT NULL UNIQUE,
    nombre_skin VARCHAR(80) NOT NULL,
    arma VARCHAR(60) NOT NULL,
    rareza ENUM(
        'comun',
        'poco_comun',
        'raro',
        'epico',
        'legendario'
    ) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL DEFAULT 0,
    propietario VARCHAR(60) NOT NULL,
    fecha_obtencion DATE NOT NULL,
    estado ENUM(
        'equipada',
        'inventario',
        'vendida'
    ) NOT NULL DEFAULT 'inventario',
    CONSTRAINT chk_precio_no_negativo_skins CHECK (precio >= 0)
);
