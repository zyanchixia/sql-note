---9.5�����Ʒ���а���������Բ�Ʒ
--�ֶ�:��Ʒ���,��ɻ���,��������,����_qty,���������qty_total,������

select * into ����Ʒ����ļ�
from (
select a.��Ʒ���,b.��Ʒ���һ As ��ɻ���
,count(distinct a.���ױ��) as ��������
,sum(a.��Ʒ����) as ����_qty
,b.���һ���� as �������
,sum(��Ʒ����)*b.���һ���� as qty_total
,case when b.��Ʒ���һ not in ('') then '1'
else '����' end as ������
 from dbo.vip������ϸ�ļ� a 
 left join dbo.��ɻ��ŵ� b  on a.��Ʒ���= b.��Ʒ���
group by a.��Ʒ���,b.��Ʒ���һ,b.���һ����

union all

select a.��Ʒ���,b.��Ʒ��ɶ� As ��ɻ���
,count(distinct a.���ױ��) as ��������
,sum(a.��Ʒ����) as ����_qty
,b.���һ���� as �������
,sum(��Ʒ����)*b.��ɶ����� as qty_total
,case when b.��Ʒ��ɶ� not in ('') then '1'
else '����' end as ������
 from dbo.vip������ϸ�ļ� a 
 left join dbo.��ɻ��ŵ� b  on a.��Ʒ���= b.��Ʒ���
group by a.��Ʒ���,b.��Ʒ��ɶ�,b.��ɶ�����

union all

select a.��Ʒ���,b.��Ʒ����� As ��ɻ���
,count(distinct a.���ױ��) as ��������
,sum(a.��Ʒ����) as ����_qty
,b.���һ���� as �������
,sum(��Ʒ����)*b.��������� as qty_total
,case when b.��Ʒ����� not in ('') then '1'
else '����' end as ������
 from dbo.vip������ϸ�ļ� a 
 left join dbo.��ɻ��ŵ� b  on a.��Ʒ���= b.��Ʒ���
group by a.��Ʒ���,b.��Ʒ�����,b.���һ����
) aa ----������

--��ɻ��ţ���Ʒ��ţ��������������������ܴ���������������
select a.��ɻ���,b.��Ʒ���
,sum(��������) As ��������
,sum(����_qty) as ���������ܴ���
,sum(qty_total) as ����������
 from ����Ʒ����ļ� a 
 left join ��ɻ��ŵ� b on a.��ɻ��� = b.��ɻ���
 group by a.��ɻ���,b.��Ʒ���
 order by ���������� desc
