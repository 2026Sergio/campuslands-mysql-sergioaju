# ejercicio 003 - inventario de skins shooter

solucion del ejercicio 003 enfocado en el uso de primary key para un inventario de skins.

## decisiones tecnicas
- el campo `id` actua como primary key para dar un identificador unico a cada skin.
- se usaron los tipos `enum` para limitar las opciones de rareza y estado.
- se uso `decimal` para los precios en monedas.

## archivos
- `ddl/schema.sql`: crea la tabla con su primary key autonumerica.
- `dml/inserts.sql`: agrega 9 registros de skins de distintas armas.
- `dql/consultas.sql`: 5 consultas analiticas para revisar la tienda.

## orden de ejecucion
1. ejecutar `ddl/schema.sql`
2. ejecutar `dml/inserts.sql`
3. ejecutar `dql/consultas.sql`