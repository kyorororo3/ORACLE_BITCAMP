--1) 직책(Job Title)이 Sales Manager인 사원들의 입사년도와 입사년도(hire_date)별 평균 급여를 출력하시오. 
--   출력 시 년도를 기준으로 오름차순 정렬하시오. 
SELECT last_name, e.hire_date, e.avg_sal
FROM jobs j, (SELECT last_name, job_id, hire_date, TRUNC(AVG(salary)OVER(PARTITION BY SUBSTR(hire_date,1,2))) AS AVG_SAL FROM employees) e
WHERE j.job_id = e.job_id
    AND j.job_title = 'Sales Manager';
    
--2) 각 도시(city)에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다. 
--   평균급여가 가장 낮은 도시부터 도시명(city)과 평균연봉, 해당 도시의 직원수를 출력하시오. 
--   단, 도시에 근무하는 직원이 10명 이상인 곳은 제외하고 조회하시오.
 
SELECT e.last_name, e.department_id, e.location_id, l.location_id, l.city,
ROUND(AVG(e.avg_sal)OVER(PARTITION BY l.city)) AS "CITYAVG", 
COUNT(*)OVER(PARTITION BY l.city) AS "countnumber"
 FROM (SELECT last_name, salary, department_id, phone_number,
            CASE SUBSTR(phone_number, 1, 3)
                WHEN '515' THEN '1000'
                WHEN '590' THEN '1100'
                WHEN '650' THEN '1200'
                WHEN '603' THEN '1300'
                WHEN '011' THEN '1400'
                END AS location_id, TRUNC(AVG(salary)OVER(PARTITION BY department_id)) AS AVG_SAL 
        FROM employees)e, locations l
WHERE e.location_id = l.location_id
      AND countnumber <10
ORDER BY CITYAVG ASC;

--3. ‘Public  Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하시오. 
--   (현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려 하지 않는다.)      
--   이름은 first_name, last_name을 아래의 실행결과와 같이 출력한다.

