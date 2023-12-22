※DESC為描述，統計學當中的敘述性統計概念(python也有)

DESC testdb.deptdata

DESC testdb.empdata

※INSERT INTO插入新資料 VALUE 值/ key PRIMARY 為主索引資料，是唯一金鑰的存在。
INSERT INTO testdb.deptdata VALUES (60, 'EDU', 'NEW YORK')
▼概念：查詢資料庫觀察描述後，運用INSERT INTO運算式插入新值

INSERT INTO testdb.deptdata
VALUES (70, 'MARKETING', DEFAULT)
→DEFAULT為預設

INSERT INTO testdb.deptdata
VALUES (80, 'PURCHASING')

直接觀察對應欄位後插入：
INSERT INTO testdb.deptdata
VALUES ('PURCHASING', 80, 'NEW YORK')

對應欄位數正確，但是對應的值不對，還是插入得進去
INSERT INTO testdb.deptdata (dname, deptno, location)
VALUES ('PURCHASING', 80, 'NEW YORK')

3插入2欄資料，就會呈現錯誤的情況：
INSERT INTO testdb.deptdata (deptno, dname, location)
VALUES (90, 'SHIPPING')
就會顯示#1136 - Column count doesn't match value count at row 1
→意思為會空出一欄沒有值可填入

INSERT  INTO testdb.deptdata
VALUES (90, 'SHIPPING', DEFAULT)
預設 DEFAULT 欄為NULL 則會顯示為截圖5-2-1

INSERT INTO testdb.deptdata (deptno, dname)
VALUES (90, 'SHIPPING')
→因為重複deptno 的"key PRIMARY"所以無法插入資料。

INSERT INTO testdb.deptdata (deptno, location)
VALUES (180, 'NEW YORK')
→  Warning: #1364 Field 'dname' doesn't have a default value

INSERT INTO testdb.deptdata () VALUES ()
可以，但因為資料庫裏頭本來就有no.0 所以需要編輯不重覆資料
▼但會顯示以下資料
Field 'deptno' doesn't have a default value
Field 'dname' doesn't have a default value

INSERT INTO testdb.deptdata (deptno, dname)
VALUES (90, 'SHIPPING')

※SET 語法比較少見，但就是一個蘿蔔一個坑的語法
INSERT INTO testdb.deptdata 
SET deptdatano = 90, dname = 'SHIPPING'

幾欄資料就對應幾欄，
INSERT INTO testdb.empdata VALUES 
(8001, 'SIMON', 'MANAGER', 7369, '2001-02-03', 3300, NULL, 50),
(8002, 'JOHN', 'PROGRAMMER', 8001, '2002-01-01', 2300, NULL, 50),
(8003, 'GREEN', 'ENGINEER', 8001, '2003-05-01', 2000, NULL, 50)


INSERT INTO testdb.deptdata
VALUES (50, 'MIS', DEFAULT);
→資料重複執行中斷Duplicate entry '50' for key 'PRIMARY'

※IGNORE忽略重複項目，保持運算式持續運作的概念
INSERT IGNORE INTO testdb.deptdata
VALUES (50, 'MIS', DEFAULT);
→ 重複但忽略不中斷，成功，新增了 0 列

INSERT IGNORE INTO testdb.deptdata
VALUES (500, 'MIS', DEFAULT);
→ 不重複運算不中斷，成功，新增了 1列

SELECT *
FROM   testdb.traveldata
WHERE  empno = 7900 AND 
       location = 'BOSTON'
先查詢結果顯示並無此筆資料

INSERT INTO testdb.traveldata
VALUES (7900, 'BOSTON', 1);
因此新增一筆資料

※今天如果要更新出差次數：
UPDATE testdb.traveldata
SET    counter = counter + 1 (X=X+1、X++的概念)
WHERE  empno = 7900 AND 
       location = 'BOSTON'

※根據Key PRIMARY資料並且在後方counter欄新增一筆計數
INSERT INTO testdb.traveldata
VALUES (7900, 'BOSTON', 1)
ON DUPLICATE KEY UPDATE counter = counter + 1


INSERT INTO testdb.deptdata
VALUES (50, 'MIS', DEFAULT)


INSERT IGNORE INTO testdb.deptdata
VALUES (50, 'MIS', DEFAULT)

※取代並覆蓋的概念：
REPLACE INTO testdb.deptdata
VALUES (50, 'MIS', DEFAULT)
