# ✨ Solución ejercicio básico: 08

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `futbol_sala` para almacenar información organizada sobre jugadores de un equipo o competición de fútbol sala y sus principales estadísticas deportivas.

La tabla cuenta con los siguientes campos:

- jugador_id
- nombre_jugador
- equipo
- posicion
- goles
- asistencias
- estado

*El campo `jugador_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada jugador y su valor será asignado automáticamente por MySQL.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se centra en la inserción y modificación de información utilizando la sentencia `UPDATE`.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- nombre_jugador
- equipo
- posicion
- goles
- asistencias
- estado

*El campo `jugador_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. Por esta razón, MySQL asignará automáticamente un identificador único y consecutivo a cada jugador.*

*Los datos fueron creados de forma coherente con la temática de fútbol sala, utilizando diferentes jugadores, equipos, posiciones, estadísticas de goles y asistencias, además de diferentes estados deportivos.*

### Actualización de registros 🔄

Las actualizaciones que se realizaron fueron:

- Aumentar en `2` los goles de todos los jugadores que ocupan la posición de `Pivot`.
- Aumentar en `3` las asistencias de todos los jugadores que ocupan la posición de `Ala`.
- Cambiar el estado de los jugadores que se encuentran `Lesionado` a `Activo`.
- Transferir al jugador `Santiago Flores` al equipo `Titanes Futsal`.
- Aumentar en `5` los goles y en `2` las asistencias del jugador `Fernando Lopez`.

*Las consultas permiten practicar el uso de la sentencia `UPDATE` para modificar información existente en una tabla. Se utilizaron condiciones con `WHERE` para asegurar que las actualizaciones se apliquen únicamente a los registros que cumplen con los criterios establecidos.*

*En la última actualización se modificaron dos columnas simultáneamente, demostrando que un mismo `UPDATE` puede cambiar varios campos de un registro.*

### Consultas de verificación ✅

Para comprobar los cambios realizados, se puede utilizar la siguiente consulta:

```sql
SELECT * FROM futbol_sala
ORDER BY jugador_id ASC;