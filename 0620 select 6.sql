--SUB QUERY
-- QUERY���� QUERY���̴�.
--�Ѱ��� ��(ROW)���� ��� ���� ��ȯ�Ǵ� QUERY

--SELECT       ����ROW ����COLUMN (������ �����ʹ� �и��� �ϳ������Ѵ� ������ 1�� �÷� 1��) �츮�� ���� ���� ���� ������
--FROM         ����ROW ����COLUMN  -- �������� ������°� ������ �� �ִ� ����
--WHERE        ����ROW ����COLUMN  -- Ȱ�뵵 �ѹ���

/*

SELECT (SELECT FIRST_NAME FROM EMPLOYEES)    -- (SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES) �̷� ���´� �Ұ���(�����÷��� �ƴϴϱ�) 

SELECT  EMPLOYEE_ID (SELECT FIRST_NAME FROM EMPLOYEES) -- x ROW�� ���� ��
FROM    EMPLOYEES


SELECT  (SELECT FIRST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID=100) -- �̷� �����̸� ���� ��� SELECT�������� �� ��� ���Ѵ�.
FROM    EMPLOYEES

*/

--SELECT
SELECT employee_id, first_name, salary,
    (SELECT SUM(salary) FROM employees),
    (SELECT COUNT(*) FROM employees)
FROM employees;

--FROM
SELECT employee_id, last_name, salary, department_id                --���⼭ ���°� ����������
FROM (SELECT employee_id, last_name, salary, department_id          --���⼱ �ȵ� �Ѱ��ִ°� ���µ� ������ ���� ���� ����
        FROM employees
        WHERE department_id = 20); --�̷���� ���⿡ ����ڶ�� ����?
    

SELECT employee_id, last_name, salary, department_id               
FROM (SELECT
            *
        FROM employees
        WHERE department_id = 20); -- *�ξ��� �� �Ѱ��ִ°� �Ǵ°���
    
--WHERE
--�μ���ȣ�� 20��, �޿��� 6000�̻��� ��� 

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

--JOIN �� �� SUBQUERY�� �ְ� ���� ��찡 �� ���� ���� FROM������ ��, �μ� �̷������� ������ ���ϰ� �׳� *�� �Ѱ��ָ� �ۿ��� �� ���� �����ϰ� ��

SELECT a.employee_id, a.first_name, a.job_id, b.job_id, b."�޿� �հ�", b."�ο���" 
FROM employees a, (SELECT job_id, SUM(salary) as "�޿� �հ�", COUNT(*) AS "�ο���"
                   FROM employees
                   GROUP BY job_id) b
WHERE a.job_id = b.job_id and a.first_name = 'Steven';

SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);                   
-- ���� �� ���ϸ� ������. �׷��� ���� �񱳸� ����

SELECT first_name, last_name, job_id
FROM employees
WHERE job_id  IN(SELECT job_id FROM jobs WHERE job_id = 'IT_PROG');

-- �μ����� ���� �޿��� ���� �޴� ����� ���� �޿��� �޴� ���
SELECT first_name, salary, department_id
FROM employees 
WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id);

-- �μ����� ���� �޿��� ���� �޴� ����� ���� 
SELECT department_id, first_name, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary) FROM employees GROUP BY department_id)
ORDER BY SALARY DESC;