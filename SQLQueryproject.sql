select *
from [dbo].[Coviddeath]
order by 3,7

select *
from [dbo].[Covidvaccinations]
order by 3,4

select location, date, population, total_cases, new_cases
from [dbo].[Coviddeath]
order by location

--Total cases vrs Total death

select location, total_cases, total_deaths, (total_deaths/total_cases)*100
from [dbo].[Coviddeath]
order by location

SELECT CAST(total_deaths AS float) / CAST(total_cases AS float) 
FROM [dbo].[Coviddeath];

SELECT
    location,
    total_cases,

    total_deaths,
    CASE
        WHEN total_cases = 0 THEN NULL
        ELSE (CAST(total_deaths AS float) / NULLIF(total_cases, 0))*100
    END AS Result
FROM [dbo].[Coviddeath]
where location = 'africa'


--changing the datatype of the columns from string to float

UPDATE [dbo].[Coviddeath]
SET 
    total_cases = TRY_CAST(total_cases AS float),
    total_deaths = TRY_CAST(total_deaths AS float),
    population = TRY_CAST(population AS float)
WHERE 
    total_cases IS NOT NULL
    AND total_deaths IS NOT NULL
    AND population IS NOT NULL;

	select *
	from [dbo].[Coviddeath]

	select location, total_deaths, total_cases
	from [dbo].[Coviddeath]

	--Total cases vrs Total death
	
	select location,sum(total_cases)
	from [dbo].[Coviddeath]

	SELECT
    location,
    CAST(total_cases AS float) AS converted_total_cases
FROM [dbo].[Coviddeath];

select sum(total_cases)
from [dbo].[Coviddeath]

