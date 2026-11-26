-- database: users table from task 07
ALTER TABLE `users`
    DROP PRIMARY KEY,
    ADD CONSTRAINT `pk_users` PRIMARY KEY (`id`, `username`);
