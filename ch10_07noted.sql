SELECT Name
FROM   worldcity
WHERE  ID IN ( SELECT Capital 
               FROM   countrydata
               WHERE  Capital IS NOT NULL )
▲上下兩個語法運算結果相同，那就用下方的(多表格查詢)即可▼
SELECT worldcity.Name //指定欄位名稱
FROM   worldcity, countrydata
WHERE  ID = Capital

※子查詢中的條件式判斷
SELECT Name
FROM   worldcity
WHERE  ID NOT IN ( SELECT Capital 
                   FROM   countrydata
                   WHERE  Capital IS NOT NULL )

※多表格查詢的左結合資料判斷
SELECT worldcity.Name, countrydata.Capital
FROM   worldcity LEFT JOIN countrydata ON worldcity.ID = countrydata.Capital


SELECT worldcity.Name
FROM   worldcity LEFT JOIN countrydata ON worldcity.ID = countrydata.Capital
WHERE  countrydata.Capital IS NULL //有條件判斷的左結合資料查詢
