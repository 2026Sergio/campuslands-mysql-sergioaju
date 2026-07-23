# ✨ Solución ejercicio intermedio: 04

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `garaje_motos` para almacenar información organizada sobre motocicletas de diferentes marcas y modelos disponibles en un garaje.

La tabla cuenta con los siguientes campos:

- moto_id
- marca
- modelo
- cilindraje
- anio
- precio
- estado

*El campo `moto_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada motocicleta y su valor será asignado automáticamente por MySQL.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se enfoca en el análisis de registros agrupados y en el uso de la cláusula `HAVING` para filtrar los resultados obtenidos mediante funciones de agregación.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- marca
- modelo
- cilindraje
- anio
- precio
- estado

*El campo `moto_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. Por esta razón, MySQL asignará automáticamente un identificador único y consecutivo a cada motocicleta.*

*Los datos fueron creados de forma coherente con la temática de un garaje de motos, utilizando diferentes marcas, modelos, cilindradas, años, precios y estados de disponibilidad.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Agrupar las motocicletas por marca, calcular la cantidad de motos y el precio promedio, mostrando únicamente las marcas que tienen al menos `2` motocicletas mediante `HAVING`.
- Agrupar las motocicletas por marca y calcular el valor total de sus precios, mostrando únicamente las marcas cuyo valor acumulado sea superior a `150000000`.
- Agrupar las motocicletas por marca y calcular el cilindraje promedio, mostrando únicamente las marcas cuyo promedio sea superior a `700`.
- Agrupar las motocicletas por estado, calcular la cantidad de motos y el valor total, mostrando únicamente los estados que tengan más de `3` motocicletas.
- Filtrar previamente las motocicletas disponibles utilizando `WHERE`, agruparlas por marca y mostrar únicamente las marcas que tengan al menos `2` motos disponibles mediante `HAVING`.

*Las consultas permiten practicar el uso de `HAVING` para filtrar resultados después de aplicar agrupaciones con `GROUP BY`. También se utilizaron las funciones de agregación `COUNT`, `SUM` y `AVG`, además de `WHERE` y `ORDER BY` para construir consultas verificables y obtener indicadores útiles sobre el garaje de motos.*