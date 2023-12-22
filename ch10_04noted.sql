※暫時重新命名的欄位來顯示前10筆資料來做GNP資料的排序
SELECT   Name, GNP
FROM     ( SELECT *
           FROM   countrydata
           WHERE  Continent = 'Asia' ) asiacountrydata
ORDER BY GNP DESC
LIMIT    10

※子查詢資料裡的運算並且再把運算結果依照條件暫存
SELECT Name, Language, Population * Percentage
FROM   countrydata, ( SELECT countrydataCode, Language, Percentage
                  FROM   countrydatalanguage
                  WHERE  IsOfficial = 'T' ) officiallanguage
WHERE  Code = countrydataCode
