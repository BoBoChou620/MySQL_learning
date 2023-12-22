ALTER TABLE addressbook
DROP PRIMARY KEY,
# 刪除主索引

DROP INDEX email,
DROP INDEX name,
DROP INDEX address
# 刪除一般索引

XX
DROP INDEX 'PRIMARY' ON addressbook
XX
DROP INDEX 'UNIQUE' ON addressbook


DROP INDEX email ON addressbook

DROP INDEX email_index ON addressbook




DROP INDEX name ON addressbook


DROP INDEX address ON addressbook
