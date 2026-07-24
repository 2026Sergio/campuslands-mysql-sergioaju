-- avanzado/ejercicio-010 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS participaciones_carreras_urbanas_backup;

CREATE TABLE participaciones_carreras_urbanas_backup (
    id INT AUTO_INCREMENT PRIMARY KEY,
    piloto VARCHAR(80) NOT NULL,
    vehiculo VARCHAR(80) NOT NULL,
    circuito VARCHAR(80) NOT NULL,
    posicion_llegada INT NOT NULL,
    premio_ganado DECIMAL(10, 2) NOT NULL DEFAULT 0,
    penalizaciones INT NOT NULL DEFAULT 0,
    estado ENUM(
        'finalizada',
        'descalificado',
        'abandono'
    ) NOT NULL,
    fecha_carrera DATE NOT NULL,
    CONSTRAINT chk_posicion_carreras_backup CHECK (posicion_llegada > 0)
);
