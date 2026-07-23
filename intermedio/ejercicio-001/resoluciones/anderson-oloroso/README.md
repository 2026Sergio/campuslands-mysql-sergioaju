# ✨ Solución ejercicio intermedio: 01

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Para este ejercicio se crearon dos tablas relacionadas entre sí, con el objetivo de representar la información de un torneo de esports de tipo MOBA y relacionar los equipos participantes con sus respectivos jugadores.

La primera tabla es `equipos_moba`, que cuenta con los siguientes campos:

- equipo_id
- nombre_equipo
- region
- entrenador

La segunda tabla es `jugadores_moba`, que cuenta con los siguientes campos:

- jugador_id
- equipo_id
- nombre_jugador
- rol

*El campo `equipo_id` de la tabla `equipos_moba` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada equipo.*

*El campo `jugador_id` de la tabla `jugadores_moba` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada jugador.*

*La tabla `jugadores_moba` tiene una relación con la tabla `equipos_moba` mediante el campo `equipo_id`, el cual funciona como FK y referencia al campo `equipo_id` de la tabla `equipos_moba`.*

### Creación de registros 📝

Se insertaron 15 registros en la tabla `equipos_moba` con los siguientes campos:

- nombre_equipo
- region
- entrenador

También se insertaron 15 registros en la tabla `jugadores_moba` con los siguientes campos:

- equipo_id
- nombre_jugador
- rol

*Los campos `equipo_id` y `jugador_id` que funcionan como PK y están configurados como `AUTO_INCREMENT` no se incluyeron directamente en los registros de la tabla `equipos_moba`. MySQL asignará automáticamente los identificadores de cada equipo.*

*El campo `jugador_id` tampoco se incluyó directamente en los registros de `jugadores_moba`, ya que MySQL generará automáticamente su valor.*

*El campo `equipo_id` de `jugadores_moba` se utilizó para establecer la relación entre cada jugador y un equipo existente en la tabla `equipos_moba`.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Unir las tablas `equipos_moba` y `jugadores_moba` mediante un `INNER JOIN` para mostrar la información completa de los equipos junto con sus jugadores.
- Seleccionar los equipos y jugadores pertenecientes a la región de `Latinoamerica`.
- Seleccionar los jugadores que desempeñan el rol de `Mid` junto con el equipo al que pertenecen.
- Seleccionar los equipos de la región de `Corea del Sur` junto con sus entrenadores y jugadores, ordenando los resultados alfabéticamente por el nombre del equipo.
- Contar la cantidad de jugadores registrados por cada equipo utilizando `COUNT`, `INNER JOIN` y `GROUP BY`, ordenando los resultados de mayor a menor cantidad de jugadores.

*Las consultas permiten practicar el uso de `INNER JOIN` para relacionar información almacenada en diferentes tablas mediante una clave foránea. También se utilizaron `WHERE`, `COUNT`, `GROUP BY` y `ORDER BY` para filtrar, agrupar y organizar los resultados obtenidos.*