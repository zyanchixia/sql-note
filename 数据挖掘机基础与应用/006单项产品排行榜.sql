---9.5单项产品排行榜：需拆解组合性产品
--字段:产品编号,组成货号,订单笔数,订单_qty,组成数量，qty_total,组成类别

select * into 拆解产品组合文件
from (
select a.产品编号,b.产品组成一 As 组成货号
,count(distinct a.交易编号) as 订单笔数
,sum(a.产品数量) as 订单_qty
,b.组成一数量 as 组成数量
,sum(产品数量)*b.组成一数量 as qty_total
,case when b.产品组成一 not in ('') then '1'
else '其他' end as 组成类别
 from dbo.vip订单明细文件 a 
 left join dbo.组成货号档 b  on a.产品编号= b.产品编号
group by a.产品编号,b.产品组成一,b.组成一数量

union all

select a.产品编号,b.产品组成二 As 组成货号
,count(distinct a.交易编号) as 订单笔数
,sum(a.产品数量) as 订单_qty
,b.组成一数量 as 组成数量
,sum(产品数量)*b.组成二数量 as qty_total
,case when b.产品组成二 not in ('') then '1'
else '其他' end as 组成类别
 from dbo.vip订单明细文件 a 
 left join dbo.组成货号档 b  on a.产品编号= b.产品编号
group by a.产品编号,b.产品组成二,b.组成二数量

union all

select a.产品编号,b.产品组成三 As 组成货号
,count(distinct a.交易编号) as 订单笔数
,sum(a.产品数量) as 订单_qty
,b.组成一数量 as 组成数量
,sum(产品数量)*b.组成三数量 as qty_total
,case when b.产品组成三 not in ('') then '1'
else '其他' end as 组成类别
 from dbo.vip订单明细文件 a 
 left join dbo.组成货号档 b  on a.产品编号= b.产品编号
group by a.产品编号,b.产品组成三,b.组成一数量
) aa ----拆解完成

--组成货号，产品编号，订单笔数，订单出现总次数，销售总数量
select a.组成货号,b.产品编号
,sum(订单笔数) As 订单笔数
,sum(订单_qty) as 订单出现总次数
,sum(qty_total) as 销售总数量
 from 拆解产品组合文件 a 
 left join 组成货号档 b on a.组成货号 = b.组成货号
 group by a.组成货号,b.产品编号
 order by 销售总数量 desc
