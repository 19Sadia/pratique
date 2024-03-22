use olympics;
select* from athlete_events;
select * from noc_regions;
-- SQL query to fetch the top 5 athletes who have won the most gold medals.
select name, team, medal
from events
where medal='gold'
order by medal limit 5;

-- SQL Query to fetch the top 5 athletes who have won the most medals 
select name, team, count(1) as total_medals
from events
where medal in ('Gold', 'Silver', 'Bronze')
group by name, team
order by total_medals desc;

-- Write an SQL Query to fetch details of all Olympic Games where India won medal(s) in hockey. 
select e.team,e.sport,e.games,medal from events as e
inner join noc_regions as r on e.noc=r.noc
where r.region='india' and e.medal='gold';

-- Write SQL Query to return the sport which has won India the highest no of medals. 
select r.region,e.sport, count(1) as total_medals from events as e
inner join noc_regions as r on e.noc=r.noc
where r.region='india' and e.sport='hockey';

-- Write a SQL query to fetch the top 5 most successful countries in olympics
select r.region, count(1) as total_medals
from events as e
inner join noc_regions as r on e.noc=r.noc
where medal <> 'NA'
group by r.region
order by total_medals desc limit 5;

-- Write a SQL query to list down the  total gold, silver and bronze medals won by each country.
with gold as (select  Games, Team,  count(Medal) as gold_medal_cnt
from events where Medal = 'Gold'
group by Games, Team),
silver as (select  Games, Team,  count(Medal) as silver_medal_cnt
from events where Medal = 'silver'
group by Games, Team ),
bronze as (select games,team,count(medal) as bronze_medal_cnt
from events where Medal = 'bronze'
group by Games, Team )
select a.Games, a.Team,  a.gold_medal_cnt as gold_count, b.silver_medal_cnt as silver_cnt, c.bronze_medal_cnt as bronze_cnt
from gold as a
inner join silver as b
on a.Team = b.Team and a.Games = b.Games
join bronze as c
on a.Team = c.Team and a.Games = c.Games
order by 1 asc , 3 desc;

-- List down total gold, silver and bronze medals won by each country
select e.team,e.sport,e.games,medal from events as e
inner join noc_regions as r on e.noc=r.noc
where r.region='india' and e.medal='gold';

-- Write SQL Query to return the sport which has won India the highest no of medals. 
select r.region,e.sport, count(1) as total_medals from events as e
inner join noc_regions as r on e.noc=r.noc
where r.region='india' and e.sport='hockey';

-- Write a SQL query to fetch the top 5 most successful countries in olympics
select r.region, count(1) as total_medals
from events as e
inner join noc_regions as r on e.noc=r.noc
where medal <> 'NA'
group by r.region
order by total_medals desc limit 5;

-- Write a SQL query to list down the  total gold, silver and bronze medals won by each country.
with gold as (select  Team,  count(Medal) as gold_medal_cnt
from events where Medal = 'Gold'
group by Team),
silver as (select Team,  count(Medal) as silver_medal_cnt
from events where Medal = 'silver'
group by  Team ),
bronze as (select team,count(medal) as bronze_medal_cnt
from events where Medal = 'bronze'
group by  Team )
select  a.Team,  a.gold_medal_cnt as gold_count, b.silver_medal_cnt as silver_cnt, c.bronze_medal_cnt as bronze_cnt
from gold as a
inner join silver as b
on a.Team = b.Team 
join bronze as c
on a.Team = c.Team
order by  2 desc;


