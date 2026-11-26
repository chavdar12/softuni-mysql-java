-- database: bank
CREATE PROCEDURE `usp_transfer_money` (`from_account_id` INT, `to_account_id` INT, `amount` DECIMAL(19, 4))
BEGIN
    -- a missing from-account yields NULL balance, so the >= check rejects it too
    IF
        `amount` > 0
        AND `from_account_id` <> `to_account_id`
        AND (
            SELECT count(*) FROM `accounts` AS `a`
            WHERE a.`id` = `to_account_id`
        ) = 1
        AND (
            SELECT a.`balance` FROM `accounts` AS `a`
            WHERE a.`id` = `from_account_id`
        ) >= `amount`
    THEN
        START TRANSACTION;
        UPDATE `accounts` AS `a`
        SET a.`balance` = a.`balance` - `amount`
        WHERE a.`id` = `from_account_id`;
        UPDATE `accounts` AS `a`
        SET a.`balance` = a.`balance` + `amount`
        WHERE a.`id` = `to_account_id`;
        COMMIT;
    END IF;
END;

CALL `usp_transfer_money`(1, 2, 10);
