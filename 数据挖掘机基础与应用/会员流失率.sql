--11����Ա��ʧ�ʣ��빫˾�ƶ���Ӫ�����ԣ���˾��Ʒ�������ͷ���Ա����̬�ȵ��й�
--������ʧ��ʱֻ��������Ѽ�¼�Ļ�Ա
with test as 
(
select distinct a.��Ա���,vip������,vip��ֹ��
,case when vip������>='2014-01-01' and vip������<'2015-01-01' then '2014'
      when vip������>='2015-01-01' and vip������<'2016-01-01' then '2015'
	  when vip������>='2016-01-01' and vip������<'2017-01-01' then '2016'
	  when vip������>='2017-01-01' and vip������<'2018-01-01' then '2018'
 end as �������
 ,case when datediff(day,vip������,vip��ֹ��)<='365' then '��һ��'
 when when datediff(day,vip������,vip��ֹ��)>='366'
  and when datediff(day,vip������,vip��ֹ��) <'730' then '�ڶ���'
when when datediff(day,vip������,vip��ֹ��)>='731'
  and when datediff(day,vip������,vip��ֹ��) <'1095' then '������'
when when datediff(day,vip������,vip��ֹ��)>='1096'
  and when datediff(day,vip������,vip��ֹ��) <'1082' then '������'
else '����' end as ��ʧ���
from vip��Ա���������ļ� a left join vip ������ϸ�ļ� b
on a.��Ա��� = b.��Ա���
where b.��Ա��� not in ('')--��Ŀǰ���ݿ���û�ж�����¼�Ļ�Ա����������
group by  a.��Ա���,vip������,vip��ֹ��
)
--���������񣬽�����ͨ���������
select �������,��ʧ���,count(��ʧ���) as ��ʧ����
 from test
 group by �������,��ʧ���
 order by �������
 --��ʧ��= ��ʧ����/�����Ա����