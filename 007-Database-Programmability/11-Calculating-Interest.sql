-- database: bank
CREATE PROCEDURE `usp_calculate_future_value_for_account` (`account_id` INT, `interest_rate` DECIMAL(20, 4))
BEGIN
    SELECT
        a.`id`,
        h.`first_name`,
        h.`last_name`,
        a.`balance`,
        ufn_calculate_future_value(a.`balance`, interest_rate, 5) AS `balance_in_5_years`
    FROM `account_holders` AS `h`
    INNER JOIN `accounts` AS `a` ON `h`.`id` = `a`.`account_holder_id`
    WHERE a.`id` = `account_id`
    GROUP BY a.`account_holder_id`;
END;

CALL usp_calculate_future_value_for_account(1, 0.1);
