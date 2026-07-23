-- avanzado/ejercicio-009 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS eventos_kickboxing_locks;

CREATE TABLE eventos_kickboxing_locks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_evento VARCHAR(100) NOT NULL UNIQUE,
    cupos_disponibles INT NOT NULL DEFAULT 0,
    CONSTRAINT chk_cupos_kickboxing_locks CHECK (cupos_disponibles >= 0)
);
