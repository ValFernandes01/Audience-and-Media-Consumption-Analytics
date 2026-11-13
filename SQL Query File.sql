create database audience_analytics; 
use audience_analytics; 

                                                       -- Data Exploration
-- Understanding table structure
SHOW tables; 
Describe audience_data; 

-- Total records
SELECT COUNT(*) AS total_records
FROM audience_data;

-- Sample of 10 rows
SELECT *
FROM audience_data
LIMIT 10;

-- Duplicate check 
SELECT 
    Age_Group, Gender, Weekly_Watching_Time,
    Preferred_Content, Preferred_Genre,
    Preferred_Platform, Monthly_Movies,
    Monthly_Series_Episodes, Monthly_Subscription_Spending,
    Primary_Device, Usual_Watching_Time,
    Multitasking_Frequency, Late_Night_Watching,
    Sleep_Impact, Productivity_Impact, Watching_Reason,
    COUNT(*) AS duplicate_count
FROM audience_data
GROUP BY 
    Age_Group, Gender, Weekly_Watching_Time,
    Preferred_Content, Preferred_Genre,
    Preferred_Platform, Monthly_Movies,
    Monthly_Series_Episodes, Monthly_Subscription_Spending,
    Primary_Device, Usual_Watching_Time,
    Multitasking_Frequency, Late_Night_Watching,
    Sleep_Impact, Productivity_Impact, Watching_Reason
HAVING COUNT(*) > 1;

-- Finding out the number of Nulls in each column 
SELECT
    COUNT(*) - COUNT(Age_Group) AS Age_Group,
    COUNT(*) - COUNT(Gender) AS Gender,
    COUNT(*) - COUNT(Weekly_Watching_Time) AS Weekly_Watching_Time,
    COUNT(*) - COUNT(Preferred_Content) AS Preferred_Content,
    COUNT(*) - COUNT(Preferred_Genre) AS Preferred_Genre,
    COUNT(*) - COUNT(Preferred_Platform) AS Preferred_Platform,
    COUNT(*) - COUNT(Monthly_Movies) AS Monthly_Movies,
    COUNT(*) - COUNT(Monthly_Series_Episodes) AS Monthly_Series_Episodes,
    COUNT(*) - COUNT(Monthly_Subscription_Spending) AS Monthly_Subscription_Spending,
    COUNT(*) - COUNT(Primary_Device) AS Primary_Device,
    COUNT(*) - COUNT(Usual_Watching_Time) AS Usual_Watching_Time,
    COUNT(*) - COUNT(Multitasking_Frequency) AS Multitasking_Frequency,
    COUNT(*) - COUNT(Late_Night_Watching) AS Late_Night_Watching,
    COUNT(*) - COUNT(Sleep_Impact) AS Sleep_Impact,
    COUNT(*) - COUNT(Productivity_Impact) AS Productivity_Impact,
    COUNT(*) - COUNT(Watching_Reason) AS Watching_Reason
FROM audience_data;



-- Checking for Blank Values
SELECT
    SUM(TRIM(Age_Group) = '') AS Age_Group,
    SUM(TRIM(Gender) = '') AS Gender,
    SUM(TRIM(Weekly_Watching_Time) = '') AS Weekly_Watching_Time,
    SUM(TRIM(Preferred_Content) = '') AS Preferred_Content,
    SUM(TRIM(Preferred_Genre) = '') AS Preferred_Genre,
    SUM(TRIM(Preferred_Platform) = '') AS Preferred_Platform,
    SUM(TRIM(Monthly_Movies) = '') AS Monthly_Movies,
    SUM(TRIM(Monthly_Series_Episodes) = '') AS Monthly_Series_Episodes,
    SUM(TRIM(Monthly_Subscription_Spending) = '') AS Monthly_Subscription_Spending,
    SUM(TRIM(Primary_Device) = '') AS Primary_Device,
    SUM(TRIM(Usual_Watching_Time) = '') AS Usual_Watching_Time,
    SUM(TRIM(Multitasking_Frequency) = '') AS Multitasking_Frequency,
    SUM(TRIM(Late_Night_Watching) = '') AS Late_Night_Watching,
    SUM(TRIM(Sleep_Impact) = '') AS Sleep_Impact,
    SUM(TRIM(Productivity_Impact) = '') AS Productivity_Impact,
    SUM(TRIM(Watching_Reason) = '') AS Watching_Reason
FROM audience_data;

                                               -- Data Cleaning & Transformation
                                               
SET SQL_SAFE_UPDATES = 0;

-- Check distinct values in Age_group
SELECT DISTINCT Age_Group
FROM audience_data;

-- Correct inconsistent values in Age_group
UPDATE audience_data
SET Age_Group = CASE
    WHEN Age_Group = '35â€“44' THEN '35-44'
    WHEN Age_Group = '25â€“34' THEN '25-34'
    WHEN Age_Group = '45â€“54' THEN '45-54'
    ELSE Age_Group
END
WHERE Age_Group IN ('35â€“44', '25â€“34', '45â€“54');

-- Verifying corrected Age_groups
SELECT DISTINCT Age_Group
FROM audience_data;

-- Checking distinct values in Weekly Watching Time
SELECT DISTINCT Weekly_Watching_Time
FROM audience_data
ORDER BY Weekly_Watching_Time;

-- Correcting inconsistent values in Weekly Watching Time
UPDATE audience_data
SET Weekly_Watching_Time  = CASE
WHEN Weekly_Watching_Time = '11â€“15 hours' THEN '11-15 hours'
WHEN Weekly_Watching_Time = '16â€“20 hours' THEN  '16-20 hours'
WHEN Weekly_Watching_Time = '2â€“5 hours' THEN  '2-5 hours'
WHEN Weekly_Watching_Time = '6â€“10 hours' THEN  '6-10 hours'
ELSE Weekly_Watching_Time
END
WHERE Weekly_Watching_Time IN ('11â€“15 hours', '16â€“20 hours', '2â€“5 hours', '6â€“10 hours',
'Less than 2 hours', 'More than 20 hours');

-- Verifying corrected Weekly Watching Time
SELECT DISTINCT Weekly_Watching_Time
FROM audience_data
ORDER BY Weekly_Watching_Time;

-- Checking distinct values in Monthly Movies
SELECT DISTINCT Monthly_Movies
FROM audience_data
ORDER BY Monthly_Movies;

-- Correcting inconsistent values in Monthly Movies
UPDATE audience_data
SET Monthly_Movies = CASE
    WHEN Monthly_Movies = '11â€“15' THEN '11-15'
    WHEN Monthly_Movies = '1â€“2' THEN '1-2'
    WHEN Monthly_Movies = '3â€“5' THEN '3-5'
    WHEN Monthly_Movies = '6â€“10' THEN '6-10'
    ELSE Monthly_Movies
END
WHERE Monthly_Movies IN ('11â€“15', '1â€“2', '3â€“5', '6â€“10');

-- Verifying corrected values in Monthly Movies
SELECT DISTINCT Monthly_Movies
FROM audience_data
ORDER BY Monthly_Movies;

-- Checking distinct values in Monthly Series Episodes
SELECT DISTINCT Monthly_Series_Episodes
FROM audience_data
ORDER BY Monthly_Series_Episodes;

-- Correcting inconsistent values in Monthly Series Episodes
UPDATE audience_data
SET Monthly_Series_Episodes = CASE
    WHEN Monthly_Series_Episodes = '11â€“20' THEN '11-20'
    WHEN Monthly_Series_Episodes = '1â€“5' THEN '1-5'
    WHEN Monthly_Series_Episodes = '21â€“30' THEN '21-30'
    WHEN Monthly_Series_Episodes = '6â€“10' THEN '6-10'
    ELSE Monthly_Series_Episodes
END
WHERE Monthly_Series_Episodes IN ('11â€“20', '1â€“5', '21â€“30', '6â€“10');

-- Verifying corrected values in Monthly Series Episodes
SELECT DISTINCT Monthly_Series_Episodes
FROM audience_data
ORDER BY Monthly_Series_Episodes;

-- Checking distinct values in Monthly Subscription Spending
SELECT DISTINCT Monthly_Subscription_Spending
FROM audience_data
ORDER BY Monthly_Subscription_Spending;

-- Correcting inconsistent values in Monthly Subscription Spending
UPDATE audience_data
SET Monthly_Subscription_Spending = CASE
    WHEN Monthly_Subscription_Spending = 'â‚¹0' THEN '₹0'
    WHEN Monthly_Subscription_Spending = 'â‚¹1â€“200' THEN '₹1-200'
    WHEN Monthly_Subscription_Spending = 'â‚¹201â€“500' THEN '₹201-500'
    WHEN Monthly_Subscription_Spending = 'â‚¹501â€“1,000' THEN '₹501-1,000'
    WHEN Monthly_Subscription_Spending = 'More than â‚¹1,000' THEN 'More than ₹1,000'
    ELSE Monthly_Subscription_Spending
END
WHERE Monthly_Subscription_Spending IN ('â‚¹0','â‚¹1â€“200','â‚¹201â€“500','â‚¹501â€“1,000', 'More than â‚¹1,000');

-- Verify corrected values in Monthly Subscription Spending
SELECT DISTINCT Monthly_Subscription_Spending
FROM audience_data
ORDER BY Monthly_Subscription_Spending;

-- Checking distinct values in Usual Watching Time
SELECT DISTINCT Usual_Watching_Time
FROM audience_data
ORDER BY Usual_Watching_Time;

-- Check distinct values in Multitasking Frequency
SELECT DISTINCT Multitasking_Frequency
FROM audience_data
ORDER BY Multitasking_Frequency;

-- Check distinct values in Late Night Watching
SELECT DISTINCT Late_Night_Watching
FROM audience_data
ORDER BY Late_Night_Watching;

-- Check distinct values in Sleep Impact
SELECT DISTINCT Sleep_Impact
FROM audience_data
ORDER BY Sleep_Impact;

-- Checking distinct values in Productivity Impact
SELECT DISTINCT Productivity_Impact
FROM audience_data
ORDER BY Productivity_Impact;

-- Checking distinct values in Watching Reason
SELECT DISTINCT Watching_Reason
FROM audience_data
ORDER BY Watching_Reason;

-- Checking total records after cleaning
SELECT COUNT(*) AS total_records
FROM audience_data;

													-- Verifying cleaned values

-- Verify cleaned Age Groups
SELECT DISTINCT Age_Group FROM audience_data;

-- Verifyng cleaned Monthly Movies
SELECT DISTINCT Monthly_Movies FROM audience_data;

-- Verifying cleaned Monthly Series Episodes
SELECT DISTINCT Monthly_Series_Episodes FROM audience_data;

-- Verifying cleaned Monthly Subscription Spending
SELECT DISTINCT Monthly_Subscription_Spending FROM audience_data;

-- Check duplicate records after cleaning
SELECT
    Age_Group, Gender, Weekly_Watching_Time,
    Preferred_Content, Preferred_Genre, Preferred_Platform,
    Monthly_Movies, Monthly_Series_Episodes,
    Monthly_Subscription_Spending, Primary_Device,
    Usual_Watching_Time, Multitasking_Frequency,
    Late_Night_Watching, Sleep_Impact,
    Productivity_Impact, Watching_Reason,
    COUNT(*) AS duplicate_count
FROM audience_data
GROUP BY
    Age_Group, Gender, Weekly_Watching_Time,
    Preferred_Content, Preferred_Genre, Preferred_Platform,
    Monthly_Movies, Monthly_Series_Episodes,
    Monthly_Subscription_Spending, Primary_Device,
    Usual_Watching_Time, Multitasking_Frequency,
    Late_Night_Watching, Sleep_Impact,
    Productivity_Impact, Watching_Reason
HAVING COUNT(*) > 1;

-- Reviewing existing table structure
DESCRIBE audience_data;

-- Creating master table with a primary key
CREATE TABLE audience_master (
    respondent_id INT AUTO_INCREMENT PRIMARY KEY,
    Age_Group TEXT,
    Gender TEXT,
    Weekly_Watching_Time TEXT,
    Preferred_Content TEXT,
    Preferred_Genre TEXT,
    Preferred_Platform TEXT,
    Monthly_Movies TEXT,
    Monthly_Series_Episodes TEXT,
    Monthly_Subscription_Spending TEXT,
    Primary_Device TEXT,
    Usual_Watching_Time TEXT,
    Multitasking_Frequency TEXT,
    Late_Night_Watching TEXT,
    Sleep_Impact TEXT,
    Productivity_Impact TEXT,
    Watching_Reason TEXT
);

DESCRIBE audience_master;

-- Insert survey records into audience_master
INSERT INTO audience_master (
    Age_Group,
    Gender,
    Weekly_Watching_Time,
    Preferred_Content,
    Preferred_Genre,
    Preferred_Platform,
    Monthly_Movies,
    Monthly_Series_Episodes,
    Monthly_Subscription_Spending,
    Primary_Device,
    Usual_Watching_Time,
    Multitasking_Frequency,
    Late_Night_Watching,
    Sleep_Impact,
    Productivity_Impact,
    Watching_Reason
)
SELECT
    Age_Group,
    Gender,
    Weekly_Watching_Time,
    Preferred_Content,
    Preferred_Genre,
    Preferred_Platform,
    Monthly_Movies,
    Monthly_Series_Episodes,
    Monthly_Subscription_Spending,
    Primary_Device,
    Usual_Watching_Time,
    Multitasking_Frequency,
    Late_Night_Watching,
    Sleep_Impact,
    Productivity_Impact,
    Watching_Reason
FROM audience_data;

-- Checking total records
SELECT COUNT(*) AS total_records
FROM audience_master;

-- Previewing records
SELECT *
FROM audience_master
LIMIT 10;

-- Checking for duplicate respondent IDs
SELECT respondent_id, COUNT(*)
FROM audience_master
GROUP BY respondent_id
HAVING COUNT(*) > 1;

-- Reviewing master table structure
DESCRIBE audience_master;

-- Creating respondents table
CREATE TABLE respondents (
    respondent_id INT PRIMARY KEY,
    Age_Group VARCHAR(20),
    Gender VARCHAR(30),
    FOREIGN KEY (respondent_id)
        REFERENCES audience_master(respondent_id)
);

-- Inserting respondent details
INSERT INTO respondents (
    respondent_id,
    Age_Group,
    Gender
)
SELECT
    respondent_id,
    Age_Group,
    Gender
FROM audience_master;

-- Checking respondent records
SELECT COUNT(*) AS total_records
FROM respondents;

-- Previewing respondent records
SELECT *
FROM respondents
LIMIT 10;

-- Creating viewing_preferences table
CREATE TABLE viewing_preferences (
    respondent_id INT PRIMARY KEY,
    Preferred_Content VARCHAR(100),
    Preferred_Genre VARCHAR(100),
    Preferred_Platform VARCHAR(100),
    Primary_Device VARCHAR(50),
    FOREIGN KEY (respondent_id)
        REFERENCES respondents(respondent_id)
);

-- Inserting viewing preferences
INSERT INTO viewing_preferences (
    respondent_id,
    Preferred_Content,
    Preferred_Genre,
    Preferred_Platform,
    Primary_Device
)
SELECT
    respondent_id,
    Preferred_Content,
    Preferred_Genre,
    Preferred_Platform,
    Primary_Device
FROM audience_master;

-- Checking viewing preference records
SELECT COUNT(*) AS total_records
FROM viewing_preferences;

-- Creating viewing_behaviour table
CREATE TABLE viewing_behaviour (
    respondent_id INT PRIMARY KEY,
    Weekly_Watching_Time VARCHAR(50),
    Monthly_Movies VARCHAR(50),
    Monthly_Series_Episodes VARCHAR(50),
    Usual_Watching_Time VARCHAR(50),
    Multitasking_Frequency VARCHAR(50),
    Late_Night_Watching VARCHAR(50),
    FOREIGN KEY (respondent_id)
        REFERENCES respondents(respondent_id)
);

-- Inserting viewing behaviour records
INSERT INTO viewing_behaviour (
    respondent_id,
    Weekly_Watching_Time,
    Monthly_Movies,
    Monthly_Series_Episodes,
    Usual_Watching_Time,
    Multitasking_Frequency,
    Late_Night_Watching
)
SELECT
    respondent_id,
    Weekly_Watching_Time,
    Monthly_Movies,
    Monthly_Series_Episodes,
    Usual_Watching_Time,
    Multitasking_Frequency,
    Late_Night_Watching
FROM audience_master;

-- Checking total viewing behaviour records
SELECT COUNT(*) AS total_records
FROM viewing_behaviour;

-- Creating viewing_impact table
CREATE TABLE viewing_impact (
    respondent_id INT PRIMARY KEY,
    Monthly_Subscription_Spending VARCHAR(50),
    Sleep_Impact VARCHAR(100),
    Productivity_Impact VARCHAR(100),
    Watching_Reason VARCHAR(100),
    FOREIGN KEY (respondent_id)
        REFERENCES respondents(respondent_id)
);

-- Inserting viewing impact records
INSERT INTO viewing_impact (
    respondent_id,
    Monthly_Subscription_Spending,
    Sleep_Impact,
    Productivity_Impact,
    Watching_Reason
)
SELECT
    respondent_id,
    Monthly_Subscription_Spending,
    Sleep_Impact,
    Productivity_Impact,
    Watching_Reason
FROM audience_master;

-- Checking total viewing impact records
SELECT COUNT(*) AS total_records
FROM viewing_impact;

-- Checking record counts across all tables
SELECT 'respondents' AS table_name, COUNT(*) AS total_records
FROM respondents

UNION ALL

SELECT 'viewing_preferences', COUNT(*)
FROM viewing_preferences

UNION ALL

SELECT 'viewing_behaviour', COUNT(*)
FROM viewing_behaviour

UNION ALL

SELECT 'viewing_impact', COUNT(*)
FROM viewing_impact;

-- Joining respondent details with viewing preferences and behaviour
SELECT
    r.respondent_id,
    r.Age_Group,
    r.Gender,
    vp.Preferred_Genre,
    vp.Preferred_Platform,
    vb.Weekly_Watching_Time,
    vb.Usual_Watching_Time
FROM respondents r
INNER JOIN viewing_preferences vp
    ON r.respondent_id = vp.respondent_id
INNER JOIN viewing_behaviour vb
    ON r.respondent_id = vb.respondent_id
LIMIT 10;

-- Checking all tables in the database
SHOW TABLES;

--                                                            Audience Analysis

-- No. of respondents in each age group
SELECT Age_group, COUNT(Age_group)
FROM Audience_data
GROUP BY Age_group; 

-- Percentage distribution of respondents across age groups
SELECT Age_Group, COUNT(*) as total_respondents, 
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM respondents),2) as percentage
from respondents
GROUP BY Age_Group;

-- Find the gender distribution, showing the number of respondents in each category.
SELECT gender, count(gender)
FRoM audience_data
GROUP BY gender; 


-- Identify the most common age group among respondents
with temp_table as
(select age_group, count(age_group) as total_respondents
from audience_master
group by age_group), 

temp2 as
(select *, dense_rank () over (order by total_respondents desc) as ranked
from temp_table)  

select * from temp2
where ranked = 2; 

-- Find the number of respondents in each weekly watching-time category.
SELECT weekly_watching_time, count(weekly_watching_time) as watch_time
FROM viewing_behaviour
GROUP BY weekly_watching_time; 

-- Identify the most common weekly watching-time category.
WITH Temp_table as
(SELECT Weekly_Watching_Time, count(Weekly_Watching_Time),
dense_rank () OVER (ORDER BY count(Weekly_Watching_Time) DESC) as ranked_viewing_time
from viewing_behaviour
group by Weekly_Watching_Time)

SELECT * 
FROM temp_table
where ranked_viewing_time = 1; 

--  Find the distribution of respondents by their usual watching time.
SELECT COUNT(*) AS respondent_count
FROM viewing_behaviour
WHERE Late_Night_Watching IN ('Always', 'Often', 'Sometimes');

-- 5. Compare weekly watching-time categories across different age groups.
select age_group, Weekly_Watching_Time, count(respondent_id)
from audience_master
group by age_group, Weekly_Watching_Time; 

-- 6. Find the most common usual watching time for each age group.
with temp_table as
(select age_group, Usual_Watching_Time, count(Usual_Watching_Time) as counted_timing
from audience_master
group by Age_Group, Usual_Watching_Time),

temp2 as
(select *, 
dense_rank () over (partition by Age_Group order by counted_timing desc) as ranked_timing
from temp_table)

select * from temp2
where ranked_timing = 1; 

-- 7. Compare late-night watching across age groups.
select age_group, Late_Night_Watching, count(respondent_id) as No_of_respondents
from audience_master
group by Age_Group,Late_Night_Watching; 

-- 8. Find the distribution of multitasking frequency across respondents.
select Multitasking_Frequency, count(respondent_id) as total_respondents
from audience_master
group by Multitasking_Frequency; 

--                                                       Overall preferences
-- 1. Find the distribution of preferred content types among respondents.
SELECT Preferred_Content, count(Preferred_Content) as Total_counts
from viewing_preferences
group by Preferred_Content; 

-- 2. Identify the most popular content type.
with Temp_table as 
(SELECT Preferred_Content, count(Preferred_Content) total_counts
from viewing_preferences
group by Preferred_Content), 
temp2 as
(select *,
dense_rank () over(order by Total desc) ranked 
from temp_table
)
select * from temp2
where ranked =1; 

-- 3. Find the distribution of preferred genres.
SELECT Preferred_Genre, count(Preferred_Genre) as Total_count
from viewing_preferences
group by Preferred_Genre; 

-- 4. Identify the most popular genre.
with Temp_table as 
(SELECT Preferred_Genre, count(Preferred_Genre) total_counts
from viewing_preferences
group by Preferred_Genre), 
Temp2 as
(select *,
dense_rank () over(order by Total_counts desc) ranked 
from temp_table
)
select * from temp2
where ranked =1; 
-- 5. Find the distribution of preferred streaming platforms.
SELECT Preferred_Platform, count(Preferred_Platform) as Total_count
FROM viewing_preferences
GROUP BY Preferred_Platform;

-- 6. Identify the most popular streaming platform.
WITH Temp_table as 
(SELECT Preferred_Platform, count(Preferred_Platform) as Total_count
FROM viewing_preferences
GROUP BY Preferred_Platform), 
Temp2 as
(SELECT *,
DENSE_RANK () OVER (order by Total_count desc) as Platforms_ranked
from temp_table
)
select * from Temp2
WHERE Platforms_ranked = 1;

-- 7. Find the distribution of primary devices used for watching content.
SELECT Primary_Device, count(Primary_Device) as Total_count
from viewing_preferences
group by Primary_Device; 

-- 8. Identify the most commonly used primary device.
WITH Temp_table as
(SELECT Primary_Device, count(Primary_Device) as Total_count
FROM viewing_preferences
GROUP BY Primary_Device), 
Temp2 as 
(SELECT *, 
DENSE_RANK () OVER (order by Total_count desc) as Ranked_devices
from Temp_table)

SELECT * from Temp2
WHERE Ranked_devices = 1;

--                                                    Audience comparisons

-- 9. Compare preferred genres across different age groups.
SELECT vp.Preferred_Genre, r.age_group, count(r.age_group) as Total_repondents
from respondents r inner join viewing_preferences vp
on r.respondent_id = vp.respondent_id
group by r.age_group,vp.Preferred_Genre; 

-- 10. Compare preferred streaming platforms across different age groups.
SELECT vp.Preferred_Platform, r.age_group, count(r.age_group) as Total_respondents
FROM respondents r inner join viewing_preferences vp
on r.respondent_id = vp.respondent_id
group by r.age_group,vp.Preferred_Platform;

-- 11. Find the most popular platform for each age group.
with temp_table as
(SELECT vp.Preferred_Platform, r.age_group, count(r.age_group) as total_count
from viewing_preferences vp inner join respondents r 
on vp.respondent_id = r.respondent_id
Group by vp.Preferred_Platform, r.age_group),
temp2 as
(select *,
 dense_rank () over (partition by age_group order by total_count desc) as ranked_platform_pref
 from temp_table)
select * from temp2
where ranked_platform_pref = 1; 

-- 12. Compare preferred content types across genders.
SELECT vp.Preferred_Content, r.gender, count(r.gender)
from viewing_preferences vp inner join respondents r
on vp.respondent_id = r.respondent_id
group by vp.Preferred_Content, r.gender;

--                                               Advanced Audience Analysis

-- Assign row number to respondents within each age group, ordering by respondent_id. Return the first five respondents from each age group.
Select * 
from (Select *, row_number () over (partition by age_group order by respondent_id) as row_no
from respondents) as temp
where row_no <= 5  ; 

-- Rank preferred genres within each age group based on the number of respondents who selected each genre.
WITH temp as (SELECT r.age_group, vp.Preferred_Genre, count(vp.respondent_id) as respondent_count
from viewing_preferences vp inner join respondents r
on r.respondent_id = vp.respondent_id
group by vp.Preferred_Genre, r.age_group )
SELECT *, 
Dense_rank () over (partition by age_group order by respondent_count desc) as Ranking 
from temp ; 

-- Classify respondents into three subscription-spending groups:
-- Low: ₹0–₹200
-- Medium: ₹201–₹500
-- High: Above ₹500

	SELECT Monthly_Subscription_Spending, 
	case 
	when Monthly_Subscription_Spending in ("₹0", '₹1-200') then "Low"
	when Monthly_Subscription_Spending in ('₹201-500') then "Medium"
	when Monthly_Subscription_Spending in ("₹501-1,000" , "More than ₹1,000") then "High"
	end as Spending_category
from viewing_impact;

-- Identify weekly watching-time categories with respondent counts above the average respondent count across all weekly watching-time categories.
SELECT Weekly_Watching_Time, count(respondent_id) as Respondent_count     
from viewing_behaviour
Group By Weekly_Watching_Time
Having respondent_count > (select avg(category_count)
from (select count(respondent_id) as category_count
from viewing_behaviour
group by Weekly_Watching_Time)as counts);

-- Identify respondents who report frequent late-night watching (Always or Often) and also report a negative sleep impact.
SELECT distinct vi.respondent_id, vi.Sleep_Impact, vb.Late_Night_Watching
from viewing_behaviour vb join viewing_impact vi
on vb.respondent_id = vi.respondent_id
where vi.Sleep_Impact in ("Very little", "Moderate effect", "Significant effect", "Very significant effect") and vb.Late_Night_Watching in ('Often', "Always");

-- For each age group, calculate the number of respondents who fall into these three categories:
-- - Frequently: Always or Often
-- - Occasionally: Sometimes
-- - Rarely or never: Rarely or Never

SELECT r.Age_Group,
SUM(Case
When vb.Late_Night_Watching in ('Always', 'Often')
Then 1 Else 0
end) as Frequently,
SUM(Case
When vb.Late_Night_Watching = 'Sometimes'
then 1 else 0
end) as Occasionally,
SUM(Case
When vb.Late_Night_Watching in ('Rarely', 'Never')
then 1 else 0
end) AS Rarely_or_Never
from respondents r inner join viewing_behaviour vb
ON r.respondent_id = vb.respondent_id
group by r.Age_Group;

-- Calculate the percentage distribution of preferred genres within each age group.
select r.age_group, vp.preferred_genre,
count(*) as respondent_count,
round(count(*) * 100.0 /sum(count(*)) over (partition by r.age_group),2) as genre_percentage
from respondents r
inner join viewing_preferences vp
on r.respondent_id = vp.respondent_id
group by r.age_group, vp.preferred_genre
order by r.age_group, genre_percentage desc;

-- Identify the most common spending category among respondents who prefer each platform.
with temp as (
select vp.preferred_platform,
       vi.monthly_subscription_spending,
       count(*) as respondent_count
from viewing_preferences vp
inner join viewing_impact vi
on vp.respondent_id = vi.respondent_id
group by vp.preferred_platform, vi.monthly_subscription_spending
)
select *,
       dense_rank() over (
           partition by preferred_platform
           order by respondent_count desc
       ) as ranking
from temp
order by preferred_platform, ranking;

-- Identify the age group with the highest proportion of respondents reporting a negative productivity impact.
with temp as 
(select r.age_group,count(case
when vi.productivity_impact in ('moderate effect', 'significant effect', 'very significant effect')
then 1
end) as negative_impact_count,
count(*) as total_respondents
from respondents r
inner join viewing_impact vi
on r.respondent_id = vi.respondent_id
group by r.age_group),
temp2 as (select *,round(negative_impact_count * 100.0 / total_respondents, 2) as negative_impact_percentage
from temp)
select *,
dense_rank() over (order by negative_impact_percentage desc) as ranking
from temp2
where negative_impact_percentage = (select max(negative_impact_percentage)
from temp2);
















