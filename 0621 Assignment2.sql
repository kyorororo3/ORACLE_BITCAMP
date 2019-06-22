--1) ��å(Job Title)�� Sales Manager�� ������� �Ի�⵵�� �Ի�⵵(hire_date)�� ��� �޿��� ����Ͻÿ�. 
--   ��� �� �⵵�� �������� �������� �����Ͻÿ�. 
SELECT last_name, e.hire_date, e.avg_sal
FROM jobs j, (SELECT last_name, job_id, hire_date, TRUNC(AVG(salary)OVER(PARTITION BY SUBSTR(hire_date,1,2))) AS AVG_SAL FROM employees) e
WHERE j.job_id = e.job_id
    AND j.job_title = 'Sales Manager';
    
--2) �� ����(city)�� �ִ� ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� �Ѵ�. 
--   ��ձ޿��� ���� ���� ���ú��� ���ø�(city)�� ��տ���, �ش� ������ �������� ����Ͻÿ�. 
--   ��, ���ÿ� �ٹ��ϴ� ������ 10�� �̻��� ���� �����ϰ� ��ȸ�Ͻÿ�.
 
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

--3. ��Public  Accountant���� ��å(job_title)���� ���ſ� �ٹ��� ���� �ִ� ��� ����� ����� �̸��� ����Ͻÿ�. 
--   (���� ��Public Accountant���� ��å(job_title)���� �ٹ��ϴ� ����� ��� ���� �ʴ´�.)      
--   �̸��� first_name, last_name�� �Ʒ��� �������� ���� ����Ѵ�.

