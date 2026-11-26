CREATE TABLE `directors`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

CREATE TABLE `genres`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

CREATE TABLE `categories`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

CREATE TABLE `movies`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `director_id` INT,
    `copyright_year` YEAR,
    `length` TIME,
    `genre_id` INT,
    `category_id` INT,
    `rating` DOUBLE,
    `notes` TEXT,
    CONSTRAINT `fk_movies_directors` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`),
    CONSTRAINT `fk_movies_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
    CONSTRAINT `fk_movies_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
);

INSERT INTO `directors` (`director_name`)
VALUES ('Christopher Nolan'),
('Quentin Tarantino'),
('Steven Spielberg'),
('Martin Scorsese'),
('Ridley Scott');

INSERT INTO `genres` (`genre_name`)
VALUES ('Drama'),
('Action'),
('Sci-Fi'),
('Crime'),
('Adventure');

INSERT INTO `categories` (`category_name`)
VALUES ('Feature'),
('Short'),
('Documentary'),
('Animation'),
('Series');

INSERT INTO `movies` (`title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`, `rating`)
VALUES ('Inception', 1, 2010, '02:28:00', 3, 1, 8.8),
('Pulp Fiction', 2, 1994, '02:34:00', 4, 1, 8.9),
('Jurassic Park', 3, 1993, '02:07:00', 5, 1, 8.2),
('Goodfellas', 4, 1990, '02:26:00', 4, 1, 8.7),
('Gladiator', 5, 2000, '02:35:00', 2, 1, 8.5);
