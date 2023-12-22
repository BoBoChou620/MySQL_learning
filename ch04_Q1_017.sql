(1)countrydata 與 worldcity 的資料表中，如果都有相同的欄位名稱，
   ，如(name)欄位;在使用多表格查詢時，該如何下語法，請從以下選出正確的語法。
    A.
        SELECT countrydata.name, countrydata.Population coPop,
        worldcity.Name, worldcity.Population ciPop,
        worldcity.Population / countrydata.Population * 100 Scale
	FROM   countrydata, worldcity
	WHERE  Capital = ID

    B.  SELECT name, countrydata.Population coPop,
        worldcity.Population ciPop,
        worldcity.Population / countrydata.Population * 100 Scale
	FROM   countrydata, worldcity
	WHERE  Capital = ID

    C.  SELECT name
	FROM   countrydata, worldcity
	WHERE  Capital = ID

    D.  SELECT name country , name city
	FROM   countrydata, worldcity
	WHERE  Capital = ID

答案：B.  SELECT name, countrydata.Population coPop,
        worldcity.Population ciPop,
        worldcity.Population / countrydata.Population * 100 Scale
	FROM   countrydata, worldcity
	WHERE  Capital = ID
	
	並且答案B可以再次簡化為下面縮寫：
	
	SELECT name, a.Population coPop,
           b.Population ciPop,
           b.Population / a.Population * 100 
	FROM   countrydata a , worldcity b
	WHERE  Capital = ID


(2) 試問下列語法 
    
	SELECT Capital 
	FROM countrydata , worldcity 
	WHERE Capital = ID
    
	請從以下的選擇選出相同的輸出結果。 INNER JOIN 內結合
	
    A.SELECT Capital FROM countrydata INNER JOIN worldcity (沒有指定)
    B.SELECT Capital FROM countrydata INNER JOIN worldcity ON Capital = ID
    C.SELECT Capital FROM countrydata INNER JOIN worldcity USING (ID) 指定ID為新的一欄
    D.SELECT Capital FROM countrydata INNER worldcity ON Capital = ID (沒有JOIN)
	

答案: B.SELECT Capital 
		FROM countrydata INNER JOIN worldcity 
		ON Capital = ID


(3) SELECT Capital FROM countrydata INNER JOIN worldcity  USING (ID)
    試問從語法執行結果為何
    A.無法執行
    B.秀出countrydata的Capital欄位
    C.秀出worldcity的Capital欄位
    D.秀出worldcity的ID欄位
	
答案：B. Capital欄位會以(ID)欄呈現

(4) SELECT countrydata.code,worldcity.Name FROM countrydata, worldcity
    試問從語法執行結果為何
    A.無法執行
    B.只秀出其worldcity裡的資料
    C.秀出其countrydata.code資料數量並乘上worldcity.Name的資料數量
    D.只秀出其countrydata裡的資料
	
答案：D. 只會顯示countrydata.code,worldcity.Name的資料


(5) 試問下列語法何選項是可以正常執行
    A.都無法執行
    B.SELECT Name From countrydata UNION SELECT Region,Name FROM countrydata
    C.SELECT Name,Region From countrydata UNION SELECT Region,Name FROM countrydata
    D.SELECT Region From countrydata UNION SELECT Region,Name FROM countrydata

答案：C. 只要欄位數量相對應即可運算函式 


實作題:

(1)請查詢testdb裡的empdata及deptdata二表格中的員工編號、員工名稱、部門編號、部門名稱。

答案：

SELECT empno, ename, e.deptno, d.dname
FROM   testdb.empdata e, testdb.dept d
WHERE  e.deptno = d.deptno

(2)請查詢global裡的worldcity資料表。請查詢出歐洲及亞洲國家最多及最少的人口數。

答案：

SELECT country, continent, MAX(population) MaxPop
FROM worldcity
WHERE continent = 'Europe' OR continent = 'Asia'
GROUP BY country, continent
ORDER BY max_population DESC
LIMIT 1;

(3)請查詢testdb裡的empdata及deptdata二表格中的員工編號、員工名稱、部門編號、部門名稱。
   並包含NULL的資料

