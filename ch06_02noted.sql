※顯示指定資料庫儲存路徑
SHOW VARIABLES LIKE 'datadir'

※創建資料庫
CREATE DATABASE testdb

IF NO EXISTS如果不存在就創建(防止運算中止)
CREATE DATABASE IF NOT EXISTS testdb


CREATE DATABASE testdb01 CHARACTER SET utf8 COLLATE utf8_unicode_ci


CREATE DATABASE testdb02 CHARACTER SET utf8


CREATE DATABASE testdb03 COLLATE utf8_unicode_ci

※修改既有資料庫連線校對的語法及文字編碼方式：
ALTER DATABASE testdb02 CHARACTER SET utf8 COLLATE utf8_unicode_ci


ALTER DATABASE testdb02 CHARACTER SET utf8 


ALTER DATABASE testdb02 COLLATE utf8_unicode_ci

※刪除現有的數據庫
DROP DATABASE something


DROP DATABASE IF EXISTS something


SHOW DATABASES


SHOW SCHEMAS


SHOW CREATE DATABASE testdb

※查詢欄位型態(用以Debug全覽所有value是否符合欄位名稱及狀態)：
SELECT * FROM information_schema.SCHEMATA
