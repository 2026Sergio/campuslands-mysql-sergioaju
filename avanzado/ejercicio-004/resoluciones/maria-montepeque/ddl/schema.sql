-- avanzado/ejercicio-004 - maria-montepeque
USE campuslands_mysql;

DROP TRIGGER IF EXISTS trg_motos_before_update;
DROP TRIGGER IF EXISTS trg_motos_after_update_precio;
DROP TRIGGER IF EXISTS trg_motos_after_update_estado;
DROP TABLE IF EXISTS historial_estado_motos_trg;
DROP TABLE IF EXISTS historial_precios_motos_trg;
DROP TABLE IF EXISTS motos_garaje_trg;

CREATE TABLE motos_garaje_trg (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(60) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL DEFAULT 0,
    estado ENUM(
        'disponible',
        'en_reparacion',
        'vendida'
    ) NOT NULL DEFAULT 'disponible',
    fecha_ingreso DATE NOT NULL,
    fecha_ultima_modificacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_precio_motos_trg CHECK (precio >= 0)
);

CREATE TABLE historial_precios_motos_trg (
    id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    precio_anterior DECIMAL(10, 2) NOT NULL,
    precio_nuevo DECIMAL(10, 2) NOT NULL,
    fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_historial_precio_moto
        FOREIGN KEY (moto_id)
        REFERENCES motos_garaje_trg(id)
);

CREATE TABLE historial_estado_motos_trg (
    id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    estado_anterior ENUM('disponible', 'en_reparacion', 'vendida') NOT NULL,
    estado_nuevo ENUM('disponible', 'en_reparacion', 'vendida') NOT NULL,
    fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_historial_estado_moto
        FOREIGN KEY (moto_id)
        REFERENCES motos_garaje_trg(id)
);

DELIMITER $$

-- Trigger 1: cada vez que se actualiza una moto, se refresca automaticamente
-- su fecha_ultima_modificacion, sin depender de que la aplicacion se acuerde
-- de hacerlo.
CREATE TRIGGER trg_motos_before_update
BEFORE UPDATE ON motos_garaje_trg
FOR EACH ROW
BEGIN
    SET NEW.fecha_ultima_modificacion = NOW();
END$$

-- Trigger 2: si el precio realmente cambio (no en cada UPDATE, solo cuando
-- el valor es distinto), se registra el cambio en el historial de precios.
CREATE TRIGGER trg_motos_after_update_precio
AFTER UPDATE ON motos_garaje_trg
FOR EACH ROW
BEGIN
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO historial_precios_motos_trg (moto_id, precio_anterior, precio_nuevo)
        VALUES (OLD.id, OLD.precio, NEW.precio);
    END IF;
END$$

-- Trigger 3: igual que el anterior, pero para cambios de estado.
CREATE TRIGGER trg_motos_after_update_estado
AFTER UPDATE ON motos_garaje_trg
FOR EACH ROW
BEGIN
    IF OLD.estado <> NEW.estado THEN
        INSERT INTO historial_estado_motos_trg (moto_id, estado_anterior, estado_nuevo)
        VALUES (OLD.id, OLD.estado, NEW.estado);
    END IF;
END$$

DELIMITER ;
