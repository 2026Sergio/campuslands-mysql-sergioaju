-- intermedio/ejercicio-014 - maria-montepeque
USE campuslands_mysql;

DROP VIEW IF EXISTS vista_proximos_estrenos_saga;
DROP VIEW IF EXISTS vista_resumen_saga;
DROP VIEW IF EXISTS vista_peliculas_estrenadas_saga;
DROP TABLE IF EXISTS peliculas_saga_cf;

CREATE TABLE peliculas_saga_cf (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL UNIQUE,
    saga VARCHAR(80) NOT NULL,
    episodio INT NOT NULL,
    fecha_estreno DATE NOT NULL,
    duracion_minutos INT NOT NULL,
    recaudacion_millones DECIMAL(10, 2) NOT NULL DEFAULT 0,
    estado ENUM(
        'estrenada',
        'en_produccion',
        'cancelada'
    ) NOT NULL DEFAULT 'en_produccion',
    CONSTRAINT chk_duracion_saga_cf CHECK (duracion_minutos > 0),
    CONSTRAINT chk_episodio_saga_cf CHECK (episodio > 0)
);

-- Vista 1: solo las peliculas que ya se estrenaron, con los datos que
-- normalmente interesan para reportes de taquilla.
CREATE VIEW vista_peliculas_estrenadas_saga AS
SELECT
    titulo,
    saga,
    fecha_estreno,
    duracion_minutos,
    recaudacion_millones
FROM peliculas_saga_cf
WHERE estado = 'estrenada';

-- Vista 2: resumen agregado por saga (cantidad de peliculas, recaudacion
-- total y duracion promedio). Encapsula un GROUP BY que se reutiliza en
-- varias consultas sin tener que repetirlo cada vez.
CREATE VIEW vista_resumen_saga AS
SELECT
    saga,
    COUNT(*) AS total_peliculas,
    SUM(recaudacion_millones) AS recaudacion_total,
    ROUND(AVG(duracion_minutos), 2) AS duracion_promedio
FROM peliculas_saga_cf
WHERE estado = 'estrenada'
GROUP BY saga;

-- Vista 3: proximos estrenos (peliculas en produccion), listas para mostrar
-- en un panel sin exponer el resto de columnas de la tabla base.
CREATE VIEW vista_proximos_estrenos_saga AS
SELECT
    titulo,
    saga,
    fecha_estreno
FROM peliculas_saga_cf
WHERE estado = 'en_produccion';
