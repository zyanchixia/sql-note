--SQL��Ϊ ���ݲ�������DML�����ݶ�������DDL
/*
DDL����ʹ����������������ɾ�����Ҳ���Զ����������������涨��֮������Ӽ�ʩ�ӱ���Լ��
CREATE DATABASE - ���������ݿ�
ALTER DATABASE - �޸����ݿ�
CREATE TABLE - �����±�
ALTER TABLE - �������ݿ��
DROP TABLE - ɾ����
CREATE INDEX - ��������
DROP INDEX - ɾ������
*/

--1:SQL CREATE TABLE ���
CREATE TABLE table_name(
column1 datatype,
column2 datatype,
column3 datatype,
.....
columnN datatype,
PRIMARY KEY( one or more columns )
--2:SQL DROP TABLE ���
DROP TABLE table_name
--3:SQL CREATE INDEX ��� 
CREATE UNIQUE INDEX index_name
ON table_name ( column1, column2,...columnN)
--4:SQL DROP INDEX ��� 
ALTER TABLE table_name
DROP INDEX index_name
--5:SQL DESC ���---��ṹ��ѯ
DESC table_name;

--6:SQL TRUNCATE TABLE ���
TRUNCATE TABLE table_name;
SQL ALTER TABLE ���:

ALTER TABLE table_name {ADD|DROP|MODIFY} column_name {data_ype};
SQL ALTER TABLE ��� (������) :

ALTER TABLE table_name RENAME TO new_table_name;
SQL INSERT INTO ���:

INSERT INTO table_name( column1, column2....columnN)
VALUES ( value1, value2....valueN);
SQL UPDATE ���:

UPDATE table_name
SET column1 = value1, column2 = value2....columnN=valueN
[ WHERE  CONDITION ];
SQL DELETE ���:

DELETE FROM table_name
WHERE  {CONDITION};
SQL CREATE DATABASE ���:

CREATE DATABASE database_name;
SQL DROP DATABASE ���:

DROP DATABASE database_name;
SQL USE ���:

USE database_name;
SQL COMMIT ���:
COMMIT;
SQL ROLLBACK ���:

ROLLBACK;