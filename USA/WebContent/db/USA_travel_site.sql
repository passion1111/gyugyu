------------
--���� ���̺�
------------
create table qa(
    qa_num number constraint qa_num_pk primary key, -- ��ȣPK
    qa_subject varchar2(300), -- ����
    qa_readcount number, -- ��ȸ��
    qa_date date default sysdate, -- �ۼ���¥
    qa_writer varchar2(120) constraint qa_writer_fk references mem(mem_name), -- �̸�FK
    qa_filename varchar2(520), -- �����̸�
    qa_contents varchar2(4000), -- ����
    qa_alive number default 0-- ��������
);

----------------
--���� ��� ���̺�
----------------
create table qarep(
    qarep_num number constraint qarep_num_pk primary key, -- ��ȣPK
    qarep_qanum number constraint qarep_qanum_fk references qa(qa_num), -- �����Խ��� ��ȣFK
    qarep_date date default sysdate, -- �ۼ���¥
    qarep_contents varchar2(4000), -- ����
    qarep_writer varchar2(120) constraint qa_writer_fk references mem(mem_name), -- �̸�FK
    qarep_writerrep number, -- �θ��ۼ��� ��ȣ
    qarep_alive number default 0, -- ��������
    qarep_numref number, -- ���� ����
    qarep_numref_lv number -- ���� ����
);

------------
--�ŷ� ���̺�
------------
create table tra(
    tra_num number constraint tra_num_pk primary key, -- ��ȣPK
    tra_subject varchar2(300), -- ����
    tra_readcount number, -- ��ȸ��
    tra_date date default sysdate, -- �ۼ���¥
    tra_writer varchar2(120) constraint qa_writer_fk references mem(mem_name), -- �̸�FK
    tra_filename varchar2(520), -- �����̸�
    tra_contents varchar2(4000), -- ����
    tra_alive number, -- ��������
    tra_head varchar2(9) -- ��ϴ�,�˴ϴ�
);

----------------
--�ŷ� ��� ���̺�
----------------
create table trarep(
    trarep_num constraint trarep_num_pk primary key, -- ��ȣPK
    trarep_tranum number constraint trarep_tranum_fk references tra(tra_num), -- �����Խ��� ��ȣFK
    trarep_date date default sysdate, -- �ۼ���¥
    trarep_contents varchar2(4000), -- ����
    trarep_writer varchar2(120) constraint qa_writer_fk references mem(mem_name), -- �̸�FK
    trarep_writerrep number, -- �θ��ۼ��� ��ȣ
    trarep_alive number default 0, -- ��������
    trarep_numref number, -- ���� ����
    trarep_numref_lv number -- ���� ����
);

----------------
--����(��) ���̺�
----------------
create table reg(
    reg_name varchar2(120) constraint reg_name_pk primary key, -- ����(��)�̸�
    reg_subject varchar2(300), -- ����
    reg_contents varchar2(4000), -- ����
    reg_filename varchar2(520) -- �����̸�
);

------------
--���� ���̺�
------------
create table loc(
    loc_name varchar2(120) constraint loc_name_pk primary key, -- �����̸�
    loc_contents varchar2(4000), -- ����
    loc_filename varchar2(520), -- �����̸�
    loc_regname varchar2(120) constraint loc_regname_fk references reg(reg_name) -- �����̸�FK
);

------------
--���� ���̺�
------------
create table rev(
    rev_num number constraint rev_num_pk primary key, -- ��ȣPK
    rev_date date default sysdate, -- �ۼ���¥
    rev_writer varchar2(120) constraint rev_writer_fk references mem(mem_name), -- �̸�FK
    rev_contents varchar2(4000), -- ����
    rev_alive number, -- ��������
    rev_score number, -- ����
    rev_locname varchar2(120) references loc(loc_name) -- �����̸�FK
);

------------
--ȸ�� ���̺�
------------
create table mem(
    mem_id varchar2(40) constraint mem_id_pk primary key, -- ���̵�
    mem_pwd varchar2(32) not null, -- ��й�ȣ
    mem_ph varchar2(32), -- ��ȭ��ȣ
    mem_name varchar2(120), -- �̸�   
    mem_addr varchar2(200), -- �ּ�
    mem_point number default 0, -- ����Ʈ
    mem_alive number default 0, -- Ż������
    mem_cdate date default sysdate, -- ���Գ�¥
    mem_ddate date -- Ż��¥
);
