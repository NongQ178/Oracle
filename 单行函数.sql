--------字符函数--------------------

LOWER---转换成小写
select lower('ABCDE')
from dual

UPPER---转换成大写
select upper('abcde')
from dual

INITCAP---把单词的首字母转换成大写

select initcap('pujing tuolasiji')
from dual

CONCAT---拼接字符串，把多个参数拼接起来，参数两个，三个不行

select concat(ename,job)
from emp

---第一个参数是要截取的数据源，第二个参数是从哪里开始截取，第三个参数是截取多少个字符
---注意：第二个参数可以是负数，表示自右开始截取，但是截取的方向都是往右
SUBSTR
select substr('abcdefg',-3,2)----结果是  ef
from dual

select substr('abcdefg',3,2)----结果是  cd
from dual



LENGTH---获取字符串的长度
select length('abcedfg')
from dual

INSTR---IN表示index的缩写，是索引的意思
select instr('abcdef','c')---3
from dual


LPAD---左填充

select lpad('abc',11,'*')-----  ********abc
from dual

RPAD---右填充
select rpad('abc',11,'*')-----  abc********
from dual

REPLACE----替换

select replace('abcdef','c','p')---abpdef
from dual



TRIM---删除,只能删除前面和后面的数据

select trim('c' from 'ccabcdefcccc')----abcdef
from dual


=================================================================================
1.写一个查询,
用首字母大写，其它字母小写显示雇员的 ename，显示名字的长度，
并给每列一个适当的标签，

条件是满足所有雇员名字的开始字母是J、A 或 M 的雇员，

并对查询结果按雇员的ename升序排序。（提示：使用initcap、length、substr）

select initcap(ename) 员工姓名,length(ename) 名字长度
from emp
where substr(ename,1,1) in ('J','A','M')
order by ename;

3.查询每个职工的编号,姓名，工资  
要求将查询到的数据按照一定的格式合并成一个字符串.
前10位：编号,不足部分用*填充,左对齐
中间10位：姓名，不足部分用*填充,左对齐
后10位：工资，不足部分用*填充,右对齐


select rpad(empno,10,'*')||rpad(ename,10,'*')||lpad(sal,10,'*')
from emp----方案一

select concat(concat(rpad(empno,10,'*'),rpad(ename,10,'*')),lpad(sal,10,'*'))
from emp----方案二

==================================================================
数值函数

round---一个四舍五入的函数
select round(12.645)
from dual


select trunc(45.926,-1)---40
from dual

======================================================================
常用日期函数
SYSDATE：返回系统日期
select sysdate+1  ----直接加1就是加一天
from dual


MONTHS_BETWEEN：返回两个日期类型数据之间间隔的自然月数

select sysdate,hiredate,trunc(months_between(sysdate,hiredate)) 间隔月数
from emp


ADD_MONTHS：返回指定日期加上相应的月数后的日期

select add_months(hiredate,12)
from emp


NEXT_DAY：返回某一日期的下一个指定日期 
select hiredate,next_day(hiredate,'星期一')
from emp

LAST_DAY：返回指定日期当月最后一天的日期

select hiredate,last_day(hiredate)
from emp

ROUND(date[,‘fmt’])将date按照fmt指定的格式进行四舍五入，fmt为可选项，如果没有指定fmt，则默认为DD，将date四舍五入为最近的天。
格式码：世纪CC,年YY，月MM,日DD，小时HH24，分MI，秒SS
select sysdate 当时日期,
round(sysdate) 最近0点日期,
round(sysdate,'day') 最近星期日,
round(sysdate,'month') 最近月初,
round(sysdate,'q') 最近季初日期, 
round(sysdate,'year') 最近年初日期 from dual;




TRUNC(date[,‘fmt’])将date按照fmt指定的格式进行截断，fmt为可选项，如果没有指定fmt，则默认为‘DD’，将date截取为最近的天。 

select sysdate 当时日期,
trunc(sysdate) 今天日期,
trunc(sysdate,'day') 本周星期日,
trunc(sysdate,'month') 本月初,
trunc(sysdate,'q') 本季初日期, 
trunc(sysdate,'year') 本年初日期 from dual;----不会四舍五入



EXTRACT：返回日期类型数据中的年份、月份或者日，和时分秒。

特别注意：如果获取时分秒，则目标数据的数据类型必须是timestamp类型

select 
extract(hour from timestamp '2001-2-16 2:38:40 ' ) 小时,
extract(minute from timestamp '2001-2-16 2:38:40 ' ) 分钟,
extract(second from timestamp '2001-2-16 2:38:40 ' ) 秒,
extract(DAY from timestamp '2001-2-16 2:38:40 ' ) 日,
extract(MONTH from timestamp '2001-2-16 2:38:40 ' ) 月,
extract(YEAR from timestamp '2001-2-16 2:38:40 ' ) 年
 from dual;

select extract (YEAR from date '2001-2-16' ) from dual; 


select sysdate 当前日期,
extract(hour from  systimestamp)+8 小时,----加上时差
extract(DAY from sysdate ) 日,
extract(MONTH from sysdate ) 月,
extract(YEAR from sysdate ) 年
 from dual;
 
======================================
转换函数
select to_char(hiredate,'dd/MM/YYYY YEAR MONTH DAY DY  Month'),TO_CHAR(SAL,'$99,999')
from emp
 
 -----0 NINETEEN EIGHTY 12月 星期三 星期三  12月      $800
 
 select to_char(hiredate,'dd/MM/YYYY YEAR MONTH DAY DY  Month'),TO_CHAR(SAL,'L99,999')
from emp

------17/12/1980 NINETEEN EIGHTY 12月 星期三 星期三  12月      ￥800

---------------TO_NUMBER()   TO_DATE()

SELECT TO_NUMBER('￥800','L99,999')
FROM DUAL


SELECT TO_DATE('2020/12/25','YYYY/MM/DD')
FROM DUAL

SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:mm:SS')----HH:12时   HH24:24时
FROM DUAL

------------------------------通用函数

nvl2:


select empno,nvl2(comm,'有奖金','无奖金')
from emp


select nullif('1','12')
from dual


==============================================================
需求：查询员工姓名，部门编号，部门名称
case语句：

select ename,deptno,(case deptno when 10 then '销售部' 
                                 when 20 then '技术部'
                                 when 30 then '管理部'
                                   else '无' 
                                     end) 部门名称
from emp;


decode函数：


select ename,deptno,decode(deptno,10,'销售部',20,'技术部',30,'管理部','无') 部门名称
from emp;












 




















