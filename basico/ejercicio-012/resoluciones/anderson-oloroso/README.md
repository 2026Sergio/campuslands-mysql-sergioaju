# ✨ Solución ejercicio básico: 12

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `playlist_musical` para representar la entidad playlist musical y almacenar información organizada sobre diferentes listas de reproducción.

La tabla cuenta con los siguientes campos:

- playlist_id
- nombre_playlist
- creador
- genero_principal
- cantidad_canciones
- duracion_minutos
- estado

*El campo `playlist_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada playlist y su valor será asignado automáticamente por MySQL.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se enfoca en el modelado de una entidad independiente relacionada con las playlists musicales.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- nombre_playlist
- creador
- genero_principal
- cantidad_canciones
- duracion_minutos
- estado

*El campo `playlist_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. Por esta razón, MySQL asignará automáticamente un identificador único y consecutivo a cada playlist.*

*Los datos fueron creados de forma coherente con la temática de playlist musical, utilizando diferentes nombres de playlists, creadores, géneros musicales, cantidades de canciones, duraciones y estados de publicación.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Seleccionar las playlists que tienen el estado `Publica`.
- Seleccionar las playlists que contienen `25` canciones o más.
- Seleccionar las playlists cuya duración sea superior a `100` minutos.
- Contar la cantidad de playlists registradas para cada género musical utilizando `COUNT` y `GROUP BY`.
- Seleccionar las playlists públicas y ordenarlas de mayor a menor según la cantidad de canciones.

*Las consultas permiten practicar el modelado y consulta de una entidad utilizando filtros con `WHERE`, agrupaciones con `GROUP BY`, conteo de registros con `COUNT` y ordenamiento de resultados con `ORDER BY`.*