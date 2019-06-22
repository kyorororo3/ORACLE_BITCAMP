-- �빮�� (JAVA) toUpperCase ORACLE : UPPER(���ڿ�)
-- �ҹ��� (JAVA) toLowerCase ORACLE : LOWER(���ڿ�)

-- ���ڿ��� ���ϴ� ��� 
SELECT first_name || ' ' || last_name
FROM employees;

--CONCAT
SELECT concat(first_name, last_name)
FROM employees;  -- ���⸦ �ϱⰡ �������� �ʴ�

--months_between: �� ��¥���� ������ ��� (�� ����)
SELECT MONTHS_BETWEEN('2019-11-13',SYSDATE) -- �տ� �� ū ���ڸ� �� �� 
FROM DUAL;

--add_month (���� ������ �ʴ´�) : Ư�� ��¥�� ���� ������ ���Ѵ��� �ش� ��¥�� ��ȯ..?
SELECT add_months('2019-06-02', 8)
FROM dual;
-- 8���� ���� ���� ���� ���´� 

-- extract() : ��¥ �������� Ư���� �⵵, ��, ��, �ð�, ��, �ʸ� ������ �� �ִ� �Լ�
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

-- �׷����� ���� ���
-- JOB_ID(����), DEPARTMENT_ID(�μ�)  
-- �ߺ����� ����
SELECT DISTINCT department_id
FROM employees
ORDER BY department_id ASC;
-- DISTINCT�� ��� ������ ���� ���� �ֳ��ϸ� ���ڰ� ���׹��� �Ǿ��ֱ� ���� 
-- ORDERBY���� ��� ���� �ؿ� �ִ� ����

--GROUP BY ��  
SELECT department_id  -- �׷����� ������ ��� �׷����� ���� �÷��� �����ֱ� ������ �ٸ��� ǥ���� �� ���� EMPLOYEE_ID�� ��� ���� ����� ������ �ִ� ���̹Ƿ� ���⿡ ǥ���� �Ұ��ϴ�
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

/*
GROUP �Լ� 
COUNT : GROUP���� ������ �� �ȿ� �� ���ִ� ī��Ʈ
SUM : �հ�
AVG : ���
MAX
MIN


*/

SELECT COUNT(salary),COUNT(*), SUM(salary), AVG(salary),
    SUM(salary)/COUNT(*)
FROM employees
WHERE job_id = 'IT_PROG'; -- �����Ŷ� ��������

/*
NVL(����� �Ǵ� �÷�, ��) 
-> �÷��� �ڷ����� ���� ���� �޶���

NVL(����� �Ǵ� �÷�, 0)       NUMBER
����� �Ǵ� �÷� != NULL -> ����� �Ǵ� �÷�
����� �Ǵ� �÷� == NULL -> 0
NVL(����� �Ǵ� �÷�, '����')  VARCHAR2
����� �Ǵ� �÷� == NULL -> ����

NVL2(����� �Ǵ� �÷� 1, 0)
����� �Ǵ� �÷� != NULL ->1
����� �Ǵ� �÷� == NULL ->0


*/

SELECT first_name, NVL(commission_pct, 0)
FROM employees;

SELECT first_name, NVL2(commission_pct, '����', '����')
FROM employees;

SELECT department_id, /*�� ������ �� �� �ִ� �� �׷��Լ�ONLY*/ SUM(salary), MAX(salary), ROUND(AVG(salary))
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

SELECT department_id, job_id
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id ASC;

--GROUP BY 
--������ HAVING �ܵ� ��� �Ұ�

SELECT job_id, SUM(salary)
FROM employees
GROUP BY job_id
HAVING SUM(SALARY) >= 30000
ORDER BY SUM(salary) DESC;

SELECT job_id, COUNT(*), SUM(salary), TRUNC(AVG(salary))
FROM employees
WHERE salary > 5000         --HAVING ���� �ƴ� WHERE ���� �� ���� 
GROUP BY job_id
HAVING SUM(salary) > 20000;

