--����Ŭ�� �⺻�Լ� PL���� �ٸ� �� �����Ǵ� �Լ� 

-- DUAL : �������̺�  -> ���ุ �غ� �� �ִ� �����, ��� Ȯ�ο� �ӽ����̺�
SELECT 1 FROM DUAL; -- ������ ��� ���� Ȯ���� �� �ִ� ��, ���ڿ�, ���� �ѱ� ���� 
SELECT 'A' FROM DUAL;
SELECT '��' FROM DUAL;
SELECT 34*21 FROM DUAL;

------------------------------------------ �����Լ� 
-- CHR(N) : ASCII ���� ���ڷ� ��ȯ
SELECT CHR(97) FROM DUAL;
SELECT CHR(65) FROM DUAL;

SELECT '�� ������' || CHR(65) || '�Դϴ�' --���� "�� ������" +  CHR(65) + "�Դϴ�" �� �ڹٽ�Ÿ���� ���� ���
FROM DUAL;

-- LPAD(RPAD) : ������ ��ĭ�� Ư�����ڷ� ä��� ��
SELECT LPAD('BBB', 10) FROM DUAL;
SELECT LPAD('BBB', 10, '-') FROM DUAL;
SELECT RPAD('BBB', 10, '+') FROM DUAL;

--INSTR == Indexof ����: java : 0~ oracle : 1~
SELECT INSTR ('A123B456C', 'A') FROM DUAL;

SELECT INSTR ('A123B456C789B', 'B', 7) FROM DUAL; -- �ڿ������� ���� ���� 7�� ������ B�� ã���� 

SELECT INSTR ('A123B456C789B', 'B', 7, 1) FROM DUAL; -- 7�� ���Ŀ� ù��°�� ������ B

SELECT INSTR ('A123B456C789B', 'B', 7, 2) FROM DUAL; -- 7�� ���Ŀ� �ι�°�� ������ B ���⶧���� 0�� ���´� 


--REPLACE : ���ڿ� ġȯ 
SELECT REPLACE('AAAAAAAAAADFGA', 'A') FROM DUAL; --� ���ڷ� �ٲٶ�� ���� ��� ������ ��� A�� �� ���ֹ��� 

SELECT REPLACE('AAAAAAAAAADFGA', 'A','a') FROM DUAL;

SELECT REPLACE('AAAAAAAAAADFGA', 'AA','a') FROM DUAL ; -- �ǳ��� �ִ� A�� �ϳ��̱⶧���� ���� ���ڷ� ����� ���� �ʴ´�

--TRANSLATE : ����ġȯ
SELECT TRANSLATE('AAAAAAAAAADFGA', 'A', 'a') FROM DUAL;
SELECT TRANSLATE('AAAAAAAAAADFGA', 'AA','a') FROM DUAL ; --�ѱ��ڸ� ����Ͽ���

-----------------------------------------------���� �Լ�
--�ø�
SELECT CEIL(13.1) FROM DUAL; -- �ø��Լ�

--����
SELECT FLOOR(14.9) FROM DUAL;

--���� ������
SELECT MOD(9,2) FROM DUAL;
SELECT MOD(9.1,2.3) FROM DUAL; --���� ���� �������� �Ҽ����� ������� �������� ����Ŭ�� ��� ����

-- �¼� 
SELECT POWER(3,2) FROM DUAL;

--�ݿø�
SELECT ROUND(13.5) FROM DUAL;

--��ȣ   +�� ��� 1, 0�� ��� 0, -�� ��� -1�� ����
SELECT SIGN(13.4) FROM DUAL;
SELECT SIGN(0) FROM DUAL;
SELECT SIGN(-23.5) FROM DUAL;

--����  //���� ���Ǵ� �� 
SELECT TRUNC(12.3456) FROM DUAL;
SELECT TRUNC(12.3456, 2) FROM DUAL;
SELECT TRUNC(12.3456, -1) FROM DUAL; --1�� �ڸ��� �ִ� �ָ� ���� 

--ASCII �ڵ� ���� ������ <-> CHR�� �ݴ� 
SELECT ASCII('A') FROM DUAL;


--��ȯ �Լ� DATE ->STRING 

--TO_CHAR�ڡڡ�
SELECT TO_CHAR(SYSDATE) FROM DUAL; -- ��� �����δ� ���̰� ����

SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD-HH-MI-SS') FROM DUAL;

SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS') FROM DUAL;

SELECT TO_CHAR(10000000, '$999,999,999') FROM DUAL;

--TO_DATE�ڡڡ�
SELECT TO_DATE('20190617') FROM DUAL; --2019/06/17 �̷��� ���� �ʾƵ� �� ����
SELECT TO_DATE('20190617', 'YYYYMMDD') FROM DUAL;
SELECT TO_DATE('06172019', 'MMDDYYYY') FROM DUAL;

--TO_NUMBER ->INTEGER.PARSEINT
SELECT '100' + 12 FROM DUAL; --������ ��
SELECT TO_NUMBER('100') + 12 FROM DUAL; --������ ��

--LAST_DAY
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT LAST_DAY('2019/11/01') FROM DUAL;
SELECT LAST_DAY(TO_DATE('2019-11-01','YYYY-MM-DD')) FROM DUAL;
--���޶� �߿��� ��

-- �ڹ��� SubString (1,3) "ABCDE" -> BC�� ������ ��
--SUBSTR 
SELECT SUBSTR('ABCDE', 3) FROM DUAL;  -- 3��° ���ں��� ������

SELECT SUBSTR('ABCDE', 3, 1) FROM DUAL;   --3��°���� 1���ڸ� ���� �Ͷ�


--LENGTHB ���̰����� ����Ʈ �������� �������� �� ���ڱ��� BYTE���� 
--LENGTH ���ڱ���
SELECT LENGTH('ABC') FROM DUAL;
