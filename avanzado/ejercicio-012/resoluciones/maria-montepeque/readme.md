# Ejercicio 012 (avanzado) - maria-montepeque

Tematica: playlist musical. Tabla `canciones_playlist_window` con 13 canciones, disenada con dos pares de empates en reproducciones a proposito, para practicar funciones de ventana (`window functions`).

## Decisiones tecnicas

- Se insertaron dos pares de canciones con **la misma cantidad de reproducciones** (`9800` y `22300`). Esto permite mostrar la diferencia real entre `RANK()` (deja huecos en la numeracion despues de un empate) y `DENSE_RANK()` (no deja huecos): en el resultado real, tras el empate en la posicion 3, `RANK()` salta a la posicion 5 mientras `DENSE_RANK()` continua en la 4.
- `CONSTRAINT chk_duracion_playlist_window CHECK (duracion_segundos > 0)` y `CONSTRAINT chk_reproducciones_playlist_window CHECK (reproducciones >= 0)` evitan datos imposibles.

### Las 6 funciones de ventana practicadas

1. **`RANK()` vs `DENSE_RANK()`** — mismo `ORDER BY`, resultados distintos frente a empates.
2. **`PARTITION BY genero`** — la numeracion del ranking se reinicia en cada genero.
3. **`LAG()` / `LEAD()`** — para cada cancion, cuantas reproducciones tiene la cancion inmediatamente mejor y peor posicionada (con `NULL` en los extremos del ranking, donde no hay "anterior" o "siguiente").
4. **Total acumulado (`SUM() OVER (... ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)`)** — mas el porcentaje que cada fila representa sobre el total (`SUM() OVER ()` sin `ORDER BY`, ventana completa).
5. **Promedio movil (`AVG() OVER (... ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)`)** — ventana de 3 canciones consecutivas ordenadas por ano de lanzamiento.
6. **`NTILE(4)`** — divide las 13 canciones en 4 cuartiles de popularidad segun sus reproducciones.

## Archivos

- `ddl/schema.sql` — tabla + dos `CHECK`.
- `dml/inserts.sql` — 13 canciones, 5 generos, 6 artistas, con dos pares de reproducciones empatadas a proposito.
- `dql/consultas.sql` — 6 consultas con funciones de ventana (RANK/DENSE_RANK, PARTITION BY, LAG/LEAD, running total, promedio movil, NTILE).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker, confirmando el comportamiento esperado en cada empate.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
