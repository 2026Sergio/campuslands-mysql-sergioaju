# ✨ Solución ejercicio intermedio: 02

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Para este ejercicio se crearon dos tablas relacionadas entre sí, con el objetivo de representar la información de jugadores de un juego Battle Royale y su participación dentro de un sistema de ranking.

La primera tabla es `jugadores_battle_royale`, que cuenta con los siguientes campos:

- jugador_id
- nombre_jugador
- region
- nivel

La segunda tabla es `ranking_battle_royale`, que cuenta con los siguientes campos:

- ranking_id
- jugador_id
- puesto
- puntos
- temporada

*El campo `jugador_id` de la tabla `jugadores_battle_royale` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada jugador.*

*El campo `ranking_id` de la tabla `ranking_battle_royale` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada registro del ranking.*

*La tabla `ranking_battle_royale` tiene una relación con la tabla `jugadores_battle_royale` mediante el campo `jugador_id`, el cual funciona como FK y referencia al campo `jugador_id` de la tabla `jugadores_battle_royale`.*

### Creación de registros 📝

Se insertaron 15 registros en la tabla `jugadores_battle_royale` con los siguientes campos:

- nombre_jugador
- region
- nivel

También se insertaron 12 registros en la tabla `ranking_battle_royale` con los siguientes campos:

- jugador_id
- puesto
- puntos
- temporada

*Los campos `jugador_id` y `ranking_id` que funcionan como PK y están configurados como `AUTO_INCREMENT` no se incluyeron directamente en los registros. MySQL asignará automáticamente los identificadores de los jugadores y registros del ranking.*

*El campo `jugador_id` de `ranking_battle_royale` se utilizó para establecer la relación entre los jugadores y sus respectivos registros dentro del ranking.*

*Se registraron únicamente 12 jugadores en la tabla `ranking_battle_royale`, mientras que existen 15 jugadores en `jugadores_battle_royale`. Esto permite demostrar el comportamiento de `LEFT JOIN`, ya que los jugadores que no tienen un registro asociado en el ranking también aparecen en los resultados.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Utilizar `LEFT JOIN` para mostrar todos los jugadores junto con su información de ranking, incluyendo aquellos que no tienen un registro asociado.
- Identificar mediante `LEFT JOIN` los jugadores que no aparecen actualmente en el ranking utilizando `IS NULL`.
- Seleccionar los jugadores que tienen más de `8000` puntos en el ranking.
- Seleccionar los jugadores con un nivel igual o superior a `50` y mostrar su información de ranking, ordenándolos de mayor a menor según su nivel.
- Contar la cantidad de jugadores que tienen un registro en el ranking agrupándolos por región utilizando `COUNT`, `LEFT JOIN` y `GROUP BY`.

*Las consultas permiten practicar el uso de `LEFT JOIN`, garantizando que todos los registros de la tabla principal `jugadores_battle_royale` puedan ser visualizados incluso cuando no exista un registro relacionado en `ranking_battle_royale`. También se utilizaron `WHERE`, `IS NULL`, `COUNT`, `GROUP BY` y `ORDER BY` para filtrar, identificar y organizar la información obtenida.*