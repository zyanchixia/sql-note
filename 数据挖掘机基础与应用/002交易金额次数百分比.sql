---------6:���׽������ٷֱ�:����ȹ۲������Ƚ��׽��Ĵ����ٷֱ�
--PS:ÿ�������Ľ����ܶ�ֲ㣻��������ȣ���������㽻�׽��ռ��
--PS�����������ݿ��н��ױ��Ϊnarchar���ͣ����Լ���ʱ��ת����float���Ͳ���ȷ��С�����2λ
select * into vip���׽�����_2016
 from (
select 
distinct ���ױ�� ,sum(���) as �����ܽ��
,case 
when sum(���) < 500 then '�����ܽ��<500'
when sum(���) >= 500 and sum(���) < 1000 then '�����ܽ��0.5k~1k'
when sum(���) >= 1000 and sum(���)< 2000 then '�����ܽ��1k~2k'
when sum(���) >= 2000 and sum(���)< 3000 then '�����ܽ��2k~3k'
when sum(���) >= 3000 and sum(���)< 4000 then '�����ܽ��3k~4k'
when sum(���) >= 4000 and sum(���)< 5000 then '�����ܽ��4k~5k'
else '����5k' end as ����_new
from dbo.vip��Ա���������ļ���
where ����ʱ�� >= '2016-01-01' and ����ʱ�� <'2017-01-01'---ÿ��ȷֱ���,�ֶ���ͬ,�����޸�
)aa

select ����_new,count(����_new) as ����_new_cnt
,(select count(����_new) from vip���׽�����_2016) as ���н��εĴ���
,round((cast(count(����_new) as float) / (select cast(count(����_new) as float) from vip���׽�����_2016)),2) as �ٷ�ռ��
 from vip���׽�����_2016
 group by ����_new
---�˽����������,�ý��γ��ֵĴ���,���ֱ��ռ��,����ȵ�����ˮƽ��������ͬ