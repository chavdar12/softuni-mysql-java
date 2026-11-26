-- database: bank
CREATE PROCEDURE `usp_get_holders_with_balance_higher_than` (`balance` DOUBLE)
BEGIN
    SELECT DISTINCT
        ah.`first_name`,
        ah.`last_name`
    FROM `accounts` AS `a`
    INNER JOIN `account_holders` AS `ah` ON `a`.`account_holder_id` = `ah`.`id`
    WHERE (
        SELECT sum(a2.`balance`)
        FROM `accounts` AS `a2`
        WHERE a2.`account_holder_id` = ah.`id`
        GROUP BY a2.`account_holder_id`
    ) > `balance`
    GROUP BY a.`account_holder_id`, a.`id`
    ORDER BY a.`id`;
END;

CALL `usp_get_holders_with_balance_higher_than`(7000);
