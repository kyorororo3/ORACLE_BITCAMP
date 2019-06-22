-- 특수  Query
-- CASE, DECODE 조건 분기를 할 수 있는 문법 
SELECT employee_id, first_name, phone_number,
    CASE SUBSTR(phone_number, 1, 3)/*지역번호*/
    WHEN '515' THEN '서울'
    WHEN '590' THEN '부산'
    WHEN '659' THEN '광주'
    WHEN '603' THEN '대전'
    ELSE '기타'
    END AS "지역"
FROM employees; 

--CASE 안에 있는 것이 하나의 컬럼이 되는 것 
SELECT employee_id, first_name, phone_number,
    CASE
        WHEN SUBSTR(phone_number, 1, 3) = '515' THEN '서울'
        WHEN SUBSTR(phone_number, 1, 3) = '590' THEN '부산'
        WHEN SUBSTR(phone_number, 1, 3) = '659' THEN '광주'
        WHEN SUBSTR(phone_number, 1, 3) = '603' THEN '대전'
        ELSE '기타'
        END AS "지역"
FROM employees; 

--DECODE
--함수식으로 사용한다는 점에서 다르다. 
SELECT employee_id, first_name, phone_number,
    DECODE(SUBSTR(phone_number, 1, 3),
        '515', '서울',
        '590', '부산',
        '659', '광주',
        '603', '대전', '기타') AS "지역"
FROM employees;

-- OVER() PARTITION BY ORDER BY 중요하다
--왜배우는가요? 컬럼 순서에 대해서 순번을 매겨주기 위한 존재 게시글에서도 최신글을 먼저 띄워줄 때, 5개씩 10개씩 20개씩 잘라서 페이지를 넘겨주는 느낌으로 쓸 때 이걸 쓴다. 
SELECT job_id, salary, COUNT(*)OVER(PARTITION BY job_id ORDER BY salary DESC)
FROM employees;


SELECT job_id,  COUNT(*)OVER()
FROM employees;


SELECT job_id,  COUNT(*)OVER(PARTITION BY job_id) -- 그룹단위로 나누어 카운트
FROM employees;

SELECT department_id, job_id, MIN(salary)OVER(PARTITION BY job_id)
FROM employees;
--그룹바이는 묶인것만 보이지만 이 경우 다른 컬럼도 볼 수 있는 것 
--AVG()
--MAX()
--MIN()
--SUM()


--분석함수 
-- 순위를 매기는 함수 RANK 
-- RANK()                   1 2 3 3 5 6
-- DENSE_RANK()             1 2 3 3 4 5 
-- ROW_NUMBER()★           1 2 3 4 5 6 
-- ROW_NUM★                1 2 3 4 5 6 

SELECT first_name, salary,
    RANK()OVER(ORDER BY salary DESC),
    DENSE_RANK()OVER(ORDER BY salary DESC),
    ROW_NUMBER()OVER(ORDER BY salary DESC)  -- 게시판에 시간이나 날짜로 최신글을 구분할 수 있고 이걸 가지고 한다는 것 
    
FROM employees
ORDER BY salary DESC;

-- 10명의 데이터만을 산출하는 경우 

SELECT ROWNUM, employee_id, first_name, salary
  
FROM employees
WHERE ROWNUM <= 10;
-- 이렇게 했을 때는 문제가 따로 없어보인다

SELECT ROWNUM, employee_id, first_name, salary --2번으로 적용 
FROM employees
WHERE ROWNUM BETWEEN 11 AND 20;  --이게 1번으로 적용(ROWNUM 조건) 

--1. 설정
--2. ROWNUM 완성
--3. 범위를 설정
SELECT RNUM, employee_id, first_name, salary

FROM
    (SELECT ROWNUM AS RNUM, 
        employee_id, first_name, salary
    FROM
        (SELECT employee_id, first_name, salary
        FROM employees)
    )
WHERE RNUM BETWEEN 11 AND 20;


