# ✨ Solución ejercicio intermedio: 05

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Para este ejercicio se crearon dos tablas relacionadas entre sí, con el objetivo de representar la información de los clientes de un taller mecánico de motos y los servicios realizados o solicitados por cada cliente.

La primera tabla es `clientes_taller`, que cuenta con los siguientes campos:

- cliente_id
- nombre_cliente
- telefono
- ciudad

La segunda tabla es `servicios_taller_motos`, que cuenta con los siguientes campos:

- servicio_id
- cliente_id
- marca_moto
- modelo_moto
- tipo_servicio
- costo
- estado

*El campo `cliente_id` de la tabla `clientes_taller` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada cliente.*

*El campo `servicio_id` de la tabla `servicios_taller_motos` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada servicio registrado.*

*La tabla `servicios_taller_motos` tiene una relación con la tabla `clientes_taller` mediante el campo `cliente_id`, el cual funciona como FK y referencia al campo `cliente_id` de la tabla `clientes_taller`.*

### Creación de registros 📝

Se insertaron 15 registros en la tabla `clientes_taller` con los siguientes campos:

- nombre_cliente
- telefono
- ciudad

También se insertaron 15 registros en la tabla `servicios_taller_motos` con los siguientes campos:

- cliente_id
- marca_moto
- modelo_moto
- tipo_servicio
- costo
- estado

*Los campos `cliente_id` y `servicio_id` que funcionan como PK y están configurados como `AUTO_INCREMENT` no se incluyeron directamente en los registros de la tabla `clientes_taller`. MySQL asignará automáticamente los identificadores de cada cliente.*

*El campo `servicio_id` tampoco se incluyó directamente en los registros de `servicios_taller_motos`, ya que MySQL generará automáticamente su valor.*

*El campo `cliente_id` de `servicios_taller_motos` se utilizó para establecer la relación entre cada servicio y un cliente existente en la tabla `clientes_taller`.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Seleccionar los clientes que tienen al menos un servicio cuyo costo sea superior al costo promedio de todos los servicios, utilizando una subconsulta con `AVG`.
- Seleccionar los clientes que tienen al menos un servicio cuyo estado sea `Pendiente`, utilizando una subconsulta con `IN`.
- Seleccionar los clientes que tienen registrado un servicio de tipo `Mantenimiento general`, utilizando una subconsulta correlacionada con `EXISTS`.
- Seleccionar los clientes que tienen registrados más de un servicio, utilizando una subconsulta con `GROUP BY`, `COUNT` y `HAVING`.
- Seleccionar el cliente relacionado con el servicio de mayor costo del taller, utilizando una subconsulta con la función `MAX`.

*Las consultas permiten practicar el uso de subconsultas en MySQL para obtener información relacionada entre diferentes niveles de consulta. Se utilizaron subconsultas con `IN`, `EXISTS`, `AVG`, `MAX`, `COUNT`, `GROUP BY` y `HAVING` para resolver diferentes necesidades de análisis sobre los clientes y los servicios del taller.*