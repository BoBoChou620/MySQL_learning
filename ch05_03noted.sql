※對於原始資料庫的修改更新
UPDATE testdb.empdata
SET    salary = salary + 100
》影響了 12 列，會動到原始資料庫。

※指定條件式的的資料更新修改
UPDATE testdb.empdata
SET    salary = salary + 100
WHERE  salary < 1500

※指定更新資料
UPDATE testdb.deptdata
SET    deptdatano = 50
WHERE  deptdatano = 30

運用IGNORE來保持運算式不中斷
UPDATE IGNORE testdb.deptdata
SET    deptdatano = 50
WHERE  deptdatano = 30


UPDATE testdb.empdata
SET    salary = 'HELLO', comm = 1000
WHERE  empno = 7369
▲上下運算式結果相同，有無IGNORE1並不影響結果▼
salary = 'HELLO' salary欄原為float值，字串在float為0。故comm欄更新，salary欄取代為0.00
UPDATE IGNORE testdb.empdata
SET    salary = 'HELLO', comm = 1000
WHERE  empno = 7369

UPDATE   testdb.empdata
SET      salary = salary + 100
ORDER BY salary 排序


UPDATE   testdb.empdata
SET      salary = salary + 100
LIMIT    3 
僅修改前三筆資料


UPDATE   testdb.empdata
SET      salary = salary + 100
ORDER BY salary
LIMIT    3
僅修改排序後的前三筆資料。但這邊的限制三筆資料為隨機，需注意資料完整度原始資料狀態

UPDATE   testdb.empdata
SET      salary = salary + 100
ORDER BY salary DESC
LIMIT    3;
SELECT * FROM testdb.empdata
LIMIT    5