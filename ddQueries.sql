USE playground;
#droping table if TABLE exist before create the table 
DROP TABLE if exists countries;
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
    
DROP TABLE IF exists dup_countries;
CREATE TABLE IF NOT exists dup_countries AS SELECT * FROM countries;
#Check key word checks if the max salary at the time of inserting values 

create table if not exists jobs (
	job_id varchar(10) not null, 
    job_title varchar(35) not null, 
    min_salary decimal(6,0),
    max_salary decimal(6,0) check (max_salary <= 250000) 
    );
drop table if exists countries ;

-- create table countries (
-- 	country_id varchar(2) not null unique,
--     country_name varchar(40) 
--     check (country_name in ('Italy', 'India', 'China') ) not null, 
--     region_id decimal(10,0) not null
-- );

create table if not exists job_histry (
	employee varchar(2) not null, 
    start_date date not null, 
    end_date date not null check(end_date like '--/--/----'),
    job_id varchar(2) not null, 
    department_id varchar(2) not null 
    );
    

drop table if exists jobs;
create table if not exists jobs (
	job_id varchar(10) not null unique,
    job_title varchar(40) not null DEFAULT  ' ' , 
    min_salary decimal(6,0) DEFAULT 8000,
    max_salary decimal(6,0) default null 
    );    
    
    
create table if not exists countries (
	country_id varchar(10) not null unique primary key,
    country_name varchar(40) not null,
    region_id decimal(10,0) not null
    ); 