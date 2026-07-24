DELIMITER //

CREATE PROCEDURE ObtenerRankingCompleto()
BEGIN
    SELECT * FROM ranking_royale 
    ORDER BY puntos_ranking DESC;
END //

DELIMITER ;