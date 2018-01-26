----整理一下sql server 中日常用到的语法
--1：top 子句
select top  5 * from tbname--sql server 
select column from tbname limit 5 ---my sql
select column from tbname where rownum <= 5 --- oracle

--2:like操作符
select column from tbname 
where column like pattern --'N%'N开头;'%g'g结尾;not like '%loa%'不包含loa在内
 
 --3：通配符：%代替一个或多个字符；_ 仅代替一个字符;[^charlist] 或 [!charlist]不在字符列
 select * from tbname where first_name like '_ong'--取表中名字的第一个字符之后是'ong'的信息
 select * from tbname where city like '[ALN]%'--在表的city字段中查找以A或L或N 开头的信息
 select * from tbname where city '[!ALN]%' --不以A或L或N开头的

 --4：in操作符
 select column from tbname 
 where column in (value1,value2...)--允许在 WHERE 子句中规定多个值
 --5:between 操作符:介于两个值之间的数据范围,可以是数值,文本或者日期
 select column from tbname where column between value1 and value2
 --6:表的sql alisa 语法：将列名或表名指定别名,别名使查询程序更易阅读和书写
 select * column_name from table_name as table_newname
 --7:join(inner join ,left join ,right join ,full join) 链接两个或者多个表
JOIN: 如果表中有至少一个匹配，则返回行
LEFT JOIN: 即使右表中没有匹配，也从左表返回所有的行
RIGHT JOIN: 即使左表中没有匹配，也从右表返回所有的行
FULL JOIN: 只要其中一个表中存在匹配，就返回行

--8：SQL UNION 和 UNION ALL 操作符
UNION 操作符用于合并两个或多个 SELECT 语句的结果集,必须拥有相同数量的列.列也必须拥有相似的数据类型.同时,每条 SELECT 语句中的列的顺序必须相同.

UNION ALL 列出所有值, 允许有重复

注意:UNION 结果集中的列名总是等于 UNION 中第一个 SELECT 语句中的列名

--9:SQL SELECT INTO 语句可用于创建表的备份复件
select * into new_tb from old_tb
left join tba on old_tb.id = tba.id--- 可以多子句结合
SELECT * INTO Persons IN 'Backup.mdb' FROM Persons---in子句可用于向另一个数据库中拷贝表,没执行成功...
--10：create database 创建数据库
creat database database_name 
--1： create table 创建表
create table table_name 