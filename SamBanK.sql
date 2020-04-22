-- ������ ���̺�

create table adminTBL(
    admin_no NUMBER(10) constraint pk_admin_no primary key, -- ������ ��ȣ(���)
    auth NVARCHAR2(2) not null, -- ������ ���
    id NVARCHAR2(10)not null UNIQUE, -- ���̵�
    password NVARCHAR2(20) not null, -- �н�����
    name NVARCHAR2(10) not null, -- �̸�
    rank NVARCHAR2(10) not null, -- ��å
    branch NVARCHAR2(20) not null, -- ����
    phone NVARCHAR2(20) not null); -- ��ȭ��ȣ
    
-- �α� ���
create table logTBL(
    log_no NUMBER(10) constraint pk_log_no primary key, -- �α׹�ȣ
    admin_no NUMBER(10), -- ������ ��ȣ(���)
    logindate date DEFAULT sysdate, -- �α��� �ð�
    logoutdate date DEFAULT sysdate); -- �α׾ƿ� �ð�
    
-- ������ �Խ���
create table admin_board(
    admin_bno number(10) constraint pk_admin_board primary key, -- �۹�ȣ
    admin_no number(10) not null, -- ������ ��ȣ(���)
    title VARCHAR2(200) not null, -- ����
    content VARCHAR2(2000) not null, -- ����
    writer VARCHAR2(50) not null, -- �ۼ���
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
    rating number(10) not null, -- �ſ뵵
    name NVARCHAR2(20) not null, -- �� �̸�
    gender NVARCHAR2(20) not null, -- ����
    birth NVARCHAR2(20) not null, -- �������
    resident_registration_no NVARCHAR2(20) not null, -- �ֹι�ȣ
    address NVARCHAR2(100) not null, -- �ּ�
    mobile NVARCHAR2(15) not null, -- ����ó
    id NVARCHAR2(20) not null UNIQUE, -- ���̵�
    password NVARCHAR2(20) not null, -- ��й�ȣ
    passhint NVARCHAR2(20) not null, -- ��й�ȣ ��Ʈ
    email NVARCHAR2(30) not null, -- �̸���
    withdrawal_limits number(38) not null, -- �ִ� ��� �ѵ�
    check_card number(10) not null, -- ī�� ��û����(boolean)
    createdate date DEFAULT sysdate); -- ���� ��¥
    

-- ����� ���� ���̺�    
create table depositTBL(
    dno number(10) constraint pk_dno primary key, -- ���� ���� ��ȣ
    cno number(10) not null, -- �� ��ȣ
    ano NVARCHAR2(20) not null, -- ���� ��ȣ
    balance NUMBER(20) not null, -- �ܾ�
    createdate date DEFAULT sysdate, -- ���� ���� ��¥
    updatedate date DEFAULT sysdate); -- ���� ���� ��¥
    
    
-- ���� ���� ���̺�
create table savings_accountTBL(
    sno number(10) constraint pk_sno primary key, -- ���� ���� ��ȣ
    cno number(10) not null, -- �� ��ȣ
    ano NVARCHAR2(20) not null, -- ���� ��ȣ
    balance NUMBER(20) not null, -- �ܾ�
    createdate date DEFAULT sysdate, -- ���� ���� ��¥
    updatedate date DEFAULT sysdate); -- ���� ���� ��¥
    
-- ���� ���� ���̺�
create table loanTBL(
    lno number(10) constraint pk_lno primary key, -- ���� ���� ��ȣ
    cno number(10) not null, -- �� ��ȣ
    ano NVARCHAR2(20) not null, -- ���� ��ȣ
    balance NUMBER(20) not null, -- �ܾ�
    createdate date DEFAULT sysdate, -- ���� ���� ��¥
    updatedate date DEFAULT sysdate); -- ���� ���� ��¥
    
-- ����� ���� ���� --
-- pk
-- ano, �Աݸ�+����, �Աݾ�, ��ݸ�+����, ��ݾ�, ��¥:�ð�
create table account_history(
    ano NVARCHAR2(20) constraint pk_ano primary key, -- ���� ��ȣ
    deposit number(38) not null, -- �Ա�
    withdrawal number(38) not null); -- ���

-- �� �Խ��� ���̺�
create table customer_board(
    bno number(10) constraint pk_customer_board primary key, -- �Խ��� ��ȣ
    cno number(10) not null, -- �� ��ȣ
    title VARCHAR2(200) not null, -- ����
    content VARCHAR2(2000) not null, -- ����
    writer VARCHAR2(50) not null, -- �ۼ���
    regdate date default sysdate, -- �ۼ��ð�
    updatedate date default sysdate); -- �����ð�
    
-- �� �Խ��� ��� ���̺�
create table board_reply(
	rno number(10) constraint pk_reply primary key, -- ��� ��ȣ
	bno number(10) not null, -- �Խ��� ��ȣ
	reply varchar2(1000) not null, -- ��� ����
	replyer varchar2(50) not null, -- ��� �ۼ���
	replydate date default sysdate, -- ��� �ۼ��ð�
	updatedate date default sysdate); -- ��� �����ð�

-- ī�� ���̺�--
create table cardTBL(
    card_no number(10) constraint pk_card primary key, -- ī�� ��ȣ
    cno number(10) not null, -- ����ȣ
    createdate date default sysdate); -- ī�� ���� ��¥

-- Ÿ ���� ���̺�
create table bankTBL(
    bnak_no number(10) constraint pk_bnak primary key, -- idx
    bank_name varchar2(20) not null, -- �����
    name varchar2(20) not null, -- �̸�
    ano number(20) not null); -- ���¹�ȣ

-- �� �ſ뵵 ���̺�
create table ratingTBL(
    rating_no number(10) constraint pk_rating primary key, -- idx
    cno number(10) not null, -- �� ��ȣ
    name NVARCHAR2(10) not null, -- �̸�
    resident_registration_no NVARCHAR2(20) not null, -- �ֹι�ȣ
    rating number(10) not null); -- �ſ뵵
    

-- ������ ����

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

-- ������ ����
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

-- ���� ����
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

-- ���̺� ����
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





    






