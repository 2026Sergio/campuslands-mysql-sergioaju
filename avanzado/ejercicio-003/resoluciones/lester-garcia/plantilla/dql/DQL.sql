USE inventario_skins_shooter;

-- ==========================================
-- CONSULTAS
-- ==========================================

-- 1
SELECT *
FROM jugadores;

-- 2
SELECT nombre,rareza,precio
FROM skins
ORDER BY precio DESC;

-- 3
SELECT nickname,nombre
FROM jugadores
JOIN inventario USING(id_jugador)
JOIN skins USING(id_skin);

-- 4
SELECT AVG(precio) AS promedio
FROM skins;

-- 5
SELECT MAX(precio) AS skin_mas_costosa
FROM skins;

-- 6
SELECT COUNT(*) AS total_skins
FROM skins;

-- 7
SELECT metodo_pago,
COUNT(*) AS cantidad
FROM compras
GROUP BY metodo_pago;

-- 8
SELECT nombre
FROM skins
WHERE precio>
(
SELECT AVG(precio)
FROM skins
);

-- ==========================================
-- FUNCIONES SQL
-- ==========================================

DELIMITER $$

CREATE FUNCTION fn_total_skins_jugador(p_jugador INT)
RETURNS INT
DETERMINISTIC
BEGIN

DECLARE cantidad INT;

SELECT COUNT(*)
INTO cantidad
FROM inventario
WHERE id_jugador=p_jugador;

RETURN cantidad;

END $$

DELIMITER ;

SELECT fn_total_skins_jugador(1);

-- ==========================================

DELIMITER $$

CREATE FUNCTION fn_valor_skin(p_skin INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN

DECLARE valor DECIMAL(10,2);

SELECT precio
INTO valor
FROM skins
WHERE id_skin=p_skin;

RETURN valor;

END $$

DELIMITER ;

SELECT fn_valor_skin(6);

-- ==========================================

DELIMITER $$

CREATE FUNCTION fn_rareza_skin(p_skin INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

DECLARE nivel VARCHAR(20);

SELECT rareza
INTO nivel
FROM skins
WHERE id_skin=p_skin;

RETURN nivel;

END $$

DELIMITER ;

SELECT fn_rareza_skin(4);

-- ==========================================

DELIMITER $$

CREATE FUNCTION fn_total_compras(p_jugador INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN

DECLARE total DECIMAL(10,2);

SELECT SUM(total)
INTO total
FROM compras
WHERE id_jugador=p_jugador;

RETURN IFNULL(total,0);

END $$

DELIMITER ;

SELECT fn_total_compras(1);

-- ==========================================

DELIMITER $$

CREATE FUNCTION fn_categoria_skin(p_skin INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN

DECLARE categoria VARCHAR(50);

SELECT c.nombre
INTO categoria
FROM categorias c
JOIN skins s
ON c.id_categoria=s.id_categoria
WHERE s.id_skin=p_skin;

RETURN categoria;

END $$

DELIMITER ;

SELECT fn_categoria_skin(5);