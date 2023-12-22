建立一個空的資料表CREATE TABLE 語法並給予欄位預設值及資料類型

CREATE TABLE mycountry2 (
  Code char(3) NOT NULL DEFAULT '',
  Name char(52) NOT NULL DEFAULT '',
  Continent enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  Region char(26) NOT NULL DEFAULT '',
  Population int(11) NOT NULL DEFAULT '0',
  GNP float(10,2) DEFAULT NULL,
  PRIMARY KEY (Code)
)

插入既有資料表的子查詢自動產生的資料
(請注意！欄位個數要匹配，資料表要插對，總表資料搜尋要預設正確匹配)

INSERT INTO mycountry
( SELECT Code, Name, Continent, Region, Population, GNP
  FROM countrydata
  WHERE Continent = 'Asia' )


INSERT INTO mycountry
( SELECT *
  FROM countrydata
  WHERE Continent = 'Africa' )

找出子查詢資料後更新現有資料表(不會有人這樣做)
UPDATE testdb.empdata
SET    salary = salary * 1.05        //薪水加薪5%
WHERE  deptno = ( SELECT deptno      //找出他的部門編號
                  FROM   testdb.deptdata
                  WHERE  dname = 'RD' )

※既讀取搜尋資料表又要更改原有的資料(不會有人這樣做)
→明明就在同一個資料表就不會用子查詢再更新，應該另存新檔
UPDATE testdb.empdata
SET    salary = salary * 1.05
WHERE  job = ( SELECT job
               FROM   testdb.deptdata
               WHERE  ename = 'BLAKE' )


