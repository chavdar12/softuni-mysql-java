-- database: soft_uni
SELECT count(`salary`) AS `count`
FROM `employees`
WHERE `manager_id` IS NULL
GROUP BY `manager_id`;
