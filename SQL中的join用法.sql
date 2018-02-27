
SQL中的join用法:

JOIN 分为:内连接(INNER JOIN),外连接(OUTER JOIN).其中,外连接分为:左外连接(LEFT OUTER JOIN),
右外连接(RIGHT OUTER JOIN),全外连接(FULL OUTER JOIN),其中外连接的"OUTER"关键字可以省略不写.

例: 表A有列ID,值为: 1 2 3 4  表B有列ID,值为: 3 4 5 6

1.内连接(显示左右两表能完全匹配的数据):

select A.ID, B.ID from A INNER JOIN B ON A.ID = B.ID
结果为: 3    3 4    4

2.左外连接(显示左表所有数据,右表匹配不上的显示为NULL):
select A.ID, B.ID from A LEFT JOIN B ON A.ID = B.ID
结果为: 1    NULL 2    NULL 3    3 4    4

3.右外连接(显示右表所有数据,左表匹配不上的显示为NULL):
select A.ID, B.ID from A RIGHT JOIN B ON A.ID = B.ID
结果为: 3    3 4    4 NULL    5 NULL    6


4.全外连接(显示左右两量表所有数据,两表匹配不上的显示为NULL):
select A.ID, B.ID from A FULL OUTER JOIN B ON A.ID = B.ID
结果为: 1    NULL 2    NULL 3    3 4    4 NULL    5 NULL    6