# ✨ Solución ejercicio básico: 09

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `kickboxing` para almacenar información organizada sobre peleadores de kickboxing y sus principales estadísticas deportivas.

La tabla cuenta con los siguientes campos:

- peleador_id
- nombre_peleador
- categoria
- victorias
- derrotas
- estado

*El campo `peleador_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada peleador y su valor será asignado automáticamente por MySQL.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se centra en la inserción y eliminación controlada de información utilizando la sentencia `DELETE`.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- nombre_peleador
- categoria
- victorias
- derrotas
- estado

*El campo `peleador_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. Por esta razón, MySQL asignará automáticamente un identificador único y consecutivo a cada peleador.*

*Los datos fueron creados de forma coherente con la temática de kickboxing, utilizando diferentes peleadores, categorías de peso, estadísticas de victorias y derrotas, además de diferentes estados deportivos.*

### Eliminación de registros 🗑️

Las eliminaciones que se realizaron fueron:

- Eliminar los peleadores cuyo estado sea `Retirado`.
- Eliminar los peleadores cuyo estado sea `Suspendido`.
- Eliminar los peleadores que tengan más de `8` derrotas.
- Eliminar los peleadores que tengan menos de `15` victorias y más de `5` derrotas.
- Eliminar los peleadores de la categoría `Peso Pesado` que tengan el estado `Lesionado`.

*Las consultas permiten practicar el uso de la sentencia `DELETE` para eliminar registros de manera controlada. Se utilizó la cláusula `WHERE` en todas las operaciones para evitar eliminar todos los registros de la tabla accidentalmente.*

*Las condiciones fueron seleccionadas utilizando diferentes criterios de filtrado, incluyendo comparaciones numéricas, condiciones de texto y el uso del operador `AND` para combinar múltiples condiciones.*

### Consultas de verificación ✅

Para comprobar los registros que permanecen después de ejecutar las eliminaciones, se puede utilizar la siguiente consulta:

```sql
SELECT * FROM kickboxing
ORDER BY peleador_id ASC;
