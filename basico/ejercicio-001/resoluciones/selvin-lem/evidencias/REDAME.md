# Evidencias:

````
2026-07-22 20:13:33 [DEBUG] Creating MySQL connection for 1784772684736
2026-07-22 20:13:33 [DEBUG] Start load foreignKey meta data...
2026-07-22 20:13:33 [DEBUG] Creating MySQL connection for 1784772684736_meta
2026-07-22 20:13:33 [DEBUG] Load foreignKey meta data success! cost: 52ms
2026-07-22 20:13:33 [DEBUG] Closing connection 1784772684736_meta
2026-07-22 20:13:33 [DEBUG] Creating MySQL connection for 1784772684736_tree
2026-07-22 20:14:54 [DEBUG] Closing connection 1780629557951
2026-07-22 20:19:18 [DEBUG] Connection 1784772684736 idle for 345s, closing...
2026-07-22 20:19:18 [DEBUG] Closing connection 1784772684736
2026-07-22 20:21:19 [DEBUG] Connection 1784772684736_tree idle for 322s, closing...
2026-07-22 20:21:19 [DEBUG] Closing connection 1784772684736_tree
2026-07-22 20:33:03 [DEBUG] Creating MySQL connection for 1784772684736
2026-07-22 20:33:03 [ INFO] Executing: CREATE DATABASE IF NOT EXISTS campuslands_mysql
2026-07-22 20:33:03 [ INFO] Result: 1 rows affected in 37ms
2026-07-22 20:33:03 [ INFO] Executing: USE campuslands_mysql
2026-07-22 20:33:03 [ INFO] Result: 0 rows affected in 6ms
2026-07-22 20:33:03 [ INFO] Executing: DROP TABLE IF EXISTS basico_ejercicio_001
2026-07-22 20:33:03 [ INFO] Result: 0 rows affected in 13ms
2026-07-22 20:33:03 [ INFO] Executing: CREATE TABLE basico_ejercicio_001 (   id INT AUTO_INCREMENT PRIMARY KEY,   nombre VARCHAR(120) NOT NULL,   categoria VARCHAR(80) NOT NULL,   puntaje DECIMAL(10,2) NOT NULL DEFAULT 0,   estado ENUM('activo','revision','inactivo') NOT NULL DEFAULT 'activo',   creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP )
2026-07-22 20:33:04 [ INFO] Result: 0 rows affected in 99ms
2026-07-22 20:33:04 [DEBUG] Creating MySQL connection for 1784772684736_tree
2026-07-22 20:34:08 [ INFO] Executing: USE campuslands_mysql
2026-07-22 20:34:08 [ INFO] Result: 0 rows affected in 4ms
2026-07-22 20:34:08 [ INFO] Executing: INSERT INTO basico_ejercicio_001 (nombre, categoria, puntaje, estado) VALUES ('Kairos',   'mid',     87.50, 'activo'), ('Vantex',   'top',     79.20, 'activo'), ('Nyxara',   'support', 65.00, 'activo'), ('Ferox',    'jungla',  91.30, 'activo'), ('Blitzen',  'adc',     73.80, 'revision'), ('Serath',   'top',     68.40, 'activo'), ('Onyxia',   'mid',     55.10, 'activo'), ('Draven99', 'adc',     0.00,  'inactivo')
2026-07-22 20:34:08 [ INFO] Result: 8 rows affected in 25ms
2026-07-22 20:34:30 [ INFO] Executing: USE campuslands_mysql
2026-07-22 20:34:30 [ INFO] Result: 0 rows affected in 4ms
2026-07-22 20:34:30 [ INFO] Executing: SELECT * FROM basico_ejercicio_001 LIMIT 100
2026-07-22 20:34:30 [ INFO] Result: 8 rows retrieved in 7ms
2026-07-22 20:34:30 [ INFO] Executing: SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio FROM basico_ejercicio_001 GROUP BY categoria ORDER BY promedio DESC LIMIT 100
2026-07-22 20:34:30 [ INFO] Result: 5 rows retrieved in 6ms
2026-07-22 20:34:30 [ INFO] Executing: SELECT nombre, categoria, puntaje FROM basico_ejercicio_001 ORDER BY puntaje DESC LIMIT 5
2026-07-22 20:34:30 [ INFO] Result: 5 rows retrieved in 6ms
2026-07-22 20:34:30 [ INFO] Executing: SELECT nombre, categoria, puntaje FROM basico_ejercicio_001 WHERE estado = 'activo' AND puntaje > 70 ORDER BY puntaje DESC LIMIT 100
2026-07-22 20:34:30 [ INFO] Result: 3 rows retrieved in 6ms
2026-07-22 20:34:30 [ INFO] Executing: SELECT nombre, categoria, estado FROM basico_ejercicio_001 WHERE estado IN ('revision', 'inactivo') LIMIT 100
2026-07-22 20:34:30 [ INFO] Result: 2 rows retrieved in 6ms
2026-07-22 20:39:19 [DEBUG] Connection 1784772684736_tree idle for 306s, closing...
2026-07-22 20:39:19 [DEBUG] Closing connection 1784772684736_tree
2026-07-22 20:42:19 [DEBUG] Connection 1784772684736 idle for 306s, closing...
2026-07-22 20:42:19 [DEBUG] Closing connection 1784772684736

````