USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS garaje_motos (
    moto_id INT NOT NULL AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindraje INT NOT NULL,
    anio INT NOT NULL,
    precio DECIMAL(12,2) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (moto_id)
);

CREATE TABLE IF NOT EXISTS historial_garaje_motos (
    historial_id INT NOT NULL AUTO_INCREMENT,
    moto_id INT NOT NULL,
    accion VARCHAR(30) NOT NULL,
    fecha_accion DATETIME NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    PRIMARY KEY (historial_id),
    FOREIGN KEY (moto_id) REFERENCES garaje_motos(moto_id)
);

DELIMITER $$

CREATE TRIGGER tr_moto_insertada
AFTER INSERT ON garaje_motos
FOR EACH ROW
BEGIN
    INSERT INTO historial_garaje_motos (
        moto_id,
        accion,
        fecha_accion,
        descripcion
    )
    VALUES (
        NEW.moto_id,
        'INSERT',
        NOW(),
        CONCAT('Se registro la motocicleta ', NEW.marca, ' ', NEW.modelo)
    );
END $$

CREATE TRIGGER tr_moto_actualizada
AFTER UPDATE ON garaje_motos
FOR EACH ROW
BEGIN
    INSERT INTO historial_garaje_motos (
        moto_id,
        accion,
        fecha_accion,
        descripcion
    )
    VALUES (
        NEW.moto_id,
        'UPDATE',
        NOW(),
        CONCAT(
            'Se actualizo la motocicleta ',
            NEW.marca,
            ' ',
            NEW.modelo,
            '. Estado anterior: ',
            OLD.estado,
            '. Estado nuevo: ',
            NEW.estado
        )
    );
END $$

CREATE TRIGGER tr_moto_eliminada
AFTER DELETE ON garaje_motos
FOR EACH ROW
BEGIN
    INSERT INTO historial_garaje_motos (
        moto_id,
        accion,
        fecha_accion,
        descripcion
    )
    VALUES (
        OLD.moto_id,
        'DELETE',
        NOW(),
        CONCAT('Se elimino la motocicleta ', OLD.marca, ' ', OLD.modelo)
    );
END $$

DELIMITER ;