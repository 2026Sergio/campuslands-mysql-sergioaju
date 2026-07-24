-- intermedio/ejercicio-006 - maria-montepeque
-- Objetivo: normalizacion 1FN.
--
-- Diseno NO normalizado que se queria evitar (solo como referencia, no se crea):
--   CREATE TABLE modelos_hiperdeportivos (
--       id INT PRIMARY KEY,
--       modelo VARCHAR(60),
--       colores_disponibles VARCHAR(200)  -- ej: 'Rojo, Negro, Blanco'  <- viola 1FN
--   );
-- Ese diseno mete varios valores (colores) en una sola celda, lo que impide
-- filtrar, contar o unir por color de forma limpia y confiable con SQL.
--
-- Diseno en 1FN: cada color disponible es una fila atomica en su propia
-- tabla, relacionada con el modelo por clave foranea.
USE campuslands_mysql;

DROP TABLE IF EXISTS colores_disponibles_modelo;
DROP TABLE IF EXISTS modelos_hiperdeportivos;

CREATE TABLE modelos_hiperdeportivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(60) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    anio YEAR NOT NULL,
    potencia_hp INT NOT NULL,
    precio DECIMAL(12, 2) NOT NULL DEFAULT 0,
    CONSTRAINT uq_marca_modelo_anio UNIQUE (marca, modelo, anio),
    CONSTRAINT chk_potencia_modelos_hiper CHECK (potencia_hp > 0)
);

CREATE TABLE colores_disponibles_modelo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo_id INT NOT NULL,
    color VARCHAR(40) NOT NULL,
    CONSTRAINT fk_colores_modelo
        FOREIGN KEY (modelo_id)
        REFERENCES modelos_hiperdeportivos(id),
    CONSTRAINT uq_modelo_color UNIQUE (modelo_id, color)
);
