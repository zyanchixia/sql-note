
SQL�е�join�÷�:

JOIN ��Ϊ:������(INNER JOIN),������(OUTER JOIN).����,�����ӷ�Ϊ:��������(LEFT OUTER JOIN),
��������(RIGHT OUTER JOIN),ȫ������(FULL OUTER JOIN),���������ӵ�"OUTER"�ؼ��ֿ���ʡ�Բ�д.

��: ��A����ID,ֵΪ: 1 2 3 4  ��B����ID,ֵΪ: 3 4 5 6

1.������(��ʾ������������ȫƥ�������):

select A.ID, B.ID from A INNER JOIN B ON A.ID = B.ID
���Ϊ: 3    3 4    4

2.��������(��ʾ�����������,�ұ�ƥ�䲻�ϵ���ʾΪNULL):
select A.ID, B.ID from A LEFT JOIN B ON A.ID = B.ID
���Ϊ: 1    NULL 2    NULL 3    3 4    4

3.��������(��ʾ�ұ���������,���ƥ�䲻�ϵ���ʾΪNULL):
select A.ID, B.ID from A RIGHT JOIN B ON A.ID = B.ID
���Ϊ: 3    3 4    4 NULL    5 NULL    6


4.ȫ������(��ʾ������������������,����ƥ�䲻�ϵ���ʾΪNULL):
select A.ID, B.ID from A FULL OUTER JOIN B ON A.ID = B.ID
���Ϊ: 1    NULL 2    NULL 3    3 4    4 NULL    5 NULL    6