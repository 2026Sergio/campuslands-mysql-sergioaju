CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS movimientos_premio;
DROP TABLE IF EXISTS billeteras_equipo;

CREATE TABLE billeteras_equipo (
  id_billetera INT AUTO_INCREMENT PRIMARY KEY,
  nombre_equipo VARCHAR(60) NOT NULL UNIQUE,
  saldo DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado ENUM('activa','congelada') NOT NULL DEFAULT 'activa',
  CHECK (saldo >= 0)
) ENGINE=InnoDB;

CREATE TABLE movimientos_premio (
  id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
  id_billetera INT NOT NULL,
  tipo_movimiento ENUM('deposito','retiro') NOT NULL,
  monto DECIMAL(10,2) NOT NULL,
  concepto VARCHAR(80) NOT NULL,
  fecha_movimiento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_mov_billetera FOREIGN KEY (id_billetera) REFERENCES billeteras_equipo(id_billetera)
) ENGINE=InnoDB;