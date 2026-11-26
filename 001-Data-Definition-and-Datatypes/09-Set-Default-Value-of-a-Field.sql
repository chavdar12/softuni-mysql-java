-- database: users table from task 07
ALTER TABLE `users`
    MODIFY COLUMN `last_login_time` DATETIME DEFAULT NOW();
