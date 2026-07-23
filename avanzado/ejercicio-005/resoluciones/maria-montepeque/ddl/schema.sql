-- avanzado/ejercicio-005 - maria-montepeque
-- La tabla se crea a proposito SIN indices adicionales (solo PK y el
-- UNIQUE de numero_orden). Los indices de rendimiento se agregan mas
-- adelante, en dql/consultas.sql, para poder comparar con EXPLAIN el
-- "antes" (sin indice) y el "despues" (con indice) sobre la misma consulta.
USE campuslands_mysql;

DROP TABLE IF EXISTS servicios_taller_motos_idx;

CREATE TABLE servicios_taller_motos_idx (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_orden VARCHAR(20) NOT NULL UNIQUE,
    placa_moto VARCHAR(10) NOT NULL,
    cliente VARCHAR(80) NOT NULL,
    mecanico VARCHAR(60) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL DEFAULT 0,
    estado ENUM(
        'pendiente',
        'en_proceso',
        'finalizada',
        'entregada'
    ) NOT NULL DEFAULT 'pendiente',
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT chk_costo_taller_idx CHECK (costo >= 0)
);
