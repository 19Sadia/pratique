use mysqlpractice;

-- 11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from Worker
order by FIRST_NAME asc;

-- 12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
   select * from Worker
   order by DEPARTMENT desc,FIRST_NAME asc;
   
   -- 13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
      select * from Worker
      where FIRST_NAME in ('Vipul','Satish');
      
      -- 14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
      select * from Worker
      where FIRST_NAME not in ('Vipul','Satish');
      
      -- 15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
      select * from Worker
      where DEPARTMENT ='Admin';
      
      -- 16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
      select * from Worker
      where FIRST_NAME like '%a%';
      
      -- 17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
      select * from Worker
      where FIRST_NAME like '%a';
      
      -- 18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
      select * from Worker
      where FIRST_NAME like '_____h%';
      
      -- 19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
      select*from Worker
      where SALARY between 100000 and 500000;
      
      -- 20. Write an SQL query to print details of the Workers who joined in Feb 2021.
      select*from Worker 
      where year (JOINING_DATE)=2021 and month (JOINING_DATE) = 2;