# ✨ Solución ejercicio básico: 10

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `carreras_urbanas` para almacenar información organizada sobre diferentes eventos de carreras urbanas, incluyendo la cantidad de participantes, los premios y el estado de cada carrera.

La tabla cuenta con los siguientes campos:

- carrera_id
- nombre_carrera
- ciudad
- cantidad_participantes
- premio_total
- estado

*El campo `carrera_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada carrera y su valor será asignado automáticamente por MySQL.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se centra en la inserción de registros y en el uso de las funciones de agregación `COUNT` y `SUM`.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- nombre_carrera
- ciudad
- cantidad_participantes
- premio_total
- estado

*El campo `carrera_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. Por esta razón, MySQL asignará automáticamente un identificador único y consecutivo a cada carrera.*

*Los datos fueron creados de forma coherente con la temática de carreras urbanas, utilizando diferentes nombres de eventos, ciudades, cantidades de participantes, premios y estados.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Contar la cantidad total de carreras registradas en la tabla `carreras_urbanas` utilizando `COUNT`.
- Calcular la cantidad total de participantes registrados en todas las carreras utilizando `SUM`.
- Calcular el valor total de los premios asignados a todas las carreras utilizando `SUM`.
- Contar la cantidad de carreras que tienen el estado `Finalizada` utilizando `COUNT` y `WHERE`.
- Contar las carreras que están `Programadas` y calcular la cantidad total de participantes de dichas carreras utilizando `COUNT` y `SUM`.

*Las consultas permiten practicar el uso de las funciones de agregación `COUNT` y `SUM` para obtener indicadores generales y específicos sobre las carreras urbanas registradas.*