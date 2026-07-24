-- Consultas base y Funciones (UDF).
USE campuslands_mysql;

-- 1. Creacion de la funcion para categorizar la rareza de la skin basada en su precio
DELIMITER //
CREATE FUNCTION CategorizarPrecioSkin(p_precio INT) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  DECLARE v_categoria VARCHAR(20);
  IF p_precio >= 2475 THEN SET v_categoria = 'Exclusiva';
  ELSEIF p_precio >= 2175 THEN SET v_categoria = 'Legendaria';
  ELSEIF p_precio >= 1775 THEN SET v_categoria = 'Epica';
  ELSE SET v_categoria = 'Estandar';
  END IF;
  RETURN v_categoria;
END //
DELIMITER ;

-- 2. Uso de la funcion para listar todas las skins con su categoria calculada dinamicamente
SELECT s.nombre_arma, c.nombre AS coleccion, s.precio_puntos, CategorizarPrecioSkin(s.precio_puntos) AS rareza_calculada 
    FROM avanzado_ejercicio_003_skins 
    s JOIN avanzado_ejercicio_003_colecciones 
    c ON s.coleccion_id = c.id;

-- 3. Agrupar la cantidad de skins utilizando la funcion como criterio de agrupacion
SELECT CategorizarPrecioSkin(precio_puntos) AS categoria_generada, COUNT(*) AS total_skins 
    FROM avanzado_ejercicio_003_skins 
    GROUP BY categoria_generada 
    ORDER BY total_skins DESC;
    
-- 4. Creacion de una segunda funcion para convertir Puntos a Dolares (1 VP = 0.0105 USD aprox)
DELIMITER //
CREATE FUNCTION ConvertirPuntosAUSD(p_precio INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN ROUND(p_precio * 0.0105, 2);
END //
DELIMITER ;

-- 5. Listar las colecciones y el valor en USD de su skin usando la segunda funcion
SELECT c.nombre AS coleccion, s.nombre_arma, s.precio_puntos, ConvertirPuntosAUSD(s.precio_puntos) AS precio_usd 
    FROM avanzado_ejercicio_003_skins 
    s JOIN avanzado_ejercicio_003_colecciones 
    c ON s.coleccion_id = c.id 
    ORDER BY precio_usd DESC;