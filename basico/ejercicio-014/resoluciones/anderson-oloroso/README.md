# ✨ Solución ejercicio básico: 14

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `saga_ciencia_ficcion` para almacenar información organizada sobre las películas pertenecientes a una saga de ciencia ficción, incluyendo sus datos de producción, fecha de estreno, presupuesto y estado.

La tabla cuenta con los siguientes campos:

- pelicula_id
- titulo
- director
- fecha_estreno
- presupuesto
- estado

*El campo `pelicula_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada película y su valor será asignado automáticamente por MySQL.*

*El campo `fecha_estreno` utiliza el tipo de dato `DATE`, permitiendo almacenar las fechas de estreno en el formato estándar `YYYY-MM-DD`.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se centra en el almacenamiento de información de una saga y en la práctica de consultas utilizando fechas básicas.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- titulo
- director
- fecha_estreno
- presupuesto
- estado

*El campo `pelicula_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. Por esta razón, MySQL asignará automáticamente un identificador único y consecutivo a cada película.*

*Los datos fueron creados de forma coherente con la temática de una saga de ciencia ficción, utilizando diferentes títulos, directores, fechas de estreno, presupuestos y estados.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Seleccionar las películas estrenadas antes del `01 de enero de 2020`.
- Seleccionar las películas cuya fecha de estreno se encuentre entre el `01 de enero de 2020` y el `31 de diciembre de 2023`.
- Seleccionar las películas estrenadas desde el año `2025` y ordenarlas cronológicamente de manera ascendente.
- Seleccionar las películas cuyo año de estreno sea exactamente `2024` utilizando la función `YEAR`.
- Seleccionar las películas estrenadas después del `31 de diciembre de 2024` que además tengan un presupuesto superior a `180000000`, ordenándolas por fecha de estreno.

*Las consultas permiten practicar el manejo básico de fechas en MySQL utilizando operadores de comparación, `BETWEEN`, `ORDER BY` y la función `YEAR`, permitiendo filtrar y organizar las películas según sus fechas de estreno.*