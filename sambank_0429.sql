-- ������ ���̺�
create table adminTBL(
    id NVARCHAR2(10)constraint pk_admin_id primary key, -- ���̵�
    password NVARCHAR2(100) not null,-- �н�����
    admin_no NVARCHAR2(10)not null UNIQUE, -- ������ ��ȣ(���)
    auth NVARCHAR2(10) not null, -- ������ ���
    name NVARCHAR2(10) not null, -- �̸�
    rank NVARCHAR2(10) not null, -- ��å
    branch NVARCHAR2(20) not null, -- ����
    mobile NVARCHAR2(20) not null, -- ��ȭ��ȣ
    enabled number(10) not null); -- ��������(�α��� ���/���)

-- �α� ���
create table logTBL(
    log_no NUMBER(10) constraint pk_log_no primary key, -- �α׹�ȣ
    id NVARCHAR2(10) not null, -- ������ ���̵�
    logindate date DEFAULT sysdate, -- �α��� �ð�
    logoutdate date DEFAULT sysdate); -- �α׾ƿ� �ð�

-- ������ ���� �Խ���
create table admin_board(
    admin_bno number(10) constraint pk_admin_board primary key, -- �۹�ȣ
    id NVARCHAR2(10) not null, -- ������ ���̵�
    title NVARCHAR2(200) not null, -- ����
    content NVARCHAR2(2000) not null, -- ����
    writer NVARCHAR2(10) not null, -- �ۼ���
    regdate date default sysdate, -- ��Ͻð�
    updatedate date default sysdate); --�����ð�

-- �������� �Խ���   
create table notice_board(
    notice_bno number(10) constraint pk_notice_board primary key, -- �۹�ȣ
    id NVARCHAR2(10) not null, -- ������ ��ȣ(���)
    title NVARCHAR2(200) not null, -- ����
    content NVARCHAR2(2000) not null, -- ����
    writer NVARCHAR2(10) not null, -- �ۼ���
    regdate date default sysdate, -- ��Ͻð�
    updatedate date default sysdate); --�����ð�

-- ���������� �Խ���--
create table authTBL(
    auth_no number(10) constraint pk_auth_no primary key, -- ������ ��ȣ
    cno number(10) not null, -- �� ��ȣ
    certificate NUMBER(10) not null, -- ������ ���� Ȯ��(boolean)
    password NVARCHAR2(20) not null); -- ������ ��ȣ

-- �� ���� ���̺�
create table customerTBL(
    cno number(10) constraint pk_cno primary key, -- �� ��ȣ
    name NVARCHAR2(20) not null, -- �� �̸�
    eng_name NVARCHAR2(20) not null, -- ���� �̸�
    gender NVARCHAR2(1) not null, -- ����
    birth NVARCHAR2(8) not null, -- �������
    reg_no NVARCHAR2(13) not null, -- �ֹι�ȣ
    address NVARCHAR2(100) not null, -- �ּ�
    mobile NVARCHAR2(11) not null, -- ����ó
    id NVARCHAR2(20) not null UNIQUE, -- ���̵�
    password NVARCHAR2(20) not null, -- ��й�ȣ
    email NVARCHAR2(30) not null, -- �̸���
    createdate date DEFAULT sysdate, -- ���� ��¥
    updatedate date default sysdate); -- ���� ��¥


-- ����� ���� ���̺�    
create table depositTBL(
    cno number(10) not null, -- �� ��ȣ
    ano NVARCHAR2(20) constraint pk_dno primary key, -- ���� ��ȣ
    type number(1) not null, -- ���� ����
    product number(3) not null, -- ��ǰ ����
    password NVARCHAR2(20) not null, -- ��й�ȣ
    balance NUMBER(20) not null, -- �ܾ�
    card_apply CHAR(1) default 'I', -- ī�� ����
    card_no NVARCHAR2(15), -- ī�� ��ȣ
    day_withdraw NUMBER(20) not null, -- �Ϸ� ��� �ѵ�
    max_withdraw NUMBER(20) not null, -- �ѹ��� ��� ���� �ѵ�
    branch NVARCHAR2(10) not null, -- ����
    createdate date DEFAULT sysdate, -- ���� ���� ��¥
    updatedate date DEFAULT sysdate); -- ���� ���� ��¥

-- ��ǰ ���̺�
create table productTBL(
    product number(3) constraint pk_product primary key,-- ��ǰ ����
    p_name NVARCHAR2(20) not null,-- ��ǰ �̸�
    interest_rates NUMBER(5) not null,-- �ݸ�
    limit NUMBER(20) not null,-- �ݾ� ����
    exp_date date DEFAULT sysdate, -- ��������
    repay_date date DEFAULT sysdate);-- ��ȯ����

-- ����� ���� ����
create table deposit_history(
    hno number(10) constraint pk_hno primary key, -- ����� ��ȣ
    ano NVARCHAR2(20) not null, -- ���� ��ȣ
    from_ano NVARCHAR2(20),  -- ��/��� ���¹�ȣ
    name NVARCHAR2(20) not null, -- �� �̸�
    deposit number(38), -- �Ա�
    withdrawal number(38), -- ���
    balance NUMBER(20), -- �ܾ�
    Depositdate date DEFAULT sysdate); -- ��¥


-- �� �Խ��� ���̺�
create table customer_board(
    bno number(10) constraint pk_customer_board primary key, -- �Խ��� ��ȣ
    cno number(10) not null, -- �� ��ȣ
    title NVARCHAR2(200) not null, -- ����
    content NVARCHAR2(2000) not null, -- ����
    writer NVARCHAR2(50) not null, -- �ۼ���
    regdate date default sysdate, -- �ۼ��ð�
    updatedate date default sysdate); -- �����ð�
    
    
-- �� �Խ��� ��� ���̺�
create table board_reply(
	rno number(10) constraint pk_reply primary key, -- ��� ��ȣ
	bno number(10) not null, -- �Խ��� ��ȣ
	reply NVARCHAR2(1000) not null, -- ��� ����
	replyer NVARCHAR2(50) not null, -- ��� �ۼ���
	replydate date default sysdate, -- ��� �ۼ��ð�
	updatedate date default sysdate); -- ��� �����ð�

-- ī�� ���̺�
create table cardTBL(
    card_no number(10) constraint pk_card primary key, -- ī�� ��ȣ
    ano NVARCHAR2(20) not null, -- ���� ��ȣ
    p_name NVARCHAR2(20) not null,-- ��ǰ
    c_type NVARCHAR2(5) not null,-- ����(����/������)
    Exp_date number(6)not null, -- ���� ����
    security_key number(3)not null,-- ����Ű
    condition NVARCHAR2(12) DEFAULT '0', -- ī�� ���� ī�� �����/����/����/�н�
    createdate date default sysdate, -- ī�� ���� ��¥
    updatedate date default sysdate); -- ī�� ���� ��¥ 

    
-- ī�� ��ǰ ���̺�
CREATE TABLE card_product (
    product     NUMBER(3) NOT NULL CONSTRAINT pk_card_product PRIMARY KEY, -- ��ǰ ��ȣ
    p_name      NVARCHAR2(100) NOT NULL, -- ��ǰ�̸�
    service1    CHAR(1 BYTE) DEFAULT '0', -- ���� ����
    service2    CHAR(1 BYTE) DEFAULT '0', -- ���� ����
    service3    CHAR(1 BYTE) DEFAULT '0', -- ���� ����
    service4    CHAR(1 BYTE) DEFAULT '0', -- ���� ����
    service5    CHAR(1 BYTE) DEFAULT '0', -- ���� ����
    service6    CHAR(1 BYTE) DEFAULT '0', -- ���� ����
    service7    CHAR(1 BYTE) DEFAULT '0', -- ���� ����
    service8    CHAR(1 BYTE) DEFAULT '0', -- ���� ����
    service9    CHAR(1 BYTE) DEFAULT '0', -- ���� ����
    service10   CHAR(1 BYTE) DEFAULT '0' -- ���� ����
);

-- ī�� ���� ���̺�(��û/��߱�/���/�����..)
CREATE TABLE card_condition (
    condition        CHAR(1 BYTE) NOT NULL CONSTRAINT card_condition_pk PRIMARY KEY, -- ���� ��ȣ
    condition_name   NVARCHAR2(20) NOT NULL -- ��Ȳ
);

-- Ÿ ���� ���̺�
create table bankTBL(
    bnak_no number(10) constraint pk_bnak primary key, -- idx
    bank_name NVARCHAR2(20) not null, -- �����
    hno number(10) not null); -- ���¹�ȣ

-- �� �ſ뵵 ���̺�
create table ratingTBL(
    rating_no number(10) constraint pk_rating primary key, -- idx
    cno number(10) not null, -- �� ��ȣ
    name NVARCHAR2(10) not null, -- �̸�
    reg_no NVARCHAR2(20) not null, -- �ֹι�ȣ
    rating number(10) not null); -- �ſ뵵
    
-- ������ ÷������ ���̺�    
create table admin_attach(
	uuid nvarchar2(100) not null, -- uuid
	uploadPath nvarchar2(200) not null, -- ���ε� ���
	fileName nvarchar2(100) not null, -- ���� �̸�
	fileType char(1) default 'I', -- ���� Ÿ��
	admin_bno number(10) -- �����ڰԽ��� �Խ� ��ȣ
);

-- �� ÷������ ���̺�
create table customer_attach(
	uuid nvarchar2(100) not null, -- uuid
	uploadPath nvarchar2(200) not null, -- ���ε� ���
	fileName nvarchar2(100) not null, -- ���� �̸�
	fileType char(1) default 'I', -- ���� Ÿ��
	bno number(10) -- ���Խ��� �Խ� ��ȣ
);



-- ���� ÷������ ���̺�
create table notice_attach(
	uuid nvarchar2(100) not null, -- uuid
	uploadPath nvarchar2(200) not null, -- ���ε� ���
	fileName nvarchar2(100) not null, -- ���� �̸�
	fileType char(1) default 'I', -- ���� Ÿ��
	notice_bno number(10) -- ���Խ��� �Խ� ��ȣ
);

-- ������ �׷� ���
create table admin_group_members(
id nvarchar2(20) constraint pk_group_members primary key, -- id
group_name nvarchar2(20) not null -- �׷� �̸�
);

--������ ���
create table admin_authorities(
    id NVARCHAR2(10) not null, -- id
    authority NVARCHAR2(20) not null); -- ���
    
--������ �׷� ���
create table admin_group_authorities(
    group_id NVARCHAR2(20) not null, -- �׷� id
    authority NVARCHAR2(20) not null); -- ���
    
-- ������ �׷� ���̺�
create table customer_groups(
    id NVARCHAR2(20) not null primary key, -- id
    group_name NVARCHAR2(20) not null -- �׷� �̸�
);
--�� ���
create table customer_authorities(
    id NVARCHAR2(10) not null, -- id
    authority NVARCHAR2(20) not null); -- ���
    
--�� �׷� ���
create table customer_group_authorities(
    group_id NVARCHAR2(20) not null, -- �׷� id
    authority NVARCHAR2(20) not null); -- ���

-- �� �׷� ���̺�
create table customer_groups(
    id NVARCHAR2(20) not null primary key, -- id
    group_name NVARCHAR2(20) not null -- �׷� �̸�
);
-- �� �׷� ��� ���̺�
create table customer_group_members(
    group_id NVARCHAR2(20) not null, -- �׷� id
    id NVARCHAR2(20) not null); -- id

-- ī�� ��û ���̺�
create table customer_card_register(
    no number(10) constraint pk_customer_card_register primary key, -- ��û ��ȣ
    name NVARCHAR2(10) not null, -- ��û�� �̸�
    ano NVARCHAR2(20) not null, -- ī�� ���� ���¹�ȣ
    product number(3) not null, -- ī�� ���
    destination  NVARCHAR2(100) not null, -- �� ������
    privacy_check CHAR(1 BYTE) DEFAULT '1', -- �������� Ȯ��
    paydate NVARCHAR2(10) DEFAULT 25 NOT NULL, -- ������
    pay_notice CHAR(1 BYTE) DEFAULT '1', -- ���� �˸�
    applydate date default sysdate,-- ��û ����
    reg_condition CHAR(1 BYTE) DEFAULT '1', -- ó�� ��Ȳ
    completedate date default sysdate); -- �Ϸ� ����
    


-- ������ ����

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

-- ������ ����
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


-- ���� ����
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


-- �������� ����

ALTER TABLE depositTBL drop constraint fk_deposit_history;
ALTER TABLE savings_accountTBL drop constraint fk_savings_history;
ALTER TABLE loanTBL drop constraint fk_loan_history;


-- ���̺� ����
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














