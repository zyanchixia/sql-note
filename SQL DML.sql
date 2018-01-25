--SQL分为 数据操作语言DML和数据定义语言DDL
/*查询和更新指令构成了SQL的DML部分：
SELECT -从数据库中获取数据
UPDATE - 更新数据库表中的数据
DELETE - 从数据库表中删除数据
INSERT INTO - 向数据库表中插入数据
*/
--1:SELECT 用于从表中选取数据，结果被存储在一个结果表中，称为结果集
SELECT 列名 FROM 表名

--2:SELECT DISTINCT 语句
SELECT DISTINCT 列名 FROM 表名 --用于返回唯一不同的值

--3：SELECT WHERE 条件
SELECT 列名 FROM 表名 WHERE 列 运算符 值 ---条件子句
where 子句中可以使用=,<>,>,<,>=,<=,between,like
SELECT * FROM tb WHERE FirstName='Bush'---单引号来环绕文本值
SELECT * FROM Persons WHERE Year>1965 ---如果是数值，就不要使用引号

--4：AND & OR 运算符：用于基于一个以上的条件对记录进行过滤
SELECT * FROM tb 
WHERE (FirstName='Thomas' OR FirstName='William')
AND LastName='Carter'---and与or结合起来使用举例

--5:ORDER BY 子句：用于对结果集进行排序，默认升序，DESC降序
SELECT Company, OrderNumber 
FROM Orders 
ORDER BY Company DESC, OrderNumber ASC

--6:INSERT INTO 向表格中插入新的行
INSERT INTO tb values (值1,值2,....)
INSERT INTO tb (列1, 列2,...) VALUES (值1, 值2,....)

--7:UPDATE 用于修改表中的数据
UPDATE 表名 SET 列名 = 新值 where 列名= 某值

UPDATE Person SET Address = 'Zhongshan 23', City = 'Nanjing'
WHERE LastName = 'Wilson'

--8:DELETE 用于删除表中的行
DELETE FROM 表名 WHERE 列名= 值
delete from table_name --在不删除表的情况下删除所有行，这意味着表的结构，属性和索引都是完整的
--9:IN 子句
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name IN (val-1, val-2,...val-N)

--10:SQL BETWEEN 子句
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name BETWEEN val-1 AND val-2

--11:SQL LIKE 子句
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name LIKE ('%%')
--12:SQL GROUP BY 子句
SELECT SUM(column_name)
FROM   table_name
WHERE  CONDITION
GROUP BY column_name
--13:SQL COUNT 子句
SELECT COUNT(column_name)
FROM   table_name
WHERE  CONDITION

--14:SQL HAVING 子句
SELECT SUM(column_name)
FROM   table_name
WHERE  CONDITION
GROUP BY column_name
HAVING (arithematic function condition)



/*drop,truncate和delete的区别
一般而言，drop > truncate > delete
TRUNCATE 和DELETE只删除数据，DROP则删除整个表（结构和数据）
http://blog.csdn.net/ws0513/article/details/49980547
*/