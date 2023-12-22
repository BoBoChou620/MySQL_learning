ALTER TABLE addressbook5 ADD newcolumn int


ALTER TABLE addressbook5 ADD newcolumn2 int FIRST


ALTER TABLE addressbook5 ADD newcolumn3 int AFTER address


ALTER TABLE addressbook5 
ADD (newcolumn4 int, newcolumn5 int)

※自行定義修改地的
ALTER TABLE addressbook5 
CHANGE newcolumn4 sex BIGINT AFTER adress


ALTER TABLE addressbook5 
MODIFY one BIGINT AFTER three

移除欄位
ALTER TABLE addressbook5 DROP two

重新命名欄位
ALTER TABLE addressbook5 RENAME mynewtable


RENAME TABLE addressbook5 TO mynewtable
