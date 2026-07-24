# Ejercicio 010 - COUNT y SUM para carreras urbanas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `participantes_carreras` para almacenar información de corredores.
- Se agregaron restricciones `PRIMARY KEY`, `NOT NULL`, `DEFAULT`, `ENUM` y `CHECK`.
- Se insertaron ocho participantes con diferentes categorías, estados y valores de inscripción.
- Las consultas fueron diseñadas para practicar funciones agregadas `COUNT` y `SUM`.
- Se utilizaron agrupaciones para obtener indicadores útiles de una carrera urbana.
- Los reportes permiten conocer cantidad de participantes e ingresos generados.