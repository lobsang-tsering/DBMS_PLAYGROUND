USE playground;
#droping table if TABLE exist before create the table 
-- DROP TABLE if exists countries;
/*
alternative way of creating table 
CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(2),
COUNTRY_NAME varchar(40),
REGION_ID decimal(10,0)
);
*/
drop table if exists countries;

CREATE TABLE countries (
	country_id varchar(2) not null,
    country_name varchar(40) not null,
    region_id decimal(10,0) not null
    );
    
-- mysql> describe countries;
-- +--------------+---------------+------+-----+---------+-------+
-- | Field        | Type          | Null | Key | Default | Extra |
-- +--------------+---------------+------+-----+---------+-------+
-- | country_id   | varchar(2)    | NO   | PRI |         |       |
-- | country_name | varchar(40)   | YES  |     | NULL    |       |
-- | region_id    | decimal(10,0) | NO   | PRI | NULL    |       |
-- +--------------+---------------+------+-----+---------+-------+
-- 3 rows in set (0.00 sec)
    
-- DROP TABLE IF exists dup_countries;
CREATE TABLE IF NOT exists dup_countries AS SELECT * FROM countries;
#Check key word checks if the max salary at the time of inserting values 

-- create table if not exists jobs (
-- 	job_id varchar(10) not null, 
--     job_title varchar(35) not null, 
--     min_salary decimal(6,0),
--     max_salary decimal(6,0) check (max_salary <= 250000) 
--     );
drop table if exists countries ;

-- create table countries (
-- 	country_id varchar(2) not null unique,
--     country_name varchar(40) 
--     check (country_name in ('Italy', 'India', 'China') ) not null, 
--     region_id decimal(10,0) not null
-- );

-- create table if not exists job_histry (
-- 	employee varchar(2) not null, 
--     start_date date not null, 
--     end_date date not null check(end_date like '--/--/----'),
--     job_id varchar(2) not null, 
--     department_id varchar(2) not null 
--     );
    

-- create table if not exists jobs (
-- 	job_id varchar(10) not null unique,
--     job_title varchar(40) not null DEFAULT  ' ' , 
--     min_salary decimal(6,0) DEFAULT 8000,
--     max_salary decimal(6,0) default null 
--     );    
    
-- mysql> desc jobs;
-- +------------+--------------+------+-----+---------+-------+
-- | Field      | Type         | Null | Key | Default | Extra |
-- +------------+--------------+------+-----+---------+-------+
-- | job_id     | varchar(10)  | NO   | PRI | NULL    |       |
-- | job_title  | varchar(40)  | NO   |     |         |       |
-- | min_salary | decimal(6,0) | YES  |     | 8000    |       |
-- | max_salary | decimal(6,0) | YES  |     | NULL    |       |
-- +------------+--------------+------+-----+---------+-------+
-- 4 rows in set (0.00 sec)

--     
-- create table if not exists countries (
-- 	country_id varchar(2) not null unique default ' ',
--     country_name varchar(40) default null,
--     region_id decimal(10,0) not null, 
--     primary key(country_id, region_id)
--     );

-- drop table if exists job_histry;

-- create table job_histry (
-- 	employee_id decimal(6,0) not null primary key,
--     start_date date not null,
--     end_data date not null,
--     job_id varchar(10) not null,
--     department_id decimal(4,0) default null,
--     foreign key(job_id) references jobs(job_id)
-- );

-- mysql> desc job_histry;
-- +---------------+--------------+------+-----+---------+-------+
-- | Field         | Type         | Null | Key | Default | Extra |
-- +---------------+--------------+------+-----+---------+-------+
-- | employee_id   | decimal(6,0) | NO   | PRI | NULL    |       |
-- | start_date    | date         | NO   |     | NULL    |       |
-- | end_data      | date         | NO   |     | NULL    |       |
-- | job_id        | varchar(10)  | NO   | MUL | NULL    |       |
-- | department_id | decimal(4,0) | YES  |     | NULL    |       |
-- +---------------+--------------+------+-----+---------+-------+
-- 5 rows in set (0.00 sec)

-- create table if not exists departments (
-- 	DEPARTMENT_ID decimal(4,0) not null default 0 , 
--     department_name varchar(30) not null default ' ',
--     MANAGER_ID decimal(6,0) not null, 
--     location_id decimal(4,0) default null,
--     constraint PK_departments primary key (DEPARTMENT_ID,MANAGER_ID)
--     );
--     
-- CREATE TABLE IF NOT EXISTS employees ( 
-- 	EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
-- 	FIRST_NAME varchar(20) DEFAULT NULL, 
-- 	LAST_NAME varchar(25) NOT NULL, 
-- 	EMAIL varchar(25) NOT NULL, 
-- 	PHONE_NUMBER varchar(20) DEFAULT NULL, 
-- 	HIRE_DATE date NOT NULL, 
-- 	JOB_ID varchar(10) NOT NULL, 
-- 	SALARY decimal(8,2) DEFAULT NULL, 
-- 	COMMISSION_PCT decimal(2,2) DEFAULT NULL, 
-- 	MANAGER_ID decimal(6,0) DEFAULT NULL, 
-- 	DEPARTMENT_ID decimal(4,0), 
-- 	FOREIGN KEY(DEPARTMENT_ID,MANAGER_ID) 
-- 	REFERENCES  departments(DEPARTMENT_ID,MANAGER_ID)
-- );


create table if not exists jobs (
	job_id integer not null primary key,
    job_title varchar(35) not null , 
    min_salary decimal(6,0),
    max_salary decimal(6,0)
    );  
    
create table if not exists job_histry (
	employee_id decimal(6,0) not null primary key,
    start_date date not null,
    end_data date not null,
    job_id integer not null,
    department_id decimal(4,0) default null,
    foreign key(job_id) references jobs(job_id)
);
    
create table if not exists departments (
	DEPARTMENT_ID decimal(4,0) not null primary key default 0 ,
    Dempart_name varchar(30) not null,
    MANAGER_ID decimal(6,0), 
    location_id decimal(4,0)
    );

CREATE TABLE IF NOT EXISTS employees ( 
	EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
	FIRST_NAME varchar(20) DEFAULT NULL, 
	LAST_NAME varchar(25) NOT NULL, 
	EMAIL varchar(25) NOT NULL, 
	PHONE_NUMBER varchar(20) DEFAULT NULL, 
	HIRE_DATE date NOT NULL, 
	JOB_ID  integer NOT NULL,
	SALARY decimal(8,2) DEFAULT NULL, 
	COMMISSION_PCT decimal(2,2) DEFAULT NULL, 
	MANAGER_ID decimal(6,0) DEFAULT NULL, 
	DEPARTMENT_ID decimal(4,0), 
	FOREIGN KEY(DEPARTMENT_ID) 
	REFERENCES  departments(DEPARTMENT_ID),
    foreign key(JOB_id)
    REFERENCES jobs(job_id)
);


