
--�� SQL Server �еĺϼƺ���(Aggregate functions)
����:����
1:AVG(column):����ĳ�е�ƽ��ֵ
SELECT AVG(column_name) FROM table_name

2:COUNT(column):����ĳ�е�����(������NULLֵ)
SELECT COUNT(column_name) FROM table_name

COUNT(*):���ر�ѡ����
COUNT(DISTINCT column):��������������Ŀ

3:FIRST(column):������ָ�������е�һ����¼��ֵ(SQLServer2000 ��֧��)
SELECT FIRST(column_name) FROM table_name order by column
 
4:LAST(column):������ָ�����������һ����¼��ֵ(SQLServer2000 ��֧��)
SELECT LAST(column_name) FROM table_name order by column
5:MAX(column):����ĳ�е����ֵ
SELECT MAX(column_name) FROM table_name 
select max(date) from table_name ---��ѯ�������һ�μ�¼��ʱ��

6:MIN(column):����ĳ�е����ֵ
SELECT MIN(column_name) FROM table_name
Select min(date) from table_name ---��ѯ���������¼��ʱ��

7:SUM(column):����ĳ�е��ܺ�
SELECT date,SUM(column_name) FROM table_name group by date
��ʹ��sum�Ⱥ���ʱ,��Ҫgroup by ������

8:GROUP BY ������ڽ�Ϻϼƺ���,����һ�������жԽ�������з���
SELECT Customer,OrderDate,SUM(OrderPrice) FROM Orders
GROUP BY Customer,OrderDate

9:HAVING �Ӿ�: SQL ������ HAVING �Ӿ�ԭ���ǣ�WHERE �ؼ����޷���ϼƺ���һ��ʹ��
�﷨:
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name
HAVING aggregate_function(column_name) operator value

����:���ҿͻ� "Bush" �� "Adams" ӵ�г��� 1500 �Ķ����ܽ��
SELECT Customer,SUM(OrderPrice) FROM Orders
WHERE Customer='Bush' OR Customer='Adams'
GROUP BY Customer
HAVING SUM(OrderPrice)>1500

10:UCASE() ����:���ֶε�ֵת��Ϊ��д
�﷨:SELECT UCASE(column_name) FROM table_name
ѡȡ "LastName" �� "FirstName" �е����ݣ�Ȼ��� "LastName" ��ת��Ϊ��д
SELECT UCASE(LastName) as LastName,FirstName
 FROM Persons

 11:LCASE() ����:���ֶε�ֵת��ΪСд
 �﷨:SELECT LCASE(column_name) FROM table_name

 12:MID() ����:���ڴ��ı��ֶ�����ȡ�ַ�
 �﷨:SELECT MID(column_name,start[,length]) FROM table_name
 ����:�� "City" ������ȡǰ 3 ���ַ�
 SELECT MID(City,1,3) as SmallCity FROM Persons

 13:LEN() ����:�����ı��ֶ���ֵ�ĳ���
 �﷨:SELECT LEN(column_name) FROM table_name
 ����:ȡ�� "City" ����ֵ�ĳ���
 SELECT LEN(City) as LengthOfCity FROM Persons

 14:SQL ROUND() ����:���ڰ���ֵ�ֶ�����Ϊָ����С��λ��
 �﷨:SELECT ROUND(column_name,decimals) FROM table_name
 ����:�����ƺͼ۸�����Ϊ��ӽ�������
 SELECT ProductName, ROUND(UnitPrice,0) as UnitPrice 
 FROM Products

 15:GETDATE() �������ص�ǰ�����ں�ʱ��
 �﷨:SELECT GETDATE() FROM table_name
 SELECT ProductName, UnitPrice, GETDATE() as PerDate
  FROM Products

  16:SQL FORMAT() �������ڶ��ֶε���ʾ���и�ʽ��
  �﷨:SELECT FORMAT(column_name,format) FROM table_name
  
����	����
column_name	����,Ҫ��ʽ�����ֶ�,
format	����,�涨��ʽ,
����:��ʾÿ����������Ӧ�����ƺͼ۸�(���ڵ���ʾ��ʽ�� "YYYY-MM-DD")
SELECT ProductName, UnitPrice, FORMAT(GETDATE(),'YYYY-MM-DD') as PerDate
FROM Products