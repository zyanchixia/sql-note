select top 2 *
  from V_Fct_SummaryInfo2


select convert(varchar(10),rec_createtime,120) ����
,substring(Record,charindex(':',Record,charindex(':',Record))+1,8)
  from V_Fct_SummaryInfo2
    where Rec_CreateTime >='2018-03-21' and Rec_CreateTime<'2018-03-22'
 



 select 
 STUFF(Record,PATINDEX('%[^0-9]%',Record),1,'')
 ,PATINDEX('%[^0-9]%',Record) ��һ����Ϊ���ֵ��ַ����ֵ�λ�� 
 
   from V_Fct_SummaryInfo2
   where Rec_CreateTime >='2018-03-21' and Rec_CreateTime<'2018-03-22'
   and SerialNumber is not NULL

  select 
left(Record,charindex(':',Record,charindex(':',Record)+1))
  from V_Fct_SummaryInfo2
   where Rec_CreateTime >='2018-03-21' and Rec_CreateTime<'2018-03-22'
   and SerialNumber is not NULL
