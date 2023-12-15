SELECT*
FROM [dbo].[dailyActivity_merged]
SELECT*
FROM [dbo].[heartrate_seconds_merged]
SELECT*
FROM [dbo].[Hourly_Activity_merged]
SELECT*
FROM [dbo].[minuteMETsNarrow_merged]
SELECT*
FROM [dbo].[minuteSleep_merged]
SELECT*
FROM [dbo].[sleepDay_merged]

SELECT*
FROM [dbo].[weightLogInfo_merged]

select sum(TotalDistance)
from[dbo].[dailyActivity_merged]

--Number of active users, Average distance, longest distance travelled, Average steps taken, longest steps

select count(distinct ID) as Number_of_users, 
 
	   Avg([TotalSteps]) as Avg_Total_Num_steps,
	   Max([TrackerDistance]) as Longest_distance_walked,
	   Avg([TrackerDistance]) as Avg_distance_travel,
	   Max([TotalSteps]) as Longest_walk,
	   Avg([Calories]) as Avg_Calories
	  
from [dbo].[dailyActivity_merged]

-- which month had the highest/lowest number of activity


--number of users tracking heartbeat

select 
      count(distinct id) as Num_users_heartbeat,
	  Avg([Value]) as Avg_heartbeat,
	  Min([Value]) as Min_hearthbeat,
	  Max([Value]) as Max_heartbeat

from [dbo].[heartrate_seconds_merged]

--number of users tracking sleep

select 
      count(distinct id) as Users,
	  sum(TotalSleepRecords) as Total_records,
	  Max(TotalMinutesAsleep/60) as Highest_hr_Asleep,
	  Max(TotalTimeInBed/60) as Time_in_Bed
from [dbo].[sleepDay_merged]

--number of uses tracting Vitals(weight, Fat, BMI)

select 
      count(distinct id) as users,
	  max([WeightKg]) as Max_weight,
	  Min([WeightKg]) as min_weight,
	  Avg([WeightKg]) as Avg_weight,
	  max([Fat]) as Max_fat,
	  Min([Fat]) as min_fat,
	  Avg([WeightKg]) as Avg_weight,
	  max([BMI]) as max_BMI,
	  min([BMI]) as min_BMI,
	  Avg([BMI]) as Avg_BMI

from [dbo].[weightLogInfo_merged]

--number of days the device was used by each user


select distinct Id,count(ActivityDate) as Num_of_Active_days
from [dbo].[dailyActivity_merged]
group by Id
order by Num_of_Active_days

--how many users used it most of the days

select 
       count([Id]) as Num_Users, 
	   Num_of_Active_days
from (
      select distinct Id,count(ActivityDate) as Num_of_Active_days
      from [dbo].[dailyActivity_merged]
      group by Id
      ) as Users_Active_days
group by Num_of_Active_days


--Average time spent for each activity in hours

select count(distinct id) as users,
       max([VeryActiveMinutes])/60 as Max_active_time,
       min([VeryActiveDistance])/60 as least_usage_time,
	   avg([VeryActiveMinutes])/60 as avg_active_time,
       avg([SedentaryMinutes])/60 as avg_sedentary_time 
from [dbo].[dailyActivity_merged]

--METs to estimate the intensity of physical activities and to calculate the number of calories burned during exercise. 
--Determine time when users were most active

select [ActivityMinute],[METs]
from [dbo].[minuteMETsNarrow_merged]

SELECT*
FROM [dbo].[Hourly_Activity_merged]

SELECT 

	  time,
	  max(StepTotal) Max_num_steps,
	  max(hourlyIntensities_merged_1_TotalIntensity) as Total_hr_intensity,
      max([hourlyIntensities_merged_1_AverageIntensity]) as Total_time_hr_aveintensity
FROM [dbo].[Hourly_Activity_merged]
group by time
order by StepTotal desc,[hourlyIntensities_merged_1_AverageIntensity] desc

select id, avg([TotalSteps]) as Avg_steps
from [dbo].[dailyActivity_merged]
group by [Id]




