---8:ƽ�����׼��ʱ��,���������ʱ�䰲�� 
--PS:�ֶ�:��Ա���,���׽�����,���ױ��,��һ�ʽ��׶�����,��һ�ʽ��ױ��,�������
--��������b�н��׽�����>���a�Ľ��׽����գ�select top 1 ָ��ȡ��һ�����ֵ��ʱ������n-1��

with test as
(
select distinct a.��Ա���,a.���׽�����,a.���ױ��
,(select top 1 b.���׽����� from dbo.vip������ϸ�ļ� b
where a.��Ա��� = b.��Ա���
and a.���׽����� > b.���׽�����
) as ��һ�ʽ��׽�����
,(select top 1 b.���ױ�� from dbo.vip������ϸ�ļ� b 
where  a.��Ա��� = b.��Ա���
and a.���׽����� > b.���׽�����
) as ��һ�ʽ��ױ��
,datediff(dd,���׽�����,(select top 1 b.���׽����� from dbo.vip������ϸ�ļ� b
where a.��Ա��� = b.��Ա���
and a.���׽����� > b.���׽�����
)) as �������
from dbo.vip������ϸ�ļ� a
)
---------
select * into vip��Աƽ�����׼��ʱ��
from (
select distinct ��Ա���,count(���ױ��)as ���״���
,sum(datediff(dd,���׽�����,��һ�����׽�����)) as �����������
,case 
when count(���ױ��) >1 then 
(sum(datediff(dd,���׽�����,��һ�����׽�����))) /(count(���ױ��)-1)
else '0' end as ƽ����������
from test
group by ��Ա���
)


