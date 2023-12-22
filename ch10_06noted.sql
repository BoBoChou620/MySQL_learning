
分群又欄位正確
SELECT Continent, Name, GNP
FROM   countrydata
WHERE  (Continent, GNP) IN ( SELECT   Continent, MAX(GNP)
                             FROM     countrydata
                             GROUP BY Continent )  //州別直接在群內做最大值的欄位資料比對
▲上下兩筆資料運算結果相同，(建議只要記得上面即可)▼
SELECT Continent, Name, GNP
FROM   countrydata oc
WHERE  GNP = ( SELECT MAX(GNP)
               FROM   countrydata
               WHERE  Continent = oc.Continent )

※EXISTS 語法： 找出存在選取條件判斷式的資料表中的資料

SELECT Name
FROM   countrydata c
WHERE  EXISTS ( SELECT *
                FROM   worldcity
                WHERE  countrydataCode = c.Code AND
                       Population > 8000000 )

找出不存在符合條件判斷的資料表中的資料
(白話：那就直接找符合相反條件的資料即可)
SELECT Name
FROM   countrydata c
WHERE  NOT EXISTS ( SELECT *
                    FROM   worldcity
                    WHERE  CountrydataCode = c.Code AND
                           Population > 8000000 )
