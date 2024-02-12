-- SQL PROJECT
use project_sql;
select count(*) from olympics1;

create table olympics1 
(
ID int,Name 
varchar(400) ,
Sex varchar(50) ,
Age int,
Height  int,
Weight int ,
Team varchar(300),
NOC varchar(300),
Games varchar(200),
Year int,
Season varchar(200),
City varchar(100),
Sport varchar (100),
Event varchar (100),
Medal varchar(100)
);







-- 1. Show how many medal counts present for entire data
select Medal, count(Medal) as medal_count from olympics1
group by Medal
order by medal_count asc;

-- 2. Show count of unique sports present in Olympics
select  count(distinct Sport) as unique_sport from Olympics1;


-- 3. Show how many different medals won by team India
select medal,Team, count(Medal) as medal_count from Olympics1
where (Team = 'India' and medal != 'NoMedal')
group by Medal
order by medal_count;

-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select Event, count(Medal) as medal_count from Olympics
where Team ='India' and medal <> 'noMedal'
group by Event
order by medal_count desc;

-- 5. Show event wise medals won by India in order of year
select Event,Year, count(Medal) as yearwise from Olympics1
where Team = 'India' and medal <> 'NoMedal'
group by Event, Year
order by Year;


-- 6. show country who won maximum medals.
select Medal,Team, count(medal) as max_medal from olympics1
where medal <>'NoMedal'
group by Medal,Team
order by max_medal desc
limit 1;

select * from Olympics1;


-- 7.show top 10 countries who won gold
select Team, count(Medal) as gold_medal_count from Olympics1
where medal<>'NoMedal'
group by Team
order by gold_medal_count desc
limit 10;


--  8. show in which year did United states won most gold medal
select  Year, count(medal) as medal_count from Olympics1
where Team = 'United States' and Medal='gold'
group by year
order by medal_count desc
limit 1;


-- 9. In which sports United States has most medals.
select medal, Sport, count(medal) as most_med from Olympics1
where Team = 'United States' and Medal != 'NoMedal'
group by medal, sport
order by most_med desc
limit 1;

-- 10. Find top three players who won most medals along with their sports and country
select Name, sport, team, count(medal) as most_three from Olympics1
where medal!='NoMedal'
group by Name, Team, sport
order by most_three desc
limit 3;


-- 11. Find player with most gold medals in cycling along with his country.
select * from Olympics1;
select name, sport, Team, count(medal) as top_cycling from olympics1
where medal <> 'NoMedal' and sport = 'Cycling'
group by name, sport, team
order by top_cycling desc
limit 1;



-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select medal, name, sport,team, count(medal) as most_medals from olympics1
where medal<>'NoMedal' and sport = 'Basketball'
group by name, medal, sport, team
order by most_medals desc
limit 1;


-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select name, medal, sport, count(medal) as top_player from olympics1
where sport = 'Basketball' and name='Teresa Edwards'
group by name, medal, sport
order by top_player desc
limit 3;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select year, sex, count(sex) as count_mf from Olympics1
where medal<> 'NoMedal'
group by year,sex
order by count_mf;