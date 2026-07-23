# ✨ Solución ejercicio básico: 05

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `taller_mecanico_motos` para almacenar información organizada sobre los servicios mecánicos realizados a motocicletas dentro de un taller.

La tabla cuenta con los siguientes campos:

- servicio_id
- nombre_cliente
- marca_moto
- modelo_moto
- tipo_servicio
- costo
- estado

*El campo `servicio_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada servicio registrado y su valor será asignado automáticamente por MySQL.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se centra en la inserción y consulta de información relacionada con los servicios mecánicos.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- nombre_cliente
- marca_moto
- modelo_moto
- tipo_servicio
- costo
- estado

*El campo `servicio_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. Por esta razón, MySQL asignará automáticamente un identificador único y consecutivo a cada servicio.*

*Los datos fueron creados de forma coherente con la temática de un taller mecánico de motos, utilizando diferentes clientes, marcas, modelos, tipos de servicio, costos y estados de atención.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Seleccionar todos los registros de la tabla `taller_mecanico_motos` para visualizar la información completa de los servicios registrados.
- Seleccionar únicamente los servicios cuyo estado sea `Completado`.
- Seleccionar los servicios con un costo superior a `700000` y ordenarlos de mayor a menor según su costo.
- Contar la cantidad de servicios realizados para cada tipo de servicio y ordenar los resultados según la cantidad registrada.
- Calcular el costo promedio de los servicios agrupados por marca de motocicleta y ordenar los resultados de mayor a menor costo promedio.

*Las consultas permiten practicar el uso de `SELECT`, `WHERE`, `ORDER BY`, `COUNT`, `AVG` y `GROUP BY`, obteniendo información útil para analizar los servicios registrados en el taller mecánico.*