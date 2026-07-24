SELECT * FROM autos_hiperdeportivos
WHERE velocidad_maxima > 400;

SELECT * FROM autos_hiperdeportivos
WHERE potencia_hp > 1500;

SELECT * FROM autos_hiperdeportivos
WHERE pais_origen = 'Italia';

SELECT * FROM autos_hiperdeportivos
WHERE precio BETWEEN 1000000000 AND 2000000000;

SELECT * FROM autos_hiperdeportivos
WHERE velocidad_maxima > 350 AND potencia_hp > 1000;