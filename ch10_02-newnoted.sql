SELECT Name, GNP
FROM   countrydata
WHERE  GNP = ( SELECT MAX(GNP)
               FROM   countrydata )


SELECT Name, GNP
FROM   countrydata
WHERE  GNP = ( SELECT Code, MAX(GNP)
               FROM   countrydata )


SELECT Name, GNP
FROM   countrydata
WHERE  GNP = ( SELECT   MAX(GNP)
               FROM     countrydata
               GROUP BY Continent )


SELECT countrydataCode
FROM   worldcity
WHERE  Population > 4000000


SELECT Name
FROM   countrydata
WHERE  Code IN ('BRA','IDN','IND','JPN','GBR'
                'CHN')


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


SELECT * FROM outertable


SELECT * FROM innertable


SELECT * 
FROM   outertable
WHERE  n > ALL ( SELECT age
                 FROM   innertable )
透過所有innertable的城市去搜outertable
SELECT * 
FROM   outertable
WHERE  n <> ALL ( SELECT n           //<>就是不等於
                  FROM   innertable )
▲上下兩種語法的資料查詢結果相同▼
SELECT * 
FROM   outertable
WHERE  n NOT IN ( SELECT n           //
                  FROM   innertable )


SELECT * 
FROM   outertable
WHERE  n = ANY ( SELECT n           //任何一筆資料即可滿足
                 FROM   innertable )
▲上下兩種語法的資料查詢結果相同▼
SELECT * 
FROM   outertable
WHERE  n IN ( SELECT n             
              FROM   innertable )

程式語言的最基礎寫法：
SELECT Name, GNP
FROM   countrydata
WHERE  Continent = 'Asia' AND GovernmentForm = 'Republic'

多條件的多筆資料欄位如果相等的話就可以像以下這樣寫
SELECT Name, GNP
FROM   countrydata
WHERE  ( Continent, GovernmentForm ) = ( 'Asia', 'Republic' )

兩個條件判斷式子查詢的標準寫法：
SELECT Name
FROM   countrydata
WHERE  Region = ( SELECT Region         //丟給Region
                  FROM   countrydata
                  WHERE  Name = 'Iraq' )
       AND
       GovernmentForm = ( SELECT GovernmentForm
                          FROM   countrydata
                          WHERE  Name = 'Iraq' )

判斷的條件一樣、資料表的欄位一樣→子查詢的延伸：簡化寫法

SELECT Name
FROM   countrydata
WHERE  (Region, GovernmentForm) = ( SELECT Region, GovernmentForm
                                    FROM   countrydata
                                    WHERE  Name = 'Iraq' )

有多個國家的的最大值的多筆資料查詢
SELECT   Continent, MAX(GNP)
FROM     countrydata
GROUP BY Continent

撈出州別、國家名稱、GNP的資料的多欄位
來與州別裏頭的州名及最大值交互作多筆資料的查詢

SELECT Continent, Name, GNP
FROM   countrydata
WHERE  (Continent, GNP) IN ( SELECT   Continent, MAX(GNP)
                             FROM     countrydata
                             GROUP BY Continent )
