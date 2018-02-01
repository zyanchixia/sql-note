

 -------------------4：会员在交易时的年龄及婚姻状态,datediff年龄分层
  ---PS:若出现交易编号为null的则证明该会员并无购买商品的记录，所以也不知道其交易时的年龄

 select * into vip_交易时的年龄及婚姻状态 
 from (
 select b.会员编号,交易编号,婚姻状态,生日
,datediff(year,生日,交易建立日) as age
,case 
  when datediff(year,生日,交易建立日) not between 0 and 107 then '其他'
  when datediff(year,生日,交易建立日) between 0 and 10 then '0岁~10岁'
  when datediff(year,生日,交易建立日) between 11 and 20 then '11~20岁'
  when datediff(year,生日,交易建立日) between 21 and 30 then '21~30岁'
  else '其他' end as age_lever
,case 
   when 婚姻状态 not in ('1','2','3') then '其他' 
   else 婚姻状态 end as 婚姻状态_new
  from dbo.vip会员基本资料文件夹 b
  left join dbo.vip订单明细文件 a 
  on a.会员编号= b.会员编号
  )aa
 




  --------------5：计算不重复交易编号下的会员交易时年龄及婚姻状态的次数及百分比
  --PS：由于在数据库中交易编号为narchar类型，所以计算时需转换成float类型并精确到小数点后2位

  select age_level as 年龄段 ,count(distinct 交易编号) as 交易次数
  ,(select count(distinct 交易次数) from vip_交易时的年龄及婚姻状态 ) as 交易总数
  ,round((cast(count(distinct 交易编号) as float)   / (select (cast(count(distinct 交易编号) as float) from vip_交易时的年龄及婚姻状态)),2) 
  as 年龄百分占比
   from vip_交易时的年龄及婚姻状态 
   group by age_level


  select 婚姻状态_new ,count(distinct 交易编号) as 成交次数
  ,(select distinct 交易次数 from vip_交易时的年龄及婚姻状态) as 交易总数
  ,round(cast( count(distinct 交易编号) as float) / (select (cast(count(distinct 交易次数) as float) from vip_交易时的年龄及婚姻状态)),2) as 婚姻状态百分比
   from vip_交易时的年龄及婚姻状态
   group by 婚姻状态_new