-- DML: Registro de 8 repuestos para pruebas de selección y proyecciones
USE campuslands_mysql;

INSERT INTO repuestos_taller_basico 
(nombre_repuesto, categoria, precio_unitario, stock_actual, proveedor, estado) 
VALUES
('Pastillas de Freno Delanteras', 'frenos', 25.50, 15, 'Brembo Corp', 'disponible'),
('Aceite Sintético 10W-40 1L', 'lubricantes', 14.00, 40, 'Motul S.A.', 'disponible'),
('Batería YTZ10S 12V', 'electrico', 85.00, 6, 'Yuasa Parts', 'disponible'),
('Kit de Arrastre/Cadena 520', 'motor', 110.00, 0, 'DID Chain', 'agotado'),
('Filtro de Aceite Deportivo', 'lubricantes', 9.50, 25, 'K&N Filters', 'disponible'),
('Bujía de Iridio IX', 'electrico', 12.00, 30, 'NGK Spark', 'disponible'),
('Amortiguador Trasero Gas', 'suspension', 195.00, 3, 'Ohlins Tech', 'disponible'),
('Disco de Freno Flotante', 'frenos', 135.00, 0, 'Brembo Corp', 'descontinuado');
