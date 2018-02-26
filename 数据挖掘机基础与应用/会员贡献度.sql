--12：会员贡献度 P85 不同年度所加入会员的贡献度，及各年度不同时间点的平均销额
with test as(
select distinct a.会员编号,交易编号,vip建立日,vip终止日,金额,交易建立日
,case when vip建立日>='2014-01-01' and vip建立日<'2015-01-01' then '2014'
      when vip建立日>='2015-01-01' and vip建立日<'2016-01-01' then '2015'
	  when vip建立日>='2016-01-01' and vip建立日<'2017-01-01' then '2016'
	  when vip建立日>='2017-01-01' and vip建立日<'2018-01-01' then '2018'
 end as 加入年度
 ,case when datediff(day,vip建立日,交易建立日)<='365' then '第一年'
 when when datediff(day,vip建立日,交易建立日)>='366'
  and when datediff(day,vip建立日,交易建立日) <'730' then '第二年'
when when datediff(day,vip建立日,交易建立日)>='731'
  and when datediff(day,vip建立日,交易建立日) <'1095' then '第三年'
when when datediff(day,vip建立日,交易建立日)>='1096'
  and when datediff(day,vip建立日,交易建立日) <'1082' then '第四年'
else '其他' end as 购买年度
from vip会员基本资料文件 a left join vip 订单明细文件 b
on a.会员编号 = b.会员编号
where b.会员编号 not in ('')--将目前数据库中没有订单记录的会员不计入在内
and datediff(day,vip建立日,交易建立日)>0--顾客成为vip会员之后的消费
group by  a.会员编号,交易编号,vip建立日,vip终止日,金额,交易建立日
)
--虚拟表格字段：会员编号,交易编号,vip建立日,vip终止日,金额,交易建立日,加入年度,购买年度
select 加入年度,购买年度
,sum(金额) as 总金额
from test
group by 加入年度,购买年度
order by 加入年度
--会员人均贡献度= 总金额/当年会员人数