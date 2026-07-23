# ✨ Solución ejercicio básico: 07

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `liga_futbol` para almacenar información organizada sobre diferentes equipos de una liga de fútbol y sus principales estadísticas de rendimiento durante la temporada.

La tabla cuenta con los siguientes campos:

- equipo_id
- nombre_equipo
- ciudad
- partidos_jugados
- partidos_ganados
- goles_favor
- puntos

*El campo `equipo_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada equipo y su valor será asignado automáticamente por MySQL.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se centra en la inserción de datos y en la organización de los resultados utilizando la cláusula `ORDER BY`.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- nombre_equipo
- ciudad
- partidos_jugados
- partidos_ganados
- goles_favor
- puntos

*El campo `equipo_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. Por esta razón, MySQL asignará automáticamente un identificador único y consecutivo a cada equipo.*

*Los datos fueron creados de forma coherente con la temática de una liga de fútbol, utilizando diferentes equipos, ciudades y estadísticas relacionadas con su rendimiento en la competición.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Seleccionar todos los equipos y ordenarlos de mayor a menor según la cantidad de puntos obtenidos.
- Seleccionar todos los equipos y ordenarlos de mayor a menor según la cantidad de goles a favor.
- Seleccionar los equipos ordenándolos primero por cantidad de partidos ganados de forma descendente y después por puntos de forma descendente.
- Seleccionar todos los equipos y ordenarlos alfabéticamente de forma ascendente según su nombre.
- Seleccionar los equipos ordenándolos primero por puntos de forma ascendente y, en caso de existir coincidencias, ordenar los resultados por goles a favor de forma descendente.

*Las consultas permiten practicar el uso de la cláusula `ORDER BY` para organizar los resultados de diferentes maneras. También se utilizaron los modificadores `ASC` y `DESC`, además de ordenar los resultados utilizando múltiples campos para establecer diferentes criterios de clasificación.*