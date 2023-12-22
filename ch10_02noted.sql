判斷因子可以是<、>、==

SELECT Name, GNP
FROM   countrydata
WHERE  GNP = ( SELECT MAX(GNP)
               FROM   countrydata )

二個欄位不能丟給單一個欄位做子查詢
→Operand should contain 1 column(s)
SELECT Name, GNP
FROM   countrydata
WHERE  GNP = ( SELECT Code, MAX(GNP)
               FROM   countrydata )

若改成一個欄位並做分群，得到的資訊為多筆資料的集合
→Subquery returns more than 1 row 就會沒有辦法做子查詢
SELECT Name, GNP
FROM   countrydata
WHERE  GNP = ( SELECT   MAX(GNP)
               FROM     countrydata
               GROUP BY Continent )


SELECT countrydataCode
FROM   worldcity
WHERE  Population > 9000000


SELECT Name
FROM   countrydata
WHERE  Code IN ('BRA','IDN','IND','JPN','GBR'
                'CHN')


SELECT Name
FROM   countrydata
WHERE  Code IN ( SELECT countrydataCode
                 FROM   city
                 WHERE  Population > 9000000 )


SELECT Name
FROM   countrydata
WHERE  Code = ( SELECT countrydataCode //等號為一個，不可以判斷多個數據
                FROM   worldcity
                WHERE  Population > 9000000 )

※老師更新之後的資料(2023/9/4/09:49am)
SELECT Name
FROM   countrydata
WHERE  Code IN ( SELECT countrydataCode
                 FROM   worldcity
                 WHERE  Population > 4000000 )

SELECT Name
FROM   countrydata
WHERE  Code = ( SELECT countrydataCode
                FROM   worldcity
                WHERE  Population > 4000000 )

SELECT Name
FROM   countrydata
WHERE  Code NOT IN ( SELECT countrydataCode
                     FROM   worldcity
                     WHERE  Population > 9000000 )
※自己改寫的資料
SELECT Name
FROM   countrydata
WHERE  Code IN ( SELECT countrydataCode 
                 FROM   worldcity
                 WHERE  Population > 6000000 )

→ 無法利用"="來做多對一的資料比對子查詢，就必須用in/not in語法

SELECT Name
FROM   countrydata
WHERE  Code NOT IN ( SELECT countrydataCode // NOT IN就為多筆資料的子查詢，找出「多筆不是」的資料
                     FROM   worldcity
                     WHERE  Population > 9000000 )

※請先匯入分享區的outertable.sql、innertable.sql檔才能繼續作業！

SELECT * FROM outertable

SELECT * FROM innertable


SELECT * 
FROM   outertable
WHERE  n > ALL ( SELECT n
                 FROM   innertable )

SELECT * 
FROM   outertable
WHERE  n <> ALL ( SELECT n
                  FROM   innertable )

SELECT * 
FROM   outertable
WHERE  n NOT IN ( SELECT n
                  FROM   innertable )


SELECT * 
FROM   outertable
WHERE  n = ANY ( SELECT n
                 FROM   innertable )


SELECT * 
FROM   outertable
WHERE  n IN ( SELECT n
              FROM   innertable )


SELECT Name, GNP
FROM   countrydata
WHERE  Continent = 'Asia' AND GovernmentForm = 'Republic'


SELECT Name, GNP
FROM   countrydata
WHERE  ( Continent, GovernmentForm ) = ( 'Asia', 'Republic' )


SELECT Name
FROM   countrydata
WHERE  Region = ( SELECT Region
                  FROM   countrydata
                  WHERE  Name = 'Iraq' )
       AND
       GovernmentForm = ( SELECT GovernmentForm
                          FROM   countrydata
                          WHERE  Name = 'Iraq' )


SELECT Name
FROM   countrydata
WHERE  (Region, GovernmentForm) = ( SELECT Region, GovernmentForm
                                    FROM   countrydata
                                    WHERE  Name = 'Iraq' )


SELECT   Continent, MAX(GNP)
FROM     countrydata
GROUP BY Continent


SELECT Continent, Name, GNP
FROM   countrydata
WHERE  (Continent, GNP) IN ( SELECT   Continent, MAX(GNP)
                             FROM     countrydata
                             GROUP BY Continent )
