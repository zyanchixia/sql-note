--SQL分为 数据操作语言DML和数据定义语言DDL
/*
DDL部分使我们有能力创建或删除表格，也可以定义索引（键），规定表之间的链接及施加表间的约束
CREATE DATABASE - 创建新数据库
ALTER DATABASE - 修改数据库
CREATE TABLE - 创建新表
ALTER TABLE - 更改数据库表
DROP TABLE - 删除表
CREATE INDEX - 创建索引
DROP INDEX - 删除索引
*/

--1:SQL CREATE TABLE 语句
CREATE TABLE table_name(
column1 datatype,
column2 datatype,
column3 datatype,
.....
columnN datatype,
PRIMARY KEY( one or more columns )
--2:SQL DROP TABLE 语句
DROP TABLE table_name

--3:SQL CREATE INDEX 语句 
CREATE UNIQUE INDEX index_name
ON table_name ( column1, column2,...columnN)

--4:SQL DROP INDEX 语句 
ALTER TABLE table_name
DROP INDEX index_name

--5:SQL DESC 语句---表结构查询,在oracle中使用
DESC table_name

--6:SQL TRUNCATE TABLE 语句
TRUNCATE TABLE table_name;

--7:SQL ALTER TABLE 语句:
ALTER TABLE table_name {ADD|DROP|MODIFY} column_name {data_ype};

--8:SQL ALTER TABLE 语句 (重命名) :
ALTER TABLE table_name RENAME TO new_table_name;

--9:SQL INSERT INTO 语句:
INSERT INTO table_name( column1, column2....columnN)
VALUES ( value1, value2....valueN);

--10:SQL UPDATE 语句:
UPDATE table_name
SET column1 = value1, column2 = value2....columnN=valueN
[ WHERE  CONDITION ];

--11:SQL DELETE 语句:
DELETE FROM table_name
WHERE  {CONDITION};

--12:SQL CREATE DATABASE 语句:
CREATE DATABASE database_name;

--13:SQL DROP DATABASE 语句:
DROP DATABASE database_name;

--14:SQL USE 语句:
USE database_name;

--15:SQL COMMIT 语句:在oracle中使用，sql server 没用过
COMMIT;

--16:SQL ROLLBACK 语句:
ROLLBACK;