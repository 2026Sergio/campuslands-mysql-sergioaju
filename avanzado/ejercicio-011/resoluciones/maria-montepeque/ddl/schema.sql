-- avanzado/ejercicio-011 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS entrenamientos_pingpong_cte;

CREATE TABLE entrenamientos_pingpong_cte (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador VARCHAR(80) NOT NULL,
    fecha_entrenamiento DATE NOT NULL,
    duracion_minutos INT NOT NULL,
    CONSTRAINT chk_duracion_entrenamiento_cte CHECK (duracion_minutos > 0)
);
