# Ejercicio 011 (avanzado) - maria-montepeque

Tematica: pingpong. Tabla `entrenamientos_pingpong_cte` con 12 sesiones de entrenamiento en una ventana de 14 dias (2026-07-01 a 2026-07-14), con 5 dias sin ningun entrenamiento a proposito.

## Decisiones tecnicas

El objetivo del ejercicio es CTE (`WITH`), tanto simples como recursivos (`WITH RECURSIVE`). Las 6 consultas cubren usos distintos:

1. **CTE simple para nombrar un resultado intermedio** — evita repetir un `GROUP BY` como subconsulta en el `FROM`.
2. **CTE + `ROW_NUMBER()`** — el CTE calcula los totales y la consulta final arma un ranking sobre ese resultado.
3. **CTE recursivo "de libro"** — genera la secuencia 1 a 10 (`WITH RECURSIVE numeros AS (... UNION ALL ...)`), el ejemplo mas simple para ver el mecanismo: un caso ancla y un caso recursivo que se referencia a si mismo hasta cumplir la condicion de corte.
4. **CTE recursivo aplicado al negocio** — genera cada uno de los 14 dias del calendario (aunque no haya entrenamientos ese dia) y lo cruza con `LEFT JOIN` contra la tabla real. Sin el CTE recursivo, los dias sin entrenamientos simplemente no apareceriaan en el resultado.
5. **Reutilizacion del mismo CTE recursivo** — la misma logica del calendario, pero filtrando los dias sin ningun entrenamiento (los "huecos" que el CTE hace visibles).
6. **CTE simple + subconsulta escalar** — jugadores cuyo total de minutos supera el promedio general, calculado sobre el propio CTE.

Los datos se disenaron a proposito con **5 dias vacios** dentro de la ventana de 14 dias, para que el CTE recursivo del calendario tuviera huecos reales que mostrar (consultas 4 y 5).

- `CONSTRAINT chk_duracion_entrenamiento_cte CHECK (duracion_minutos > 0)` evita datos imposibles.

## Archivos

- `ddl/schema.sql` — tabla + `CHECK`.
- `dml/inserts.sql` — 12 entrenamientos de 4 jugadores en 9 dias distintos.
- `dql/consultas.sql` — 6 consultas con CTE: resumen simple, ranking con ROW_NUMBER, secuencia numerica recursiva, calendario recursivo con huecos, dias sin entrenamiento, y jugadores sobre el promedio.
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
