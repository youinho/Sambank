
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


select * from admintbl;
update admintbl set enabled=1 where admin_no=21;
    commit;
delete from admin_group_authorities;
insert into admin_groups values(10, '관리자Level 10');
insert into admin_groups values(7, '관리자Level 7');
insert into admin_groups values(5, '관리자Level 5');
insert into admin_groups values(3, '관리자Level 3');
insert into admin_groups values(1, '관리자Level 1');
insert into admin_group_authorities values(10, 'ROLE_10');
insert into admin_group_authorities values(7, 'ROLE_7');
insert into admin_group_authorities values(5, 'ROLE_5');
insert into admin_group_authorities values(3, 'ROLE_3');
insert into admin_group_authorities values(1, 'ROLE_1');
select * from admin_group_authorities;

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
select * from admintbl;
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
insert into card_product(product, p_name) values(101, 'SAMBANK 골드카드');
insert into card_product(product, p_name) values(102, 'SAMBANK 실버카드');
insert into card_product(product, p_name) values(103, 'SAMBANK 브론즈카드');
alter table cardtbl modify(exp_date nvarchar2(10) default to_char(add_months(sysdate,60) ,'YYYYMM'));
select * from cardtbl;
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

select c.card_no, c.limit, c.limit_month, c.condition, card_product.p_name from (select * from cardtbl where card_no=1017047948222545) c
join card_product
on c.c_type = card_product.product;

create table card_condition(
    condition char(1) not null primary key,
    condition_name nvarchar2(20) not null
    );
insert into card_condition values(0, '미승인');
insert into card_condition values(1, '승인');
insert into card_condition values(2, '분실');
insert into card_condition values(3, '도난');
select * from card_condition;
commit;
select * from cardtbl;
select * from admintbl;
select card_no from cardtbl
		where ano=10135034467899
		order by createdate desc;
select * from admin_groups;
update admin_groups set group_name='관리자Level 10' where id=10;
select * from admin_group_members;
select * from admin_group_authorities;



select ad.id, ad.rank, ad.branch, ad.mobile, ad.enabled, ad.name, admin_groups.group_name, a.group_id
from (select * from admintbl where name like '%%' and branch like '%%' and id like '%sam%') ad, admin_group_members, admin_groups, (select * from admin_group_authorities where SUBSTR(admin_group_authorities.authority, 6)<=5) a
where ad.id = admin_group_members.id and admin_group_members.group_id=admin_groups.id and admin_groups.id = a.group_id order by a.group_id desc;

select * from admintbl;


select substr(authority, 6) from admin_group_authorities;

select group_id from admin_group_members where id='sam';

select * from 
(select * from admintbl where id='sam') ad
join admin_group_members
on ad.id = admin_group_members.id;


select * from admin_groups;

select * from notice_board;
select ad.id, ad.rank, ad.branch, ad.mobile, ad.enabled, ad.name, admin_groups.group_name, admin_group_authorities.group_id, admin_groups.group_name
		from (select * from admintbl where id='sam') ad, admin_group_members, admin_groups,admin_group_authorities
		where ad.id = admin_group_members.id and admin_group_members.group_id=admin_groups.id and admin_groups.id = admin_group_authorities.group_id;
        select group_id from admin_group_members where id='sam';
select * from admin_groups;
select * from admin_group_members;
select admin_groups.id, admin_groups.group_name from admin_groups
where admin_groups.id < to_number((select group_id from admin_group_members where admin_group_members.id='sam'), '99')
order by id asc;
select * from admintbl;


select group_id from admin_group_members where id='sam';

select * from admintbl;
select * from admin_group_members;

select seq_admin.nextVal from dual;
select * from customertbl where name='김동혁';

alter table customertbl add(authority nvarchar2(10) default 'ROLE_USER');
alter table customertbl add(enabled number(1) default 1);
alter table customertbl modify(enabled number(1) not null);
alter table customertbl modify(authority nvarchar2(10) not null);
commit;
update customertbl set authority='ROLE_USER';
update customertbl set enabled=1;
select * from customertbl where name='김동혁';
alter table admin_board add(content2 clob);
update admin_board set content2 = content;
commit;
alter table admin_board rename column content to content3;
alter table admin_board rename column content2 to content;
commit;
alter table admin_board modify(content3 nvarchar2(2000) default '임시');
alter table admin_board modify(content3 nvarchar2(2500) default '임시');
select * from admin_board;
alter table admin_board modify(content clob default 'NULL');
select * from deposit_history;
select * from admin_board;
commit;
delete from admin_board where admin_bno!=4 and admin_bno!=5 and admin_bno!=6;
select * from admin_attach;
update admin_board set content='임시' where admin_bno=21;
select * from admin_board;
commit;



select * from admin_attach;
select * from admin_board;
select * from admin_group_members;



alter table logtbl add(uri nvarchar2(1000) not null);
alter table logtbl add(logdate date default sysdate);
alter table logtbl add(local_name nvarchar2(100));
alter table logtbl add(local_addr nvarchar2(100));
alter table logtbl add(local_port nvarchar2(100));
alter table logtbl add(remote_addr nvarchar2(100));
alter table logtbl add(remote_port nvarchar2(100));
alter table logtbl add(admin_session nvarchar2(200));
alter table logtbl modify id null;
alter table logtbl drop constraint fk_log;


select * from logtbl order by logdate desc;
commit;

rollback;

select * from admin_attach;

alter table notice_board add(content2 clob);
alter table notice_board add(type nvarchar2(30) not null);
alter table notice_board modify(content clob);
alter table notice_board rename column content2 to content;
alter table notice_board drop column content3;
alter table notice_board modify(type nvarchar2(20) default '공지사항');
select * from notice_board;
select * from notice_attach;

select to_char(sysdate, 'yyyy-MM-dd HH:mm:ss') from dual;
create sequence seq_inquiry;


create table customer_inquiry(
    inquiry_no number(10) not null,
    customer_id nvarchar2(20) not null,
    customer_name nvarchar2(20) not null,
    title nvarchar2(1000),
    content clob,
    answer_id nvarchar2(20),
    answer_branch nvarchar2(20),
    answer_rank nvarchar2(20),
    answer_name nvarchar2(20),
    condition number(2) default 1 not null,
    regdate date default sysdate,
    updatedate date default sysdate
);
-- drop table customer_inquiry_reply;
create table customer_inquiry_reply(
    inquiry_reply_no number(10) not null,
    inquiry_no number(10) not null,
    answer_id nvarchar2(20),
    answer_branch nvarchar2(20),
    answer_rank nvarchar2(20),
    answer_name nvarchar2(20),
    content clob,
    regdate date default sysdate
    );
    
select * from customer_board;
delete from customer_inquiry;
-- drop table customer_inquiry;
insert into customer_inquiry(inquiry_no, customer_id, customer_name, title, content) values(seq_inquiry.nextVal, 'rlaehdgur1', '김동혁', '테스트 문의글 제목입니다.', '테스트 문의글 내용 입니다.');
commit;

select * from customer_inquiry;
select * from customer_inquiry_reply;
update customer_inquiry set answer_id='sam', answer_branch='본사', answer_rank='사장', answer_name='김동혁' where inquiry_no=4;
create sequence seq_inquiry_reply;
-- drop sequence inquiry_reply_no;
select * from admintbl;
commit;
select * from cardtbl;
select * from logtbl order by log_no desc;
select * from notice_board;
alter table notice_board rename column type to notice_type;
update admin_board
		set title=#{title} and content=#{content} and updatedate=sysdate where admin_bno=#{admin_bno};
select * from admin_board;
select * from admintbl;
select seq_admin.nextVal from dual;

delete from customertbl
where cno in (select cno from (select * from customertbl
left join deposittbl
on deposittbl.cno = customertbl.cno) a
where a.ano is null and cno<40000);
drop table customer_groups;
select * from admintbl;
select * from customertbl;
select seq_admin.nextVal from dual;
commit;


select * from admintbl;
alter table admintbl add(profile_image blob);
CREATE OR REPLACE DIRECTORY load_DIR AS 'D:/oracle/product/1014/dm/load';
commit;
update admintbl set profile_image=(select profile_image from admintbl where name='호호호');
select profile_image from admintbl
where id='sam';
create table default_profile_image(
    profile_image blob
    );
    select profile_image from admintbl where name='호호호';
insert into default_profile_image select profile_image from admintbl where name='호호호';
commit;
select * from admintbl;
select * from customertbl;
select to_char(logdate, 'yyyy-mm-dd HH24:MI:SS') as time, id, uri  from logtbl order by log_no desc;
select count(*) from logtbl;
select sum(balance) from deposittbl;
alter table logtbl add(parameter_names nvarchar2(1000));
commit;

select * from admintbl where id='sam';
alter table admintbl add(profile_image_type nvarchar2(10));
update admintbl set profile_image_type='png';
commit;

select * from customertbl order by cno desc;


select * from customer_inquiry order by inquiry_no desc;
select * from customer_inquiry_reply;

select * from admintbl;


select * from deposittbl;
commit;
select id, password, profile_image, profile_image_type from admintbl;
delete from admintbl where id = 'sam2';
delete from admin_group_members where id = 'sam2';

select * from customertbl where name='최규리';
select * from deposit_history;

delete from admin_attach;
delete from customer_attach;
commit;

select * from customertbl order by cno desc;
select * from deposittbl;
delete from customertbl where cno=19946;
commit;
select * from deposittbl where ano=10135034475205;

select * from deposittbl;

select * from customertbl where name='김동혁';
update customertbl set enabled=0 where id='rlaehdgur1';
commit;

alter table customertbl add(failed_login_count number(1) default 0);
alter table admintbl add(failed_login_count number(1) default 0);
update customertbl set failed_login_count=0;
update admintbl set failed_login_count=0;
commit;
update admintbl set failed_login_count=failed_login_count+1
		where id='sam';
select * from admintbl where id='sam';
commit;
select * from deposittbl;
select * from admintbl where id='sam';

select * from customertbl where id='rlaehdgur1';

select * from customertbl where id = 'rlaehdgur11';
-- <Connector SSLEnabled="true" keystoreFile="d:/SamBank.keystore" keystorePass="123456" port="8443" scheme="https" secure="true" sslProtocol="TLS" sslEnabledProtocols="TLSv1.2,TLSv1.1,TLSv1,SSLv2Hello"/>