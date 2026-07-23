# Ejercicio 007 (avanzado) - maria-montepeque

Tematica: liga de futbol. Cuatro tablas (`equipos_liga_futbol_view`, `jugadores_liga_futbol_view`, `partidos_liga_futbol_view`, `goles_partido_liga_view`) y 4 vistas que van mas alla de un filtro simple.

## Decisiones tecnicas

El objetivo del ejercicio es vistas avanzadas (a diferencia del ejercicio de "vistas simples" del nivel intermedio). Se cubren 4 tecnicas distintas:

1. **`vista_goleadores_liga`** — vista base con `JOIN` de 4 tablas. Al combinar varias tablas, MySQL la considera **no actualizable**.
2. **`vista_ranking_goleadores_liga`** — **vista construida sobre otra vista**: en vez de repetir el `JOIN`, hace `SELECT ... FROM vista_goleadores_liga` y le agrega un `GROUP BY`.
3. **`vista_resumen_partidos_liga`** — vista agregada con `JOIN` + `LEFT JOIN` + `GROUP BY`, con el total de goles por partido.
4. **`vista_jugadores_activos_liga`** — vista de una sola tabla, **si actualizable**, creada con `WITH CHECK OPTION`. Esta clausula evita que un `UPDATE` hecho a traves de la vista pueda dejar la fila resultante fuera del filtro de la vista (`estado = 'activo'`).

### Verificacion manual de WITH CHECK OPTION

`dml/inserts.sql` incluye un `UPDATE` **valido** a traves de la vista (cambia el dorsal de `Mateo Rivas`, que sigue activo despues del cambio). Ademas, antes de generar la evidencia final, probe (fuera del script entregable) un `UPDATE` que **si** deberia fallar:

```sql
UPDATE vista_jugadores_activos_liga SET estado = 'lesionado' WHERE nombre = 'Nico Farias';
```

Esto fallo con `ERROR 1369 (CHECK OPTION failed 'campuslands_mysql.vista_jugadores_activos_liga')`, porque si se aplicara, la fila resultante ya no cumpliria `estado = 'activo'` y "desaparecerian" de su propia vista. Como el `UPDATE` fue rechazado, los datos no se modificaron y no fue necesario restaurar nada.

- `Ruben Casal` (lesionado) y `Bruno Salas` (suspendido) se insertaron a proposito en un estado distinto a `activo`, para poder comprobar que la vista los excluye (consultas 4 y 6).
- `CONSTRAINT chk_dorsal_jugadores_view CHECK (dorsal > 0)` y `CONSTRAINT chk_minuto_goles_view CHECK (minuto BETWEEN 1 AND 120)` evitan datos imposibles.

## Archivos

- `ddl/schema.sql` — 4 tablas + `FOREIGN KEY` + `CHECK` + 4 `CREATE VIEW` (una de ellas construida sobre otra vista, otra con `WITH CHECK OPTION`).
- `dml/inserts.sql` — 4 equipos, 8 jugadores (2 en estado no activo), 3 partidos, 8 goles, y un `UPDATE` valido a traves de la vista con `WITH CHECK OPTION`.
- `dql/consultas.sql` — 6 consultas sobre las 4 vistas (goleadores con JOIN, ranking via vista-de-vista, resumen de partidos, jugadores activos, verificacion del UPDATE, comparacion de conteos).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
