CREATE TABLE `users`
(
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(30) UNIQUE NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` DATETIME,
    `is_deleted` BOOLEAN
);

INSERT INTO `users` (`username`, `password`, `last_login_time`, `is_deleted`)
VALUES ('ivan', 'pass1', '2024-01-01 10:00:00', FALSE),
('maria', 'pass2', '2024-01-02 11:00:00', FALSE),
('georgi', 'pass3', '2024-01-03 12:00:00', TRUE),
('elena', 'pass4', '2024-01-04 13:00:00', FALSE),
('petar', 'pass5', '2024-01-05 14:00:00', TRUE);
