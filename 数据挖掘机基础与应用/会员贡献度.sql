--12����Ա���׶� P85 ��ͬ����������Ա�Ĺ��׶ȣ�������Ȳ�ͬʱ����ƽ������
with test as(
select distinct a.��Ա���,���ױ��,vip������,vip��ֹ��,���,���׽�����
,case when vip������>='2014-01-01' and vip������<'2015-01-01' then '2014'
      when vip������>='2015-01-01' and vip������<'2016-01-01' then '2015'
	  when vip������>='2016-01-01' and vip������<'2017-01-01' then '2016'
	  when vip������>='2017-01-01' and vip������<'2018-01-01' then '2018'
 end as �������
 ,case when datediff(day,vip������,���׽�����)<='365' then '��һ��'
 when when datediff(day,vip������,���׽�����)>='366'
  and when datediff(day,vip������,���׽�����) <'730' then '�ڶ���'
when when datediff(day,vip������,���׽�����)>='731'
  and when datediff(day,vip������,���׽�����) <'1095' then '������'
when when datediff(day,vip������,���׽�����)>='1096'
  and when datediff(day,vip������,���׽�����) <'1082' then '������'
else '����' end as �������
from vip��Ա���������ļ� a left join vip ������ϸ�ļ� b
on a.��Ա��� = b.��Ա���
where b.��Ա��� not in ('')--��Ŀǰ���ݿ���û�ж�����¼�Ļ�Ա����������
and datediff(day,vip������,���׽�����)>0--�˿ͳ�Ϊvip��Ա֮�������
group by  a.��Ա���,���ױ��,vip������,vip��ֹ��,���,���׽�����
)
--�������ֶΣ���Ա���,���ױ��,vip������,vip��ֹ��,���,���׽�����,�������,�������
select �������,�������
,sum(���) as �ܽ��
from test
group by �������,�������
order by �������
--��Ա�˾����׶�= �ܽ��/�����Ա����