--SUB QUERY
-- QUERY안의 QUERY문이다.
--한개의 행(ROW)에서 결과 값이 변환되는 QUERY

--SELECT       단일ROW 단일COLUMN (나오는 데이터는 분명히 하나여야한다 데이터 1개 컬럼 1개) 우리가 보고 싶은 실제 데이터
--FROM         다중ROW 다중COLUMN  -- 조건절이 길어지는걸 막아줄 수 있는 존재
--WHERE        다중ROW 다중COLUMN  -- 활용도 넘버원

/*

SELECT (SELECT FIRST_NAME FROM EMPLOYEES)    -- (SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES) 이런 형태는 불가능(단일컬럼이 아니니까) 

SELECT  EMPLOYEE_ID (SELECT FIRST_NAME FROM EMPLOYEES) -- x ROW가 다중 값
FROM    EMPLOYEES


SELECT  (SELECT FIRST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID=100) -- 이런 형식이면 가능 사실 SELECT절에서는 잘 사용 안한다.
FROM    EMPLOYEES

*/

--SELECT
SELECT employee_id, first_name, salary,
    (SELECT SUM(salary) FROM employees),
    (SELECT COUNT(*) FROM employees)
FROM employees;

--FROM
SELECT employee_id, last_name, salary, department_id                --여기서 빼는건 가능하지만
FROM (SELECT employee_id, last_name, salary, department_id          --여기선 안됨 넘겨주는게 없는데 위에서 받을 수가 없죠
        FROM employees
        WHERE department_id = 20); --이럴경우 여기에 써봤자라는 느낌?
    

SELECT employee_id, last_name, salary, department_id               
FROM (SELECT
            *
        FROM employees
        WHERE department_id = 20); -- *로쓰면 다 넘겨주는게 되는거죠
    
--WHERE
--부서번호가 20번, 급여가 6000이상인 사원 

SELECT
    *
FROM employees
WHERE department_id = 20
    AND salary >= 6000;
    
SELECT
    *
FROM (SELECT
          *
      FROM employees
      WHERE department_id = 20)
WHERE salary >= 6000;

--JOIN 할 때 SUBQUERY에 넣고 쓰는 경우가 꽤 있음 안쪽 FROM절에서 잡, 부서 이런식으로 조인을 다하고 그냥 *로 넘겨주면 밖에서 다 접근 가능하게 됨

SELECT a.employee_id, a.first_name, a.job_id, b.job_id, b."급여 합계", b."인원수" 
FROM employees a, (SELECT job_id, SUM(salary) as "급여 합계", COUNT(*) AS "인원수"
                   FROM employees
                   GROUP BY job_id) b
WHERE a.job_id = b.job_id and a.first_name = 'Steven';

SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);                   
-- 먼저 뭘 구하면 좋은가. 그러고 나서 비교를 하자

SELECT first_name, last_name, job_id
FROM employees
WHERE job_id  IN(SELECT job_id FROM jobs WHERE job_id = 'IT_PROG');

-- 부서별로 가장 급여를 적게 받는 사원과 같은 급여를 받는 사원
SELECT first_name, salary, department_id
FROM employees 
WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id);

-- 부서별로 가장 급여를 적게 받는 사원의 정보 
SELECT department_id, first_name, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary) FROM employees GROUP BY department_id)
ORDER BY SALARY DESC;