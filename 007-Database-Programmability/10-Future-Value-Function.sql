-- database: bank
CREATE FUNCTION `ufn_calculate_future_value`(
    `sum` DECIMAL(20, 4), `yearly_interest_rate` DECIMAL(20, 4),
    `number_of_years` INT
)
RETURNS DECIMAL(20, 4)
DETERMINISTIC
BEGIN
    RETURN `sum` * pow(1 + `yearly_interest_rate`, `number_of_years`);
END;

SELECT `ufn_calculate_future_value`(1000, 0.5, 5);
