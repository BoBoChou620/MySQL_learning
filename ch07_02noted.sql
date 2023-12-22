※匯入整數 intergertable，整數型態有5種
INSERT INTO integertable VALUES (1, 2, 3, 4, 5)

介於-2^15 ~ 2^15-1
INSERT INTO integertable VALUES (1, 65536, 3, 4, 5)


INSERT INTO integertable VALUES (1.2, 2.3, 3.4, 4.5, 5.6)


INSERT INTO numerictable (i4, f2) VALUES (1, 1),(-1, -1)

※注意結構內的unsighed屬性，為非負的整數
INSERT INTO numerictable (i, f) VALUES (-1, -1)

一次輸入多筆資料與值，byte和bit的位元換算
INSERT INTO numerictable (i, i2, i3, i4, i5)
VALUES (1, 1, 1, 1, 1),
       (123, 123, 123, 123, 123),
       (123, 12345, 1234567, 1234567890, 1234567890123456789)


INSERT INTO numerictable (f, f2, f3)
VALUES (123.12, 123.12, 123.12),
       (123.123, 123.123, 123.123)


INSERT INTO numerictable (f, f2, f3) VALUES (0.1, 12345.12, 0.1)


INSERT INTO numerictable2 VALUES (1, 1, 1, 1, 1, 1.1, 1.1, 1.1)


INSERT INTO numerictable2 (i4) VALUES (123), (1234567)

※輸入的位元型態：

INSERT INTO bittable 
VALUES (1, 255, 65536),
       (b'1', b'11111111', b'1111111111111111')


INSERT INTO nonbinarytable 
VALUES ('', ''),('123', '123'),('1234567890', '1234567890')

字串長度
SELECT s, LENGTH(s), s2, LENGTH(s2), s3, LENGTH(s3) 
FROM   nonbinarytable2

字元長度
SELECT s,CHAR_LENGTH(s),s2,CHAR_LENGTH(s2),s3,CHAR_LENGTH(s3) 
FROM   nonbinarytable2

英文字母大小寫的排序
SELECT * FROM nonbinarytable3


SELECT   * 
FROM     nonbinarytable3
ORDER BY s

SELECT   * 
FROM     nonbinarytable3
ORDER BY s2


SELECT * 
FROM   nonbinarytable3 
WHERE  s = 'aaa'

嚴謹大小寫排序
SELECT * 
FROM   nonbinarytable3 
WHERE  s2 = 'aaa'


SELECT b, LENGTH(b), b2, LENGTH(b2)
FROM   binarytable

※enum值的用法，於資料結構將字元資料以數值資料存放
INSERT INTO enumtable 
VALUES ('XS', 'XS'),('S', 'S'),('M', 'M'),
       ('L', 'L'),('XL', 'XL');

可以在字串資料裡輸入"QQ"
INSERT INTO enumtable (stringsize) VALUES ('QQ');


INSERT INTO enumtable (enumsize) VALUES ('QQ')


INSERT INTO enumtable (enumsize)
VALUES ('XS'),('S'),('M'),('L'),('XL')
▲上下兩筆資料呈現結果相同，在c語言、c++、c#都有ENUM語法▼
INSERT INTO enumtable (enumsize)
VALUES (1),(2),(3),(4),(5)


SELECT   enumsize 
FROM     enumtable 
ORDER BY enumsize

以字母的大小排序
SELECT   stringsize 
FROM     enumtable 
ORDER BY stringsize


SELECT * FROM enumtable where enumsize = 'M'
▲上下兩筆資料呈現結果相同▼
SELECT * FROM enumtable where enumsize = 3


INSERT INTO settable
VALUES ('MON,WED,FRI'),
       ('TUE,THU'),
       ('SAT,SUN'),
       ('MON,TUE,WED,THU,FRI,SAT,SUN')


INSERT INTO settable VALUES ('MON,HELLO,FRI')


INSERT INTO settable VALUES (0),(1),(4),(16)


INSERT INTO settable VALUES (''),('MON'),('WED'),('FRI')


INSERT INTO settable VALUES ('MON,WED,FRI')


INSERT INTO settable VALUES (21)


INSERT INTO estable 
VALUES (1, 1, 21, 21),
       ('M','M','MON','MON'),
       ('m','M','mon','MON')


INSERT INTO estable (enumsize2, workingday2)
VALUES ('m','mon')

※存成以日期(date)計算計量格式的資料方式：
日期格式語法的分水嶺：二位數填入69以前會自動帶入例如西元2069、2040年
INSERT INTO dttable (d) VALUES ('9000-1-1')


INSERT INTO dttable (d) VALUES ('900-1-1')


INSERT INTO dttable (d) VALUES ('90-1-1')
若填入70以後會自動帶入19xx年

INSERT INTO dttable (d) VALUES ('9-1-1')


INSERT INTO dttable (d) VALUES ('2000-1-1')


INSERT INTO dttable (d) VALUES ('200-1-1')


INSERT INTO dttable (d) VALUES ('20-1-1')
會自動帶入成2020年

INSERT INTO dttable (d) VALUES ('2-1-1')

※存成以小時數(time)為單位的計量資料：
INSERT INTO dttable (t) VALUES ('200:30:00')


INSERT INTO dttable (t) VALUES ('-1:20:30')
可以存負值，閱讀成「往前推算一小時二十分三十秒」

INSERT INTO dttable (t) VALUES ('200:30:30')


INSERT INTO dttable (t) VALUES ('200:30')


INSERT INTO dttable (t) VALUES ('200')
若單純輸入200，系統判定會變變成分鐘

※正確的日期格式儲存資料結構類型為datetime 
INSERT INTO dttable (dt) 
VALUES ('2000-01-01 10:10:10')


INSERT INTO dttable (dt) 
VALUES ('2000-01-01     10:10:10')


INSERT INTO dttable (dt) 
VALUES ('2000-01-01')
系統會自動存成 2000-01-01 00:00:00

INSERT INTO dttable (dt) 
VALUES ('2000-01-01 200:00:00')
若同時儲存成不同的資料結構類型單位，前者為 datetime，後者為time，如此就會變成0000-00-00 00:00:00


INSERT INTO dttable (ts) VALUES ('1970-1-01 8:0:1')


INSERT INTO dttable (ts) VALUES ('1970-1-01 0:0:1')


SELECT @@GLOBAL.TIME_ZONE, @@SESSION.TIME_ZONE


SET SESSION TIME_ZONE = '+00:00'


SET GLOBAL TIME_ZONE = '+00:00'


SELECT @@GLOBAL.TIME_ZONE, @@SESSION.TIME_ZONE


INSERT INTO dttable (dt, ts)
VALUES ('2000-01-01 00:00:00', '2000-01-01 00:00:00')


SELECT dt,ts FROM dttable 


SET GLOBAL TIME_ZONE = '+08:00'


SELECT dt,ts FROM dttable
