SHOW TABLES FROM global


SHOW TABLES FROM global LIKE '%y'


SELECT TABLE_SCHEMA, TABLE_NAME, ENGINE, TABLE_ROWS,
       AUTO_INCREMENT,TABLE_COLLATION
FROM   information_schema.TABLES
WHERE  TABLE_SCHEMA = 'global'


DESCRIBE global.countrydata

容易跟降冪排序搞混，差別在於放在描述的前後。
DESC global.countrydata


SHOW COLUMNS FROM global.countrydata


SHOW FIELDS FROM global.countrydata


SHOW CREATE TABLE global.countrydata
