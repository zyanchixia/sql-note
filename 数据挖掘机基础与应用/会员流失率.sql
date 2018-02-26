--11：会员流失率，与公司制定的营销策略，公司产品质量，客服人员服务态度等有关
--计算流失率时只针对有消费记录的会员
with test as 
(
select distinct a.会员编号,vip建立日,vip终止日
,case when vip建立日>='2014-01-01' and vip建立日<'2015-01-01' then '2014'
      when vip建立日>='2015-01-01' and vip建立日<'2016-01-01' then '2015'
	  when vip建立日>='2016-01-01' and vip建立日<'2017-01-01' then '2016'
	  when vip建立日>='2017-01-01' and vip建立日<'2018-01-01' then '2018'
 end as 加入年度
 ,case when datediff(day,vip建立日,vip终止日)<='365' then '第一年'
 when when datediff(day,vip建立日,vip终止日)>='366'
  and when datediff(day,vip建立日,vip终止日) <'730' then '第二年'
when when datediff(day,vip建立日,vip终止日)>='731'
  and when datediff(day,vip建立日,vip终止日) <'1095' then '第三年'
when when datediff(day,vip建立日,vip终止日)>='1096'
  and when datediff(day,vip建立日,vip终止日) <'1082' then '第四年'
else '其他' end as 流失年度
from vip会员基本资料文件 a left join vip 订单明细文件 b
on a.会员编号 = b.会员编号
where b.会员编号 not in ('')--将目前数据库中没有订单记录的会员不计入在内
group by  a.会员编号,vip建立日,vip终止日
)
--建立虚拟表格，将数据通过计算呈现
select 加入年度,流失年度,count(流失年度) as 流失人数
 from test
 group by 加入年度,流失年度
 order by 加入年度
 --流失率= 流失人数/当年会员人数