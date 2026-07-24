SELECT tipo, COUNT(*) AS total_skings
    FROM catalago_skins
    GROUP BY tipo;

SELECT rareza, AVG(precio) AS precio_promedio
    FROM catalogo_skins
    GROUP BY rareza;