-- avanzado/ejercicio-003 - maria-montepeque
--
-- NOTA IMPORTANTE sobre CREATE FUNCTION en MySQL:
-- Si el servidor tiene el binary log activado (log_bin = ON), MySQL exige
-- el privilegio SUPER para crear funciones, salvo que la variable global
-- log_bin_trust_function_creators este en 1. Si al ejecutar este archivo
-- aparece el error 1419 ("You do not have the SUPER privilege and binary
-- logging is enabled..."), es necesario que un usuario con privilegios
-- de administrador ejecute una sola vez:
--   SET GLOBAL log_bin_trust_function_creators = 1;
-- Esto es una configuracion del servidor, no algo que el script pueda
-- resolver por si mismo con el usuario de la aplicacion (campus).
USE campuslands_mysql;

DROP FUNCTION IF EXISTS fn_categoria_precio_skin;
DROP FUNCTION IF EXISTS fn_dias_en_inventario_skin;
DROP FUNCTION IF EXISTS fn_valor_total_propietario_skin;
DROP TABLE IF EXISTS coleccion_skins_shooter_fn;

CREATE TABLE coleccion_skins_shooter_fn (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_skin VARCHAR(20) NOT NULL UNIQUE,
    nombre_skin VARCHAR(80) NOT NULL,
    arma VARCHAR(60) NOT NULL,
    rareza ENUM(
        'comun',
        'poco_comun',
        'raro',
        'epico',
        'legendario'
    ) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL DEFAULT 0,
    propietario VARCHAR(60) NOT NULL,
    estado ENUM(
        'equipada',
        'inventario',
        'vendida'
    ) NOT NULL DEFAULT 'inventario',
    fecha_obtencion DATE NOT NULL,
    CONSTRAINT chk_precio_coleccion_skins_fn CHECK (precio >= 0)
);

DELIMITER $$

-- Funcion 1: clasifica el precio de una skin en una categoria de negocio.
-- Es puramente computacional (no toca tablas), por eso es DETERMINISTIC.
CREATE FUNCTION fn_categoria_precio_skin (p_precio DECIMAL(10, 2))
RETURNS VARCHAR(20)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE v_categoria VARCHAR(20);

    IF p_precio < 10 THEN
        SET v_categoria = 'Economica';
    ELSEIF p_precio < 40 THEN
        SET v_categoria = 'Media';
    ELSEIF p_precio < 70 THEN
        SET v_categoria = 'Premium';
    ELSE
        SET v_categoria = 'Legendaria';
    END IF;

    RETURN v_categoria;
END$$

-- Funcion 2: dias transcurridos desde que se obtuvo la skin hasta hoy.
-- Depende de CURDATE(), por eso NOT DETERMINISTIC (el resultado cambia
-- cada dia aunque el parametro sea el mismo).
CREATE FUNCTION fn_dias_en_inventario_skin (p_fecha_obtencion DATE)
RETURNS INT
NOT DETERMINISTIC
NO SQL
BEGIN
    RETURN DATEDIFF(CURDATE(), p_fecha_obtencion);
END$$

-- Funcion 3: valor total invertido por un propietario. A diferencia de las
-- otras dos, esta si consulta una tabla (READS SQL DATA), por eso puede
-- usarse dentro de un SELECT como un valor calculado por fila sin tener que
-- escribir la subconsulta cada vez.
CREATE FUNCTION fn_valor_total_propietario_skin (p_propietario VARCHAR(60))
RETURNS DECIMAL(10, 2)
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10, 2);

    SELECT COALESCE(SUM(precio), 0) INTO v_total
    FROM coleccion_skins_shooter_fn
    WHERE propietario = p_propietario;

    RETURN v_total;
END$$

DELIMITER ;
