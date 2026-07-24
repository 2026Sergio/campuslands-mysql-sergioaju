# Resolucion - Ejercicio 003 (Avanzado) - Selvin Lem

## Tematica
Inventario de skins shooter

## Como ejecutar
1. Ejecutar `ddl/schema.sql`: crea la tabla y las 2 funciones.
2. Ejecutar `dml/inserts.sql` para insertar 8 registros de prueba.
3. Ejecutar `dql/consultas.sql` para probar las funciones en distintos
   contextos: SELECT, WHERE y GROUP BY.

## Entidad principal
- Tabla: skins_inventario_avanzado
- Funciones: clasificar_valor_skin, calcular_precio_con_descuento

## Restriccion aplicada
DETERMINISTIC en ambas funciones, requerido por MySQL para funciones
que no dependen de estado externo aleatorio.

## Caso limite incluido
Skin con precio en 0.00; la funcion la clasifica como "sin_tasar"
en vez de "bajo", distinguiendo ausencia de valor de valor real bajo.
