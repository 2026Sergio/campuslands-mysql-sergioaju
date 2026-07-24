# ✨ Solución ejercicio básico: 15

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Para este ejercicio se crearon dos tablas relacionadas entre sí, con el objetivo de representar una biblioteca gamer y controlar los préstamos de los videojuegos.

La primera tabla es `biblioteca_gamer`, que cuenta con los siguientes campos:

- juego_id
- titulo
- genero
- plataforma
- anio_lanzamiento
- estado

La segunda tabla es `prestamos_gamer`, que cuenta con los siguientes campos:

- prestamo_id
- juego_id
- nombre_usuario
- fecha_prestamo
- fecha_devolucion
- estado

*El campo `juego_id` de la tabla `biblioteca_gamer` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada videojuego.*

*El campo `prestamo_id` de la tabla `prestamos_gamer` también está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada préstamo registrado.*

*La tabla `prestamos_gamer` tiene una relación con la tabla `biblioteca_gamer` mediante el campo `juego_id`, el cual funciona como FK y referencia al campo `juego_id` de la tabla `biblioteca_gamer`.*

### Creación de registros 📝

Se insertaron 15 registros en la tabla `biblioteca_gamer` con los siguientes campos:

- titulo
- genero
- plataforma
- anio_lanzamiento
- estado

También se insertaron 15 registros en la tabla `prestamos_gamer` con los siguientes campos:

- juego_id
- nombre_usuario
- fecha_prestamo
- fecha_devolucion
- estado

*Los campos `juego_id` y `prestamo_id` que funcionan como PK y están configurados como `AUTO_INCREMENT` no se incluyeron directamente en los registros de la tabla `biblioteca_gamer` y el campo `prestamo_id` se generará automáticamente en la tabla `prestamos_gamer`.*

*El campo `juego_id` de `prestamos_gamer` se utilizó para relacionar cada préstamo con un videojuego existente en la tabla `biblioteca_gamer`.*

*Los registros utilizan valores `NULL` en `fecha_devolucion` para representar préstamos que todavía se encuentran activos y no han sido devueltos.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Unir las tablas `biblioteca_gamer` y `prestamos_gamer` mediante un `INNER JOIN` para mostrar información de los videojuegos junto con los datos de sus préstamos.
- Seleccionar los préstamos que actualmente tienen el estado `Activo`, mostrando el videojuego y el usuario que lo tiene prestado.
- Seleccionar los videojuegos que actualmente tienen el estado `Disponible`.
- Contar la cantidad de videojuegos registrados para cada género utilizando `COUNT` y `GROUP BY`.
- Seleccionar los préstamos realizados desde el `01 de enero de 2026` que ya fueron devueltos y ordenarlos cronológicamente según la fecha del préstamo.

*Las consultas permiten practicar relaciones simples entre tablas mediante claves foráneas e `INNER JOIN`, además del uso de `WHERE`, `COUNT`, `GROUP BY` y `ORDER BY` para obtener información verificable sobre los videojuegos y sus préstamos.*