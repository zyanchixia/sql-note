----����һ��sql server ���ճ��õ����﷨
--1��top �Ӿ�
select top  5 * from tbname--sql server 
select column from tbname limit 5 ---my sql
select column from tbname where rownum <= 5 --- oracle

--2:like������
select column from tbname 
where column like pattern --'N%'N��ͷ;'%g'g��β;not like '%loa%'������loa����
 
 --3��ͨ�����%����һ�������ַ���_ ������һ���ַ�;[^charlist] �� [!charlist]�����ַ���
 select * from tbname where first_name like '_ong'--ȡ�������ֵĵ�һ���ַ�֮����'ong'����Ϣ
 select * from tbname where city like '[ALN]%'--�ڱ��city�ֶ��в�����A��L��N ��ͷ����Ϣ
 select * from tbname where city '[!ALN]%' --����A��L��N��ͷ��

 --4��in������
 select column from tbname 
 where column in (value1,value2...)--������ WHERE �Ӿ��й涨���ֵ
 --5:between ������:��������ֵ֮������ݷ�Χ,��������ֵ,�ı���������
 select column from tbname where column between value1 and value2
 --6:���sql alisa �﷨�������������ָ������,����ʹ��ѯ��������Ķ�����д
 select * column_name from table_name as table_newname
 --7:join(inner join ,left join ,right join ,full join) �����������߶����
JOIN: �������������һ��ƥ�䣬�򷵻���
LEFT JOIN: ��ʹ�ұ���û��ƥ�䣬Ҳ����������е���
RIGHT JOIN: ��ʹ�����û��ƥ�䣬Ҳ���ұ������е���
FULL JOIN: ֻҪ����һ�����д���ƥ�䣬�ͷ�����

--8��SQL UNION �� UNION ALL ������
UNION ���������ںϲ��������� SELECT ���Ľ����,����ӵ����ͬ��������.��Ҳ����ӵ�����Ƶ���������.ͬʱ,ÿ�� SELECT ����е��е�˳�������ͬ.

UNION ALL �г�����ֵ, �������ظ�

ע��:UNION ������е��������ǵ��� UNION �е�һ�� SELECT ����е�����

--9:SQL SELECT INTO �������ڴ�����ı��ݸ���
select * into new_tb from old_tb
left join tba on old_tb.id = tba.id--- ���Զ��Ӿ���
SELECT * INTO Persons IN 'Backup.mdb' FROM Persons---in�Ӿ����������һ�����ݿ��п�����,ûִ�гɹ�...
--10��create database �������ݿ�
creat database database_name 
--1�� create table ������
create table table_name 