--7:vip会员红利积点次数分配百分比:积点次数分配情形及其百分比
---PS:每个交易编号的红利和,分层并命名,计算百分比

select * into vip会员红利积点
from (
select distinct 交易编号,sum(红利积点) As 红利积点总和
,case
when sum(红利积点) <50 then '红利积点总和小于50'
when sum(红利积点) >=50 and sum(红利积点) < 100 then '红利积点总和50~100'
when sum(红利积点) >=100 and sum(红利积点) < 2000 then '红利积点总和100~200'
when sum(红利积点) >=200 and sum(红利积点) < 300 then '红利积点总和200~300'
when sum(红利积点) >=300 and sum(红利积点) < 400 then '红利积点总和300~400'
when sum(红利积点) >=400 and sum(红利积点) < 500 then '红利积点总和400~500'
else '红利积点大于等于500' end as 红利积点_new
from dbo.vip会员基本资料文件夹
group by 交易编号
)aa

select 红利积点_new, count(红利积点_new) as 红利积点_new_cnt
,(select count(红利积点_new)) as 红利积点总数
,round((cast(count(红利积点_new) as float) /  (select cast (count(红利积点_new) as float) from vip会员红利积点)),4) as 红利积点百分比
 from vip会员红利积点
 group by 红利积点_new