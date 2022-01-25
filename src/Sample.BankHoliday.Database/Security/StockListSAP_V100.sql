CREATE SCHEMA [StockListSAP_V100]
    AUTHORIZATION [dbo];




GO
GRANT SELECT
    ON SCHEMA::[StockListSAP_V100] TO [TraditionalUser];


GO
GRANT SELECT
    ON SCHEMA::[StockListSAP_V100] TO [mi-rest-service];

