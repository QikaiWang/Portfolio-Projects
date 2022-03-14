--Comparison from 1949 to 2021

SELECT total_population, male_population, female_population, urban_population, rural_population
FROM China_Population
WHERE Year = 1949 OR Year = 2021
ORDER BY Year

--Finding the rate of increase in urban and rural population form 1949 to 2021

SELECT Year, sum(total_population) OVER (Order by Year) AS rate_increase_toal, sum(urban_population) OVER (Order by Year) AS rate_increase_urban , sum(rural_population) OVER (Order by Year) AS rate_increase_rural
FROM China_Population

--Using CTE to find the percentage of average male and female populations from 1949 to 2021.

WITH avg_pop (average_total, average_male, average_female)
as
(
SELECT avg(total_population) AS average_total, avg(male_population) AS average_male, avg(female_population) AS average_female
FROM China_Population
)
SELECT (average_male/average_total)*100 AS percent_male, (average_female/average_total)*100 AS percent_female
FROM avg_pop
