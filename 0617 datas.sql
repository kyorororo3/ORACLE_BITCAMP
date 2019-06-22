SELECT * FROM employees; /*�ҹ��� �빮�� ��� ���� �ҹ��ڿ� �빮�ڸ� ���� �ʴ°� ����.  */
select * from employees;
SELECT * FROM EMPLOYEES;   /*���� �����ϴ� ��Ÿ���� ���*/


-- ���� �ּ���
/*
�����ּ���
*/

--�ڷ���
-- java           oracle 
-- int          => NUMBER
-- String       => VARCHAR2
-- double       => NUMBER (������ �ڸ��� ,�Ҽ��� �ڸ���) ��ġ �Լ����� ���
-- Date         => Date


--���ڿ� �ڷ���
--CHAR 
CREATE TABLE TB_CHAR(
COL_CHAR1 CHAR(10 BYTE), -- String COL_CHAR1; �� ���¿� ���� 10����Ʈ ���·� ��ƶ� ���� ö�ڷ� 10�������� ���� 
COL_CHAR2 CHAR(10 CHAR),
COL_CHAR3 CHAR(10)  -- �ƹ��͵� �������� ����Ʈ�� ��
);

/*
CREATE TABLE ���̺�� (
    �÷��� �÷��� �ڷ���(ũ��) -> ũ�⸦ �����ʰ� ����� ����������, �뷮�� ������ ���������� ����
    �÷��� �÷��� �ڷ���(ũ��)
    �ϳ��� ��Ű������ ������ 
*/

INSERT INTO TB_CHAR (COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('ABC', 'ABC', 'ABC'); -- ��񿡼��� ū����ǥ�� �ƴ� ��������ǥ�� �Ǵ� �� 
-- ������ ��� ������ 1����Ʈ 


SELECT * FROM tb_char; 

INSERT INTO TB_CHAR (COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('��', '��', '��'); -- �ѱ�ũ�� 3����Ʈ 

INSERT INTO TB_CHAR (COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('����', '����', '����');

INSERT INTO TB_CHAR (COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('������', '������', '������');

SELECT col_char1, col_char2, col_char3,
    LENGTHB(col_char1),LENGTHB(col_char2),LENGTHB(col_char3)
FROM tb_char;



/*
CHAR : 10BYTE 00000 00000
ABC -> `      ABC00 00000

10BYTE 
������ -> ������0
10CHAR
�ѱ��� 3BYRE
�� 3+9 = 12 ��0000   00000  �̷��� ����Ŷ� 12��Ƽ���� ���� 
���� 3+ 3+ 8 = ����000  00000 14����Ʈ 
������ 3+3+3 + 7 = ������00 00000
*/

--VARCHAR2 ���ڿ�

CREATE TABLE TB_VARCHAR(
    �÷�1 VARCHAR2(10 BYTE),
    �÷�2 VARCHAR2(10 CHAR),
    �÷�3 VARCHAR2(10)
);


INSERT INTO TB_VARCHAR(�÷�1, �÷�2, �÷�3)
VALUES('ABC','ABC','ABC');

INSERT INTO TB_VARCHAR(�÷�1, �÷�2, �÷�3)
VALUES('������','������','������');

SELECT "�÷�1", "�÷�2", "�÷�3", 
    LENGTHB("�÷�1"), LENGTHB("�÷�2"), LENGTHB("�÷�3")
    
FROM tb_varchar;

-- LONG �ִ� 2GB���� ���� ����

CREATE TABLE TB_LONG(  --ORACLE���� LONG�� ���ڿ��̴�!!!
    COL_LONG1 LONG  --���� ũ�� ������� �ʴ´�
 --   COL_LONG2 LONG
);

INSERT INTO TB_LONG(COL_LONG1)
VALUES ('ABC');

SELECT * FROM tb_long;

--���� �ڷ��� INTEGER

CREATE TABLE TB_INTEGER(
    COL_INT1 INTEGER,
    COL_INT2 INTEGER
);

INSERT INTO TB_INTEGER(COL_INT1, COL_INT2)
VALUES(4,5);

SELECT * FROM tb_integer;


-- NUMBER (����, �Ǽ� �Ѵ� ��� ����)
CREATE TABLE TB_NUMBER(
    COL_NUM1 NUMBER,
    COL_NUM2 NUMBER(5),
    COL_NUM3 NUMBER(5,2),
    COL_NUM4 NUMBER(*,2)
);


INSERT INTO tb_number(COL_NUM1,COL_NUM2,COL_NUM3,COL_NUM4)
VALUES(1234.5678, 12345, 124.56, 1234.56789);  -- ���� 1234.567 5�ڸ��� �Ҽ� 2�ڸ����� �̹Ƿ� ������ ���� �÷� 3���� 

SELECT * FROM tb_number;

--��¥ �ڷ��� DATE
--���� ��, ��, ��,��,�� �ٵ� �ִ°� 
CREATE TABLE TB_DATE(
    COL_DATE1 DATE,
    COL_DATE2 DATE
);

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES(SYSDATE, SYSDATE-1);

SELECT * FROM tb_date;

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES (SYSDATE, TO_DATE('2019-07-12 10:32:24', 'YYYY-MM-DD HH:MI:SS'));

SELECT * FROM tb_date;

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES ('19/08/15', '19/07/12'); --�ð��� �������� ���� �ȴ�

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES (SYSDATE, '2019-07-12 10:32:24'); --����

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES (SYSDATE, '20190712103224', 'YYYYMMDDHHMISS');

--VARCHAR2(���ڿ�) => DATE(��¥����)  : TO_DATE
--DATE(��¥����) => VARCHAR2(���ڿ�)  : TO_CHAR


DROP TABLE TB_CHAR;
DROP TABLE TB_VARCHAR;
DROP TABLE TB_LONG;
DROP TABLE TB_NUMBER;
DROP TABLE TB_INTEGER;
DROP TABLE TB_DATE;