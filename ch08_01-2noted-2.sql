CREATE TABLE city (
  ID int(11) NOT NULL auto_increment,
  Name char(35) NOT NULL default '',
  CountryCode char(3) NOT NULL default '',
  District char(20) NOT NULL default '',
  Population int(11) NOT NULL default '0',
  PRIMARY KEY  (ID)
) AUTO_INCREMENT=4080 DEFAULT CHARSET=latin1


CREATE TABLE addressbook (
  name      VARCHAR(20),
  tel       VARCHAR(20),
  address   VARCHAR(80),
  birthdate DATE
)


CREATE TABLE addressbook2 (
  name      VARCHAR(20),
  tel       VARCHAR(20),
  address   VARCHAR(80),
  birthdate DATE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci


SHOW ENGINES


CREATE TABLE addressbook3 (
  name      VARCHAR(20) CHARACTER SET big5, //設定字元集
  tel       VARCHAR(20),
  address   VARCHAR(80),
  birthdate DATE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci


CREATE TABLE addressbook (
  name      VARCHAR(20) NOT NULL,
  tel       VARCHAR(20) NULL,
  address   VARCHAR(80),
  birthdate DATE
)


INSERT INTO addressbook (name) VALUES ('Simon Johnson')
INSERT INTO addressbook (name) VALUES (null)

INSERT INTO addressbook (address) VALUES ('Taipei')
INSERT INTO addressbook (address) VALUES ('Taipei')


CREATE TABLE addressbook (
  name      VARCHAR(20) NOT NULL,
  tel       VARCHAR(20) NULL,
  address   VARCHAR(80),
  birthdate DATE
)


CREATE TABLE addressbook6 (
  name      VARCHAR(20) NOT NULL,
  tel       VARCHAR(20) DEFAULT NULL,//DEFAUT NULL可以省略
  address   VARCHAR(80) DEFAULT NULL,//DEFAUT NULL可以省略
  birthdate DATE DEFAULT NULL
)


INSERT INTO addressbook5 (name) VALUES ('Simon Johnson')
INSERT INTO addressbook5 (name) VALUES ('Simon Johnson1')
INSERT INTO addressbook5 (name) VALUES ('Simon Johnson2')

CREATE TABLE addressbook (
  name      VARCHAR(20) NOT NULL,
  tel       VARCHAR(20),
  address   VARCHAR(80) DEFAULT 'Buenos Aires',
  birthdate DATE
)


INSERT INTO addressbook5 (name,address) VALUES ('Simon Johnson','Tainan')
INSERT INTO addressbook5 (name,address) VALUES ('Simon Johnson1','Taichung')
INSERT INTO addressbook5 (name) VALUES ('Simon Johnson2')

※將addressbook5的 address 欄位權更改為預設
UPDATE addressbook5 SET address = DEFAULT'Buenos Aires'


沒有Key Primery主索引所以搜尋起來會很麻煩
CREATE TABLE tstable (
  ts TIMESTAMP,
  ts2 TIMESTAMP,
  area VARCHAR(20) NOT NULL,
  temp INT NOT NULL
)

建立預設為隨時可以更新
CREATE TABLE tstable (
  ts timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  ts2 timestamp NOT NULL default '0000-00-00 00:00:00',
  area varchar(20) NOT NULL,
  temp int(11) NOT NULL
)


INSERT INTO tstable (area, temp) VALUES ('NORTH', 25)


INSERT INTO tstable (area, temp) VALUES ('CENTRAL', 28)


INSERT INTO tstable (area, temp) VALUES ('SOUTH', 30)


UPDATE tstable SET temp = 32 WHERE area = 'South'


CREATE TABLE tstable3 (
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  area VARCHAR(20) NOT NULL,
  temp INT NOT NULL
)


CREATE TABLE tstable3 (
  created TIMESTAMP DEFAULT 0,
  updated TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  area VARCHAR(20) NOT NULL,
  temp INT NOT NULL
)


INSERT INTO tstable2 (created, area, temp) VALUES (NULL, 'NORTH', 25)


INSERT INTO tstable2 (created, area, temp) VALUES (NULL, 'CENTRAL', 28)


INSERT INTO tstable2 (created, area, temp) VALUES (NULL, 'SOUTH', 30)


UPDATE tstable2 SET temp = 32 WHERE area = 'South'


SELECT Name, Population
FROM   global.worldcity
WHERE  CountryDataCode='AFG'


CREATE TABLE CountryDataCodeofAFG
SELECT Name, Population
FROM   global.worldcity
WHERE  CountryDataCode='AFG'


CREATE TABLE cityoftaiwan2 (
  Name VARCHAR(30),
  Population INT UNSIGNED)
SELECT Name, Population
FROM   global.worldcity
WHERE  CountryDataCode='TWN'


CREATE TABLE cityoftaiwan3 (
  Name VARCHAR(30),
  Population INT UNSIGNED,
  Description VARCHAR(50))
SELECT Name, Population
FROM   global.worldcity
WHERE  CountryDataCode='AFG'


CREATE TABLE cityoftaiwan5 (
  Description VARCHAR(50))
SELECT city.Name, city.Population,Region
FROM   global.worldcity,global.countrydata
WHERE  CountryDataCode=Code
