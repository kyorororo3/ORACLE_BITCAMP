--WHERE 절 == IF문 ==조건절

/*
    표현식
    비교연산자와 함께 사용(=, >, <, !=, >=, <=, <>(같지않다) ) 
    NULL, = NULL(틀린문법) EQUAL로 사용 불가 JAVA에서는 그랬지만 여기는 안된다
    IS NULL, IS NOT NULL 과 같은 문법으로 사용
    ()괄호 굉장히 중요함 
    (), NOT, AND(&&로 사용안함), OR(||의 경우 용법이 다름)
    
    SELECT 
    FROM
    WHERE 조건절
    
    
*/

-- FIRST NAME == Julia
SELECT first_name, last_name, salary
FROM employees
WHERE FIRST_NAME = 'Julia';

--급여가 9000불 이상인 사원
SELECT first_name, last_name, salary
FROM employees
WHERE salary >= 9000;

--이름이 SHANTA보다 큰 이름
SELECT first_name, last_name, salary
FROM employees
WHERE FIRST_NAME >= 'Shanta';

SELECT first_name, last_name, salary
FROM employees
WHERE FIRST_NAME >= 'a';  -- 아무것도 찾지 못한다 왜냐 모든 이름이 대문자로 되어있기 때문에 이것보다 큰 아스키코드는 없다. 

SELECT first_name, manager_id
FROM employees
WHERE manager_id = '';  -- 빈문자는 NULL이 아니다 

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL; -- 자바에서는 == NULL 과 같은 문법  

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NOT NULL;  


-- AND
-- 이름 JOHN이고 급여가 5000이상인 사람
SELECT first_name, last_name, salary
FROM employees 
WHERE first_name = 'John'
    AND salary > 5000;
--조건문의 경우 간단한 조건을 먼저 확인하고 결과처리하는 경우가 많다

-- OR
SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'Shanta' 
    OR first_name = 'John';
    -- AND는 불가능 이름이 두개인 사람은 없으니까 

-- 2007년 12월 31일 이후에 입사한 사원 출력
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '2007-12-31';

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > TO_DATE('20071231','YYYYMMDD'); -- TO_MONTH


--ALL(AND), ANY(OR) (ANY하고 ALL의 경우 =)을 씀
SELECT first_name 
FROM employees
WHERE first_name = ALL('Julia', 'John');
--FIRST_NAME = JULIA AND FIRST_NAME = JOHN;

SELECT first_name, last_name, salary
FROM employees
WHERE first_name = ANY('Julia', 'John','Steven');

SELECT first_name, salary
FROM employees
WHERE salary = ANY(8000, 3200, 6000);

-- IN, NOT IN 
SELECT first_name, salary
FROM employees
WHERE salary IN(8000, 3200, 6000);

SELECT first_name, salary
FROM employees
WHERE salary  NOT IN(8000, 3200, 6000);
-- 이 금액을 포함하지 않은 나머지 사원들을 구할 때 쓰는 것

SELECT first_name, salary
FROM employees
WHERE first_name IN('Julia', 'John');

--EXISTS 데이터가 있느냐 없느냐 
SELECT first_name, job_id
FROM employees e
WHERE EXISTS(SELECT 1
                 FROM DUAL
                WHERE e.JOB_ID = 'IT_PROG');
-- sub query 에서 1을 내보내는 것이 참이면 이라는 느낌으로 조건문을 주는 것 이럴 때도 dual이 쓰일 수 있다는 것을 참고로 알 것 exists는 많이 쓰이진 않음

--BETWEEN 범위연산자 (많이 쓰이는 편) 
/*
기간 
월급
SALARY >= 3200 AND SALARY <=9000
BETWEEN 3200 AND 9000
*/
SELECT first_name, salary
FROM employees
WHERE SALARY >= 3200 AND SALARY <=9000;

SELECT first_name, salary
FROM employees
WHERE SALARY BETWEEN 3200 AND 9000;

SELECT first_name, salary
FROM employees
WHERE SALARY NOT BETWEEN 3200 AND 9000;


--LIKE  으으으음청 많이 쓰임
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'G_ra_d'; -- _는 문자 

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'K%y'; -- 뒤에오는 글자는 대문자로 하면 안된다고 한다더라 % 글자수의 제한이 없다

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE '%A%'; -- A가 들어간 위치 상관없이 A가 들어간 것을 출력한다
-- 검색어를 사용할 때 이 것을 꽤 많이 사용 

--2006년도에 입사한 사원

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '06%';



SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '06/01%'; -- 날짜를 문자열로 쓰면 안됨. 날짜형식으로 써야지만 제대로 실행됨 
