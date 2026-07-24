-- avanzado/ejercicio-006 - maria-montepeque
-- A diferencia del ejercicio de indices (donde el punto era crear el indice
-- y comparar antes/despues), aqui los indices ya existen desde el inicio.
-- El objetivo es leer e interpretar distintos planes de EXPLAIN: casos donde
-- el indice SI se usa, y casos donde el indice EXISTE pero el optimizador
-- decide (correctamente) no usarlo por como esta escrita la consulta.
USE campuslands_mysql;

DROP TABLE IF EXISTS autos_hiperdeportivos_explain;

CREATE TABLE autos_hiperdeportivos_explain (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(12) NOT NULL UNIQUE,
    marca VARCHAR(60) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    pais_origen VARCHAR(60) NOT NULL,
    precio DECIMAL(12, 2) NOT NULL DEFAULT 0,
    potencia_hp INT NOT NULL,
    anio YEAR NOT NULL,
    CONSTRAINT chk_precio_auto_explain CHECK (precio >= 0),
    CONSTRAINT chk_potencia_auto_explain CHECK (potencia_hp > 0)
);

CREATE INDEX idx_marca_auto_explain ON autos_hiperdeportivos_explain (marca);
CREATE INDEX idx_precio_auto_explain ON autos_hiperdeportivos_explain (precio);
CREATE INDEX idx_pais_auto_explain ON autos_hiperdeportivos_explain (pais_origen);
