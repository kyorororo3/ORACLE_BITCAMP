-- 대문자 (JAVA) toUpperCase ORACLE : UPPER(문자열)
-- 소문자 (JAVA) toLowerCase ORACLE : LOWER(문자열)

-- 문자열을 합하는 기능 
SELECT first_name || ' ' || last_name
FROM employees;

--CONCAT
SELECT concat(first_name, last_name)
FROM employees;  -- 띄어쓰기를 하기가 적합하지 않다

--months_between: 두 날짜간의 월수를 계산 (월 간격)
SELECT MONTHS_BETWEEN('2019-11-13',SYSDATE) -- 앞에 더 큰 숫자를 줄 것 
FROM DUAL;

--add_month (자주 사용되진 않는다) : 특정 날짜의 월의 정수를 더한다음 해당 날짜를 반환..?
SELECT add_months('2019-06-02', 8)
FROM dual;
-- 8달이 지난 후의 값이 나온다 

-- extract() : 날짜 정보에서 특정한 년도, 월, 일, 시간, 분, 초를 추출할 수 있는 함수
SELECT EXTRACT(year from sysdate),
       EXTRACT(month from sysdate),
       EXTRACT(day from sysdate)
FROM DUAL;
SELECT systimestamp,
        EXTRACT(hour from systimestamp),
        EXTRACT(minute from systimestamp),
        EXTRACT(second from systimestamp)
FROM dual;

SELECT EXTRACT (HOUR   FROM CAST(SYSDATE AS TIMESTAMP)),
       EXTRACT (MINUTE FROM CAST (SYSDATE AS TIMESTAMP)),
       EXTRACT (SECOND FROM CAST (SYSDATE AS TIMESTAMP))
FROM dual;

-- 그룹으로 묶는 기능
-- JOB_ID(업무), DEPARTMENT_ID(부서)  
-- 중복행을 제거
SELECT DISTINCT department_id
FROM employees
ORDER BY department_id ASC;
-- DISTINCT의 경우 가볍게 보는 느낌 왜냐하면 숫자가 뒤죽박죽 되어있기 때문 
-- ORDERBY절의 경우 제일 밑에 있는 존재

--GROUP BY 절  
SELECT department_id  -- 그룹으로 묶였을 경우 그룹으로 묶인 컬럼만 보여주기 때문에 다른걸 표현할 수 없다 EMPLOYEE_ID의 경우 각각 사람이 가지고 있는 것이므로 여기에 표현이 불가하다
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

/*
GROUP 함수 
COUNT : GROUP으로 묶었을 때 안에 몇 명있니 카운트
SUM : 합계
AVG : 평균
MAX
MIN


*/

SELECT COUNT(salary),COUNT(*), SUM(salary), AVG(salary),
    SUM(salary)/COUNT(*)
FROM employees
WHERE job_id = 'IT_PROG'; -- 묶은거랑 마찬가지

/*
NVL(대상이 되는 컬럼, 값) 
-> 컬럼의 자료형에 따라 값이 달라짐

NVL(대상이 되는 컬럼, 0)       NUMBER
대상이 되는 컬럼 != NULL -> 대상이 되는 컬럼
대상이 되는 컬럼 == NULL -> 0
NVL(대상이 되는 컬럼, '없음')  VARCHAR2
대상이 되는 컬럼 == NULL -> 없음

NVL2(대상이 되는 컬럼 1, 0)
대상이 되는 컬럼 != NULL ->1
대상이 되는 컬럼 == NULL ->0


*/

SELECT first_name, NVL(commission_pct, 0)
FROM employees;

SELECT first_name, NVL2(commission_pct, '있음', '없음')
FROM employees;

SELECT department_id, /*이 다음에 쓸 수 있는 건 그룹함수ONLY*/ SUM(salary), MAX(salary), ROUND(AVG(salary))
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

SELECT department_id, job_id
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id ASC;

--GROUP BY 
--조건절 HAVING 단독 사용 불가

SELECT job_id, SUM(salary)
FROM employees
GROUP BY job_id
HAVING SUM(SALARY) >= 30000
ORDER BY SUM(salary) DESC;

SELECT job_id, COUNT(*), SUM(salary), TRUNC(AVG(salary))
FROM employees
WHERE salary > 5000         --HAVING 절이 아닌 WHERE 절이 더 먼저 
GROUP BY job_id
HAVING SUM(salary) > 20000;

