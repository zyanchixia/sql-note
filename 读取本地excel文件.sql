
--excel在日常工作中仍然占有重要地位，如何在不打开excel的前提下，将数据处理成所需要的呢？

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
DATABASE=base\text.xls',[sheet1$] )--改为你自己的文件存放位置
--那么问题来了:如果一个excel中有n个sheet呢?

exec sp_configure 'Ad Hoc Distributed Queries',0  
reconfigure  
exec sp_configure 'show advanced options',0  
reconfigure 