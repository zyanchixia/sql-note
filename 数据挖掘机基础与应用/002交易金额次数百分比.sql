---------6:交易金额次数百分比:分年度观察其各年度交易金额的次数百分比
--PS:每个订单的交易总额，分层；条件：年度；结果：计算交易金额占比
--PS：由于在数据库中交易编号为narchar类型，所以计算时需转换成float类型并精确到小数点后2位
select * into vip交易金额次数_2016
 from (
select 
distinct 交易编号 ,sum(金额) as 交易总金额
,case 
when sum(金额) < 500 then '交易总金额<500'
when sum(金额) >= 500 and sum(金额) < 1000 then '交易总金额0.5k~1k'
when sum(金额) >= 1000 and sum(金额)< 2000 then '交易总金额1k~2k'
when sum(金额) >= 2000 and sum(金额)< 3000 then '交易总金额2k~3k'
when sum(金额) >= 3000 and sum(金额)< 4000 then '交易总金额3k~4k'
when sum(金额) >= 4000 and sum(金额)< 5000 then '交易总金额4k~5k'
else '大于5k' end as 金额段_new
from dbo.vip会员基本资料文件夹
where 交易时间 >= '2016-01-01' and 交易时间 <'2017-01-01'---每年度分别做,字段相同,日期修改
)aa

select 金额段_new,count(金额段_new) as 金额段_new_cnt
,(select count(金额段_new) from vip交易金额次数_2016) as 所有金额段的次数
,round((cast(count(金额段_new) as float) / (select cast(count(金额段_new) as float) from vip交易金额次数_2016)),2) as 百分占比
 from vip交易金额次数_2016
 group by 金额段_new
---此结果出来金额段,该金额段出现的次数,及分别的占比,各年度的消费水平会有所不同