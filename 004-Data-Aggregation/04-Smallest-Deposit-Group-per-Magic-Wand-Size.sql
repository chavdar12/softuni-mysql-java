-- database: gringotts
CREATE TABLE `temp_table` AS
SELECT
    `deposit_group`,
    avg(`magic_wand_size`) AS `wand_size`
FROM `wizzard_deposits`
GROUP BY `deposit_group`;

SELECT `deposit_group`
FROM `temp_table`
ORDER BY `wand_size` LIMIT 1;
