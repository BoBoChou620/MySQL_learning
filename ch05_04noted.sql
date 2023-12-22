※刪除原資料庫的語法
DELETE FROM testdb.empdata

※指定條件刪除
DELETE FROM  testdb.empdata
WHERE  salary < 1500

DELETE FROM testdb.empdata
ORDER BY salary


DELETE FROM testdb.empdata
LIMIT    3

※預設升冪排序後刪除特定筆數資料
DELETE FROM testdb.empdata
ORDER BY salary
LIMIT    3

降冪+指定特定比數資料
DELETE FROM testdb.empdata
ORDER BY salary DESC
LIMIT    3


DELETE FROM testdb.empdata
TRUNCATE的概念如「重置表格」，若有遞增/減欄位的話相較於DELETE會把整個資料基數重頭來過
TRUNCATE TABLE testdb.empdata
