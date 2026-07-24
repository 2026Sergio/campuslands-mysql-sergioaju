-- avanzado/ejercicio-011 - maria-montepeque
-- Los entrenamientos se concentran en 9 de los 14 dias de la ventana
-- 2026-07-01 a 2026-07-14 (a proposito, dejando 5 dias sin ningun
-- entrenamiento), para que el CTE recursivo que rellena el calendario
-- tenga huecos reales que mostrar.
USE campuslands_mysql;

INSERT INTO entrenamientos_pingpong_cte
    (jugador, fecha_entrenamiento, duracion_minutos)
VALUES
    ('Kairo Spin', '2026-07-01', 60),
    ('Zara Topspin', '2026-07-01', 45),
    ('Rex Smash', '2026-07-02', 30),
    ('Kairo Spin', '2026-07-04', 50),
    ('Luna Slice', '2026-07-05', 40),
    ('Zara Topspin', '2026-07-05', 55),
    ('Rex Smash', '2026-07-07', 35),
    ('Kairo Spin', '2026-07-09', 65),
    ('Zara Topspin', '2026-07-10', 50),
    ('Luna Slice', '2026-07-10', 45),
    ('Rex Smash', '2026-07-12', 40),
    ('Kairo Spin', '2026-07-14', 55);
