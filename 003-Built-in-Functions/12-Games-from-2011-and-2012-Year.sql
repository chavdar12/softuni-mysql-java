-- database: diablo
SELECT
    `name`,
    DATE_FORMAT(`start`, '%Y-%m-%d') AS `asd`
FROM `games`
WHERE extract(YEAR FROM `start`) IN ('2011', '2012')
ORDER BY `start`, `name` LIMIT 50;
