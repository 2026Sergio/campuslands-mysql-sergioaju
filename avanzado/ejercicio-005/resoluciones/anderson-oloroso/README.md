# ✨ Solución ejercicio avanzado: 05

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Para este ejercicio se creó la tabla `taller_mecanico_motos`, diseñada para almacenar información relacionada con los servicios realizados en un taller mecánico de motos.

La tabla cuenta con los siguientes campos:

- servicio_id
- nombre_cliente
- telefono
- marca_moto
- modelo_moto
- tipo_servicio
- costo
- estado
- fecha_servicio

*El campo `servicio_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada servicio registrado y su valor será asignado automáticamente por MySQL.*

*Para este ejercicio no se utilizaron relaciones con otras tablas, ya que el objetivo principal es practicar la creación y utilización de índices sobre una tabla de servicios.*

### Creación de índices ⚡

Se crearon cinco índices para optimizar las búsquedas frecuentes realizadas sobre diferentes columnas de la tabla:

- `idx_cliente`: índice sobre `nombre_cliente`.
- `idx_telefono`: índice sobre `telefono`.
- `idx_marca_moto`: índice sobre `marca_moto`.
- `idx_estado`: índice sobre `estado`.
- `idx_fecha_servicio`: índice sobre `fecha_servicio`.

*Los índices permiten mejorar el rendimiento de las consultas que utilizan estas columnas como criterios de búsqueda o filtrado.*

*No se creó un índice adicional para `servicio_id`, ya que este campo funciona como PK y MySQL crea automáticamente un índice asociado a la clave primaria.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- nombre_cliente
- telefono
- marca_moto
- modelo_moto
- tipo_servicio
- costo
- estado
- fecha_servicio

*El campo `servicio_id` no se incluyó directamente en los registros porque está configurado como PK y `AUTO_INCREMENT`. MySQL asignará automáticamente un identificador único y consecutivo a cada servicio.*

*Los datos fueron creados utilizando diferentes clientes, teléfonos, marcas, modelos, tipos de servicio, costos, estados y fechas para representar información coherente con la temática de un taller mecánico de motos.*

### Consultas y uso de índices 🔎

Las consultas que se realizaron fueron:

- Buscar un servicio utilizando el nombre específico de un cliente.
- Buscar todos los servicios asociados a la marca `Yamaha`.
- Consultar los servicios que tienen estado `Pendiente` y ordenarlos por fecha.
- Consultar los servicios realizados durante el mes de enero de 2026 utilizando un rango de fechas.
- Buscar un servicio utilizando el número de teléfono del cliente.

*Estas consultas utilizan como criterios de búsqueda las columnas sobre las cuales se crearon índices, permitiendo demostrar diferentes escenarios de consulta que pueden beneficiarse de la indexación.*

### Explicación final 📝

*La solución permite practicar la creación de índices en MySQL mediante la instrucción `INDEX`. Se crearon índices sobre columnas que representan posibles criterios de búsqueda frecuente, como el nombre del cliente, teléfono, marca de la moto, estado y fecha del servicio.*

*Los índices ayudan al motor de base de datos a localizar información de manera más eficiente, especialmente cuando las tablas contienen grandes cantidades de registros. Sin embargo, también representan un costo adicional en operaciones de inserción, actualización y eliminación, por lo que deben crearse sobre columnas que realmente aporten valor a las consultas.*

*La solución incluye 15 registros y cinco consultas verificables que permiten consultar la información mediante diferentes criterios relacionados con los índices creados.*