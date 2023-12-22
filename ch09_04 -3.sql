CREATE TABLE meeting (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(36),
  PRIMARY KEY (id)
)


CREATE TABLE participate (
  id INT UNSIGNED NOT NULL,
  empno INT(11),
  INDEX (id)
)


INSERT INTO meeting (title) VALUES ('Sales meeting');
INSERT INTO meeting (title) VALUES ('Sales meeting2');
INSERT INTO meeting (title) VALUES ('Sales meeting3')


CREATE TABLE participate2 (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(36),
  PRIMARY KEY (id)
)
# AUTO_INCREMENT:自動遞增

INSERT INTO participate2 (id, title)
VALUES (LAST_INSERT_ID(), 7499),
       (LAST_INSERT_ID(), 7521),
       (LAST_INSERT_ID(), 7654),
       (LAST_INSERT_ID(), 7844)
# LAST_INSERT_ID():獲取最後插入的自動遞增列的值，再新增插入生成的自動增量值
# 因為ID自動遞增所以可以免填內容


-->****************
INSERT INTO participate (id, empno)
VALUES (LAST_INSERT_ID(), 7499),
       (LAST_INSERT_ID(), 7521),
       (LAST_INSERT_ID(), 7654),
       (LAST_INSERT_ID(), 7844)

-->****************
CREATE TABLE participate3 (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  empno VARCHAR(36),
  PRIMARY KEY (id)
)


-->****************
INSERT INTO participate3 (id, empno)
VALUES (LAST_INSERT_ID(), 7499),
       (LAST_INSERT_ID(), 7521),
       (LAST_INSERT_ID(), 7654),
       (LAST_INSERT_ID(), 7844)


-->****************
SELECT m.id, m.title, p.empno, e.ename
FROM   meeting m, participate3 p, empdata e
WHERE  m.id = p.id AND p.empno = e.empno
-->****************

SELECT m.id, m.title, p.empno, e.ename
FROM   meeting m, participate p, empdata e
WHERE  m.id = p.id AND p.empno = e.empno


INSERT INTO meeting (title)
VALUES ('Analyst meeting')


INSERT INTO meeting (id, title)
VALUES (0, 'Manager  meeting')


INSERT INTO meeting (id, title)
VALUES (NULL, 'Clerk meeting')


SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO'


CREATE TABLE travelautoincr (
  empno INT(11) NOT NULL,
  location VARCHAR(16) NOT NULL,
  counter SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (empno, location, counter)
) ENGINE=MyISAM


INSERT INTO travelautoincr (empno, location)
VALUES  (7566, 'DALLAS');
