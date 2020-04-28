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





-- 추가

insert into customertbl(cno, name, eng_name, gender, birth, reg_no, address, mobile, id, password, email) 
		values(seq_customer.nextVal, '김동혁', 'KIM DONG HYEOK', '남', '19911217', '1234567', '서울시 노원구', '01065889752', 'rlaehdgur1', 'qwe123!@#', 'ucceoum@naver.com');
commit;

insert into deposittbl(cno, ano, type, product, password, balance, day_withdraw, max_withdraw, branch)
values(590785, '13503449752595', 1, 101, '1234', 10000, 5000, 50000, '01');


insert into producttbl(product, p_name, interest_rates, limit)
values(101, 'SAMBANK 부자통장', 0.1, 0);

insert into producttbl(product, p_name, interest_rates, limit)
values(102, 'SAMBANK 갑부통장', 0.15, 0);

insert into producttbl(product, p_name, interest_rates, limit)
values(103, 'SAMBANK 금돼지통장', 0.2, 0);



insert into producttbl(product, p_name, interest_rates, limit)
values(201, 'SAMBANK 부자적금', 2, 50000000);
insert into producttbl(product, p_name, interest_rates, limit)
values(202, 'SAMBANK 갑부적금', 2, 100000000);


insert into producttbl(product, p_name, interest_rates, limit)
values(301, 'SAMBANK 부자대출', 24, 5000000);
insert into producttbl(product, p_name, interest_rates, limit)
values(302, 'SAMBANK 갑부대출', 12, 55000000);
commit;

select * from deposittbl;
select * from customertbl;
insert into deposittbl(cno, ano, type, product, password, balance, day_withdraw, max_withdraw, branch)
values(590785, '13503449752599', 1, 101, '1234', 10000, 5000, 50000, '01');


select customertbl.name, deposittbl.ano from customertbl, deposittbl
		where customertbl.cno=deposittbl.cno and customertbl.cno=590785;


select customertbl.name, deposittbl.ano from customertbl
left join deposittbl
on customertbl.cno=deposittbl.cno 
where customertbl.cno=590633;

select customertbl.name, deposittbl.ano from customertbl left join deposittbl on customertbl.cno=deposittbl.cno where customertbl.cno='590785';


select * from deposittbl;
select * from customertbl where cno='590658';
select * from admin_board;
select * from admintbl;

insert into admin_board(admin_bno, id, title, content, writer) (select seq_admin_board.nextVal, id, title, content, writer from admin_board);
commit;


alter table admintbl add (enabled number(10));
alter table admintbl modify (auth nvarchar2(10));
select * from admintbl;
update admintbl set auth='ROLE_10' where admin_no=21;
drop table admin_authorities;
drop table admin_groups;
drop table admin_group_authorities;
drop table admin_group_members;
create table admin_authorities(
    id nvarchar2(10) not null references admintbl2(id),
    authority nvarchar2(20) not null
);

create table admin_groups(
    id nvarchar2(20) not null primary key,
    group_name nvarchar2(20) not null
);

create table admin_group_authorities(
    group_id nvarchar2(20) not null references admin_groups(id),
    authority nvarchar2(20) not null
);
    
create table admin_group_members(
    group_id nvarchar2(20) not null references admin_groups(id),
    id nvarchar2(20) not null references admintbl(id)
);

drop table admin_group_members;
drop table admin_groups;
drop table admin_group_authorities;


select * from admintbl;
update admintbl set enabled=1 where admin_no=21;
    commit;

insert into admin_groups values(10, '최고관리자');
insert into admin_groups values(5, '중간관리자');
insert into admin_groups values(1, '관리자');
insert into admin_group_authorities values(10, 'ROLE_10');
insert into admin_group_authorities values(5, 'ROLE_5');
insert into admin_group_authorities values(1, 'ROLE_1');

insert into admin_group_members values(10, 'sam');



create table adminTBL(
    id NVARCHAR2(10) not null constraint pk_admin_id primary key, 
    auth NVARCHAR2(10) not null,
    admin_no number(20) not null,
    password NVARCHAR2(100) not null,
    name NVARCHAR2(10) not null,
    rank NVARCHAR2(10) not null,
    branch NVARCHAR2(20) not null,
    mobile NVARCHAR2(20) not null,
    enabled number(10) not null);
    (select password from deposittbl where cno='590801');
delete from admintbl2 where id='tester';
insert into admintbl values('sam','bank', '1' ,'ROLE_10',  'dh', '사장', '본사', '01065889752', 1);
insert into admintbl values('sam1','bank', '2' ,'ROLE_5',  'dh', '사장', '본사', '01065889752', 1);
insert into admintbl values('sam2','bank', '3' ,'ROLE_1',  'dh', '사장', '본사', '01065889752', 1);
insert into admintbl values('sam1', 'ROLE_1', 'bank', 'dh', '사원', '본사', '01065889752', 1);
insert into admintbl values('sam2', 'ROLE_1', 'bank', 'dh', '사원', '본사', '01065889752', 0);
insert into admintbl values('tester', 'ROLE_10', (select password from deposittbl where ano='10335034467857'), 'dh', '사장', '본사', '01065889752', 1);
commit;

select * from admintbl2;
select * from customertbl where name='김동혁';
select * from deposittbl;
select password from deposittbl where ano='10335034467868';
update admintbl set password=(select password from deposittbl where ano='10335034467868') where id='sam';
alter table deposittbl modify (password nvarchar2(100));
alter table customertbl modify (password nvarchar2(100));
select * from admintbl2;
select * from admin_groups;
select * from admin_group_authorities;
select * from admin_group_members;
insert into admin_group_members values(10, 'tester');
insert into admin_group_members values(10, 'sam');
insert into admin_group_members values(5, 'sam1');
insert into admin_group_members values(1, 'sam2');
delete from admin_group_members where id='tester';
select * from admin_group_authorities;
commit;

select * from deposit_history;
select * from customertbl where name='김동혁';

select customertbl.name, deposittbl.ano from customertbl
		left join deposittbl
		on customertbl.cno=deposittbl.cno 
		where customertbl.cno=590801;
        select * from customertbl where cno=590644;
        select * from deposittbl where cno=590644;
        select * from customertbl where cno=590801;
 select c.name, d.ano from (select * from customertbl where cno=590801) c
		left join (select * from deposittbl where cno=590801) d
		on c.cno=d.cno;


select d.ano, d.p_name, d.day_withdraw, d.max_withdraw, d.balance, h.depositdate from (select a.ano, producttbl.p_name, a.day_withdraw, a.max_withdraw, a.balance from (select * from deposittbl where ano=10135034475252) a
		left join producttbl
		on a.product = producttbl.product) d
        left join (select * from deposit_history where ano=10135034475252 and rownum=1 order by ano_h desc) h
        on d.ano=h.ano;
select * from deposit_history;
select * from deposittbl;
delete from deposit_history;
insert into deposit_history values(seq_deposit_history.nextVal, 10335034467868, '사장', 50000, 0, (select balance from deposittbl where ano=10335034467868)+50000, sysdate);
update deposittbl set balance=balance+50000 where ano=10335034467868;
update deposittbl set balance=0 where ano=10335034467868;
commit;
rollback;
delete from deposit_history;
delete from deposittbl;
select * from deposittbl;
select * from customertbl where length(password) < 20;       
delete from customertbl where length(password) < 20 and name!='김동혁';
        
select * from admin_board order by admin_bno asc;        
        
select * from customertbl where id = 'rlaehdgur2';

select * from (select id, password, auth from admintbl2 where id = 'sam'
union all
select id, password, gender from customertbl where id = 'sam') where auth like 'ROLE_%';
commit;
select * from admintbl2;
update admintbl2 set password=replace(password, '{bcrypt}','');

select id, concat('{bcrypt}', password), enabled from admintbl2 where id = 'sam';


insert into admin_groups values('10', '사장');
insert into admin_group_authorities values('10', 'ROLE_10');

inser;

select * from admin_groups;
select * from admin_group_authorities;


select customertbl.name, d.cno, d.ano 
from (select cno, ano from deposittbl where ano = 10335034467868) d
join customertbl
on customertbl.cno = d.cno;

rollback;
select * from deposittbl where ano = 10335034467868;

select * from deposit_history;
update deposittbl set balance=(select balance from deposit_history where ano=10335034467868 and rownum=1 order by depositdate) where ano=10335034467868;

select balance from deposit_history where ano=10335034467868 and rownum=1 order by depositdate;

rollback;
select * from deposittbl where ano=10335034467868;
select * from deposit_history order by depositdate desc;
commit;
delete from deposit_history;
select balance from
(select rownum, balance from deposit_history where ano=10335034467868 order by depositdate desc)
where rownum=1;
select * from customertbl;
select * from deposit_history;

create table card_product(
    product number(3) not null primary key,
    p_name nvarchar2(100) not null,
    service1 char(1) default 0,
    service2 char(1) default 0,
    service3 char(1) default 0,
    service4 char(1) default 0,
    service5 char(1) default 0,
    service6 char(1) default 0,
    service7 char(1) default 0,
    service8 char(1) default 0,
    service9 char(1) default 0,
    service10 char(1) default 0
);
drop table card_product;
insert into card_product(product, p_name) values(101, 'SAMBANK 골드카드');
insert into card_product(product, p_name) values(102, 'SAMBANK 실버카드');
insert into card_product(product, p_name) values(103, 'SAMBANK 브론즈카드');
alter table cardtbl modify(exp_date nvarchar2(10) default to_char(sysdate,'YYYYMM'));
alter table cardtbl add(limit_month number(10) not null);
alter table cardtbl add(limit number(10) not null);
alter table cardtbl modify(limit_month number(10) not null);
alter table cardtbl modify(condition char(1) default 0);
alter table cardtbl drop(p_name);
alter table cardtbl drop(limit);
alter table cardtbl add(password nvarchar2(100) not null);
alter table cardtbl modify(card_no number(16));
commit;
select * from cardtbl;
delete from cardtbl;
insert into cardtbl(card_no, password, ano, c_type,  security_key, limit, limit_month)   values(1018805244807484, '1234', '10335034467868', 101,  235, 50, 540 );
select * from admintbl;
update admintbl set name='김동혁' where id='sam';
select * from admintbl;
select * from admin_group_members;
select * from cardtbl;
delete from cardtbl where security_key=245;
commit;
select * from card_product;