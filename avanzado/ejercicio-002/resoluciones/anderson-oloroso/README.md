# ✨ Solución ejercicio avanzado: 02

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `rankingBattleRoyale`, diseñada para almacenar información estadística de los jugadores de un sistema de ranking inspirado en Battle Royale.

La tabla cuenta con los siguientes campos:

- `id_jugador`
- `nombre_jugador`
- `rango`
- `puntos`
- `partidas_jugadas`
- `victorias`
- `porcentaje_victoria`
- `fecha_actualizacion`

El campo `id_jugador` funciona como clave primaria y utiliza `AUTO_INCREMENT`, por lo que MySQL asigna automáticamente un identificador único a cada jugador.

*Para esta solución no se utilizaron relaciones con otras tablas, ya que el objetivo principal del ejercicio es practicar la creación y ejecución de procedimientos almacenados.*

### Creación de registros 📝

Se insertaron 15 registros sintéticos con información coherente sobre jugadores de Battle Royale.

Los registros incluyen diferentes rangos competitivos:

- Oro
- Platino
- Diamante
- Maestro

Cada jugador cuenta con información sobre sus puntos, partidas jugadas, cantidad de victorias, porcentaje de victoria y fecha de actualización.

El campo `id_jugador` no fue incluido manualmente en los registros porque está configurado como clave primaria y `AUTO_INCREMENT`. MySQL se encarga de asignar automáticamente un identificador consecutivo a cada jugador.

### Procedimientos almacenados ⚙️

Se crearon 5 procedimientos almacenados para consultar y modificar la información de la tabla `rankingBattleRoyale`:

- `obtenerRankingPorRango`: recibe un rango como parámetro y muestra los jugadores pertenecientes a ese rango, ordenados de mayor a menor cantidad de puntos.
- `obtenerJugadoresPorVictorias`: recibe como parámetro un mínimo de victorias y muestra los jugadores que cumplen o superan esa cantidad.
- `actualizarPuntosJugador`: recibe el identificador de un jugador y una nueva cantidad de puntos para actualizar su puntuación y registrar la fecha actual de modificación.
- `obtenerTopJugadores`: recibe una cantidad de jugadores y devuelve los mejores jugadores ordenados por puntos.
- `obtenerEstadisticasRango`: recibe un rango y genera indicadores estadísticos como cantidad de jugadores, promedio de puntos, mayor puntaje, menor puntaje y total de victorias.

### Ejecución y verificación ✅

Se realizaron 5 llamadas mediante `CALL` para comprobar el funcionamiento de los procedimientos almacenados:

- Consultar los jugadores pertenecientes al rango `Diamante`.
- Buscar jugadores con al menos `150` victorias.
- Actualizar los puntos del jugador con identificador `1`.
- Consultar el `Top 5` de jugadores con mayor cantidad de puntos.
- Obtener estadísticas generales del rango `Maestro`.

Los procedimientos fueron diseñados utilizando parámetros de entrada para que puedan reutilizarse con diferentes valores sin modificar directamente el código interno de cada procedimiento.