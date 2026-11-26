-- database: bank
CREATE PROCEDURE `usp_withdraw_money` (`account_id` INT, `money_amount` DECIMAL(19, 4))
BEGIN
    IF
        `money_amount` > 0
        AND (
            SELECT a.`balance` FROM `accounts` AS `a`
            WHERE a.`id` = `account_id`
        ) >= `money_amount`
    THEN
        START TRANSACTION;
        UPDATE `accounts` AS `a`
        SET a.`balance` = a.`balance` - `money_amount`
        WHERE a.`id` = `account_id`;
        COMMIT;
    END IF;
END;

CALL `usp_withdraw_money`(1, 10);
