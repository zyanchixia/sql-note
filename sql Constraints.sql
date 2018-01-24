--SQL RDBMS����:RDBMS�����ϵ���ݿ����ϵͳ.RDBMS��SQL�Ļ���,������MS SQL Server,IBM DB2,Oracle,MySQL��Microsoft Access�������ִ����ݿ�ϵͳ.

--SQLԼ����NOT NULL,DEFAULT,UNIQUE,PRIMARY KEY,FOREIGN KEY,CHECK

--1:SQL NOT NULL Լ��:Ĭ�������,һ�п�������NULLֵ.�����������NULLֵ,����Ҫ���������ָ��NULL����������Լ��.

-- һ��NULL��û�������ǲ�һ����,�෴��������δ֪������.
--������sql����һ����Ϊcustomers���±�,������5��,����3��ָ��������nullֵ

create table  CUSTOMERS(
ID int  not null,
NAME varchar(20)  not null,
AGE int  not null,
ADDRESS char(25),
SALARY  decimal (18,2),
PRIMARY  key(ID)
)

--���CUSTOMERS���Ѿ�����,Ȼ�����һ��not nullԼ��salary��
alter table CUSTOMERS
alter column SALARY decimal (18,2) not null---sql server д��
-- modify SALARY decimal (18,2) not null--- mysql/oracleд��

--2:SQL DEFAULT Լ����Ĭ��defaultԼ���ṩһ��Ĭ��ֵ,�Ե�insert into ��䲻�ṩ�ض�ֵ����
create table  CUSTOMERS(
ID int  not null,
NAME varchar(20)  not null,
AGE int  not null,
ADDRESS char(25),
SALARY  decimal (18,2) DEFAULT 5000.00 ,----Ĭ��ֵΪ5000.00,�����������insert intoʱ��Ĭ�������ֵ
PRIMARY  key(ID)
)

--ɾ��defaultԼ��
alter table customers
alter column SALARY drop DEFAULT;

--3:sql  UNIQUE ΨһԼ��:��ֹ���ض���������ͬ��������¼ֵ
create table CUSTOMERS(
ID INT NOT NULL,
NAME VARCHAR(20) not null,
AGE INT NOT NULL UNIQUE,----ΨһԼ��
ADRESS CHAR(25),
SALARY DECIMAL(18,2),
PRIMARY KEY(id)
)

alter table tablename ADD unique(column)---���Ѿ�������ǰ����,����ĳ��ΨһԼ��
alter table tablename drop constraint column----����uniqueԼ��

--4:sql����Լ��:��һ�����ݿ����Ψһ��ʶÿ����/��¼���е��ֶ�,����������Ψһֵ,�Ҳ�����nullֵ
--һ������ֻ����һ������,�������ɵ��������ֶ����,������ֶα�������Ϊ����,�򱻳�Ϊ���ϼ�

alter table customers add primary key (ID) --���Ѵ��ڵ�customers���е�id�д�������Լ��

create table CUSTOMERS(
ID INT NOT NULL,
NAME VARCHAR(20) not null,
AGE INT NOT NULL ,
ADRESS CHAR(25),
SALARY DECIMAL(18,2),
PRIMARY KEY(id,name)--���ж�������Լ��
)
alter table customers drop constraint id --��������Լ��

--5:sql���Լ��:����������������һ��ļ�
ALTER TABLE tbname DROP CONSTRAINT column ---�������Լ��
ALTER TABLE tbname  ADD CONSTRAINT column FOREIGN KEY (column)
REFERENCES tbname1 (column)---�ڱ��Ѿ�����ĳ�е������,�����������

--6:sql check Լ������鱻���뵽һ����¼��ֵ,�������������Ϊflase,��Υ����Լ��,�����洢�ڱ���
CREATE TABLE CUSTOMERS(
       ID   INT              NOT NULL,
       NAME VARCHAR (20)     NOT NULL,
       AGE  INT              NOT NULL CHECK (AGE >= 18),--�����С��18���,���ݾͲ��ᱻ¼��
       ADDRESS  CHAR (25) ,
       SALARY   DECIMAL (18, 2),       
       PRIMARY KEY (ID)
	  -- ,constraint column check(id>0 and age>=18 and address like '%a%')--���� CHECKԼ��,�Լ�Ϊ����ж���CHECKԼ��
	   )
alter table tbname add constraint column check (age>=18)--���б��ĳ������checkԼ��
alter table tbname drop check column--����checkԼ��

--7:sql����Լ�����������ٴ����������ݿ��м�������

creat indext indext_name on table_name(column_name)--�ڱ��ϴ���һ������,����ʹ���ظ�ֵ
creat index index_name on CUSTOMERS(name,address)---�����б��ϴ�����������,�ö��Ÿ���
