-- database: soft_uni
SELECT
    `first_name`,
    `last_name`,
    `job_title`
FROM soft_uni.`employees`
WHERE
    `salary` >= 20000
    AND `salary` <= 30000
ORDER BY `employee_id`;
