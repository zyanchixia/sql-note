

 -------------------4����Ա�ڽ���ʱ�����估����״̬,datediff����ֲ�
  ---PS:�����ֽ��ױ��Ϊnull����֤���û�Ա���޹�����Ʒ�ļ�¼������Ҳ��֪���佻��ʱ������

 select * into vip_����ʱ�����估����״̬ 
 from (
 select b.��Ա���,���ױ��,����״̬,����
,datediff(year,����,���׽�����) as age
,case 
  when datediff(year,����,���׽�����) not between 0 and 107 then '����'
  when datediff(year,����,���׽�����) between 0 and 10 then '0��~10��'
  when datediff(year,����,���׽�����) between 11 and 20 then '11~20��'
  when datediff(year,����,���׽�����) between 21 and 30 then '21~30��'
  else '����' end as age_lever
,case 
   when ����״̬ not in ('1','2','3') then '����' 
   else ����״̬ end as ����״̬_new
  from dbo.vip��Ա���������ļ��� b
  left join dbo.vip������ϸ�ļ� a 
  on a.��Ա���= b.��Ա���
  )aa
 




  --------------5�����㲻�ظ����ױ���µĻ�Ա����ʱ���估����״̬�Ĵ������ٷֱ�
  --PS�����������ݿ��н��ױ��Ϊnarchar���ͣ����Լ���ʱ��ת����float���Ͳ���ȷ��С�����2λ

  select age_level as ����� ,count(distinct ���ױ��) as ���״���
  ,(select count(distinct ���״���) from vip_����ʱ�����估����״̬ ) as ��������
  ,round((cast(count(distinct ���ױ��) as float)   / (select (cast(count(distinct ���ױ��) as float) from vip_����ʱ�����估����״̬)),2) 
  as ����ٷ�ռ��
   from vip_����ʱ�����估����״̬ 
   group by age_level


  select ����״̬_new ,count(distinct ���ױ��) as �ɽ�����
  ,(select distinct ���״��� from vip_����ʱ�����估����״̬) as ��������
  ,round(cast( count(distinct ���ױ��) as float) / (select (cast(count(distinct ���״���) as float) from vip_����ʱ�����估����״̬)),2) as ����״̬�ٷֱ�
   from vip_����ʱ�����估����״̬
   group by ����״̬_new