--오라클의 기본함수 PL과는 다른 것 지원되는 함수 

-- DUAL : 가상테이블  -> 실행만 해볼 수 있는 결과값, 결과 확인용 임시테이블
SELECT 1 FROM DUAL; -- 나오는 결과 값만 확인할 수 있는 것, 문자열, 숫자 한글 가능 
SELECT 'A' FROM DUAL;
SELECT '가' FROM DUAL;
SELECT 34*21 FROM DUAL;

------------------------------------------ 문자함수 
-- CHR(N) : ASCII 값을 문자로 변환
SELECT CHR(97) FROM DUAL;
SELECT CHR(65) FROM DUAL;

SELECT '내 점수는' || CHR(65) || '입니다' --오류 "내 점수는" +  CHR(65) + "입니다" 의 자바스타일을 쓰는 방법
FROM DUAL;

-- LPAD(RPAD) : 나머지 빈칸을 특정문자로 채우는 것
SELECT LPAD('BBB', 10) FROM DUAL;
SELECT LPAD('BBB', 10, '-') FROM DUAL;
SELECT RPAD('BBB', 10, '+') FROM DUAL;

--INSTR == Indexof 시작: java : 0~ oracle : 1~
SELECT INSTR ('A123B456C', 'A') FROM DUAL;

SELECT INSTR ('A123B456C789B', 'B', 7) FROM DUAL; -- 뒤에나오는 순번 이후 7번 이후의 B를 찾으라 

SELECT INSTR ('A123B456C789B', 'B', 7, 1) FROM DUAL; -- 7번 이후에 첫번째로 나오는 B

SELECT INSTR ('A123B456C789B', 'B', 7, 2) FROM DUAL; -- 7번 이후에 두번째로 나오는 B 없기때문에 0이 나온다 


--REPLACE : 문자열 치환 
SELECT REPLACE('AAAAAAAAAADFGA', 'A') FROM DUAL; --어떤 문자로 바꾸라는 것을 명시 안했을 경우 A를 다 없애버림 

SELECT REPLACE('AAAAAAAAAADFGA', 'A','a') FROM DUAL;

SELECT REPLACE('AAAAAAAAAADFGA', 'AA','a') FROM DUAL ; -- 맨끝에 있는 A는 하나이기때문에 같은 문자로 취급을 하지 않는다

--TRANSLATE : 문자치환
SELECT TRANSLATE('AAAAAAAAAADFGA', 'A', 'a') FROM DUAL;
SELECT TRANSLATE('AAAAAAAAAADFGA', 'AA','a') FROM DUAL ; --한글자만 취급하였음

-----------------------------------------------숫자 함수
--올림
SELECT CEIL(13.1) FROM DUAL; -- 올림함수

--내림
SELECT FLOOR(14.9) FROM DUAL;

--나눈 나머지
SELECT MOD(9,2) FROM DUAL;
SELECT MOD(9.1,2.3) FROM DUAL; --원래 나눈 나머지는 소수점을 사용하지 못하지만 오라클의 경우 가능

-- 승수 
SELECT POWER(3,2) FROM DUAL;

--반올림
SELECT ROUND(13.5) FROM DUAL;

--부호   +의 경우 1, 0일 경우 0, -일 경우 -1로 나옴
SELECT SIGN(13.4) FROM DUAL;
SELECT SIGN(0) FROM DUAL;
SELECT SIGN(-23.5) FROM DUAL;

--버림  //많이 사용되는 편 
SELECT TRUNC(12.3456) FROM DUAL;
SELECT TRUNC(12.3456, 2) FROM DUAL;
SELECT TRUNC(12.3456, -1) FROM DUAL; --1의 자리에 있는 애를 버림 

--ASCII 코드 값을 보여줌 <-> CHR과 반대 
SELECT ASCII('A') FROM DUAL;


--변환 함수 DATE ->STRING 

--TO_CHAR★★★
SELECT TO_CHAR(SYSDATE) FROM DUAL; -- 결과 값으로는 차이가 없음

SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD-HH-MI-SS') FROM DUAL;

SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS') FROM DUAL;

SELECT TO_CHAR(10000000, '$999,999,999') FROM DUAL;

--TO_DATE★★★
SELECT TO_DATE('20190617') FROM DUAL; --2019/06/17 이렇게 넣지 않아도 잘 나옴
SELECT TO_DATE('20190617', 'YYYYMMDD') FROM DUAL;
SELECT TO_DATE('06172019', 'MMDDYYYY') FROM DUAL;

--TO_NUMBER ->INTEGER.PARSEINT
SELECT '100' + 12 FROM DUAL; --가능은 함
SELECT TO_NUMBER('100') + 12 FROM DUAL; --가능은 함

--LAST_DAY
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT LAST_DAY('2019/11/01') FROM DUAL;
SELECT LAST_DAY(TO_DATE('2019-11-01','YYYY-MM-DD')) FROM DUAL;
--윤달때 중요한 편

-- 자바의 SubString (1,3) "ABCDE" -> BC를 가지고 옴
--SUBSTR 
SELECT SUBSTR('ABCDE', 3) FROM DUAL;  -- 3번째 글자부터 끝까지

SELECT SUBSTR('ABCDE', 3, 1) FROM DUAL;   --3번째부터 1글자를 갖고 와라


--LENGTHB 길이값에서 바이트 형식으로 가져오는 것 문자길이 BYTE형식 
--LENGTH 문자길이
SELECT LENGTH('ABC') FROM DUAL;
