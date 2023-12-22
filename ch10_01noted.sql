SELECT Population
FROM   countrydata
WHERE  Code = 'USA'


SELECT Code, Population
FROM   countrydata
WHERE  Population > 278357000


SELECT Code, Population
FROM   countrydata
WHERE  Population > ( SELECT Population
                      FROM   countrydata
                      WHERE  Code = 'USA' )
