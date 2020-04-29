-- 관리자 테이블
create table adminTBL(
    id NVARCHAR2(10)constraint pk_admin_id primary key, -- 아이디
    password NVARCHAR2(100) not null,-- 패스워드
    admin_no NVARCHAR2(10)not null UNIQUE, -- 관리자 번호(사번)
    auth NVARCHAR2(10) not null, -- 관리자 등급
    name NVARCHAR2(10) not null, -- 이름
    rank NVARCHAR2(10) not null, -- 직책
    branch NVARCHAR2(20) not null, -- 지점
    mobile NVARCHAR2(20) not null, -- 전화번호
    enabled number(10) not null); -- 계정상태(로그인 허용/잠금)

-- 로그 기록
create table logTBL(
    log_no NUMBER(10) constraint pk_log_no primary key, -- 로그번호
    id NVARCHAR2(10) not null, -- 관리자 아이디
    logindate date DEFAULT sysdate, -- 로그인 시간
    logoutdate date DEFAULT sysdate); -- 로그아웃 시간

-- 관리자 전용 게시판
create table admin_board(
    admin_bno number(10) constraint pk_admin_board primary key, -- 글번호
    id NVARCHAR2(10) not null, -- 관리자 아이디
    title NVARCHAR2(200) not null, -- 제목
    content NVARCHAR2(2000) not null, -- 내용
    writer NVARCHAR2(10) not null, -- 작성자
    regdate date default sysdate, -- 등록시간
    updatedate date default sysdate); --수정시간

-- 공지사항 게시판   
create table notice_board(
    notice_bno number(10) constraint pk_notice_board primary key, -- 글번호
    id NVARCHAR2(10) not null, -- 관리자 번호(사번)
    title NVARCHAR2(200) not null, -- 제목
    content NVARCHAR2(2000) not null, -- 내용
    writer NVARCHAR2(10) not null, -- 작성자
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
    name NVARCHAR2(20) not null, -- 고객 이름
    eng_name NVARCHAR2(20) not null, -- 영어 이름
    gender NVARCHAR2(1) not null, -- 성별
    birth NVARCHAR2(8) not null, -- 생년월일
    reg_no NVARCHAR2(13) not null, -- 주민번호
    address NVARCHAR2(100) not null, -- 주소
    mobile NVARCHAR2(11) not null, -- 연락처
    id NVARCHAR2(20) not null UNIQUE, -- 아이디
    password NVARCHAR2(20) not null, -- 비밀번호
    email NVARCHAR2(30) not null, -- 이메일
    createdate date DEFAULT sysdate, -- 가입 날짜
    updatedate date default sysdate); -- 수정 날짜


-- 입출금 계좌 테이블    
create table depositTBL(
    cno number(10) not null, -- 고객 번호
    ano NVARCHAR2(20) constraint pk_dno primary key, -- 계좌 번호
    type number(1) not null, -- 통장 종류
    product number(3) not null, -- 상품 종류
    password NVARCHAR2(20) not null, -- 비밀번호
    balance NUMBER(20) not null, -- 잔액
    card_apply CHAR(1) default 'I', -- 카드 유무
    card_no NVARCHAR2(15), -- 카드 번호
    day_withdraw NUMBER(20) not null, -- 하루 출금 한도
    max_withdraw NUMBER(20) not null, -- 한번에 출금 가능 한도
    branch NVARCHAR2(10) not null, -- 지점
    createdate date DEFAULT sysdate, -- 계좌 생성 날짜
    updatedate date DEFAULT sysdate); -- 계좌 수정 날짜

-- 상품 테이블
create table productTBL(
    product number(3) constraint pk_product primary key,-- 상품 종류
    p_name NVARCHAR2(20) not null,-- 상품 이름
    interest_rates NUMBER(5) not null,-- 금리
    limit NUMBER(20) not null,-- 금액 제한
    exp_date date DEFAULT sysdate, -- 만료일자
    repay_date date DEFAULT sysdate);-- 상환일자

-- 입출금 계좌 내역
create table deposit_history(
    hno number(10) constraint pk_hno primary key, -- 입출금 번호
    ano NVARCHAR2(20) not null, -- 계좌 번호
    from_ano NVARCHAR2(20),  -- 입/출금 계좌번호
    name NVARCHAR2(20) not null, -- 고객 이름
    deposit number(38), -- 입금
    withdrawal number(38), -- 출금
    balance NUMBER(20), -- 잔액
    Depositdate date DEFAULT sysdate); -- 날짜


-- 고객 게시판 테이블
create table customer_board(
    bno number(10) constraint pk_customer_board primary key, -- 게시판 번호
    cno number(10) not null, -- 고객 번호
    title NVARCHAR2(200) not null, -- 제목
    content NVARCHAR2(2000) not null, -- 내용
    writer NVARCHAR2(50) not null, -- 작성자
    regdate date default sysdate, -- 작성시간
    updatedate date default sysdate); -- 수정시간
    
    
-- 고객 게시판 댓글 테이블
create table board_reply(
	rno number(10) constraint pk_reply primary key, -- 댓글 번호
	bno number(10) not null, -- 게시판 번호
	reply NVARCHAR2(1000) not null, -- 댓글 내용
	replyer NVARCHAR2(50) not null, -- 댓글 작성자
	replydate date default sysdate, -- 댓글 작성시간
	updatedate date default sysdate); -- 댓글 수정시간

-- 카드 테이블
create table cardTBL(
    card_no number(10) constraint pk_card primary key, -- 카드 번호
    ano NVARCHAR2(20) not null, -- 계좌 번호
    p_name NVARCHAR2(20) not null,-- 상품
    c_type NVARCHAR2(5) not null,-- 종류(비자/마스터)
    Exp_date number(6)not null, -- 만료 일자
    security_key number(3)not null,-- 보안키
    condition NVARCHAR2(12) DEFAULT '0', -- 카드 상태 카드 사용전/정상/도난/분실
    createdate date default sysdate, -- 카드 생성 날짜
    updatedate date default sysdate); -- 카드 수정 날짜 

    
-- 카드 상품 테이블
CREATE TABLE card_product (
    product     NUMBER(3) NOT NULL CONSTRAINT pk_card_product PRIMARY KEY, -- 상품 번호
    p_name      NVARCHAR2(100) NOT NULL, -- 상품이름
    service1    CHAR(1 BYTE) DEFAULT '0', -- 서비스 종류
    service2    CHAR(1 BYTE) DEFAULT '0', -- 서비스 종류
    service3    CHAR(1 BYTE) DEFAULT '0', -- 서비스 종류
    service4    CHAR(1 BYTE) DEFAULT '0', -- 서비스 종류
    service5    CHAR(1 BYTE) DEFAULT '0', -- 서비스 종류
    service6    CHAR(1 BYTE) DEFAULT '0', -- 서비스 종류
    service7    CHAR(1 BYTE) DEFAULT '0', -- 서비스 종류
    service8    CHAR(1 BYTE) DEFAULT '0', -- 서비스 종류
    service9    CHAR(1 BYTE) DEFAULT '0', -- 서비스 종류
    service10   CHAR(1 BYTE) DEFAULT '0' -- 서비스 종류
);

-- 카드 상태 테이블(신청/재발급/사용/사용전..)
CREATE TABLE card_condition (
    condition        CHAR(1 BYTE) NOT NULL CONSTRAINT card_condition_pk PRIMARY KEY, -- 상태 번호
    condition_name   NVARCHAR2(20) NOT NULL -- 상황
);

-- 타 은행 테이블
create table bankTBL(
    bnak_no number(10) constraint pk_bnak primary key, -- idx
    bank_name NVARCHAR2(20) not null, -- 은행명
    hno number(10) not null); -- 계좌번호

-- 고객 신용도 테이블
create table ratingTBL(
    rating_no number(10) constraint pk_rating primary key, -- idx
    cno number(10) not null, -- 고객 번호
    name NVARCHAR2(10) not null, -- 이름
    reg_no NVARCHAR2(20) not null, -- 주민번호
    rating number(10) not null); -- 신용도
    
-- 관리자 첨부파일 테이블    
create table admin_attach(
	uuid nvarchar2(100) not null, -- uuid
	uploadPath nvarchar2(200) not null, -- 업로드 경로
	fileName nvarchar2(100) not null, -- 파일 이름
	fileType char(1) default 'I', -- 파일 타입
	admin_bno number(10) -- 관리자게시판 게시 번호
);

-- 고객 첨부파일 테이블
create table customer_attach(
	uuid nvarchar2(100) not null, -- uuid
	uploadPath nvarchar2(200) not null, -- 업로드 경로
	fileName nvarchar2(100) not null, -- 파일 이름
	fileType char(1) default 'I', -- 파일 타입
	bno number(10) -- 고객게시판 게시 번호
);



-- 공지 첨부파일 테이블
create table notice_attach(
	uuid nvarchar2(100) not null, -- uuid
	uploadPath nvarchar2(200) not null, -- 업로드 경로
	fileName nvarchar2(100) not null, -- 파일 이름
	fileType char(1) default 'I', -- 파일 타입
	notice_bno number(10) -- 고객게시판 게시 번호
);

-- 관리자 그룹 멤버
create table admin_group_members(
id nvarchar2(20) constraint pk_group_members primary key, -- id
group_name nvarchar2(20) not null -- 그룹 이름
);

--관리자 등급
create table admin_authorities(
    id NVARCHAR2(10) not null, -- id
    authority NVARCHAR2(20) not null); -- 등급
    
--관리자 그룹 등급
create table admin_group_authorities(
    group_id NVARCHAR2(20) not null, -- 그룹 id
    authority NVARCHAR2(20) not null); -- 등급
    
-- 관리자 그룹 테이블
create table customer_groups(
    id NVARCHAR2(20) not null primary key, -- id
    group_name NVARCHAR2(20) not null -- 그룹 이름
);
--고객 등급
create table customer_authorities(
    id NVARCHAR2(10) not null, -- id
    authority NVARCHAR2(20) not null); -- 등급
    
--고객 그룹 등급
create table customer_group_authorities(
    group_id NVARCHAR2(20) not null, -- 그룹 id
    authority NVARCHAR2(20) not null); -- 등급

-- 고객 그룹 테이블
create table customer_groups(
    id NVARCHAR2(20) not null primary key, -- id
    group_name NVARCHAR2(20) not null -- 그룹 이름
);
-- 고객 그룹 멤버 테이블
create table customer_group_members(
    group_id NVARCHAR2(20) not null, -- 그룹 id
    id NVARCHAR2(20) not null); -- id

-- 카드 신청 테이블
create table customer_card_register(
    no number(10) constraint pk_customer_card_register primary key, -- 신청 번호
    name NVARCHAR2(10) not null, -- 신청자 이름
    ano NVARCHAR2(20) not null, -- 카드 연동 계좌번호
    product number(3) not null, -- 카드 기능
    destination  NVARCHAR2(100) not null, -- 실 수령지
    privacy_check CHAR(1 BYTE) DEFAULT '1', -- 개인정보 확인
    paydate NVARCHAR2(10) DEFAULT 25 NOT NULL, -- 결제일
    pay_notice CHAR(1 BYTE) DEFAULT '1', -- 결제 알림
    applydate date default sysdate,-- 신청 일자
    reg_condition CHAR(1 BYTE) DEFAULT '1', -- 처리 상황
    completedate date default sysdate); -- 완료 일자
    


-- 시퀀스 생성

create sequence seq_customer;
create sequence seq_deposit;
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
create sequence seq_notice_board;
create sequence product;
create sequence card_product;
create sequence card_condition;
create sequence admin_attach;
create sequence customer_attach;
create sequence notice_attach;
create sequence admin_group_members;
create sequence admin_authorities;
create sequence admin_group_authorities;
create sequence customer_groups;
create sequence customer_authorities;
create sequence customer_group_authorities;
create sequence customer_groups;
create sequence customer_group_members;
create sequence card_register;

-- 시퀀스 삭제
drop sequence seq_customer;
drop sequence seq_deposit;
drop sequence seq_board;
drop sequence seq_reply;
drop sequence seq_deposit_history;
drop sequence seq_admin;
drop sequence seq_log;
drop sequence seq_admin_board;
drop sequence seq_auth;
drop sequence seq_card;
drop sequence seq_bank;
drop sequence seq_notice_board;
drop sequence product;
drop sequence card_product;
drop sequence card_condition;
drop sequence admin_attach;
drop sequence customer_attach;
drop sequence notice_attach;
drop sequence admin_group_members;
drop sequence admin_authorities;
drop sequence admin_group_authorities;
drop sequence customer_groups;
drop sequence customer_authorities;
drop sequence customer_group_authorities;
drop sequence customer_groups;
drop sequence customer_group_members;
drop sequence card_register;


-- 제약 조건
ALTER TABLE depositTBL add constraint fk_deposit foreign key(cno) references customerTBL(cno);
ALTER TABLE customer_board add constraint fk_customer_board foreign key(cno) references customerTBL(cno);
ALTER TABLE board_reply add constraint fk_board_reply foreign key(bno) references customer_board(bno);
ALTER TABLE logTBL add constraint fk_log foreign key(id) references adminTBL(id);
ALTER TABLE admin_board add constraint fk_admin_board foreign key(id) references adminTBL(id);
ALTER TABLE notice_board add constraint fk_notice foreign key(id) references adminTBL(id);
ALTER TABLE cardTBL add constraint fk_card foreign key(ano) references depositTBL(ano);
ALTER TABLE productTBL add constraint fk_product foreign key(product) references depositTBL(product);
ALTER TABLE ratingTBL add constraint fk_rating foreign key(cno) references customerTBL(cno);
ALTER TABLE deposit_history add constraint fk_deposit_history foreign key(ano) references depositTBL(ano);
ALTER TABLE authTBL add constraint fk_auth foreign key(cno) references customerTBL(cno);
ALTER TABLE cardTBL add constraint fk_card_product foreign key(c_type) references card_product(product);
ALTER TABLE depositTBL add constraint fk_product foreign key(product) references productTBL(product);
ALTER TABLE bankTBL add constraint fk_bank foreign key(hno) references deposit_history(hno);
ALTER TABLE admin_authorities add constraint fk_admin_authorities foreign key(id) references admintbl(id);
ALTER TABLE admin_group_members add constraint fk_admin_group_members foreign key(id) references admintbl(id);
ALTER TABLE admin_group_members add constraint fk_admin_groups foreign key(group_id) references admin_groups(id);
ALTER TABLE admin_group_authorities add constraint fk_admin_group_authorities foreign key(group_id) references admin_groups(id);
ALTER TABLE customer_group_members add constraint fk_customer_group_members foreign key(id) references customertbl(id);
ALTER TABLE customer_group_members add constraint fk_customer_groups foreign key(group_id) references customer_groups(id);
ALTER TABLE customer_group_authorities add constraint fk_customer_group_authorities foreign key(group_id) references customer_groups(id);
ALTER TABLE customer_authorities add constraint fk_customer_authorities foreign key(id) references customertbl(id);
ALTER TABLE cardtbl add constraint fk_card_condition foreign key(condition) references card_condition(condition);
alter table customer_card_register add constraint fk_customer_card_product foreign key(product) references card_product(product);
alter table customer_card_register add constraint fk_customer_card_deposit foreign key(ano) references deposittbl(ano);
alter table admin_attach add constraint pk_admin_attach primary key(uuid);
alter table admin_attach add constraint fk_admin_attach foreign key(admin_bno) references admin_board(admin_bno);
alter table notice_attach add constraint pk_notice_attach primary key(uuid);
alter table notice_attach add constraint fk_notice_attach foreign key(notice_bno) references notice_board(notice_bno);
alter table customer_attach add constraint pk_customer_attach primary key(uuid);
alter table customer_attach add constraint fk_customer_attach foreign key(bno) references customer_board(bno);


-- 제약조건 삭제

ALTER TABLE depositTBL drop constraint fk_deposit_history;
ALTER TABLE savings_accountTBL drop constraint fk_savings_history;
ALTER TABLE loanTBL drop constraint fk_loan_history;


-- 테이블 삭제
--drop table customerTBL;
--drop table depositTBL;
--drop table deposit_history;
--drop table customer_board;
--drop table board_reply;
--drop table adminTBL;
--drop table logTBL;
--drop table admin_board;
--drop table authTBL;
--drop table cardTBL;
--drop table bankTBL;
--drop table ratingTBL;
--drop table productTBL;
--drop table admin_attach;
--drop table notice_attach;
--drop table customer_authorities;














