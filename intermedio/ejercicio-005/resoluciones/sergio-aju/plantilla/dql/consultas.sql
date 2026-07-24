USE db_taller_motos;

SELECT cliente, moto, costo 
FROM reparaciones 
WHERE costo > (SELECT AVG(costo) FROM reparaciones) 
ORDER BY costo DESC;

SELECT nombre, especialidad, experiencia_anios 
FROM mecanicos 
WHERE id IN (SELECT id_mecanico FROM reparaciones WHERE costo > 1000.00);

SELECT r1.cliente, r1.moto, r1.costo, r1.id_mecanico 
FROM reparaciones r1 
WHERE r1.costo = (
    SELECT MAX(r2.costo) 
    FROM reparaciones r2 
    WHERE r2.id_mecanico = r1.id_mecanico
);

       (SELECT MAX(costo) FROM reparaciones) - costo AS diferencia_con_el_maximo 
FROM reparaciones 
ORDER BY costo DESC;

SELECT nombre, especialidad, experiencia_anios 
FROM mecanicos 
WHERE experiencia_anios > (SELECT AVG(experiencia_anios) FROM mecanicos) 
ORDER BY experiencia_anios DESC;