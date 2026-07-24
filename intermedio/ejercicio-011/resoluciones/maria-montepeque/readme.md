# Ejercicio 011 (intermedio) - maria-montepeque

Tematica: pingpong. Tabla `jugadores_pingpong_intermedio` disenada para practicar varios tipos de `CHECK` sobre datos deportivos reales.

## Decisiones tecnicas

El objetivo del ejercicio es `CHECK`, por eso la tabla incluye 5 restricciones distintas, cada una demostrando un tipo de validacion diferente:

- `CONSTRAINT chk_edad_pingpong CHECK (edad BETWEEN 6 AND 90)` — rango realista de edad de un jugador federado.
- `CONSTRAINT chk_ranking_pingpong_ck CHECK (ranking_puntos BETWEEN 0 AND 3000)` — rango del sistema de puntos del club.
- `CONSTRAINT chk_ganados_pingpong_ck CHECK (partidos_ganados <= partidos_jugados)` — `CHECK` relacional entre dos columnas de la misma fila.
- `CONSTRAINT chk_sets_favor_pingpong CHECK (sets_favor >= 0)` y `CONSTRAINT chk_sets_contra_pingpong CHECK (sets_contra >= 0)` — evitan sets negativos.

Todos los nombres de `CHECK` son unicos dentro de la base de datos para no chocar con los `CHECK` de otros ejercicios.

### Verificacion manual de las restricciones CHECK

Antes de generar la evidencia final, probe (fuera del script entregable, directamente contra el contenedor Docker) que cada `CHECK` realmente bloquea datos invalidos:

- Insertar un jugador con `edad = 150` fallo con `ERROR 3819 ... chk_edad_pingpong`.
- Insertar un jugador con mas partidos ganados que jugados fallo con `ERROR 3819 ... chk_ganados_pingpong_ck`.
- Insertar un jugador con `ranking_puntos = -50` fallo con `ERROR 3819 ... chk_ranking_pingpong_ck`.

Ninguno de los tres intentos llego a insertarse, asi que los datos no se modificaron y no fue necesario restaurar el estado antes de generar la evidencia.

## Archivos

- `ddl/schema.sql` — tabla + 5 `CHECK` distintos (rango, relacional, no negativo).
- `dml/inserts.sql` — 10 jugadores de practica en 4 categorias.
- `dql/consultas.sql` — 6 consultas (top 5 ranking, invictos, ranking promedio por categoria, diferencia de sets, menores de edad, % de victorias).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
