--�ͻ�������������
/*�������еľ�ס��ַ����Ϊ������,��substringָ���ס���ֶ��е�ǰ3���ַ���ȡ����,
����������������test����,Ȼ����countָ�����������������״��
*/
with test as
(
select ��Ա���,�Ա�,����,����״̬
,ְҵ,�������,��Ա����,vip������
,substring(��ס��,1,3) as ����
from dbo.vip��Ա���������ļ���
)
select ����,count(����)
from test
group by ����

----1:����ִ�еĽ��,����˼�������ݽ��н�һ��������,��������,��case  when then ָ�����
select into dbo.vip��Ա���������ļ���1
from( 
select ��Ա���,�Ա�--------�ɷ���ά��
,����
,case when ����״̬ = '1' then 'δ��'
when ����״̬ = '2' then '�ѻ�' else '����' end as ����״̬����״̬-----�ɷ���ά��
,ְҵ-----�ɷ���ά��
,�������-----�ɷ���ά��
,��Ա����,vip������
,case when  substring(��ס��,1,3) ='̨����' then '̨����'
      when  substring(��ס��,1,3) ='̨����' then '̨����'
else '����' 
end as ����-----�ɷ���ά��
from dbo.vip��Ա���������ļ���
)aa



-----2:�����ֶ�"��Ա�����"��"vip������",��datediff�����Ա���ʱ�䳤��,Ȼ����������Ϊ���ַ�ʽ  
select into dbo.vip��Ա���������ļ���2
From(
select ��Ա���,�Ա�,����,����״̬,ְҵ,�������,
��Ա�����,vip������,����
,case when datediff(day,��Ա�����,vip������)>='0' and datediff(day,��Ա�����,vip������) <'366' then 'һ����'
 when datediff(day,��Ա�����,vip������)>='367' and datediff(day,��Ա�����,vip������) <'731' then '������'
 when datediff(day,��Ա�����,vip������)>='732' and datediff(day,��Ա�����,vip������) <'1096' then '������'
 else '����' end as '�Ἦ����'
 from dbo.vip��Ա���������ļ���1
)aa


-------------------------------3���������ڵı仯

select datepart(yyyy,���׽�����) as ���
,datepart(mm,���׽�����) as �·�
,count(distinct ���ױ��) as ÿ�½��״���
 from dbo.vip��Ա���������ļ���
 group by datepart(yyyy,���׽�����) ,datepart(mm,���׽�����)
 order by ���,�·�
