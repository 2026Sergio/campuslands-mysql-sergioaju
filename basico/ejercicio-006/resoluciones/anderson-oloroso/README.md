# ✨ Solución ejercicio básico: 06

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `autos_hiperdeportivos` para almacenar información organizada sobre diferentes autos hiperdeportivos, incluyendo sus características de rendimiento, precio y país de origen.

La tabla cuenta con los siguientes campos:

- auto_id
- marca
- modelo
- velocidad_maxima
- potencia_hp
- precio
- pais_origen

*El campo `auto_id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada automóvil y su valor será asignado automáticamente por MySQL.*

*Para esta tabla no se utilizaron relaciones con otras tablas, ya que el ejercicio se centra en la inserción y consulta de información utilizando principalmente la cláusula `WHERE`.*

### Creación de registros 📝

Se insertaron 15 registros con los siguientes campos:

- marca
- modelo
- velocidad_maxima
- potencia_hp
- precio
- pais_origen

*El campo `auto_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. Por esta razón, MySQL asignará automáticamente un identificador único y consecutivo a cada automóvil.*

*Los datos fueron creados de forma coherente con la temática de autos hiperdeportivos, utilizando diferentes marcas y modelos con características de rendimiento, precios y países de origen variados.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Seleccionar los autos cuya velocidad máxima sea superior a `400` km/h.
- Seleccionar los autos que tengan una potencia superior a `1500` HP.
- Seleccionar únicamente los autos cuyo país de origen sea `Italia`.
- Seleccionar los autos cuyo precio se encuentre entre `1000000000` y `2000000000`.
- Seleccionar los autos que tengan una velocidad máxima superior a `350` km/h y una potencia superior a `1000` HP.

*Las consultas permiten practicar el uso de la cláusula `WHERE` para filtrar registros según diferentes condiciones. También se utilizaron los operadores `>`, `BETWEEN` y `AND` para realizar búsquedas específicas sobre los datos almacenados.*