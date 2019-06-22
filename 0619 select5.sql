/*

조인 : 두 개 이상의 테이블을 연결해서 데이터를 검색하는 방법 
보통 둘 이상의 행(row)들의 공통된 값 Primary key (기본키), Foreign key (외래키) 값을 사용해서 join

primary key - 테이블에 내장, 중복되지 않는 키 -> ex) ID, sequence
foreign key - 다른 테이블에서 primary key, 고유키일 가능성이 높다 

조인의 종류
inner Join ★★★★★
cross Join ☆☆☆☆☆
outer Join ★★★☆☆
   left outer
   right outer

self Join ★★★★★

SQL : Oracle 문법, Ansi SQL(웬만한 프로그램에서 다 먹히는 문법) 

*/

--inner Join
-- 1) Ansi SQL
SELECT e.employee_id, e.first_name, e.salary, 
    e.department_id, d.department_id, 
    d.department_name, d.location_id
FROM employees E INNER JOIN departments D
    ON e.department_id = d.department_id; --이거랑 이거랑 같을 때와 같은 조건문 같은 것 
    -- 부서번호를 부서테이블로 가져가는 느낌 왼쪽에 있는 것이 중심 먼저 부서번호를 꺼내서 다른 테이블로 가져가는 작업
    
SELECT
    *
FROM employees
WHERE department_id IS NULL;

SELECT DISTINCT department_id
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

-- 2) Oracle grammar
SELECT e.employee_id, e.first_name, e.salary,
       e.department_id, d.department_id,
       d.department_name, d.location_id
FROM employees e, departments d
where e.department_id = d.department_id;

SELECT e.first_name,
       e.job_id, j.job_id, j.job_title
FROM employees e, jobs j
where e.job_id = j.job_id
    AND first_name = 'Shanta';
    
--사원번호 147의 부서명과 업무명을 알아내라

SELECT e.first_name,
     e.job_id, j.job_id, j.job_title,
     e.department_id, d.department_id, d.department_name
FROM employees e, departments d, jobs j
where e.department_id = d.department_id
    AND e.job_id = j.job_id
    AND e.employee_id = 147;
    

--cross Join 
--1) Ansi SQL
SELECT e.employee_id, e.first_name,
       e.department_id, d.department_id,
       d.department_name
FROM employees e CROSS JOIN departments d;

--2) Oracle grammar
SELECT e.employee_id, e.first_name,
       e.department_id, d.department_id,
       d.department_name
FROM employees e, departments d;
-- 조건으로 equal을 안한 상태가 cross Join

--outer Join
--1) Full outer Join Ansi SQL 버전
SELECT e.employee_id, e.first_name,
       e.department_id, d.department_id,
       d.department_name
FROM employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
--WHERE e.department_id IS NULL OR d.department_id IS NULL;
--          Kimberley            110이상

--2) left outer Join
--2-1) Ansi SQL

SELECT e.employee_id, e.first_name,
        e.department_id, d.department_id,
        d.department_name
FROM employees e LEFT OUTER JOIN departments d
    ON e.employee_id = d.department_id;


--2-2) Oracle

SELECT e.employee_id, e.first_name,
        e.department_id, d.department_id,
        d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

--3) right outer Join
--3-1) Ansi SQL

SELECT e.employee_id, e.first_name,
        e.department_id, d.department_id,
        d.department_name
FROM employees e RIGHT OUTER JOIN departments d
    ON e.employee_id = d.department_id;


--3-2) Oracle

SELECT e.employee_id, e.first_name,
        e.department_id, d.department_id,
        d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id
      AND e.department_id IS NULL;  -- 공통된 부분을 없애기 위한 방법
      
    

-- SELF JOIN: 동일한 테이블을 조인하는 것 
SELECT a.employee_id, a.first_name,
       a.manager_id, b.employee_id,
       b.first_name
FROM employees a, employees b -- a:사원의 정보 + 매니저의 번호를 뽑기위한 존재 b:매니저의 이름을 뽑기 위한 존재 
WHERE a.manager_id = b.employee_id;

--계층형 구조
SELECT  a.employee_id, a.first_name as "사원",
       a.manager_id as "사원의 상사" , b.employee_id,
       b.first_name as "상사"
       
FROM employees a, employees b
WHERE a.manager_id = b.employee_id(+)
CONNECT BY prior a.manager_id = a.employee_id --상향식 계층구조로 올라가는 것
--CONNECT BY  a.manager_id = prior a.employee_id --하향식 계층구조로 올라가는 것

