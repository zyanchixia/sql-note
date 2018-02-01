--客户基本资料整理
/*将数据中的居住地址整理为各县市,用substring指令将居住地字段中的前3个字符提取出来,
并将它纳入虚拟表格test表中,然后用count指令检查区域变量的数据状况
*/
with test as
(
select 会员编号,性别,生日,婚姻状态
,职业,入会渠道,会员生日,vip到期日
,substring(居住地,1,3) as 区域
from dbo.vip会员基本资料文件夹
)
select 区域,count(区域)
from test
group by 区域

----1:看到执行的结果,可以思考将数据进行进一步的整理,对于区域,用case  when then 指令归类
select into dbo.vip会员基本资料文件夹1
from( 
select 会员编号,性别--------可分析维度
,生日
,case when 婚姻状态 = '1' then '未婚'
when 婚姻状态 = '2' then '已婚' else '其他' end as 婚姻状态婚姻状态-----可分析维度
,职业-----可分析维度
,入会渠道-----可分析维度
,会员生日,vip到期日
,case when  substring(居住地,1,3) ='台北县' then '台北县'
      when  substring(居住地,1,3) ='台中县' then '台中县'
else '其他' 
end as 区域-----可分析维度
from dbo.vip会员基本资料文件夹
)aa



-----2:利用字段"会员入会日"和"vip到期日",用datediff计算会员入会时间长度,然后以年期作为呈现方式  
select into dbo.vip会员基本资料文件夹2
From(
select 会员编号,性别,生日,婚姻状态,职业,入会渠道,
会员入会起,vip到期日,区域
,case when datediff(day,会员入会日,vip到日期)>='0' and datediff(day,会员入会日,vip到日期) <'366' then '一年期'
 when datediff(day,会员入会日,vip到日期)>='367' and datediff(day,会员入会日,vip到日期) <'731' then '二年期'
 when datediff(day,会员入会日,vip到日期)>='732' and datediff(day,会员入会日,vip到日期) <'1096' then '二年期'
 else '其他' end as '会籍长度'
 from dbo.vip会员基本资料文件夹1
)aa


-------------------------------3：交易周期的变化

select datepart(yyyy,交易建立日) as 年度
,datepart(mm,交易建立日) as 月份
,count(distinct 交易编号) as 每月交易次数
 from dbo.vip会员基本资料文件夹
 group by datepart(yyyy,交易建立日) ,datepart(mm,交易建立日)
 order by 年度,月份
