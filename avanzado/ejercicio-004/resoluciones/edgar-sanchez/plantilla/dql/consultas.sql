DELIMITER //

-- TRIGGER 1: Restricción de Negocio (BEFORE INSERT)
-- Impide asignar mantenimientos a mecánicos inactivos
CREATE TRIGGER tg_validar_mecanico_activo
BEFORE INSERT ON mantenimientos_motos
FOR EACH ROW
BEGIN
    DECLARE v_estado VARCHAR(20);

    SELECT estado INTO v_estado
    FROM mecanicos
    WHERE mecanico_id = NEW.mecanico_id;

    IF v_estado = 'Inactivo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error de Negocio: No se puede asignar un mantenimiento a un mecánico inactivo.';
    END IF;
END //

-- TRIGGER 2: Actualización de Métricas Acumuladas (AFTER INSERT)
-- Actualiza automáticamente contadores de horas y servicios del mecánico
CREATE TRIGGER tg_actualizar_estadisticas_mecanico
AFTER INSERT ON mantenimientos_motos
FOR EACH ROW
BEGIN
    UPDATE mecanicos
    SET horas_totales_trabajadas = horas_totales_trabajadas + NEW.horas_trabajadas,
        total_servicios_realizados = total_servicios_realizados + 1
    WHERE mecanico_id = NEW.mecanico_id;
END //

-- TRIGGER 3: Registro de Auditoría (AFTER UPDATE)
-- Registra cambios en el precio cobrado en los mantenimientos
CREATE TRIGGER tg_auditar_cambio_precio
AFTER UPDATE ON mantenimientos_motos
FOR EACH ROW
BEGIN
    IF OLD.costo_total <> NEW.costo_total THEN
        INSERT INTO auditoria_precios_mantenimiento (
            mantenimiento_id,
            costo_anterior,
            costo_nuevo,
            usuario_modificacion
        ) VALUES (
            NEW.mantenimiento_id,
            OLD.costo_total,
            NEW.costo_total,
            CURRENT_USER()
        );
    END IF;
END //

DELIMITER ;

-- Inserción de mantenimientos válidos para disparar los Triggers 1 y 2
INSERT INTO mantenimientos_motos (mecanico_id, placa_moto, cilindrada, tipo_mantenimiento, costo_total, horas_trabajadas, fecha_servicio) VALUES
(1, 'MTO-881', 1000, 'Ajuste de Motor', 450.00, 5.5, '2026-06-01'),
(1, 'MTO-992', 600, 'Preventivo', 180.00, 2.0, '2026-06-03'),
(2, 'MTO-111', 250, 'Preventivo', 90.00, 1.5, '2026-06-02'),
(3, 'MTO-701', 125, 'Correctivo', 120.00, 2.0, '2026-06-05');

-- Modificación de costos para disparar el Trigger 3 (Auditoría)
UPDATE mantenimientos_motos
SET costo_total = 520.00
WHERE mantenimiento_id = 1;

UPDATE mantenimientos_motos
SET costo_total = 210.00
WHERE mantenimiento_id = 2;

-- Verificación de acumulación automática de métricas en la tabla mecanicos
SELECT 
    mecanico_id,
    nombre,
    especialidad,
    horas_totales_trabajadas,
    total_servicios_realizados,
    estado
FROM mecanicos;

-- Consulta a la tabla de auditoría
SELECT 
    auditoria_id,
    mantenimiento_id,
    costo_anterior,
    costo_nuevo,
    usuario_modificacion,
    fecha_modificacion
FROM auditoria_precios_mantenimiento;