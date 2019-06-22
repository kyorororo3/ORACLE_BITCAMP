--4
--1)
SELECT LOWER(last_name), employee_id, first_name, Lower(job_id), department_id
FROM employees
WHERE last_name = 'King';

--�˻��� �ҹ��ڷ� �ߴٴ� ���� �߿��ϴ� �˻��� �� �ҹ��ڷ� �Է��ϴ� ������� �����ϱ�
SELECT LOWER(last_name), employee_id, first_name, Lower(job_id), department_id
FROM employees
WHERE LOWER(last_name) = 'king';
--2)
SELECT UPPER(last_name), employee_id, first_name, UPPER(job_id), department_id
FROM employees
WHERE last_name = 'King';
--------------------------------------------------------------------------------
SELECT UPPER(last_name), employee_id, first_name, UPPER(job_id), department_id
FROM employees
WHERE UPPER(last_name) = 'KING';


--3)
SELECT CONCAT(department_id, department_name), CONCAT(department_name,location_id)
FROM departments;
-------------------------------------------------------------------------------
SELECT department_id || ' ' || department_name, department_name || ' ' || location_id
FROM departments;

--4)
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE first_name BETWEEN 'K' AND 'Y'
ORDER BY first_name ASC;  -- �̰Ŵ� ��� k�� ����
-----------------------------------------------------------------------
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE SUBSTR(last_name, 1,1) > 'K'
    AND SUBSTR(last_name, 1,1) < 'Y'
ORDER BY last_name ASC;

--5)
SELECT employee_id, last_name, LENGTH(last_name), salary, LENGTH(salary) 
FROM employees
WHERE department_id = 20;

--6)
SELECT first_name, INSTR(first_name,'e',1,1)
FROM employees;

SELECT first_name, INSTR(first_name,'e')
FROM employees
WHERE first_name LIKE '%e%';

--7)
SELECT ROUND(4567.678), ROUND(4567.678,0), ROUND(4567.678,2), ROUND(4567.678,-2)
FROM DUAL;

--8)
SELECT department_id, first_name, salary, MOD(salary,30)
FROM employees
WHERE department_id = 80;

--9)
SELECT last_name||CHR(13)||CHR(10)||job_id
FROM employees
WHERE department_id = 30;
--������ �߰��� ����־�� 
SELECT last_name||CHR(10)||job_id
FROM employees
WHERE department_id = 30;
-- CHR(10) == \n
--10)
SELECT first_name, hire_date AS "WORKING DAYS" ,TRUNC(SYSDATE)-hire_date,
        ROUND((TRUNC(SYSDATE)- hire_date)/7) AS "WORKING WEEKS" 
FROM employees
ORDER BY "WORKING DAYS" ASC;

--Ư����¥ 
SELECT last_name, hire_date, TO_DATE('09/06/12'), 
       TRUNC(TO_DATE('09/06/12') - hire_date) AS "�ѱٹ� �ϼ�",
       TRUNC((TO_DATE('09/06/12') - hire_date)/7) AS "�ѱٹ� ���ϼ�",
       MOD((TO_DATE('09/06/12') - hire_date),7) AS "���� �ϼ�"
FROM employees
ORDER BY "�ѱٹ� �ϼ�" DESC;
--11)
SELECT first_name,department_id, salary,TO_CHAR(salary, '$999,999')
FROM employees
WHERE department_id = 50;

--12) 
SELECT employee_id, last_name, job_id, salary,
DECODE(JOB_ID,
    'IT_PROG', SALARY*1.1,
    'ST_MAN', SALARY*1.15,
    'SA_MAN', SALARY*1.2, SALARY)
FROM employees
WHERE JOB_ID IN ('IT_PROG', 'ST_MAN', 'SA_MAN')
ORDER BY SALARY DESC;
--5
--1)

SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary)
FROM EMPLOYEES
WHERE JOB_ID LIKE 'SA%';

SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary)
FROM employees
GROUP BY job_id
HAVING JOB_ID = 'SA_MAN';

--2)
SELECT department_id,AVG(commission_pct), COUNT(commission_pct)
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) IS NOT NULL
       AND COUNT(department_id) <>0
       AND AVG(commission_pct) IS NOT NULL;

SELECT COUNT(employee_id), COUNT(*), TRUNC(AVG(commission_pct * SALARY)),
    COUNT(DISTINCT department_id)
FROM employees;

       
--3)
SELECT department_id
FROM employees;

SELECT department_id,COUNT(salary), ROUND(AVG(salary)), MIN(salary), MAX(salary), SUM(salary)
FROM employees
GROUP BY department_id
HAVING DEPARTMENT_ID <>0;

--4)

SELECT department_id,COUNT(*), ROUND(AVG(SALARY)),  MIN(salary), MAX(salary), SUM(salary)
FROM employees
GROUP BY department_id
ORDER BY SUM(salary) DESC;

--5)
SELECT department_id, job_id, COUNT(salary), TRUNC(AVG(salary)), SUM(salary)
FROM employees
GROUP BY department_id , job_id;
--���������� ���� ���� ���������� �ϰ� ������ ����

--6)
SELECT department_id, COUNT(*), SUM(salary) 
FROM employees
GROUP BY department_id
HAVING COUNT(salary) >4;

--7)
SELECT department_id, ROUND(AVG(salary)), SUM(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) >= 10000;

--8)
SELECT job_id, ROUND(AVG(salary)), SUM(salary)
FROM employees
GROUP BY job_id
HAVING ROUND(AVG(salary)) >= 10000;

--9)
SELECT job_id, SUM(salary)
FROM employees
WHERE salary >10000
GROUP BY job_id
HAVING job_id NOT LIKE ('SA_%')
ORDER BY SUM(salary) DESC;

SELECT job_id, SUM(salary)
FROM employees
WHERE job_id NOT LIKE ('SA_%')
GROUP BY job_id
HAVING SUM(salary) >10000
ORDER BY SUM(salary) DESC;

--scott
--23)
SELECT CONCAT(UPPER(SUBSTR(JOB,1,1)), LOWER(SUBSTR(JOB,2)))
FROM emp;

--INITCAP ù���ڸ� �빮�ڷ� ����� ��
SELECT job, INITCAP(job)
FROM EMP;

--24)
SELECT  ENAME, SUBSTR(ename,1,3) --subString("ABCDE", 1, 4) -> BCD 4�� ������ 
FROM emp
WHERE ename LIKE ('%A%');

--25)
SELECT ename
FROM emp
WHERE INSTR(ename, 'A') = 3;
----------------------------------üũ�ؾ���
SELECT ename
FROM emp
WHERE SUBSTR(ename, 3,1) = 'A';

--26)
SELECT CONCAT(UPPER(SUBSTR(ename,1,1)), LOWER(SUBSTR(ename,2))) AS "name", length(ename) as "length"
FROM emp
WHERE SUBSTR(ename,1,1) = ANY('J','A','M');

SELECT INITCAP(ENAME) AS NAME, LENGTH(ENAME) AS LENGTH
FROM EMP
WHERE ENAME LIKE 'A%' OR ENAME LIKE 'J%' OR ENAME LIKE 'M%';

--27)
SELECT LOWER(ENAME)
FROM emp
WHERE LENGTH(ENAME) >=6;

--28)
SELECT LOWER(SUBSTR(ename,1,3))
FROM emp
WHERE LENGTH(ENAME) >=6;



--29)
SELECT ename, TO_CHAR(sal,'$999,999,999,999,999') "SALARY"
FROM emp;

SELECT ENAME, SAL, LPAD(SAL, 15,'$') "SALARY"
FROM EMP;


/*
 join : �ٸ� ���̺� ����Ǿ� �����͸� �����ϱ� ���� ó��
 employees ->�μ���ȣ
 
 �μ��� -> departments �μ���ȣ 
 blank -> �μ���ȣ -> departments �μ���ȣ�� ���纸�� -> �μ���
 
 
*/

--50)
SELECT e.ename, e.deptno, d.dname
FROM emp e, dept d;

--51)
SELECT e.ename, e.job, d.dname, d.loc
FROM emp e, dept d
WHERE e.job = 'MANAGER';

--52)
SELECT e.ename, e.job, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno 
    AND e.comm IS NOT NULL
    AND e.comm <> 0
    AND e.sal >=1600;

--53)
SELECT e.ename, e.job, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND d.loc = 'CHICAGO';

--54)
SELECT d.loc
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
GROUP BY d.loc
HAVING COUNT(e.empno) <=5 
ORDER BY COUNT(e.empno) ASC;

--55)
SELECT a.ename "employee", a.empno "emp#", b.ename "manager", b.empno "mgr#"
FROM emp a, emp b
WHERE a.mgr = b.empno;

--56)
SELECT a.ename "employee", a.hiredate "emp hired", b.ename "manager", b.hiredate "mgr hired"
FROM emp a, emp b
WHERE a.mgr = b.empno
    AND a.hiredate < b.hiredate;
    
--57)
SELECT a.ename "employee", a.empno "emp#", b.ename "manager", b.empno "mgr#"
FROM emp a, emp b
WHERE a.mgr = b.empno(+)
ORDER BY "emp#" ASC;

--58)
SELECT
    *
FROM emp e, dept d
WHERE e.deptno = d.deptno 
    AND e.deptno = 20
    AND e.ename = 'SMITH'
    AND e.ename != e.ename;    

SELECT a.empno employee, a.deptno department, b.deptno, b.empno colleague 
FROM emp a, emp b -- a: ��� ����� ���� ����  b: ���� �μ����� ���ϴ� ����  ���̺��� �������� �� �� ������ �������� Ȯ���ϰ� �˰��� ���� �߿��ϴ�.
WHERE a.deptno = b.deptno
    AND a.empno != b.empno
ORDER BY a.deptno, a.ename, b.ename ASC;


--59)
SELECT e.deptno, d.dname, e.ename, e.sal, s.grade 
FROM emp e, dept d, salgrade s
WHERE e.deptno = d.deptno 
    AND e.deptno = 10
    AND e.sal BETWEEN s.losal AND s.hisal;
    -- AND e.sal >= s.losal AND e.sal <= s.hisal

SELECT e.deptno, d.dname, e.ename, e.sal, s.grade 
FROM emp e, dept d, salgrade s
WHERE e.deptno = d.deptno 
    AND e.deptno = 10
    AND e.sal >= s.losal AND e.sal <= s.hisal;
    
    
--join ppt 
--1)
SELECT CONCAT(e.first_name, e.last_name), d.department_name
FROM employees e INNER JOIN departments d
    ON e.department_id = d.department_id
    AND e.first_name = 'Steven'
    AND e.last_name = 'King';

SELECT CONCAT(e.first_name, e.last_name), d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND e.first_name = 'Steven'
    AND e.last_name = 'King'; 

--2)
SELECT last_name, job_id
FROM employees
WHERE job_id LIKE ('IT_%');

SELECT last_name, job_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND d.department_name = 'IT';
--3)
SELECT e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id 
FROM employees e, departments d;

--4)
SELECT e.employee_id, e.last_name, e.job_id, d.department_id, d.department_name, d.location_id 
FROM employees e, departments d
WHERE e.department_id = d.department_id;

--5)
SELECT e.employee_id "�����ȣ", e.last_name "�̸�", d.department_id "�μ���", d.location_id "�ٹ���" 
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND e.job_id = 'SA_MAN';

--6)
SELECT  e.employee_id, e.last_name, e.job_id, e.department_id,
        d.department_id, d.department_name, d.location_id 
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;
--�������ʿ� +�� �ٿ��� ���� 

--7) 
SELECT
    a.employee_id, a.last_name, b.employee_id, b.last_name
FROM employees a, employees b
WHERE a.manager_id = b.employee_id;

SELECT
  a.last_name || ' �� ���� ' || b.last_name || ' �Դϴ�.'
FROM employees a, employees b
WHERE a.manager_id = b.employee_id;


--8)

SELECT
    a.employee_id, a.last_name, a.salary, b.employee_id, b.last_name
FROM employees a, employees b
WHERE a.manager_id(+) = b.employee_id
    AND a.manager_id IS NOT NULL
CONNECT BY  prior a.employee_id = a.manager_id 
ORDER BY a.salary DESC;

SELECT a.employee_id, a.first_name, a.manager_id, 
       b.employee_id, b.first_name
       
FROM employees a, employees b
WHERE a.manager_id = b.employee_id(+)
START WITH a.manager_id IS NOT NULL 
CONNECT BY  a.manager_id = prior a.employee_id
--�տ����̸� ����� �ڿ� ���̸� �����
ORDER BY a.salary DESC;
--9)

SELECT  a.employee_id, a.last_name, a.salary, b.employee_id, b.last_name
FROM employees a, employees b
WHERE a.manager_id(+) = b.employee_id
    AND b.employee_id = 108 
CONNECT BY prior a.manager_id =  a.employee_id
ORDER BY a.salary DESC;


