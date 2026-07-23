# ✨ Solución ejercicio básico: 13

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `catalogo_peliculas_miedo` para almacenar información organizada sobre un catálogo de películas de miedo, incluyendo datos relacionados con sus directores, años de estreno, subgéneros, duración y disponibilidad.

La tabla cuenta con los siguientes campos:

- pelicula_id
- titulo
- director
- anio_estreno
- subgenero
- duracion_minutos
- estado

*El campo `pelicula_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada película y su valor será asignado automáticamente por MySQL.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se centra en el almacenamiento de información de un catálogo y en la aplicación de filtros utilizando el campo `estado`.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- titulo
- director
- anio_estreno
- subgenero
- duracion_minutos
- estado

*El campo `pelicula_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. Por esta razón, MySQL asignará automáticamente un identificador único y consecutivo a cada película.*

*Los datos fueron creados de forma coherente con la temática de un catálogo de películas de miedo, utilizando diferentes títulos, directores, años de estreno, subgéneros, duraciones y estados de disponibilidad.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Seleccionar todas las películas que tienen el estado `Disponible`.
- Seleccionar todas las películas que tienen el estado `No disponible`.
- Seleccionar las películas disponibles mostrando su título, director y subgénero, ordenadas alfabéticamente por título.
- Contar la cantidad de películas disponibles agrupadas por subgénero utilizando `COUNT`, `WHERE` y `GROUP BY`.
- Seleccionar las películas disponibles cuya duración sea superior a `110` minutos y ordenarlas de mayor a menor según su duración.

*Las consultas permiten practicar filtros por estado utilizando la cláusula `WHERE`, además de combinarla con `ORDER BY`, `COUNT` y `GROUP BY` para obtener información específica y verificable sobre la disponibilidad de las películas del catálogo.*