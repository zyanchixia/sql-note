---10:��Ʒ���ظ�������:���ÿ����Ա��ÿ����Ʒ�����һ������,������ԵĶ�������,����_qty(�ڶ����г��ֵ��ܴ���),qty_total(����������)
select * into #test_vip
from (
select a.��Ա���,a.��Ʒ���,b.��Ʒ���һ as ��ɻ���
,count(distinct a.���ױ��) as ��������
,sum(a.��Ʒ����) as  ����_qty
,b.���һ���� as �������
,sum(��Ʒ����)*b.���һ���� as  qty_total
,case when b.��Ʒ���һ not in ('') then '1'
else '����' end as ������
from vip������ϸ�ļ� a 
left join ��ɻ��ŵ� b on a.��Ʒ��� = b.��Ʒ���
group by a.��Ա���,a.��Ʒ���,b.��Ʒ���һ,b.���һ���� 

union all 

select a.��Ա���,a.��Ʒ���,b.��Ʒ��ɶ� as ��ɻ���
,count(distinct a.���ױ��) as ��������
,sum(a.��Ʒ����) as  ����_qty
,b.��ɶ����� as �������
,sum(��Ʒ����)*b.��ɶ����� as  qty_total
,case when b.��Ʒ��ɶ� not in ('') then '2'
else '����' end as ������
from vip������ϸ�ļ� a 
left join ��ɻ��ŵ� b on a.��Ʒ��� = b.��Ʒ���
group by a.��Ա���,a.��Ʒ���,b.��Ʒ��ɶ�,b.���һ���� 

)test

---test �����ֶΣ���Ա���,��Ʒ���,��ɻ���,��������,����_qty,�������,������
select * into �ظ�����_vip
from(
select distinct ��ɻ���
,(case when  �������� in ('1') then count(��Ա���) end ) as ����_1
,(case when �������� in  ('2') then count(��Ա���) end ) as ����_2
,(case when �������� in  ('3') then count(��Ա���) end ) as ����_3
,(case when �������� in  ('4') then count(��Ա���) end ) as ����_4
 from test_vip 
where ��ɻ��� not in ('')
group by ��ɻ���,��������
)test
--�ظ�����_vip�����ֶΣ���ɻ���,����_1,����_2...��ɼ����ռ��