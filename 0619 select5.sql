/*

���� : �� �� �̻��� ���̺��� �����ؼ� �����͸� �˻��ϴ� ��� 
���� �� �̻��� ��(row)���� ����� �� Primary key (�⺻Ű), Foreign key (�ܷ�Ű) ���� ����ؼ� join

primary key - ���̺� ����, �ߺ����� �ʴ� Ű -> ex) ID, sequence
foreign key - �ٸ� ���̺��� primary key, ����Ű�� ���ɼ��� ���� 

������ ����
inner Join �ڡڡڡڡ�
cross Join �١١١١�
outer Join �ڡڡڡ١�
   left outer
   right outer

self Join �ڡڡڡڡ�

SQL : Oracle ����, Ansi SQL(������ ���α׷����� �� ������ ����) 

*/

--inner Join
-- 1) Ansi SQL
SELECT e.employee_id, e.first_name, e.salary, 
    e.department_id, d.department_id, 
    d.department_name, d.location_id
FROM employees E INNER JOIN departments D
    ON e.department_id = d.department_id; --�̰Ŷ� �̰Ŷ� ���� ���� ���� ���ǹ� ���� �� 
    -- �μ���ȣ�� �μ����̺�� �������� ���� ���ʿ� �ִ� ���� �߽� ���� �μ���ȣ�� ������ �ٸ� ���̺�� �������� �۾�
    
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
    
--�����ȣ 147�� �μ���� �������� �˾Ƴ���

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
-- �������� equal�� ���� ���°� cross Join

--outer Join
--1) Full outer Join Ansi SQL ����
SELECT e.employee_id, e.first_name,
       e.department_id, d.department_id,
       d.department_name
FROM employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
--WHERE e.department_id IS NULL OR d.department_id IS NULL;
--          Kimberley            110�̻�

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
      AND e.department_id IS NULL;  -- ����� �κ��� ���ֱ� ���� ���
      
    

-- SELF JOIN: ������ ���̺��� �����ϴ� �� 
SELECT a.employee_id, a.first_name,
       a.manager_id, b.employee_id,
       b.first_name
FROM employees a, employees b -- a:����� ���� + �Ŵ����� ��ȣ�� �̱����� ���� b:�Ŵ����� �̸��� �̱� ���� ���� 
WHERE a.manager_id = b.employee_id;

--������ ����
SELECT  a.employee_id, a.first_name as "���",
       a.manager_id as "����� ���" , b.employee_id,
       b.first_name as "���"
       
FROM employees a, employees b
WHERE a.manager_id = b.employee_id(+)
CONNECT BY prior a.manager_id = a.employee_id --����� ���������� �ö󰡴� ��
--CONNECT BY  a.manager_id = prior a.employee_id --����� ���������� �ö󰡴� ��

