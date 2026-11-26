-- database: soft_uni
CREATE PROCEDURE `usp_get_towns_starting_with` (`prefix` VARCHAR(255))
BEGIN
    SELECT t.`name` AS `town_name`
    FROM `towns` AS `t`
    WHERE t.`name` LIKE (concat(`prefix`, '%'))
    ORDER BY t.`name`;
END;

CALL `usp_get_towns_starting_with`('b');
