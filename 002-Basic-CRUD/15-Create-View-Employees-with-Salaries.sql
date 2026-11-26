-- database: soft_uni
CREATE VIEW `v_employees_salaries` AS
SELECT
    `first_name`,
    `last_name`,
    `salary`
FROM soft_uni.`employees`;
