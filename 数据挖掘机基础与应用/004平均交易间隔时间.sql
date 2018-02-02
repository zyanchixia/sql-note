---8:平均交易间隔时间,可做促销活动时间安排 
--PS:字段:会员编号,交易建立日,交易编号,下一笔交易订单日,下一笔交易编号,间隔天数
--当虚拟表格b中交易建立日>表格a的交易建立日，select top 1 指令取第一个结果值，时间间隔有n-1个

with test as
(
select distinct a.会员编号,a.交易建立日,a.交易编号
,(select top 1 b.交易建立日 from dbo.vip订单明细文件 b
where a.会员编号 = b.会员编号
and a.交易建立日 > b.交易建立日
) as 下一笔交易建立日
,(select top 1 b.交易编号 from dbo.vip订单明细文件 b 
where  a.会员编号 = b.会员编号
and a.交易建立日 > b.交易建立日
) as 下一笔交易编号
,datediff(dd,交易建立日,(select top 1 b.交易建立日 from dbo.vip订单明细文件 b
where a.会员编号 = b.会员编号
and a.交易建立日 > b.交易建立日
)) as 间隔天数
from dbo.vip订单明细文件 a
)
---------
select * into vip会员平均交易间隔时间
from (
select distinct 会员编号,count(交易编号)as 交易次数
,sum(datediff(dd,交易建立日,下一个交易建立日)) as 间隔天数加总
,case 
when count(交易编号) >1 then 
(sum(datediff(dd,交易建立日,下一个交易建立日))) /(count(交易编号)-1)
else '0' end as 平均订单天数
from test
group by 会员编号
)


