--SQL RDBMS概念:RDBMS代表关系数据库管理系统.RDBMS是SQL的基础,对于像MS SQL Server,IBM DB2,Oracle,MySQL和Microsoft Access等所有现代数据库系统.

--SQL约束：NOT NULL,DEFAULT,UNIQUE,PRIMARY KEY,FOREIGN KEY,CHECK

--1:SQL NOT NULL 约束:默认情况下,一列可以容纳NULL值.如果不想列有NULL值,则需要不允许此列指定NULL定义这样的约束.

-- 一个NULL和没有数据是不一样的,相反它代表了未知的数据.
--例：用sql创建一个名为customers的新表,并增加5列,其中3列指定不接受null值

create table  CUSTOMERS(
ID int  not null,
NAME varchar(20)  not null,
AGE int  not null,
ADDRESS char(25),
SALARY  decimal (18,2),
PRIMARY  key(ID)
)

--如果CUSTOMERS表已经创建,然后添加一个not null约束salary列
alter table CUSTOMERS
alter column SALARY decimal (18,2) not null---sql server 写法
-- modify SALARY decimal (18,2) not null--- mysql/oracle写法

--2:SQL DEFAULT 约束：默认default约束提供一个默认值,以当insert into 语句不提供特定值的列
create table  CUSTOMERS(
ID int  not null,
NAME varchar(20)  not null,
AGE int  not null,
ADDRESS char(25),
SALARY  decimal (18,2) DEFAULT 5000.00 ,----默认值为5000.00,这样的情况下insert into时就默认输入该值
PRIMARY  key(ID)
)

--删除default约束
alter table customers
alter column SALARY drop DEFAULT;

--3:sql  UNIQUE 唯一约束:防止在特定的列有相同的两个记录值
create table CUSTOMERS(
ID INT NOT NULL,
NAME VARCHAR(20) not null,
AGE INT NOT NULL UNIQUE,----唯一约束
ADRESS CHAR(25),
SALARY DECIMAL(18,2),
PRIMARY KEY(id)
)

alter table tablename ADD unique(column)---表已经创建的前提下,增加某列唯一约束
alter table tablename drop constraint column----撤销unique约束

--4:sql主键约束:在一个数据库表中唯一标识每个行/记录表中的字段,主键必须是唯一值,且不能有null值
--一个表中只能有一个主键,可以是由单个或多个字段组成,当多个字段被用来作为主键,则被称为复合键

alter table customers add primary key (ID) --在已存在的customers表中的id列创建主键约束

create table CUSTOMERS(
ID INT NOT NULL,
NAME VARCHAR(20) not null,
AGE INT NOT NULL ,
ADRESS CHAR(25),
SALARY DECIMAL(18,2),
PRIMARY KEY(id,name)--多列定义主键约束
)
alter table customers drop constraint id --撤销主键约束

--5:sql外键约束:用于两个表链接在一起的键
ALTER TABLE tbname DROP CONSTRAINT column ---撤销外键约束
ALTER TABLE tbname  ADD CONSTRAINT column FOREIGN KEY (column)
REFERENCES tbname1 (column)---在表已经存在某列的情况下,创建该列外键

--6:sql check 约束：检查被输入到一个记录的值,如果条件计算结果为flase,则违反了约束,不被存储在表中
CREATE TABLE CUSTOMERS(
       ID   INT              NOT NULL,
       NAME VARCHAR (20)     NOT NULL,
       AGE  INT              NOT NULL CHECK (AGE >= 18),--如果有小于18岁的,数据就不会被录入
       ADDRESS  CHAR (25) ,
       SALARY   DECIMAL (18, 2),       
       PRIMARY KEY (ID)
	  -- ,constraint column check(id>0 and age>=18 and address like '%a%')--命名 CHECK约束,以及为多个列定义CHECK约束
	   )
alter table tbname add constraint column check (age>=18)--已有表的某列增加check约束
alter table tbname drop check column--撤销check约束

--7:sql索引约束：用来快速创建并从数据库中检索数据

creat indext indext_name on table_name(column_name)--在表上创建一个索引,允许使用重复值
creat index index_name on CUSTOMERS(name,address)---在已有表上创建多列索引,用逗号隔开
