---10:产品的重复购买率:拆解每个会员在每个产品的组成一二三四,计算各自的订单笔数,订单_qty(在订单中出现的总次数),qty_total(销售总数量)
select * into #test_vip
from (
select a.会员编号,a.产品编号,b.产品组成一 as 组成货号
,count(distinct a.交易编号) as 订单笔数
,sum(a.产品数量) as  订单_qty
,b.组成一数量 as 组成数量
,sum(产品数量)*b.组成一数量 as  qty_total
,case when b.产品组成一 not in ('') then '1'
else '其他' end as 组成类别
from vip订单明细文件 a 
left join 组成货号档 b on a.产品编号 = b.产品编号
group by a.会员编号,a.产品编号,b.产品组成一,b.组成一数量 

union all 

select a.会员编号,a.产品编号,b.产品组成二 as 组成货号
,count(distinct a.交易编号) as 订单笔数
,sum(a.产品数量) as  订单_qty
,b.组成二数量 as 组成数量
,sum(产品数量)*b.组成二数量 as  qty_total
,case when b.产品组成二 not in ('') then '2'
else '其他' end as 组成类别
from vip订单明细文件 a 
left join 组成货号档 b on a.产品编号 = b.产品编号
group by a.会员编号,a.产品编号,b.产品组成二,b.组成一数量 

)test

---test 表中字段：会员编号,产品编号,组成货号,订单笔数,订单_qty,组成数量,组成类别
select * into 重复购买_vip
from(
select distinct 组成货号
,(case when  订单笔数 in ('1') then count(会员编号) end ) as 订单_1
,(case when 订单笔数 in  ('2') then count(会员编号) end ) as 订单_2
,(case when 订单笔数 in  ('3') then count(会员编号) end ) as 订单_3
,(case when 订单笔数 in  ('4') then count(会员编号) end ) as 订单_4
 from test_vip 
where 组成货号 not in ('')
group by 组成货号,订单笔数
)test
--重复购买_vip表中字段：组成货号,订单_1,订单_2...则可计算出占比