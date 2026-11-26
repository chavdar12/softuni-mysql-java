-- database: soft_uni
UPDATE soft_uni.`employees`
SET `salary` = `salary` + (`salary` * 0.12)
WHERE
    `department_id` = 1
    OR `department_id` = 2
    OR `department_id` = 4
    OR `department_id` = 11;
SELECT `salary`
FROM soft_uni.`employees`;
