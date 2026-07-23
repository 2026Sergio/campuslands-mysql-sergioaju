CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS inventario_skins;

CREATE TABLE inventario_skins (
  id_skin INT AUTO_INCREMENT PRIMARY KEY,
  jugador VARCHAR(50) NOT NULL,
  nombre_skin VARCHAR(80) NOT NULL,
  arma VARCHAR(40) NOT NULL,
  rareza ENUM('comun','raro','epico','legendario') NOT NULL,
  precio DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  fecha_obtencion DATE NOT NULL,
  equipada BOOLEAN NOT NULL DEFAULT FALSE,
  estado ENUM('disponible','bloqueada','en_revision') NOT NULL DEFAULT 'disponible'
);