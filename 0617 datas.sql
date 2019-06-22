SELECT * FROM employees; /*소문자 대문자 모두 가능 소문자와 대문자를 섞지 않는게 좋다.  */
select * from employees;
SELECT * FROM EMPLOYEES;   /*제일 권장하는 스타일의 모양*/


-- 한줄 주석문
/*
범위주석문
*/

--자료형
-- java           oracle 
-- int          => NUMBER
-- String       => VARCHAR2
-- double       => NUMBER (정수의 자리수 ,소수의 자리수) 마치 함수같이 사용
-- Date         => Date


--문자열 자료형
--CHAR 
CREATE TABLE TB_CHAR(
COL_CHAR1 CHAR(10 BYTE), -- String COL_CHAR1; 이 형태와 동일 10바이트 형태로 잡아랏 영어 철자로 10개정도인 느낌 
COL_CHAR2 CHAR(10 CHAR),
COL_CHAR3 CHAR(10)  -- 아무것도 안적으면 바이트로 들어감
);

/*
CREATE TABLE 테이블명 (
    컬럼명 컬럼의 자료형(크기) -> 크기를 적지않고 사용은 가능하지만, 용량이 굉장히 적은편으로 나옴
    컬럼명 컬럼의 자료형(크기)
    하나의 스키마에는 동일한 
*/

INSERT INTO TB_CHAR (COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('ABC', 'ABC', 'ABC'); -- 디비에서는 큰따옴표가 아닌 작은따옴표로 되는 것 
-- 영문의 경우 무조건 1바이트 


SELECT * FROM tb_char; 

INSERT INTO TB_CHAR (COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('가', '나', '다'); -- 한글크기 3바이트 

INSERT INTO TB_CHAR (COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('가나', '가나', '가나');

INSERT INTO TB_CHAR (COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('가나다', '가나다', '가나다');

SELECT col_char1, col_char2, col_char3,
    LENGTHB(col_char1),LENGTHB(col_char2),LENGTHB(col_char3)
FROM tb_char;



/*
CHAR : 10BYTE 00000 00000
ABC -> `      ABC00 00000

10BYTE 
가나다 -> 가나다0
10CHAR
한글은 3BYRE
가 3+9 = 12 가0000   00000  이렇게 생긴거라 12바티으로 나옴 
가나 3+ 3+ 8 = 가나000  00000 14바이트 
가나다 3+3+3 + 7 = 가나다00 00000
*/

--VARCHAR2 문자열

CREATE TABLE TB_VARCHAR(
    컬럼1 VARCHAR2(10 BYTE),
    컬럼2 VARCHAR2(10 CHAR),
    컬럼3 VARCHAR2(10)
);


INSERT INTO TB_VARCHAR(컬럼1, 컬럼2, 컬럼3)
VALUES('ABC','ABC','ABC');

INSERT INTO TB_VARCHAR(컬럼1, 컬럼2, 컬럼3)
VALUES('가나다','가나다','가나다');

SELECT "컬럼1", "컬럼2", "컬럼3", 
    LENGTHB("컬럼1"), LENGTHB("컬럼2"), LENGTHB("컬럼3")
    
FROM tb_varchar;

-- LONG 최대 2GB까지 저장 가능

CREATE TABLE TB_LONG(  --ORACLE에서 LONG은 문자열이다!!!
    COL_LONG1 LONG  --롱은 크기 잡아주지 않는다
 --   COL_LONG2 LONG
);

INSERT INTO TB_LONG(COL_LONG1)
VALUES ('ABC');

SELECT * FROM tb_long;

--숫자 자료형 INTEGER

CREATE TABLE TB_INTEGER(
    COL_INT1 INTEGER,
    COL_INT2 INTEGER
);

INSERT INTO TB_INTEGER(COL_INT1, COL_INT2)
VALUES(4,5);

SELECT * FROM tb_integer;


-- NUMBER (정수, 실수 둘다 사용 가능)
CREATE TABLE TB_NUMBER(
    COL_NUM1 NUMBER,
    COL_NUM2 NUMBER(5),
    COL_NUM3 NUMBER(5,2),
    COL_NUM4 NUMBER(*,2)
);


INSERT INTO tb_number(COL_NUM1,COL_NUM2,COL_NUM3,COL_NUM4)
VALUES(1234.5678, 12345, 124.56, 1234.56789);  -- 오류 1234.567 5자리에 소수 2자리까지 이므로 오류가 나옴 컬럼 3에서 

SELECT * FROM tb_number;

--날짜 자료형 DATE
--연도 월, 일, 시,분,초 다들어가 있는것 
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
VALUES ('19/08/15', '19/07/12'); --시간은 지금으로 들어가게 된다

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES (SYSDATE, '2019-07-12 10:32:24'); --오류

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES (SYSDATE, '20190712103224', 'YYYYMMDDHHMISS');

--VARCHAR2(문자열) => DATE(날짜형식)  : TO_DATE
--DATE(날짜형식) => VARCHAR2(문자열)  : TO_CHAR


DROP TABLE TB_CHAR;
DROP TABLE TB_VARCHAR;
DROP TABLE TB_LONG;
DROP TABLE TB_NUMBER;
DROP TABLE TB_INTEGER;
DROP TABLE TB_DATE;