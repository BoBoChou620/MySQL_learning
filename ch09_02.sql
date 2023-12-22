CREATE TABLE addressbook10 (
  id        INT UNSIGNED PRIMARY KEY,
  name      VARCHAR(20),
  tel       VARCHAR(20),
  address   VARCHAR(80),
  birthdate DATE,
  email     VARCHAR(36) UNIQUE KEY
)
# UNIQUE KEY:唯一索引，非主索引
# 上下兩個結果相同
CREATE TABLE addressbook11 (
  id        INT UNSIGNED,
  name      VARCHAR(20),
  tel       VARCHAR(20),
  address   VARCHAR(80),
  birthdate DATE,
  email     VARCHAR(36),
  PRIMARY KEY (id),
  UNIQUE KEY (email)
)


CREATE TABLE addressbook12 (
  id        INT UNSIGNED,
  name      VARCHAR(20),
  tel       VARCHAR(20),
  address   VARCHAR(80),
  birthdate DATE,
  email     VARCHAR(36),
  PRIMARY KEY (id),
  UNIQUE KEY (email),
  INDEX (name, tel)
)
# INDEX:一般索引

CREATE TABLE addressbook13 (
  id        INT UNSIGNED,
  name      VARCHAR(20),
  tel       VARCHAR(20),
  address   VARCHAR(80),
  birthdate DATE,
  email     VARCHAR(36),
  INDEX (address (5) DESC)
)
# 索引做排序

CREATE TABLE addressbook14 (
  id        INT UNSIGNED,
  name      VARCHAR(20),
  tel       VARCHAR(20),
  address   VARCHAR(80),
  birthdate DATE,
  email     VARCHAR(36)
)


ALTER TABLE addressbook14
ADD PRIMARY KEY (id)
# 修改資料表 增加主索引(id)欄位

ALTER TABLE addressbook14
ADD UNIQUE KEY (email)
# 增加唯一索引

ALTER TABLE addressbook14
ADD INDEX (name, tel)
# 增加一般索引

ALTER TABLE addressbook
ADD INDEX (address (5) DESC)


CREATE TABLE addressbook15 (
  id        INT UNSIGNED,
  name      VARCHAR(20),
  tel       VARCHAR(20),
  address   VARCHAR(80),
  birthdate DATE,
  email     VARCHAR(36)
)


ALTER TABLE addressbook15
ADD PRIMARY KEY (id)
# 設定主索引鍵

CREATE UNIQUE INDEX email_index # 設定INDEX的名稱
ON addressbook15 (email)


CREATE INDEX name_tel_index
ON addressbook15 (name, tel)


CREATE INDEX address_index
ON addressbook15 (address (5) DESC)
# CREATE才可以自己建立索引名稱

ALTER TABLE addressbook15 ADD PRIMARY KEY (id)
# 但PRIMARY KEY不能自己設定名稱，也不能用CREATE只能用ALTER


CREATE UNIQUE INDEX email_index ON addressbook15 (email)
