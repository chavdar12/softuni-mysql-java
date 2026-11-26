-- database: soft_uni
SELECT
    e1.`first_name`,
    e1.`last_name`,
    e1.`department_id`
FROM `employees` AS `e1`
WHERE
    `salary` > (
        SELECT avg(e2.`salary`)
        FROM `employees` AS `e2`
        WHERE e2.`department_id` = e1.`department_id`
        GROUP BY e2.`department_id`
    )
ORDER BY e1.`department_id`, e1.`employee_id` LIMIT 10;
