# ejercicio 002 - ranking battle royale

solucion del ejercicio 002 sobre tipos de datos para un ranking de battle royale.

## decisiones tecnicas
- se uso `decimal` para el ratio de victorias y puntaje para tener decimales exactos.
- se agrego el estado `baneado` para probar filtros con jugadores sancionados.

## archivos
- `ddl/schema.sql`: crea la tabla con campos de bajas, rango y puntajes.
- `dml/inserts.sql`: inserta 9 jugadores con distintos rangos.
- `dql/consultas.sql`: 5 consultas con promedios, tops y filtros por rango.

## orden de ejecucion
1. ejecutar `ddl/schema.sql`
2. ejecutar `dml/inserts.sql`
3. ejecutar `dql/consultas.sql`