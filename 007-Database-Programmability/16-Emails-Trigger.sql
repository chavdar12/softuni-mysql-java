-- database: bank (needs the logs table from task 15)
CREATE TABLE `notification_emails`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `recipient` INT NOT NULL,
    `subject` VARCHAR(50) NOT NULL,
    `body` VARCHAR(255) NOT NULL
);

CREATE TRIGGER `tr_logs_notification_email`
AFTER INSERT
ON `logs`
FOR EACH ROW
BEGIN
    INSERT INTO `notification_emails` (`recipient`, `subject`, `body`)
    VALUES (
        NEW.`account_id`,
        concat('Balance change for account: ', NEW.`account_id`),
        concat(
            'On ', date_format(now(), '%b %d %Y at %r'), ' your balance was changed from ',
            NEW.`old_sum`, ' to ', NEW.`new_sum`, '.'
        )
    );
END;
