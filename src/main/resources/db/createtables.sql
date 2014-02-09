select * from USERS;
create table users (
  user_name varchar(15) not null primary key,
  user_pass varchar(15) not null
);

delete from USERS where USERS.FIRST_NAME = 'Sergei';

create table user_roles (
  user_name varchar(15) not null,
  role_name varchar(15) not null,
  primary key (user_name, role_name)
);
drop table USER_ROLES;
create table user_roles (
  user_id varchar(15) not null,
  role_id varchar(15) not null,
  primary key (user_id, role_id),
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES USERS(ID),
  CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES ROLES(ID)
);
/************************* Start Users Queries ******************************************************/
create table users (
    id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(50) not null,
    password varchar(50) not null,
    role_id INTEGER not null,
	CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES ROLES(ID)
);

CREATE UNIQUE INDEX email_un ON USERS (EMAIL);

drop table USERS;
insert into USERS (FIRST_NAME, LAST_NAME, EMAIL, PASSWORD, ROLE_ID)
values
('Sergei','Doroshenko', 'admin@gmail.com','111', 1),
('Tim', 'Tom', 'tim@gmail.com', '111', 2),
('Ivan', 'Ivanov', 'ivan@gmail.com', '111', 2);

insert into USERS (FIRST_NAME, LAST_NAME, EMAIL, PASSWORD, ROLE_ID)
values
('Rom', 'Amazon', 'rom@gmail.com', '111', 2),
('Dan', 'Brown', 'dan@gmail.com', '111', 2);


//********************************** End of Users queries ********************************************/
create table properties (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	prop_type varchar(20) not null,
	prop_name  varchar(20) not null
);
drop table properties;

create table roles (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	rl_name  varchar(20) not null
);
drop table roles;
insert into roles (rl_name) values ('ADMIN'), ('USER'), ('GUEST');

create table statuses (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	st_name  varchar(20) not null
);
delete from STATUSES where STATUSES.ST_NAME = 'NEW';
insert into STATUSES(ST_NAME) values ('NEW'),('ASSIGNED'),('IN PROGRESS'),('RESOLVED'),('CLOSED'),('REOPENED');

create table resolutions (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	res_name  varchar(20) not null
);
insert into RESOLUTIONS(RES_NAME) values ('FIXED'),('INVALID'),('WONTFIX'),('WORKFORME');

create table priorities (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	pr_name  varchar(20) not null
);
insert into PRIORITIES(PR_NAME) values ('CRITICAL'),('MAJOR'),('IMPORTANT'),('MINOR');

create table types (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	tp_name  varchar(20) not null
);
insert into TYPES(TP_NAME) values ('COSMETIC'),('BUG'),('FEATURE'),('PERFORMANCE');
/********************** Start Projects ****************************************************/
create table projects (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	project_name varchar(20) not null,
	description  varchar(300) not null,
	manager INTEGER not null,
	CONSTRAINT fk_manager FOREIGN KEY (manager) REFERENCES users(id)
);
drop table PROJECTS;
insert into PROJECTS (PROJECT_NAME, DESCRIPTION, MANAGER)
values
('Data Storage', 'Storage different data', 2),
('Green World', 'Ecological issues', 2);

create table builds (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	bl_name  varchar(20) not null,
	project_id INTEGER not null,
	CONSTRAINT fk_project_id FOREIGN KEY (project_id) REFERENCES PROJECTS(ID)
);
insert into BUILDS(BL_NAME, PROJECT_ID)
values
('v.1.0.1-alpha', 1),
('v.1.0.1-beta', 1),
('v.1.1.0-alpha', 1),
('v.1.2.1-beta', 2),
('v.3.2.1-beta', 2);

/****************************** End Projects  ***********************************************/
create table issues (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	create_date DATE not null,
	create_by INTEGER not null,
	modify_date DATE not null,
	modified_by INTEGER not null,
	summary varchar(200) not null,
	decription varchar(700) not null,
	status_id INTEGER not null,
	type_id INTEGER not null,
	priority_id INTEGER not null,
	build_id INTEGER not null,
	assignee_id INTEGER not null,
	CONSTRAINT fk_create_by FOREIGN KEY (create_by) REFERENCES USERS(ID),
	CONSTRAINT fk_modified_by FOREIGN KEY (modified_by) REFERENCES USERS(ID),
	CONSTRAINT fk_status_id FOREIGN KEY (status_id) REFERENCES STATUSES(ID),
	CONSTRAINT fk_type_id FOREIGN KEY (type_id) REFERENCES TYPES(ID),
	CONSTRAINT fk_priority_id FOREIGN KEY (priority_id) REFERENCES PRIORITIES(ID),
	CONSTRAINT fk_build_id FOREIGN KEY (build_id) REFERENCES BUILDS(ID),
	CONSTRAINT fk_assignee_id FOREIGN KEY (assignee_id) REFERENCES USERS(ID)
);

create table issues (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	create_date DATE,
	create_by INTEGER not null,
	modify_date DATE,
	modified_by INTEGER not null,
	summary varchar(200) not null,
	decription varchar(700) not null,
	status_id INTEGER not null,
	type_id INTEGER not null,
	priority_id INTEGER not null,
	build_id INTEGER not null,
	assignee_id INTEGER not null,
	CONSTRAINT fk_create_by FOREIGN KEY (create_by) REFERENCES USERS(ID),
	CONSTRAINT fk_modified_by FOREIGN KEY (modified_by) REFERENCES USERS(ID),
	CONSTRAINT fk_status_id FOREIGN KEY (status_id) REFERENCES STATUSES(ID),
	CONSTRAINT fk_type_id FOREIGN KEY (type_id) REFERENCES TYPES(ID),
	CONSTRAINT fk_priority_id FOREIGN KEY (priority_id) REFERENCES PRIORITIES(ID),
	CONSTRAINT fk_build_id FOREIGN KEY (build_id) REFERENCES BUILDS(ID),
	CONSTRAINT fk_assignee_id FOREIGN KEY (assignee_id) REFERENCES USERS(ID)
);
/******************** Insert colummn ******************************************/
ALTER TABLE ISSUES ADD COLUMN resolution_id INTEGER;

ALTER TABLE ISSUES ADD COLUMN description varchar(700) not null DEFAULT 'Test';

ALTER TABLE ISSUES ADD COLUMN project_id INTEGER not null DEFAULT 1;

ALTER TABLE ISSUES ADD COLUMN assignee_id INTEGER;

ALTER TABLE ISSUES ADD COLUMN modify_date DATE;

ALTER TABLE ISSUES ADD COLUMN modified_by INTEGER;


DELETE FROM ISSUES; 
/*********************** Add constraint **************************************/
ALTER TABLE ISSUES ADD CONSTRAINT fk_resolution_id FOREIGN KEY (resolution_id) REFERENCES RESOLUTIONS(ID);

ALTER TABLE ISSUES ADD CONSTRAINT fk_issue_project_id FOREIGN KEY (project_id) REFERENCES PROJECTS(ID);

ALTER TABLE ISSUES ADD CONSTRAINT fk_assignee_id FOREIGN KEY (assignee_id) REFERENCES USERS(ID);

ALTER TABLE ISSUES ADD CONSTRAINT fk_modified_by FOREIGN KEY (modified_by) REFERENCES USERS(ID);
/*********************** Drop column *****************************************/
ALTER TABLE ISSUES DROP COLUMN resolusion_id;

ALTER TABLE ISSUES DROP COLUMN decription;

ALTER TABLE ISSUES DROP COLUMN assignee_id;

ALTER TABLE ISSUES DROP COLUMN modify_date;

ALTER TABLE ISSUES DROP COLUMN modified_by;

/************************* Populate table ************************************/
insert into ISSUES(CREATE_DATE, CREATE_BY, MODIFY_DATE, MODIFIED_BY, SUMMARY, DECRIPTION, STATUS_ID,
TYPE_ID, PRIORITY_ID, BUILD_ID, ASSIGNEE_ID)
values
(CURRENT_DATE, 2, CURRENT_DATE, 2, 'Bag in Logger', 'Big Fat Bag in Logger. User login do not loggin in session logger', 2, 1, 1, 1, 3);

insert into ISSUES(CREATE_BY, MODIFIED_BY, SUMMARY, DECRIPTION, STATUS_ID,
TYPE_ID, PRIORITY_ID, BUILD_ID, ASSIGNEE_ID)
values
(2, 2, 'Summ', 'Descrip', 2, 1, 1, 1, 3);

DELETE FROM ISSUES;

DROP TABLE ISSUES;
/************** For issue inserting ****************************/
insert into ISSUES(CREATE_DATE, CREATE_BY, MODIFY_DATE, MODIFIED_BY, SUMMARY, DECRIPTION, 
STATUS_ID, TYPE_ID, PRIORITY_ID, BUILD_ID, ASSIGNEE_ID)
values
('2014-01-15', 2, '2014-01-17', 2, 
'Bag in Data Base', 
'Data Base do not auto-populete date of creation field', 
2, 2, 4, 3, 4);

delete from ISSUES where id = 2;
/******************************** COMMENTS TABLE ****************************/
create table comments (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	issue_id INTEGER not null,
	create_date DATE not null,
	create_by INTEGER not null,
	comment varchar(700) not null,
	CONSTRAINT fk_issue_id FOREIGN KEY (issue_id) REFERENCES ISSUES(ID),
	CONSTRAINT fk_create_by_com FOREIGN KEY (create_by) REFERENCES USERS(ID)
);

INSERT INTO COMMENTS (ISSUE_ID, CREATE_DATE, CREATE_BY, COMMENT)
VALUES
(3, CURRENT_DATE, 4, 'This is my first test comment. Hello, everybody!'),
(3, CURRENT_DATE, 3, 'This is my second test comment. Hello, everybody!'),
(3, CURRENT_DATE, 5, 'Don''t write spam into comments. Please.');

/********************************** ATTACHMENTS TABLE ***********************/
CREATE TABLE attachments (
	id INTEGER not null primary key GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	issue_id INTEGER not null,
	create_date DATE not null,
	create_by INTEGER not null,
	file_name varchar(200) not null,
	CONSTRAINT fk_issue_id_att FOREIGN KEY (issue_id) REFERENCES ISSUES(ID),
	CONSTRAINT fk_create_by_com_att FOREIGN KEY (create_by) REFERENCES USERS(ID)
);
CREATE UNIQUE INDEX priority_un ON PRIORITIES (PR_NAME);
CREATE UNIQUE INDEX resolution_un ON RESOLUTIONS (RES_NAME);
CREATE UNIQUE INDEX role_un ON ROLES (RL_NAME);
CREATE UNIQUE INDEX status_un ON STATUSES (ST_NAME);
CREATE UNIQUE INDEX type_un ON TYPES (TP_NAME);

 
