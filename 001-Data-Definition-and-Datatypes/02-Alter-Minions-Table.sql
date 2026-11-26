-- database: minions (judge pre-creates towns with an `id` column)
ALTER TABLE `minions`
    ADD COLUMN `town_id` INT,
    ADD CONSTRAINT `fk_minions_towns`
    FOREIGN KEY (`town_id`)
    REFERENCES `towns` (`id`);
