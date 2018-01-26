--12:SQL撤销索引，表及数据库
drop table 表名
drop database 数据库名称
truncate table 表名---仅仅除去表内的数据，但并不删除表本
--13:ALTER TABLE 语句：在已有的表中添加，修改，删除列
ALTER TABLE table_name  ADD column_name datatype
ALTER TABLE Persons   ADD Birthday date---举例
ALTER TABLE table_name DROP COLUMN column_name --要删除表中的列
ALTER TABLE table_name  ALTER COLUMN column_name datatype --要改变表中列的数据类型
ALTER TABLE Persons  ALTER COLUMN Birthday year ---举例
--14:SQL AUTO INCREMENT 新记录插入表中时生成一个唯一的数字
--把 "Persons" 表中的 "P_Id" 列定义为 auto-increment 主键：
CREATE TABLE Persons
(
P_Id int PRIMARY KEY IDENTITY,-----会自动添加一个唯一的值
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)
--15:SQL VIEW 视图是可视化的表,语法如下
CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition

--举例：新建一个视图会选取 Products 表中所有单位价格高于平均单位价格的产品
CREATE VIEW [Products Above Average Price] AS
SELECT ProductName,UnitPrice
FROM Products
WHERE UnitPrice>(SELECT AVG(UnitPrice) FROM Products) 

--sql更新视图语法 SQL CREATE OR REPLACE VIEW Syntax
CREATE OR REPLACE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition

---sql 撤销视图语法 SQL DROP VIEW Syntax
DROP VIEW view_name

--16:date 函数:处理日期时，最难的任务恐怕是确保所插入的日期的格式，与数据库中日期列的格式相匹配
GETDATE() -- 返回当前日期和时间 
DATEPART()  --返回日期/时间的单独部分
DATEADD() --在日期中添加或减去指定的时间间隔
DATEDIFF()  --返回两个日期之间的时间
CONVERT()  --用不同的格式显示日期/时间
DATE - 格式 YYYY-MM-DD
DATETIME - 格式: YYYY-MM-DD HH:MM:SS
SMALLDATETIME - 格式: YYYY-MM-DD HH:MM:SS
TIMESTAMP - 格式: 唯一的数字
select convert(varchar(10),GETDATE(),120) 日期 --2018-01-25

--17 NULL 值:遗漏的未知数据
SELECT column FROM table_name WHERE column IS (not) NULL
--18 SQL ISNULL() 函数
尤其在计算时,如果值是 NULL 则 ISNULL(),返回 0
SELECT ProductName,UnitPrice*(UnitsInStock+ISNULL(UnitsOnOrder,0))
FROM Products
