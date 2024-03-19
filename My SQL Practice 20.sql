create database olympics;
use olympics;
select* from athlete_events;
select * from noc_regions;

-- Write a SQL query to find the total no of Olympic Games held as per the dataset.
select count(distinct games) from events;

-- Write a SQL query to list down all the Olympic Games held so far.
select year, season, city from events
order by year asc;

-- SQL query to fetch total no of city participated in each olympic games.
select concat(year, ' ', season) as games, city  from events ;

-- SQL query to fetch the list of all sports which have been part of every olympics.
select sport, count(1) from events
group by sport ;

--  Using SQL query, Identify the sport which were just played once in all of olympics.
with t1 as
          	(select distinct games, sport
          	from events),
          t2 as
          	(select sport, count(1) as no_of_games
          	from t1
          	group by sport)
      select t2.*, t1.games
      from t2
      join t1 on t1.sport = t2.sport
      where t2.no_of_games = 1
      order by t1.sport;

-- Write SQL query to fetch the total no of sports played in each olympics.
select games,count(1) from events
group by games;

-- SQL Query to fetch the details of the oldest athletes to win a gold medal at the olympics.
 select * from events 
 where age > 50 and medal ='gold';
 
 -- Write a SQL query to get the ratio of male and female participants
 select sum(case when `sex`= 'M' then 1 else 0 end )/ count(*) as male_ratio,
		sum(case when `sex` = 'F' then 1 else 0 end)/count(*) as female_ratio
 from events;
 
 -- Write a SQL query to return the Olympic Games and in which country they are held in.
 select games, r.region from events e 
join noc_regions r ON r.noc=e.noc
group by games, r.region
having count(distinct games);