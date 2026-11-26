-- database: soft_uni
SELECT
    `first_name`,
    `last_name`
FROM `employees`
WHERE locate('engineer', `job_title`) IS FALSE
ORDER BY `employee_id`;
