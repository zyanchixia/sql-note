--SQL��Ϊ ���ݲ�������DML�����ݶ�������DDL
/*��ѯ�͸���ָ�����SQL��DML���֣�
SELECT -�����ݿ��л�ȡ����
UPDATE - �������ݿ���е�����
DELETE - �����ݿ����ɾ������
INSERT INTO - �����ݿ���в�������
*/
--1:SELECT ���ڴӱ���ѡȡ���ݣ�������洢��һ��������У���Ϊ�����
SELECT ���� FROM ����

--2:SELECT DISTINCT ���
SELECT DISTINCT ���� FROM ���� --���ڷ���Ψһ��ͬ��ֵ

--3��SELECT WHERE ����
SELECT ���� FROM ���� WHERE �� ����� ֵ ---�����Ӿ�
where �Ӿ��п���ʹ��=,<>,>,<,>=,<=,between,like
SELECT * FROM tb WHERE FirstName='Bush'---�������������ı�ֵ
SELECT * FROM Persons WHERE Year>1965 ---�������ֵ���Ͳ�Ҫʹ������

--4��AND & OR ����������ڻ���һ�����ϵ������Լ�¼���й���
SELECT * FROM tb 
WHERE (FirstName='Thomas' OR FirstName='William')
AND LastName='Carter'---and��or�������ʹ�þ���

--5:ORDER BY �Ӿ䣺���ڶԽ������������Ĭ������DESC����
SELECT Company, OrderNumber 
FROM Orders 
ORDER BY Company DESC, OrderNumber ASC

--6:INSERT INTO �����в����µ���
INSERT INTO tb values (ֵ1,ֵ2,....)
INSERT INTO tb (��1, ��2,...) VALUES (ֵ1, ֵ2,....)

--7:UPDATE �����޸ı��е�����
UPDATE ���� SET ���� = ��ֵ where ����= ĳֵ

UPDATE Person SET Address = 'Zhongshan 23', City = 'Nanjing'
WHERE LastName = 'Wilson'

--8:DELETE ����ɾ�����е���
DELETE FROM ���� WHERE ����= ֵ
delete from table_name --�ڲ�ɾ����������ɾ�������У�����ζ�ű�Ľṹ�����Ժ���������������
--9:IN �Ӿ�
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name IN (val-1, val-2,...val-N)

--10:SQL BETWEEN �Ӿ�
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name BETWEEN val-1 AND val-2

--11:SQL LIKE �Ӿ�
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name LIKE ('%%')
--12:SQL GROUP BY �Ӿ�
SELECT SUM(column_name)
FROM   table_name
WHERE  CONDITION
GROUP BY column_name
--13:SQL COUNT �Ӿ�
SELECT COUNT(column_name)
FROM   table_name
WHERE  CONDITION

--14:SQL HAVING �Ӿ�
SELECT SUM(column_name)
FROM   table_name
WHERE  CONDITION
GROUP BY column_name
HAVING (arithematic function condition)



/*drop,truncate��delete������
һ����ԣ�drop > truncate > delete
TRUNCATE ��DELETEֻɾ�����ݣ�DROP��ɾ���������ṹ�����ݣ�
http://blog.csdn.net/ws0513/article/details/49980547
*/