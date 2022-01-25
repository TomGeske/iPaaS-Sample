CREATE SCHEMA [BankHoliday_V100]
    AUTHORIZATION [dbo];










GO
GRANT UPDATE
    ON SCHEMA::[BankHoliday_V100] TO [TraditionalUser];


GO
GRANT UPDATE
    ON SCHEMA::[BankHoliday_V100] TO [mi-rest-service];


GO
GRANT SELECT
    ON SCHEMA::[BankHoliday_V100] TO [TraditionalUser];


GO
GRANT SELECT
    ON SCHEMA::[BankHoliday_V100] TO [mi-rest-service];


GO
GRANT INSERT
    ON SCHEMA::[BankHoliday_V100] TO [TraditionalUser];


GO
GRANT INSERT
    ON SCHEMA::[BankHoliday_V100] TO [mi-rest-service];


GO
GRANT DELETE
    ON SCHEMA::[BankHoliday_V100] TO [TraditionalUser];


GO
GRANT DELETE
    ON SCHEMA::[BankHoliday_V100] TO [mi-rest-service];

