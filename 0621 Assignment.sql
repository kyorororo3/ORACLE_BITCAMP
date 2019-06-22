--33)
SELECT ename, hiredate, TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate))  as "MONTHS WORKED"
FROM emp
ORDER BY "MONTHS WORKED" ASC;

SELECT ename, TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) AS "MONTHS_WORKED"
FROM emp
ORDER BY "MONTHS_WORKED" ASC;


--34)
SELECT ename, job, TRUNC((SYSDATE - hiredate)/365) 
FROM emp;

SELECT ename, TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)/12)
FROM emp;

--35)
SELECT ename, sal, sal+NVL(comm,0) AS "실급여"
FROM emp
WHERE comm IS NOT NULL;

--36)
SELECT ename, job, sal, NVL(comm,0), TO_CHAR(hiredate, 'YYYY-MM-DD') AS "입사일"
    
FROM emp
WHERE (sal+NVL(comm,0)) >= 2000;

--37)
SELECT ename, job,
    DECODE(JOB,
    'PRESIDENT', 'A',
    'ANALYST', 'B',
    'MANAGER', 'C',
    'SALESMAN', 'D',
    'CLERK', 'E', '0') AS GRADE
FROM emp;

SELECT ename, job,
    CASE JOB
    WHEN 'PRESIDENT' THEN 'A'
    WHEN 'ANALYST' THEN 'B'
    WHEN 'MANAGER' THEN 'C'
    WHEN 'SALESMAN' THEN 'D'
    WHEN 'CLERK' THEN 'E'
    ELSE 'O'
    END AS GRADE
FROM emp;
--1)
SELECT  employee_id, first_name, hire_date

FROM
    (SELECT ROWNUM AS RNUM, 
        employee_id, first_name, hire_date
    FROM
        (SELECT employee_id, first_name, hire_date
        FROM employees)
    )
WHERE RNUM BETWEEN 1 AND 10
ORDER BY hire_date DESC;

SELECT employee_id, first_name, salary
FROM    (SELECT ROWNUM AS RNUM, employee_id, first_name, salary

FROM       (SELECT          --SETTING DATA
             *  
            FROM employees
            ORDER BY salary DESC)

    )
WHERE RNUM BETWEEN 11 AND 20;

--2)
SELECT employee_id, first_name, salary

FROM
    (SELECT ROWNUM as rnum, employee_id, first_name, salary
    FROM
        (SELECT employee_id, first_name, salary
        FROM employees)
    );
    
--3)
SELECT first_name, job_id, hire_date

FROM (SELECT ROWNUM AS RNUM, first_name, job_id, hire_date FROM employees WHERE job_id = 'IT_PROG' AND hire_date LIKE '05%'  ORDER BY hire_date ASC)
WHERE RNUM <=3;

SELECT employee_id, first_name, job_id, hire_date
    
FROM (SELECT ROW_NUMBER()OVER(PARTITION BY SUBSTR(hire_date, 1, 2) ORDER BY hire_date ASC) AS RN, 
    employee_id, first_name, job_id, hire_date

FROM employees
WHERE job_id = 'IT_PROG' AND SUBSTR(hire_date,1,2) ='05')
WHERE RN BETWEEN 1 AND 3;