-- avanzado/ejercicio-014 - maria-montepeque
-- NOTA: crear la tabla y el EVENT lo puede hacer el usuario normal de la
-- app (campus), ya que ALL PRIVILEGES sobre campuslands_mysql incluye el
-- privilegio EVENT. Pero para que el event scheduler realmente ejecute
-- eventos en el servidor hace falta SET GLOBAL event_scheduler = ON, que
-- SI requiere privilegios de administrador (SUPER / SYSTEM_VARIABLES_ADMIN).
-- Esa activacion se hizo como root al validar este ejercicio (ver readme).
USE campuslands_mysql;

DROP EVENT IF EXISTS ev_actualizar_estrenos_saga_cf;
DROP TABLE IF EXISTS log_eventos_saga_cf;
DROP TABLE IF EXISTS peliculas_saga_cf_events;

CREATE TABLE peliculas_saga_cf_events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL UNIQUE,
    saga VARCHAR(80) NOT NULL,
    episodio INT NOT NULL,
    fecha_estreno DATE NOT NULL,
    estado ENUM(
        'estrenada',
        'en_produccion',
        'cancelada'
    ) NOT NULL DEFAULT 'en_produccion',
    fecha_actualizacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT chk_episodio_saga_cf_events CHECK (episodio > 0)
);

CREATE TABLE log_eventos_saga_cf (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mensaje VARCHAR(200) NOT NULL,
    filas_afectadas INT NOT NULL DEFAULT 0,
    fecha_ejecucion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

-- Event que corre cada minuto: pasa automaticamente de "en_produccion" a
-- "estrenada" cualquier pelicula cuya fecha_estreno ya llego, y deja
-- registro de cada corrida (incluso cuando no actualiza nada) en la tabla
-- de log, para poder auditar que el scheduler esta vivo.
CREATE EVENT ev_actualizar_estrenos_saga_cf
ON SCHEDULE EVERY 1 MINUTE
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    UPDATE peliculas_saga_cf_events
    SET estado = 'estrenada'
    WHERE estado = 'en_produccion'
      AND fecha_estreno <= CURDATE();

    INSERT INTO log_eventos_saga_cf (mensaje, filas_afectadas)
    VALUES ('Revision automatica de estrenos ejecutada', ROW_COUNT());
END$$

DELIMITER ;
