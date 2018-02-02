-------------9:产品组合:组合性产品和单项产品,需要将组合性商品拆开

--9.1:按照产品编号在不同订单中出现次数的前10名
select 产品编号,产品名称
,count(distinct 交易编号) as 产品在不同vip订单中出现的次数
from dbo.vip订单明细文件
group by 产品编号,产品名称
order by 产品在不同vip订单中出现的次数 desc

---9.2：按照产品编号排在不同会员消费过的产品人数前10名产品
select 产品编号,产品名称
,count(distinct 会员编号) as vip不同会员消费过产品的人数
from dbo.vip订单明细文件
group by 产品编号,产品名称
order by vip不同会员消费过产品的人数 desc

---9.3：所有顾客购买产品数量加总前10
select 产品编号,产品名称
,sum(产品数量) as vip产品组合总数量
from dbo.vip订单明细文件
group by 产品编号,产品名称
order by vip产品组合总数量 desc

---9.4：顾客购买产品消费总金额前10的产品
select 产品编号,产品名称
,sum(产品单价*产品数量) as vip消费总金额
from dbo.vip订单明细文件
group by 产品编号,产品名称
order by vip消费总金额 desc

