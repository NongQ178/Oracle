--------�ַ�����--------------------

LOWER---ת����Сд
select lower('ABCDE')
from dual

UPPER---ת���ɴ�д
select upper('abcde')
from dual

INITCAP---�ѵ��ʵ�����ĸת���ɴ�д

select initcap('pujing tuolasiji')
from dual

CONCAT---ƴ���ַ������Ѷ������ƴ��������������������������

select concat(ename,job)
from emp

---��һ��������Ҫ��ȡ������Դ���ڶ��������Ǵ����￪ʼ��ȡ�������������ǽ�ȡ���ٸ��ַ�
---ע�⣺�ڶ������������Ǹ�������ʾ���ҿ�ʼ��ȡ�����ǽ�ȡ�ķ���������
SUBSTR
select substr('abcdefg',-3,2)----�����  ef
from dual

select substr('abcdefg',3,2)----�����  cd
from dual



LENGTH---��ȡ�ַ����ĳ���
select length('abcedfg')
from dual

INSTR---IN��ʾindex����д������������˼
select instr('abcdef','c')---3
from dual


LPAD---�����

select lpad('abc',11,'*')-----  ********abc
from dual

RPAD---�����
select rpad('abc',11,'*')-----  abc********
from dual

REPLACE----�滻

select replace('abcdef','c','p')---abpdef
from dual



TRIM---ɾ��,ֻ��ɾ��ǰ��ͺ��������

select trim('c' from 'ccabcdefcccc')----abcdef
from dual


=================================================================================
1.дһ����ѯ,
������ĸ��д��������ĸСд��ʾ��Ա�� ename����ʾ���ֵĳ��ȣ�
����ÿ��һ���ʵ��ı�ǩ��

�������������й�Ա���ֵĿ�ʼ��ĸ��J��A �� M �Ĺ�Ա��

���Բ�ѯ�������Ա��ename�������򡣣���ʾ��ʹ��initcap��length��substr��

select initcap(ename) Ա������,length(ename) ���ֳ���
from emp
where substr(ename,1,1) in ('J','A','M')
order by ename;

3.��ѯÿ��ְ���ı��,����������  
Ҫ�󽫲�ѯ�������ݰ���һ���ĸ�ʽ�ϲ���һ���ַ���.
ǰ10λ�����,���㲿����*���,�����
�м�10λ�����������㲿����*���,�����
��10λ�����ʣ����㲿����*���,�Ҷ���


select rpad(empno,10,'*')||rpad(ename,10,'*')||lpad(sal,10,'*')
from emp----����һ

select concat(concat(rpad(empno,10,'*'),rpad(ename,10,'*')),lpad(sal,10,'*'))
from emp----������

==================================================================
��ֵ����

round---һ����������ĺ���
select round(12.645)
from dual


select trunc(45.926,-1)---40
from dual

======================================================================
�������ں���
SYSDATE������ϵͳ����
select sysdate+1  ----ֱ�Ӽ�1���Ǽ�һ��
from dual


MONTHS_BETWEEN����������������������֮��������Ȼ����

select sysdate,hiredate,trunc(months_between(sysdate,hiredate)) �������
from emp


ADD_MONTHS������ָ�����ڼ�����Ӧ�������������

select add_months(hiredate,12)
from emp


NEXT_DAY������ĳһ���ڵ���һ��ָ������ 
select hiredate,next_day(hiredate,'����һ')
from emp

LAST_DAY������ָ�����ڵ������һ�������

select hiredate,last_day(hiredate)
from emp

ROUND(date[,��fmt��])��date����fmtָ���ĸ�ʽ�����������룬fmtΪ��ѡ����û��ָ��fmt����Ĭ��ΪDD����date��������Ϊ������졣
��ʽ�룺����CC,��YY����MM,��DD��СʱHH24����MI����SS
select sysdate ��ʱ����,
round(sysdate) ���0������,
round(sysdate,'day') ���������,
round(sysdate,'month') ����³�,
round(sysdate,'q') �����������, 
round(sysdate,'year') ���������� from dual;




TRUNC(date[,��fmt��])��date����fmtָ���ĸ�ʽ���нضϣ�fmtΪ��ѡ����û��ָ��fmt����Ĭ��Ϊ��DD������date��ȡΪ������졣 

select sysdate ��ʱ����,
trunc(sysdate) ��������,
trunc(sysdate,'day') ����������,
trunc(sysdate,'month') ���³�,
trunc(sysdate,'q') ����������, 
trunc(sysdate,'year') ��������� from dual;----������������



EXTRACT�������������������е���ݡ��·ݻ����գ���ʱ���롣

�ر�ע�⣺�����ȡʱ���룬��Ŀ�����ݵ��������ͱ�����timestamp����

select 
extract(hour from timestamp '2001-2-16 2:38:40 ' ) Сʱ,
extract(minute from timestamp '2001-2-16 2:38:40 ' ) ����,
extract(second from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(DAY from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(MONTH from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(YEAR from timestamp '2001-2-16 2:38:40 ' ) ��
 from dual;

select extract (YEAR from date '2001-2-16' ) from dual; 


select sysdate ��ǰ����,
extract(hour from  systimestamp)+8 Сʱ,----����ʱ��
extract(DAY from sysdate ) ��,
extract(MONTH from sysdate ) ��,
extract(YEAR from sysdate ) ��
 from dual;
 
======================================
ת������
select to_char(hiredate,'dd/MM/YYYY YEAR MONTH DAY DY  Month'),TO_CHAR(SAL,'$99,999')
from emp
 
 -----0 NINETEEN EIGHTY 12�� ������ ������  12��      $800
 
 select to_char(hiredate,'dd/MM/YYYY YEAR MONTH DAY DY  Month'),TO_CHAR(SAL,'L99,999')
from emp

------17/12/1980 NINETEEN EIGHTY 12�� ������ ������  12��      ��800

---------------TO_NUMBER()   TO_DATE()

SELECT TO_NUMBER('��800','L99,999')
FROM DUAL


SELECT TO_DATE('2020/12/25','YYYY/MM/DD')
FROM DUAL

SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:mm:SS')----HH:12ʱ   HH24:24ʱ
FROM DUAL

------------------------------ͨ�ú���

nvl2:


select empno,nvl2(comm,'�н���','�޽���')
from emp


select nullif('1','12')
from dual


==============================================================
���󣺲�ѯԱ�����������ű�ţ���������
case��䣺

select ename,deptno,(case deptno when 10 then '���۲�' 
                                 when 20 then '������'
                                 when 30 then '����'
                                   else '��' 
                                     end) ��������
from emp;


decode������


select ename,deptno,decode(deptno,10,'���۲�',20,'������',30,'����','��') ��������
from emp;












 




















