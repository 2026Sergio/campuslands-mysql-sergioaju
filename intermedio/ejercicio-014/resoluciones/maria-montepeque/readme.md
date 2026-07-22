# Ejercicio 014 (intermedio) - maria-montepeque

Tematica: saga de ciencia ficcion. Tabla `peliculas_saga_cf` con las entregas de 3 sagas, mas 3 vistas que encapsulan las consultas mas comunes.

## Decisiones tecnicas

El objetivo del ejercicio es vistas simples, por eso ademas de la tabla se crearon 3 `VIEW`:

- `vista_peliculas_estrenadas_saga` — solo peliculas con `estado = 'estrenada'`, columnas relevantes para reportes de taquilla.
- `vista_resumen_saga` — agregado por saga (`COUNT`, `SUM`, `AVG`), encapsula un `GROUP BY` que se reutiliza en varias consultas sin repetirlo.
- `vista_proximos_estrenos_saga` — peliculas con `estado = 'en_produccion'`, listas para un panel sin exponer el resto de columnas de la tabla base.

Todas las consultas de `dql/consultas.sql` leen de estas vistas en vez de la tabla base directamente, para demostrar el valor de las vistas: encapsular logica repetible y dar una interfaz de lectura mas simple.

- `titulo` es `UNIQUE`.
- `CONSTRAINT chk_duracion_saga_cf CHECK (duracion_minutos > 0)` y `CONSTRAINT chk_episodio_saga_cf CHECK (episodio > 0)` evitan datos imposibles.

## Archivos

- `ddl/schema.sql` — tabla + `CHECK` + 3 `CREATE VIEW`.
- `dml/inserts.sql` — 10 peliculas de 3 sagas, con fechas desde 1999 hasta 2027.
- `dql/consultas.sql` — 6 consultas, todas apoyadas en las vistas (estrenadas en orden cronologico, resumen por saga, proximos estrenos, saga con mayor recaudacion, estrenadas por encima del promedio, conteo de proximos estrenos futuros).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas ejecutadas contra MySQL en Docker.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql
```
