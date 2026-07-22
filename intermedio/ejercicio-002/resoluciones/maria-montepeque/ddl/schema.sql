-- intermedio/ejercicio-002 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS partidas_battle_royale;
DROP TABLE IF EXISTS escuadras_battle_royale;

CREATE TABLE escuadras_battle_royale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    plataforma ENUM(
        'pc',
        'consola',
        'movil'
    ) NOT NULL,
    fecha_creacion DATE NOT NULL
);

CREATE TABLE partidas_battle_royale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    escuadra_id INT NOT NULL,
    mapa VARCHAR(60) NOT NULL,
    posicion_final INT NOT NULL,
    eliminaciones INT NOT NULL DEFAULT 0,
    puntos_obtenidos INT NOT NULL DEFAULT 0,
    fecha_partida DATE NOT NULL,
    CONSTRAINT fk_partidas_escuadra
        FOREIGN KEY (escuadra_id)
        REFERENCES escuadras_battle_royale(id),
    CONSTRAINT chk_posicion_partidas_br CHECK (posicion_final > 0),
    CONSTRAINT chk_eliminaciones_partidas_br CHECK (eliminaciones >= 0)
);
