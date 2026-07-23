SELECT * FROM jugadores_pingpong
WHERE edad >= 18;

SELECT * FROM jugadores_pingpong
WHERE ranking BETWEEN 1 AND 10;

SELECT * FROM jugadores_pingpong
WHERE partidos_ganados > partidos_perdidos;

SELECT * FROM jugadores_pingpong
WHERE edad < 25 AND partidos_ganados >= 30;

SELECT * FROM jugadores_pingpong
WHERE ranking <= 5 AND partidos_perdidos < 15;