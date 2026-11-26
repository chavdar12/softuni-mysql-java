-- database: soft_uni
SELECT
    e.`employee_id`,
    concat(e.`first_name`, ' ', e.`last_name`) AS `employee_name`,
    concat(m.`first_name`, ' ', m.`last_name`) AS `manager_name`,
    d.`name` AS `department_name`
FROM `employees` AS `e`
INNER JOIN `employees` AS `m` ON e.`manager_id` = m.`employee_id`
INNER JOIN `departments` AS `d` ON e.`department_id` = d.`department_id`
WHERE e.`manager_id` IS NOT NULL
ORDER BY e.`employee_id` LIMIT 5;
