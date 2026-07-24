# ✨ Solución ejercicio avanzado: 01

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Para este ejercicio se crearon dos tablas relacionadas entre sí, con el objetivo de representar un torneo de esports MOBA y registrar los movimientos de puntos obtenidos por los equipos durante el torneo.

La primera tabla es `equipos_esports_moba`, que cuenta con los siguientes campos:

- equipo_id
- nombre_equipo
- region
- puntos
- estado

La segunda tabla es `movimientos_torneo_moba`, que cuenta con los siguientes campos:

- movimiento_id
- equipo_id
- tipo_movimiento
- puntos_movimiento
- fecha_movimiento

*El campo `equipo_id` de la tabla `equipos_esports_moba` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada equipo.*

*El campo `movimiento_id` de la tabla `movimientos_torneo_moba` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada movimiento registrado.*

*La tabla `movimientos_torneo_moba` tiene una relación con la tabla `equipos_esports_moba` mediante el campo `equipo_id`, el cual funciona como FK y referencia al campo `equipo_id` de la tabla de equipos.*

### Creación de registros 📝

Se insertaron 15 registros en la tabla `equipos_esports_moba` con los siguientes campos:

- nombre_equipo
- region
- puntos
- estado

También se insertaron 15 registros en la tabla `movimientos_torneo_moba` con los siguientes campos:

- equipo_id
- tipo_movimiento
- puntos_movimiento
- fecha_movimiento

*Los campos `equipo_id` y `movimiento_id` que funcionan como PK y están configurados como `AUTO_INCREMENT` no se incluyeron directamente en los registros de sus respectivas tablas. MySQL asignará automáticamente los identificadores correspondientes.*

*El campo `equipo_id` de `movimientos_torneo_moba` se utilizó para relacionar cada movimiento con un equipo existente en la tabla `equipos_esports_moba`.*

### Transacciones 🔄

Se realizaron diferentes operaciones utilizando transacciones para practicar el control de cambios en MySQL mediante `START TRANSACTION`, `COMMIT` y `ROLLBACK`.

La primera transacción realizó las siguientes operaciones:

- Se inició una transacción mediante `START TRANSACTION`.
- Se actualizaron los puntos del equipo con `equipo_id = 1`.
- Se registró el movimiento correspondiente en la tabla `movimientos_torneo_moba`.
- Se confirmó la transacción mediante `COMMIT`.

*Al utilizar `COMMIT`, los cambios realizados dentro de la transacción quedan guardados de manera permanente.*

La segunda transacción realizó las siguientes operaciones:

- Se inició una nueva transacción.
- Se actualizaron los puntos del equipo con `equipo_id = 3`.
- Se registró un movimiento de tipo `Derrota`.
- Se cancelaron todos los cambios mediante `ROLLBACK`.

*Al utilizar `ROLLBACK`, tanto la actualización de puntos como el registro del movimiento realizado durante esta transacción son revertidos.*

La tercera transacción realizó las siguientes operaciones:

- Se inició una nueva transacción.
- Se actualizaron los puntos del equipo con `equipo_id = 4`.
- Se registró un nuevo movimiento de tipo `Victoria`.
- Se confirmó la operación mediante `COMMIT`.

*De esta manera se demuestra la diferencia entre confirmar una transacción con `COMMIT` y revertir sus cambios utilizando `ROLLBACK`.*

### Consultas ✅

La consulta final utiliza un `INNER JOIN` entre las tablas `equipos_esports_moba` y `movimientos_torneo_moba` para mostrar:

- Nombre del equipo.
- Puntos actuales.
- Estado del equipo.
- Tipo de movimiento.
- Puntos obtenidos o perdidos.
- Fecha del movimiento.

Los resultados se ordenan cronológicamente utilizando `ORDER BY` sobre el campo `fecha_movimiento`.

*La consulta permite verificar los movimientos registrados y comprobar los cambios realizados mediante las transacciones. Los movimientos asociados a la transacción confirmada con `COMMIT` permanecen registrados, mientras que el movimiento asociado a la transacción cancelada con `ROLLBACK` no permanece en la base de datos.*

### Explicación final 📝

*La solución permite practicar el manejo de transacciones en MySQL utilizando `START TRANSACTION`, `COMMIT` y `ROLLBACK`. Se utilizaron dos tablas relacionadas para mantener separados los datos principales de los equipos y el historial de movimientos. Las operaciones de actualización de puntos y registro de movimientos se ejecutaron dentro de transacciones para garantizar que ambas acciones puedan confirmarse o revertirse como una unidad lógica.*