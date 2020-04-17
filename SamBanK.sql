-- 관리자 테이블
create table adminTBL(
    admin_no NUMBER(10) constraint pk_admin_no primary key, -- 관리자 번호(사번)
    auth NVARCHAR2(2) not null, -- 관리자 등급
    id NVARCHAR2(10)not null UNIQUE, -- 아이디
    password NVARCHAR2(20) not null, -- 패스워드
    name NVARCHAR2(10) not null, -- 이름
    rank NVARCHAR2(10) not null, -- 직책
    branch NVARCHAR2(20) not null, -- 지점
    phone NVARCHAR2(20) not null); -- 전화번호
    
-- 로그 기록
create table logTBL(
    log_no NUMBER(10) constraint pk_log_no primary key, -- 로그번호
    admin_no NUMBER(10), -- 관리자 번호(사번)
    logindate date DEFAULT sysdate, -- 로그인 시간
    logoutdate date DEFAULT sysdate); -- 로그아웃 시간
    
-- 관리자 게시판
create table admin_board(
    admin_bno number(10) constraint pk_admin_board primary key, -- 글번호
    admin_no number(10) not null, -- 관리자 번호(사번)
    title VARCHAR2(200) not null, -- 제목
    content VARCHAR2(2000) not null, -- 내용
    writer VARCHAR2(50) not null, -- 작성자
    regdate date default sysdate, -- 등록시간
    updatedate date default sysdate); --수정시간
    
-- 보안인증서 게시판--
create table authTBL(
    auth_no number(10) constraint pk_auth_no primary key, -- 인증서 번호
    cno number(10) not null, -- 고객 번호
    certificate NUMBER(10) not null, -- 인증서 유무 확인(boolean)
    password NVARCHAR2(20) not null); -- 인증서 암호


-- 고객 정보 테이블
create table customerTBL(
    cno number(10) constraint pk_cno primary key, -- 고객 번호
    rating number(10) not null, -- 신용도
    name NVARCHAR2(20) not null, -- 고객 이름
    gender NVARCHAR2(20) not null, -- 성별
    birth NVARCHAR2(20) not null, -- 생년월일
    resident_registration_no NVARCHAR2(20) not null, -- 주민번호
    address NVARCHAR2(100) not null, -- 주소
    mobile NVARCHAR2(15) not null, -- 연락처
    id NVARCHAR2(20) not null UNIQUE, -- 아이디
    password NVARCHAR2(20) not null, -- 비밀번호
    passhint NVARCHAR2(20) not null, -- 비밀번호 힌트
    email NVARCHAR2(30) not null, -- 이메일
    withdrawal_limits number(38) not null, -- 최대 출금 한도
    check_card number(10) not null, -- 카드 신청여부(boolean)
    createdate date DEFAULT sysdate); -- 가입 날짜
    

-- 입출금 계좌 테이블    
create table depositTBL(
    dno number(10) constraint pk_dno primary key, -- 계좌 생성 번호
    cno number(10) not null, -- 고객 번호
    ano NVARCHAR2(20) not null, -- 계좌 번호
    balance NUMBER(20) not null, -- 잔액
    createdate date DEFAULT sysdate, -- 계좌 생성 날짜
    updatedate date DEFAULT sysdate); -- 계좌 수정 날짜
    
    
-- 적금 계좌 테이블
create table savings_accountTBL(
    sno number(10) constraint pk_sno primary key, -- 계좌 생성 번호
    cno number(10) not null, -- 고객 번호
    ano NVARCHAR2(20) not null, -- 계좌 번호
    balance NUMBER(20) not null, -- 잔액
    createdate date DEFAULT sysdate, -- 계좌 생성 날짜
    updatedate date DEFAULT sysdate); -- 계좌 수정 날짜
    
-- 대출 계좌 테이블
create table loanTBL(
    lno number(10) constraint pk_lno primary key, -- 계좌 생성 번호
    cno number(10) not null, -- 고객 번호
    ano NVARCHAR2(20) not null, -- 계좌 번호
    balance NUMBER(20) not null, -- 잔액
    createdate date DEFAULT sysdate, -- 계좌 생성 날짜
    updatedate date DEFAULT sysdate); -- 계좌 수정 날짜
    
-- 입출금 계좌 내역 --
-- pk
-- ano, 입금명+계좌, 입금액, 출금명+계좌, 출금액, 날짜:시간
create table account_history(
    ano NVARCHAR2(20) constraint pk_ano primary key, -- 계좌 번호
    deposit number(38) not null, -- 입금
    withdrawal number(38) not null); -- 출금

-- 고객 게시판 테이블
create table customer_board(
    bno number(10) constraint pk_customer_board primary key, -- 게시판 번호
    cno number(10) not null, -- 고객 번호
    title VARCHAR2(200) not null, -- 제목
    content VARCHAR2(2000) not null, -- 내용
    writer VARCHAR2(50) not null, -- 작성자
    regdate date default sysdate, -- 작성시간
    updatedate date default sysdate); -- 수정시간
    
-- 고객 게시판 댓글 테이블
create table board_reply(
	rno number(10) constraint pk_reply primary key, -- 댓글 번호
	bno number(10) not null, -- 게시판 번호
	reply varchar2(1000) not null, -- 댓글 내용
	replyer varchar2(50) not null, -- 댓글 작성자
	replydate date default sysdate, -- 댓글 작성시간
	updatedate date default sysdate); -- 댓글 수정시간

-- 카드 테이블--
create table cardTBL(
    card_no number(10) constraint pk_card primary key, -- 카드 번호
    cno number(10) not null, -- 고객번호
    createdate date default sysdate); -- 카드 생성 날짜

-- 타 은행 테이블
create table bankTBL(
    bnak_no number(10) constraint pk_bnak primary key, -- idx
    bank_name varchar2(20) not null, -- 은행명
    name varchar2(20) not null, -- 이름
    ano number(20) not null); -- 계좌번호

-- 고객 신용도 테이블
create table ratingTBL(
    rating_no number(10) constraint pk_rating primary key, -- idx
    cno number(10) not null, -- 고객 번호
    name NVARCHAR2(10) not null, -- 이름
    resident_registration_no NVARCHAR2(20) not null, -- 주민번호
    rating number(10) not null); -- 신용도
    

-- 시퀀스 생성

create sequence seq_customer;
create sequence seq_deposit;
create sequence seq_savings_account;
create sequence seq_loan;
create sequence seq_board;
create sequence seq_reply;
create sequence seq_deposit_history;
create sequence seq_admin;
create sequence seq_log;
create sequence seq_admin_board;
create sequence seq_auth;
create sequence seq_card;
create sequence seq_bank;
create sequence seq_rating;

-- 시퀀스 삭제
drop sequence seq_customer;
drop sequence seq_deposit;
drop sequence seq_savings_account;
drop sequence seq_loan;
drop sequence seq_board;
drop sequence seq_reply;
drop sequence seq_deposit_history;
drop sequence seq_admin;
drop sequence seq_log;
drop sequence seq_admin_board;
drop sequence seq_auth;
drop sequence seq_card;
drop sequence seq_bank;
drop sequence seq_rating;

-- 제약 조건
ALTER TABLE depositTBL add constraint fk_deposit foreign key(cno) references customerTBL(cno);
ALTER TABLE savings_accountTBL add constraint fk_savings_account foreign key(cno) references customerTBL(cno);
ALTER TABLE loanTBL add constraint fk_loan foreign key(cno) references customerTBL(cno);
ALTER TABLE customer_board add constraint fk_customer_board foreign key(cno) references customerTBL(cno);
ALTER TABLE board_reply add constraint fk_board_reply foreign key(bno) references customer_board(bno);
ALTER TABLE depositTBL add constraint fk_deposit_history foreign key(ano) references deposit_history(ano);
ALTER TABLE savings_accountTBL add constraint fk_savings_history foreign key(ano) references deposit_history(ano);
ALTER TABLE loanTBL add constraint fk_loan_history foreign key(ano) references deposit_history(ano);
ALTER TABLE logTBL add constraint fk_log foreign key(admin_no) references adminTBL(admin_no);
ALTER TABLE admin_board add constraint fk_admin_board foreign key(admin_no) references adminTBL(admin_no);
ALTER TABLE cardTBL add constraint fk_card foreign key(cno) references customerTBL(cno);
ALTER TABLE ratingTBL add constraint fk_rating foreign key(cno) references customerTBL(cno);

-- 테이블 삭제
drop table customerTBL;
drop table depositTBL;
drop table savings_accountTBL;
drop table loanTBL;
drop table deposit_history;
drop table customer_board;
drop table board_reply;
drop table adminTBL;
drop table logTBL;
drop table admin_board;
drop table authTBL;
drop table cardTBL;
drop table bankTBL;
drop table ratingTBL;





    






