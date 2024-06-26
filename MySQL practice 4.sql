CREATE DATABASE MysqlPractice;
SHOW DATABASES;
USE MysqlPractice;

CREATE TABLE Worker (
	WORKER_ID int not null primary key auto_increment,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

select * from Worker;
drop tables Workers;

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '21-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '21-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '21-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '21-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '21-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '21-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '21-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '21-04-11 09.00.00', 'Admin');

select * from Worker;

CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE
);

select * from Bonus;
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '23-02-20'),
		(002, 3000, '23-06-11'),
		(003, 4000, '23-02-20'),
		(001, 4500, '23-02-20'),
		(002, 3500, '23-06-11');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);
INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2023-02-20 00:00:00'),
 (002, 'Executive', '2023-06-11 00:00:00'),
 (008, 'Executive', '2023-06-11 00:00:00'),
 (005, 'Manager', '2023-06-11 00:00:00'),
 (004, 'Asst. Manager', '2023-06-11 00:00:00'),
 (007, 'Executive', '2023-06-11 00:00:00'),
 (006, 'Lead', '2023-06-11 00:00:00'),
 (003, 'Lead', '2023-06-11 00:00:00');
 
 -- Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
  select FIRST_NAME AS WORKER_NAME
  FROM Worker;
  
  -- Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
  select upper(FIRST_NAME)
  FROM Worker;
  
  -- Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
  select distinct DEPARTMENT
  FROM worker;
  
  -- Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.
  select substring(FIRST_NAME,1,3)
  FROM Worker;
  
  -- Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
  select instr(FIRST_NAME,BINARY 'a')
  FROM Worker
  WHERE FIRST_NAME='Amitabh';
  
  -- Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
  select rtrim(FIRST_NAME)
  FROM Worker;
  
  -- Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
  select ltrim(DEPARTMENT)
  FROM Worker;
  
  -- Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
  select distinct length(DEPARTMENT)
  FROM Worker;
  
  -- Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
  select replace(FIRST_NAME, 'a','A')
  FROM Worker;
  
  -- Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.
  select concat(FIRST_NAME,' ',LAST_NAME) AS COMPLETE_NAME
  FROM Worker;