# ✨ Solución ejercicio básico: 04

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `garaje_motos` para almacenar información organizada sobre las motocicletas disponibles en el garaje de la academia técnica.

La tabla cuenta con los siguientes campos:

- moto_id
- marca
- modelo
- cilindraje
- anio
- precio
- estado

*El campo `moto_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada motocicleta y su valor será asignado automáticamente por MySQL.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se centra en la creación de registros y en la realización de consultas sobre la información almacenada.*

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

- Seleccionar todas las motocicletas del garaje y ordenarlas de mayor a menor según su precio.
- Seleccionar únicamente las motocicletas que se encuentran actualmente disponibles.
- Contar la cantidad de motocicletas registradas por cada marca y ordenar los resultados según la cantidad.
- Seleccionar las motocicletas con un cilindraje mayor a `600` y ordenarlas de mayor a menor cilindraje.
- Seleccionar las motocicletas disponibles cuyo precio sea superior a `50000000` y ordenar los resultados de mayor a menor precio.

*Las consultas permiten comprobar que los registros fueron insertados correctamente y obtener información útil sobre el inventario del garaje, como disponibilidad, distribución por marca, cilindraje y precios.*