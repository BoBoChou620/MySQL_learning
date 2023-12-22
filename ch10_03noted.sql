※CONCAT語法用於在搜尋資料時的資料表串接
SELECT CONCAT('The GNP of Spain is ', GNP)
FROM   countrydata
WHERE  Name = 'Spain'

子查詢的串接資料可以再往下做SELECT查詢
SELECT CONCAT('The GNP of Spain is ',
       ( SELECT GNP FROM countrydata WHERE  Name = 'Spain' ) )

子查詢的串接資料：SELECT查詢的資料來做相除
意思為→西班牙總人口數值占全球的總人口數比例為多少
SELECT ( SELECT Population FROM countrydata WHERE Name = 'Spain' ) /
       ( SELECT SUM(Population) FROM countrydata )
