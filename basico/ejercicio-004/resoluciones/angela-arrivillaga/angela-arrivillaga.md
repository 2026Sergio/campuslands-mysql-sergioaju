# ejercicio 004 - garaje de motos

solucion del ejercicio 004 enfocado en la practica de insercion de datos (INSERT) para un garaje de motos.

## decisiones tecnicas
- se creo la tabla con tipos de datos acordes a un garaje (cilindrada en números enteros `int` y tarifas en `decimal`).
- el campo `estado` permite categorizar entre disponibles, en mantenimiento o alquiladas mediante un `enum`.
- los registros ingresados permiten realizar consultas de agregacion `COUNT`, `AVG` y filtros por cilindrada y tarifa.

## archivos
- `ddl/schema.sql`: creacion de la tabla para el garaje.
- `dml/inserts.sql`: insercion de 9 registros de motocicletas.
- `dql/consultas.sql`: 5 consultas con reportes y filtros.

## orden de ejecucion
1. ejecutar `ddl/schema.sql`
2. ejecutar `dml/inserts.sql`
3. ejecutar `dql/consultas.sql`