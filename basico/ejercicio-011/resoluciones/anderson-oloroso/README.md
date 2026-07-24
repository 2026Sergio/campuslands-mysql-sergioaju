# ✨ Solución ejercicio básico: 11

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `jugadores_pingpong` para almacenar información organizada sobre jugadores de pingpong, incluyendo sus datos básicos y estadísticas relacionadas con sus resultados en partidos.

La tabla cuenta con los siguientes campos:

- jugador_id
- nombre_jugador
- edad
- ranking
- partidos_ganados
- partidos_perdidos

*El campo `jugador_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única a cada jugador y su valor será asignado automáticamente por MySQL.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se centra en la inserción de registros y en la aplicación de validaciones simples mediante condiciones en las consultas.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- nombre_jugador
- edad
- ranking
- partidos_ganados
- partidos_perdidos

*El campo `jugador_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. Por esta razón, MySQL asignará automáticamente un identificador único y consecutivo a cada jugador.*

*Los datos fueron creados de forma coherente con la temática de pingpong, utilizando diferentes jugadores, edades, posiciones en el ranking y estadísticas de partidos ganados y perdidos.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Seleccionar los jugadores que tienen una edad igual o superior a `18` años.
- Seleccionar los jugadores cuyo ranking se encuentre entre las posiciones `1` y `10` utilizando `BETWEEN`.
- Seleccionar los jugadores que tienen más partidos ganados que partidos perdidos.
- Seleccionar los jugadores menores de `25` años que tienen al menos `30` partidos ganados.
- Seleccionar los jugadores que se encuentran dentro de los primeros `5` puestos del ranking y tienen menos de `15` partidos perdidos.

*Las consultas permiten practicar validaciones simples mediante la cláusula `WHERE` y los operadores de comparación `>=`, `>`, `<`, `<=`, además del operador `BETWEEN` y la combinación de condiciones mediante `AND`.*