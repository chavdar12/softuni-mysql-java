CREATE TABLE `people`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `picture` BLOB,
    `height` DOUBLE(10, 2),
    `weight` DOUBLE(10, 2),
    `gender` CHAR(1) NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
);

INSERT INTO `people` (`name`, `height`, `weight`, `gender`, `birthdate`)
VALUES ('Ivan', 1.80, 80.50, 'm', '1990-01-01'),
('Maria', 1.65, 55.20, 'f', '1992-02-02'),
('Georgi', 1.75, 75.00, 'm', '1988-03-03'),
('Elena', 1.70, 60.10, 'f', '1995-04-04'),
('Petar', 1.90, 90.30, 'm', '1985-05-05');
