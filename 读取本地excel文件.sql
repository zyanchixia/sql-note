
--excel���ճ���������Ȼռ����Ҫ��λ������ڲ���excel��ǰ���£������ݴ��������Ҫ���أ�

exec sp_configure 'show advanced options',1  
reconfigure  
exec sp_configure 'Ad Hoc Distributed Queries',1  
reconfigure 
EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1 --win7-2012-64
EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1


if object_id('tempdb..#wp','U') is not null drop table #wp
SELECT * INTO #wp  FROM 
OPENROWSET
('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;
DATABASE=base\text.xls',[sheet1$] )--��Ϊ���Լ����ļ����λ��
--��ô��������:���һ��excel����n��sheet��?

exec sp_configure 'Ad Hoc Distributed Queries',0  
reconfigure  
exec sp_configure 'show advanced options',0  
reconfigure 