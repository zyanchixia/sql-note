--12:SQL���������������ݿ�
drop table ����
drop database ���ݿ�����
truncate table ����---������ȥ���ڵ����ݣ�������ɾ����
--13:ALTER TABLE ��䣺�����еı�����ӣ��޸ģ�ɾ����
ALTER TABLE table_name  ADD column_name datatype
ALTER TABLE Persons   ADD Birthday date---����
ALTER TABLE table_name DROP COLUMN column_name --Ҫɾ�����е���
ALTER TABLE table_name  ALTER COLUMN column_name datatype --Ҫ�ı�����е���������
ALTER TABLE Persons  ALTER COLUMN Birthday year ---����
--14:SQL AUTO INCREMENT �¼�¼�������ʱ����һ��Ψһ������
--�� "Persons" ���е� "P_Id" �ж���Ϊ auto-increment ������
CREATE TABLE Persons
(
P_Id int PRIMARY KEY IDENTITY,-----���Զ����һ��Ψһ��ֵ
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)
--15:SQL VIEW ��ͼ�ǿ��ӻ��ı�,�﷨����
CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition

--�������½�һ����ͼ��ѡȡ Products �������е�λ�۸����ƽ����λ�۸�Ĳ�Ʒ
CREATE VIEW [Products Above Average Price] AS
SELECT ProductName,UnitPrice
FROM Products
WHERE UnitPrice>(SELECT AVG(UnitPrice) FROM Products) 

--sql������ͼ�﷨ SQL CREATE OR REPLACE VIEW Syntax
CREATE OR REPLACE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition

---sql ������ͼ�﷨ SQL DROP VIEW Syntax
DROP VIEW view_name

--16:date ����:��������ʱ�����ѵ����������ȷ������������ڵĸ�ʽ�������ݿ��������еĸ�ʽ��ƥ��
GETDATE() -- ���ص�ǰ���ں�ʱ�� 
DATEPART()  --��������/ʱ��ĵ�������
DATEADD() --����������ӻ��ȥָ����ʱ����
DATEDIFF()  --������������֮���ʱ��
CONVERT()  --�ò�ͬ�ĸ�ʽ��ʾ����/ʱ��
DATE - ��ʽ YYYY-MM-DD
DATETIME - ��ʽ: YYYY-MM-DD HH:MM:SS
SMALLDATETIME - ��ʽ: YYYY-MM-DD HH:MM:SS
TIMESTAMP - ��ʽ: Ψһ������
select convert(varchar(10),GETDATE(),120) ���� --2018-01-25

--17 NULL ֵ:��©��δ֪����
SELECT column FROM table_name WHERE column IS (not) NULL
--18 SQL ISNULL() ����
�����ڼ���ʱ,���ֵ�� NULL �� ISNULL(),���� 0
SELECT ProductName,UnitPrice*(UnitsInStock+ISNULL(UnitsOnOrder,0))
FROM Products
