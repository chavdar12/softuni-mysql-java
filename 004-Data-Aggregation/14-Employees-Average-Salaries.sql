-- database: soft_uni
CREATE TABLE `temp_table` AS
SELECT
    `department_id`,
    avg(`salary`) AS `avg_salary`
FROM `employees`
WHERE `manager_id` != 42 AND `salary` > 30000
GROUP BY `department_id`;

UPDATE `temp_table`
SET `avg_salary` = `avg_salary` + 5000
WHERE `department_id` = 1;

SELECT *
FROM `temp_table`
ORDER BY `department_id`;
