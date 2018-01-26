
--在 SQL Server 中的合计函数(Aggregate functions)
函数:描述
1:AVG(column):返回某列的平均值
SELECT AVG(column_name) FROM table_name

2:COUNT(column):返回某列的行数(不包括NULL值)
SELECT COUNT(column_name) FROM table_name

COUNT(*):返回被选行数
COUNT(DISTINCT column):返回相异结果的数目

3:FIRST(column):返回在指定的域中第一个记录的值(SQLServer2000 不支持)
SELECT FIRST(column_name) FROM table_name order by column
 
4:LAST(column):返回在指定的域中最后一个记录的值(SQLServer2000 不支持)
SELECT LAST(column_name) FROM table_name order by column
5:MAX(column):返回某列的最高值
SELECT MAX(column_name) FROM table_name 
select max(date) from table_name ---查询表中最近一次记录的时间

6:MIN(column):返回某列的最低值
SELECT MIN(column_name) FROM table_name
Select min(date) from table_name ---查询表中最早记录的时间

7:SUM(column):返回某列的总和
SELECT date,SUM(column_name) FROM table_name group by date
在使用sum等函数时,需要group by 其他列

8:GROUP BY 语句用于结合合计函数,根据一个或多个列对结果集进行分组
SELECT Customer,OrderDate,SUM(OrderPrice) FROM Orders
GROUP BY Customer,OrderDate

9:HAVING 子句: SQL 中增加 HAVING 子句原因是，WHERE 关键字无法与合计函数一起使用
语法:
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name
HAVING aggregate_function(column_name) operator value

举例:查找客户 "Bush" 或 "Adams" 拥有超过 1500 的订单总金额
SELECT Customer,SUM(OrderPrice) FROM Orders
WHERE Customer='Bush' OR Customer='Adams'
GROUP BY Customer
HAVING SUM(OrderPrice)>1500

10:UCASE() 函数:把字段的值转换为大写
语法:SELECT UCASE(column_name) FROM table_name
选取 "LastName" 和 "FirstName" 列的内容，然后把 "LastName" 列转换为大写
SELECT UCASE(LastName) as LastName,FirstName
 FROM Persons

 11:LCASE() 函数:把字段的值转换为小写
 语法:SELECT LCASE(column_name) FROM table_name

 12:MID() 函数:用于从文本字段中提取字符
 语法:SELECT MID(column_name,start[,length]) FROM table_name
 举例:从 "City" 列中提取前 3 个字符
 SELECT MID(City,1,3) as SmallCity FROM Persons

 13:LEN() 函数:返回文本字段中值的长度
 语法:SELECT LEN(column_name) FROM table_name
 举例:取得 "City" 列中值的长度
 SELECT LEN(City) as LengthOfCity FROM Persons

 14:SQL ROUND() 函数:用于把数值字段舍入为指定的小数位数
 语法:SELECT ROUND(column_name,decimals) FROM table_name
 举例:把名称和价格舍入为最接近的整数
 SELECT ProductName, ROUND(UnitPrice,0) as UnitPrice 
 FROM Products

 15:GETDATE() 函数返回当前的日期和时间
 语法:SELECT GETDATE() FROM table_name
 SELECT ProductName, UnitPrice, GETDATE() as PerDate
  FROM Products

  16:SQL FORMAT() 函数用于对字段的显示进行格式化
  语法:SELECT FORMAT(column_name,format) FROM table_name
  
参数	描述
column_name	必需,要格式化的字段,
format	必需,规定格式,
举例:显示每天日期所对应的名称和价格(日期的显示格式是 "YYYY-MM-DD")
SELECT ProductName, UnitPrice, FORMAT(GETDATE(),'YYYY-MM-DD') as PerDate
FROM Products