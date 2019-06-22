-- Ư��  Query
-- CASE, DECODE ���� �б⸦ �� �� �ִ� ���� 
SELECT employee_id, first_name, phone_number,
    CASE SUBSTR(phone_number, 1, 3)/*������ȣ*/
    WHEN '515' THEN '����'
    WHEN '590' THEN '�λ�'
    WHEN '659' THEN '����'
    WHEN '603' THEN '����'
    ELSE '��Ÿ'
    END AS "����"
FROM employees; 

--CASE �ȿ� �ִ� ���� �ϳ��� �÷��� �Ǵ� �� 
SELECT employee_id, first_name, phone_number,
    CASE
        WHEN SUBSTR(phone_number, 1, 3) = '515' THEN '����'
        WHEN SUBSTR(phone_number, 1, 3) = '590' THEN '�λ�'
        WHEN SUBSTR(phone_number, 1, 3) = '659' THEN '����'
        WHEN SUBSTR(phone_number, 1, 3) = '603' THEN '����'
        ELSE '��Ÿ'
        END AS "����"
FROM employees; 

--DECODE
--�Լ������� ����Ѵٴ� ������ �ٸ���. 
SELECT employee_id, first_name, phone_number,
    DECODE(SUBSTR(phone_number, 1, 3),
        '515', '����',
        '590', '�λ�',
        '659', '����',
        '603', '����', '��Ÿ') AS "����"
FROM employees;

-- OVER() PARTITION BY ORDER BY �߿��ϴ�
--�ֹ��°���? �÷� ������ ���ؼ� ������ �Ű��ֱ� ���� ���� �Խñۿ����� �ֽű��� ���� ����� ��, 5���� 10���� 20���� �߶� �������� �Ѱ��ִ� �������� �� �� �̰� ����. 
SELECT job_id, salary, COUNT(*)OVER(PARTITION BY job_id ORDER BY salary DESC)
FROM employees;


SELECT job_id,  COUNT(*)OVER()
FROM employees;


SELECT job_id,  COUNT(*)OVER(PARTITION BY job_id) -- �׷������ ������ ī��Ʈ
FROM employees;

SELECT department_id, job_id, MIN(salary)OVER(PARTITION BY job_id)
FROM employees;
--�׷���̴� ���ΰ͸� �������� �� ��� �ٸ� �÷��� �� �� �ִ� �� 
--AVG()
--MAX()
--MIN()
--SUM()


--�м��Լ� 
-- ������ �ű�� �Լ� RANK 
-- RANK()                   1 2 3 3 5 6
-- DENSE_RANK()             1 2 3 3 4 5 
-- ROW_NUMBER()��           1 2 3 4 5 6 
-- ROW_NUM��                1 2 3 4 5 6 

SELECT first_name, salary,
    RANK()OVER(ORDER BY salary DESC),
    DENSE_RANK()OVER(ORDER BY salary DESC),
    ROW_NUMBER()OVER(ORDER BY salary DESC)  -- �Խ��ǿ� �ð��̳� ��¥�� �ֽű��� ������ �� �ְ� �̰� ������ �Ѵٴ� �� 
    
FROM employees
ORDER BY salary DESC;

-- 10���� �����͸��� �����ϴ� ��� 

SELECT ROWNUM, employee_id, first_name, salary
  
FROM employees
WHERE ROWNUM <= 10;
-- �̷��� ���� ���� ������ ���� ����δ�

SELECT ROWNUM, employee_id, first_name, salary --2������ ���� 
FROM employees
WHERE ROWNUM BETWEEN 11 AND 20;  --�̰� 1������ ����(ROWNUM ����) 

--1. ����
--2. ROWNUM �ϼ�
--3. ������ ����
SELECT RNUM, employee_id, first_name, salary

FROM
    (SELECT ROWNUM AS RNUM, 
        employee_id, first_name, salary
    FROM
        (SELECT employee_id, first_name, salary
        FROM employees)
    )
WHERE RNUM BETWEEN 11 AND 20;


