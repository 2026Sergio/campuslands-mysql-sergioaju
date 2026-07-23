# ✨ Solución ejercicio avanzado: 04

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Para este ejercicio se crearon dos tablas relacionadas entre sí, con el objetivo de representar un garaje de motos y mantener un historial automático de las acciones realizadas sobre las motocicletas.

La primera tabla es `garaje_motos`, que cuenta con los siguientes campos:

- moto_id
- marca
- modelo
- cilindraje
- anio
- precio
- estado

La segunda tabla es `historial_garaje_motos`, que cuenta con los siguientes campos:

- historial_id
- moto_id
- accion
- fecha_accion
- descripcion

*El campo `moto_id` de la tabla `garaje_motos` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada motocicleta.*

*El campo `historial_id` de la tabla `historial_garaje_motos` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada registro del historial.*

*La tabla `historial_garaje_motos` tiene una relación con la tabla `garaje_motos` mediante el campo `moto_id`, el cual funciona como FK y referencia al campo `moto_id` de la tabla `garaje_motos`.*

### Creación de registros 📝

Se insertaron 15 registros iniciales en la tabla `garaje_motos` con los siguientes campos:

- marca
- modelo
- cilindraje
- anio
- precio
- estado

*El campo `moto_id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`. MySQL asignará automáticamente un identificador único y consecutivo a cada motocicleta.*

*Los registros fueron creados utilizando diferentes marcas, modelos, cilindradas, años, precios y estados para representar información coherente con la temática de un garaje de motos.*

### Creación de triggers ⚙️

Se crearon tres triggers para registrar automáticamente las operaciones realizadas sobre la tabla `garaje_motos`.

Los triggers creados fueron:

- `tr_moto_insertada`
- `tr_moto_actualizada`
- `tr_moto_eliminada`

El trigger `tr_moto_insertada` utiliza `AFTER INSERT` para registrar automáticamente en `historial_garaje_motos` cada nueva motocicleta agregada al garaje.

El trigger `tr_moto_actualizada` utiliza `AFTER UPDATE` para registrar las modificaciones realizadas sobre una motocicleta. También almacena el estado anterior y el nuevo estado utilizando los valores `OLD` y `NEW`.

El trigger `tr_moto_eliminada` utiliza `AFTER DELETE` para registrar automáticamente la eliminación de una motocicleta utilizando los valores anteriores almacenados en `OLD`.

*Los triggers permiten automatizar el registro de eventos sin necesidad de ejecutar manualmente un `INSERT` en la tabla de historial cada vez que se modifica la información principal.*

### Pruebas de los triggers 🔄

Se realizaron diferentes operaciones para comprobar el funcionamiento de los triggers:

- Se actualizó el estado de la motocicleta con `moto_id = 1`.
- Se actualizó el precio de la motocicleta con `moto_id = 4`.
- Se eliminó la motocicleta con `moto_id = 15`.

*Cada operación genera automáticamente un registro en la tabla `historial_garaje_motos`.*

*La actualización del estado permite comprobar el uso de `OLD.estado` y `NEW.estado`, mientras que la eliminación permite comprobar el uso de los valores `OLD` correspondientes a la motocicleta eliminada.*

*Los registros iniciales insertados en `garaje_motos` también generan automáticamente registros de historial mediante el trigger `tr_moto_insertada`.*

### Consultas ✅

Las consultas que se realizaron fueron:

- Seleccionar las motocicletas que actualmente se encuentran disponibles y ordenarlas por precio de mayor a menor.
- Contar la cantidad de motocicletas registradas por cada marca utilizando `COUNT` y `GROUP BY`.
- Calcular el precio promedio de las motocicletas agrupadas por marca utilizando `AVG`.
- Relacionar el historial con la información de las motocicletas mediante `INNER JOIN` para consultar las acciones realizadas.
- Contar la cantidad de acciones registradas para cada tipo de operación utilizando `COUNT` y `GROUP BY`.

*Las consultas permiten verificar la información actual del garaje y comprobar los registros generados automáticamente por los triggers.*

### Explicación final 📝

*La solución permite practicar la creación y utilización de triggers en MySQL para automatizar acciones relacionadas con eventos de inserción, actualización y eliminación.*

*Se utilizaron triggers `AFTER INSERT`, `AFTER UPDATE` y `AFTER DELETE` para mantener un historial de las operaciones realizadas sobre las motocicletas. La tabla `historial_garaje_motos` permite conservar evidencia de las acciones ejecutadas y facilita la auditoría de los cambios realizados en el garaje.*

*Además, se utilizaron `OLD` y `NEW` para acceder a los valores anteriores y nuevos de los registros, junto con `INNER JOIN`, `COUNT`, `AVG`, `GROUP BY` y `ORDER BY` para consultar y analizar la información almacenada.*