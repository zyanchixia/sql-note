--7:vip��Ա���������������ٷֱ�:��������������μ���ٷֱ�
---PS:ÿ�����ױ�ŵĺ�����,�ֲ㲢����,����ٷֱ�

select * into vip��Ա��������
from (
select distinct ���ױ��,sum(��������) As ���������ܺ�
,case
when sum(��������) <50 then '���������ܺ�С��50'
when sum(��������) >=50 and sum(��������) < 100 then '���������ܺ�50~100'
when sum(��������) >=100 and sum(��������) < 2000 then '���������ܺ�100~200'
when sum(��������) >=200 and sum(��������) < 300 then '���������ܺ�200~300'
when sum(��������) >=300 and sum(��������) < 400 then '���������ܺ�300~400'
when sum(��������) >=400 and sum(��������) < 500 then '���������ܺ�400~500'
else '����������ڵ���500' end as ��������_new
from dbo.vip��Ա���������ļ���
group by ���ױ��
)aa

select ��������_new, count(��������_new) as ��������_new_cnt
,(select count(��������_new)) as ������������
,round((cast(count(��������_new) as float) /  (select cast (count(��������_new) as float) from vip��Ա��������)),4) as ��������ٷֱ�
 from vip��Ա��������
 group by ��������_new