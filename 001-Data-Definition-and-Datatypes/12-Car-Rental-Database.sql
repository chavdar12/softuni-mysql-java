CREATE TABLE `categories`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category` VARCHAR(50) NOT NULL,
    `daily_rate` DECIMAL(10, 2),
    `weekly_rate` DECIMAL(10, 2),
    `monthly_rate` DECIMAL(10, 2),
    `weekend_rate` DECIMAL(10, 2)
);

CREATE TABLE `cars`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `plate_number` VARCHAR(20) NOT NULL UNIQUE,
    `make` VARCHAR(50),
    `model` VARCHAR(50),
    `car_year` YEAR,
    `category_id` INT,
    `doors` INT,
    `picture` BLOB,
    `car_condition` VARCHAR(50),
    `available` BOOLEAN,
    CONSTRAINT `fk_cars_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
);

CREATE TABLE `employees`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `title` VARCHAR(50),
    `notes` TEXT
);

CREATE TABLE `customers`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `driver_licence_number` VARCHAR(20) NOT NULL UNIQUE,
    `full_name` VARCHAR(100) NOT NULL,
    `address` VARCHAR(100),
    `city` VARCHAR(50),
    `zip_code` VARCHAR(10),
    `notes` TEXT
);

CREATE TABLE `rental_orders`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `employee_id` INT NOT NULL,
    `customer_id` INT NOT NULL,
    `car_id` INT NOT NULL,
    `car_condition` VARCHAR(50),
    `tank_level` INT,
    `kilometrage_start` INT,
    `kilometrage_end` INT,
    `total_kilometrage` INT,
    `start_date` DATE,
    `end_date` DATE,
    `total_days` INT,
    `rate_applied` DECIMAL(10, 2),
    `tax_rate` DECIMAL(10, 2),
    `order_status` VARCHAR(20),
    `notes` TEXT,
    CONSTRAINT `fk_rental_orders_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
    CONSTRAINT `fk_rental_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
    CONSTRAINT `fk_rental_orders_cars` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`)
);

INSERT INTO `categories` (`category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`)
VALUES ('Economy', 30, 180, 600, 50),
('SUV', 60, 360, 1200, 100),
('Luxury', 120, 720, 2400, 200);

INSERT INTO `cars` (`plate_number`, `make`, `model`, `car_year`, `category_id`, `doors`, `car_condition`, `available`)
VALUES ('CA1234AB', 'Toyota', 'Yaris', 2019, 1, 4, 'Good', TRUE),
('PB5678CD', 'Volvo', 'XC90', 2021, 2, 4, 'Excellent', TRUE),
('B9012EF', 'Mercedes', 'S500', 2022, 3, 4, 'New', FALSE);

INSERT INTO `employees` (`first_name`, `last_name`, `title`)
VALUES ('Ivan', 'Ivanov', 'Manager'),
('Maria', 'Petrova', 'Agent'),
('Georgi', 'Georgiev', 'Agent');

INSERT INTO `customers` (`driver_licence_number`, `full_name`, `address`, `city`, `zip_code`)
VALUES ('DL001', 'Petar Petrov', '1 Vitosha Blvd', 'Sofia', '1000'),
('DL002', 'Elena Dimitrova', '5 Main St', 'Plovdiv', '4000'),
('DL003', 'Nikolay Nikolov', '10 Sea Garden', 'Varna', '9000');

INSERT INTO `rental_orders` (`employee_id`, `customer_id`, `car_id`, `start_date`, `end_date`, `total_days`)
VALUES (1, 1, 1, '2024-01-01', '2024-01-05', 4),
(2, 2, 2, '2024-02-01', '2024-02-08', 7),
(3, 3, 3, '2024-03-01', '2024-03-03', 2);
