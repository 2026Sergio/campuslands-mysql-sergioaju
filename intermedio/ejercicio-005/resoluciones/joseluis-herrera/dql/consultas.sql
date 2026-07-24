SELECT *
FROM clientes
WHERE id_cliente IN (SELECT id_cliente FROM motos)
    
SELECT marca, modelo, velocidad_maxima 
FROM motos 
WHERE velocidad_maxima = (SELECT MAX(velocidad_maxima) FROM motos);

SELECT marca, modelo, velocidad_maxima
FROM motos
WHERE velocidad_maxima = (SELECT MIN(velocidad_maxima) FROM motos);