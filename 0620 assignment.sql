--1)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > (SELECT salary
                 FROM employees
                 WHERE last_name = 'Kochhar');
                 
--2)
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

--3)
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary) 
                     FROM employees 
                     WHERE department_id = 100);
                     
--4)
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY job_id)
ORDER BY job_id ASC;
--------------------------------------------------------------------------
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN (SELECT job_id, MIN(salary) FROM employees GROUP BY job_id)
ORDER BY job_id ASC;

--5)
SELECT e.last_name, e.job_id, d.department_name, d.location_id
FROM  (SELECT department_id, last_name, job_id FROM employees WHERE job_id = 'SA_MAN') e, departments d
WHERE e.department_id = d.department_id;

--6)    
SELECT manager_id
FROM employees
GROUP BY manager_id
HAVING COUNT(manager_id) = (SELECT MAX(COUNT(manager_id)) FROM employees GROUP BY manager_id);


--7)
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) = (SELECT MAX(COUNT(department_id))FROM employees GROUP BY department_id);

--8)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE employee_id = 192)
    AND job_id = ((SELECT job_id FROM employees WHERE employee_id = 123));
    
--9)
SELECT employee_id, last_name, job_id, department_name, salary
FROM employees e, departments d
WHERE e.department_id = d.department_id 
    AND (e.job_id, e.salary) IN (SELECT job_id, MIN(salary) FROM employees GROUP BY job_id)
ORDER BY job_id DESC;

--10)
SELECT employee_id, last_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees WHERE department_id = 50)
    AND department_id <> 50;

--11)
SELECT employee_id, last_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_id = 50)
    AND department_id <> 50
ORDER BY salary ASC;

--60)
SELECT ename, hiredate
FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'BLAKE')
    AND ename <> 'BLAKE';
    
--61)
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
ORDER BY sal DESC;

--62)
SELECT empno, ename, sal
FROM emp
WHERE sal = (SELECT MIN(sal) FROM emp WHERE deptno = 10);

--63)
SELECT  d.dname, COUNT(*)
FROM emp e, dept d
WHERE e.deptno = d.deptno 
    AND d.deptno = (SELECT deptno FROM emp GROUP BY deptno HAVING COUNT(*) >3 )
GROUP BY d.dname;
-------------------------------------------------------------------
SELECT  d.dname, COUNT(*)
FROM emp e, dept d
WHERE e.deptno = d.deptno 
GROUP BY d.dname
HAVING COUNT (e.empno) > 3;

--64)
SELECT ename, hiredate
FROM emp
WHERE hiredate < (SELECT hiredate FROM emp WHERE empno = 7844);

--65)
SELECT ename, sal
FROM emp
WHERE mgr = (SELECT empno FROM emp WHERE ename = 'KING');

--66)
SELECT e.ename, d.dname, e.sal, s.grade
FROM emp e, dept d, salgrade s
WHERE e.deptno = d.deptno 
    AND sal = (SELECT MAX(sal) FROM emp WHERE deptno = 20)
    AND sal BETWEEN s.losal AND s.hisal;
    
--67)
SELECT deptno, ename, sal+NVL(comm,0) ,  NVL2(comm, '유', '무') "comm 유무"
FROM emp
WHERE sal+NVL(comm,0) > (SELECT AVG(sal) FROM emp);

--68) 체크해야함
SELECT ename, sal, d.loc 
FROM emp e, dept d
WHERE e.sal > (SELECT AVG(sal) FROM emp e, dept d WHERE e.deptno = d.deptno AND d.loc = 'CHICAGO');

--69) 업무가 SALESMAN인 직원이 2명 이상
--부서의 이름, 근무하는 사원의 이름, 업무를 출력
--(컬럼명은 부서명, 사원명, 업무로 출력)
SELECT d.dname "부서명", e.ename "사원명", e.job "업무"
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.job = (SELECT job FROM emp WHERE job = 'SALESMAN' AND deptno>=2 GROUP BY job);
--GROUP BY job
--HAVING COUNT(*)>= 2;
--------------------------------------------------------------------------------
SELECT d.dname "부서명", e.ename "사원명", e.job "업무"
FROM emp e, dept d 
WHERE e.deptno = d.deptno
   AND  e.deptno IN (SELECT deptno
                        FROM emp
                        WHERE job = 'SALESMAN'
                        GROUP BY deptno
                        HAVING COUNT(job) >= 2)
--70)
SELECT e.ename, s.grade
FROM emp e, salgrade s
WHERE sal = (SELECT MAX(sal) FROM emp WHERE comm IS NULL OR comm = 0)
    AND sal BETWEEN s.losal AND s.hisal;
    
--71)
SELECT e.ename, e.deptno, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno 
    AND empno = (SELECT mgr FROM emp WHERE ename = 'SMITH'); 
    
    

--1)
SELECT ename, d.dname
FROM (SELECT ename, deptno FROM emp WHERE sal BETWEEN 3000 AND 5000) e, dept d
WHERE e.deptno = d.deptno;

--2)
SELECT e.ename, e.job, d.dname
FROM (SELECT job, ename, deptno FROM emp WHERE job = 'MANAGER')e, dept d
WHERE e.deptno = d.deptno;
--3)
SELECT d.dname, e.ename, e.hiredate
FROM emp e, (SELECT dname, deptno FROM dept WHERE dname = 'ACCOUNTING') d
WHERE e.deptno = d.deptno;

--4)
SELECT e.ename, d.dname, e.comm
FROM (SELECT comm, ename, deptno FROM emp WHERE comm IS NOT NULL AND comm <>0)e, dept d
WHERE e.deptno = d.deptno;
--5)
SELECT e.ename, e.sal, d.loc
FROM (SELECT loc, deptno FROM dept WHERE loc = 'NEW YORK') d, emp e
WHERE e.deptno = d.deptno;

--6)
SELECT e.ename, e.sal, d.loc
FROM (SELECT sal, ename, deptno FROM emp WHERE sal <=1200) e, dept d
WHERE e.deptno = d.deptno;


--<<1>>
SELECT e.deptno, d.dname, e.ename, e.sal
FROM emp e, dept d
WHERE e.deptno = d.deptno;

--<<2>>
SELECT d.dname 
FROM emp e, dept d
WHERE e.deptno = d.deptno 
    AND e.ename = 'ALLEN';
    
--<<3>>
SELECT mgr, b.ename
FROM emp a, (SELECT empno, ename FROM emp)b
WHERE a.mgr = b.empno;

--<<4>>
SELECT
    *
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
AND empno IS NULL;

--<<5>>
SELECT e.ename, d.dname, e.sal, e.job
FROM emp e, dept d
WHERE job = (SELECT job FROM emp WHERE ename = 'ALLEN');

--<<6>>
SELECT empno, ename, hiredate, sal
FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'JONES');

--<<7>>
