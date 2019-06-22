--WHERE �� == IF�� ==������

/*
    ǥ����
    �񱳿����ڿ� �Բ� ���(=, >, <, !=, >=, <=, <>(�����ʴ�) ) 
    NULL, = NULL(Ʋ������) EQUAL�� ��� �Ұ� JAVA������ �׷����� ����� �ȵȴ�
    IS NULL, IS NOT NULL �� ���� �������� ���
    ()��ȣ ������ �߿��� 
    (), NOT, AND(&&�� ������), OR(||�� ��� ����� �ٸ�)
    
    SELECT 
    FROM
    WHERE ������
    
    
*/

-- FIRST NAME == Julia
SELECT first_name, last_name, salary
FROM employees
WHERE FIRST_NAME = 'Julia';

--�޿��� 9000�� �̻��� ���
SELECT first_name, last_name, salary
FROM employees
WHERE salary >= 9000;

--�̸��� SHANTA���� ū �̸�
SELECT first_name, last_name, salary
FROM employees
WHERE FIRST_NAME >= 'Shanta';

SELECT first_name, last_name, salary
FROM employees
WHERE FIRST_NAME >= 'a';  -- �ƹ��͵� ã�� ���Ѵ� �ֳ� ��� �̸��� �빮�ڷ� �Ǿ��ֱ� ������ �̰ͺ��� ū �ƽ�Ű�ڵ�� ����. 

SELECT first_name, manager_id
FROM employees
WHERE manager_id = '';  -- ���ڴ� NULL�� �ƴϴ� 

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL; -- �ڹٿ����� == NULL �� ���� ����  

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NOT NULL;  


-- AND
-- �̸� JOHN�̰� �޿��� 5000�̻��� ���
SELECT first_name, last_name, salary
FROM employees 
WHERE first_name = 'John'
    AND salary > 5000;
--���ǹ��� ��� ������ ������ ���� Ȯ���ϰ� ���ó���ϴ� ��찡 ����

-- OR
SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'Shanta' 
    OR first_name = 'John';
    -- AND�� �Ұ��� �̸��� �ΰ��� ����� �����ϱ� 

-- 2007�� 12�� 31�� ���Ŀ� �Ի��� ��� ���
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '2007-12-31';

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > TO_DATE('20071231','YYYYMMDD'); -- TO_MONTH


--ALL(AND), ANY(OR) (ANY�ϰ� ALL�� ��� =)�� ��
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
-- �� �ݾ��� �������� ���� ������ ������� ���� �� ���� ��

SELECT first_name, salary
FROM employees
WHERE first_name IN('Julia', 'John');

--EXISTS �����Ͱ� �ִ��� ������ 
SELECT first_name, job_id
FROM employees e
WHERE EXISTS(SELECT 1
                 FROM DUAL
                WHERE e.JOB_ID = 'IT_PROG');
-- sub query ���� 1�� �������� ���� ���̸� �̶�� �������� ���ǹ��� �ִ� �� �̷� ���� dual�� ���� �� �ִٴ� ���� ����� �� �� exists�� ���� ������ ����

--BETWEEN ���������� (���� ���̴� ��) 
/*
�Ⱓ 
����
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


--LIKE  ��������û ���� ����
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'G_ra_d'; -- _�� ���� 

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'K%y'; -- �ڿ����� ���ڴ� �빮�ڷ� �ϸ� �ȵȴٰ� �Ѵٴ��� % ���ڼ��� ������ ����

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE '%A%'; -- A�� �� ��ġ ������� A�� �� ���� ����Ѵ�
-- �˻�� ����� �� �� ���� �� ���� ��� 

--2006�⵵�� �Ի��� ���

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '06%';



SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '06/01%'; -- ��¥�� ���ڿ��� ���� �ȵ�. ��¥�������� ������� ����� ����� 
