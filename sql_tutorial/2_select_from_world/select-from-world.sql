/* Introduction
1.
Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.
*/

SELECT world.name,
  world.continent,
  world.population
FROM world;

/**

Large Countries
2.
How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
*/

SELECT world.name
FROM world
WHERE world.population >= 200000000;

/* 
Per capita GDP
3.
Give the name and the per capita GDP for those countries with a population of at least 200 million.
*/

SELECT world.name,
  world.gdp / world.population AS per_capita_gdp
FROM world
WHERE world.population >= 200000000;

/*
South America In millions
4.
Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
*/

SELECT world.name,
  world.population / 1000000 AS population_in_millions
FROM world
WHERE world.continent = 'South America';

/*
France, Germany, Italy
5.
Show the name and population for France, Germany, Italy
*/

SELECT world.name,
  world.population
FROM world
WHERE world.name IN ('France', 'Germany', 'Italy');

/**
United
6.
Show the countries which have a name that includes the word 'United'
*/

SELECT world.name
FROM world
WHERE world.name LIKE '%United%'

/*
Two ways to be big
7.
Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.
*/

SELECT world.name,
  world.population,
  world.area
FROM world
WHERE world.area > 3000000 OR 
  world.population > 250000000;

/*
One or the other (but not both)
8.
Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.
*/

SELECT world.name,
  world.population,
  world.area
FROM world
WHERE world.area > 3000000 XOR 
  world.population 250000000;

/*
Rounding
9.
Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
For Americas show population in millions and GDP in billions both to 2 decimal places.
*/

SELECT world.name,
  ROUND(world.population / 1000000, 2) AS population_in_millions,
  ROUND(world.gdp / 1000000000, 2) AS gdp_in_billions
FROM world
WHERE world.continent = 'South America';

/*
Trillion dollar economies
10.
Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

Show per-capita GDP for the trillion dollar countries to the nearest $1000.

*/

SELECT world.name,
  ROUND(world.gdp / world.population, -3) AS per_capita_gdp
FROM world
WHERE world.gdp >= 1000000000000;

/*
Name and capital have the same length
11.
Greece has capital Athens.

Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.

You can use the LENGTH function to find the number of characters in a string
For Microsoft SQL Server the function LENGTH is LEN
*/

SELECT world.name,
  world.capital
FROM world
WHERE LENGTH(world.name) = LENGTH(world.capital)

/*
Matching name and capital
12.
The capital of Sweden is Stockholm. Both words start with the letter 'S'.

Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
You can use the function LEFT to isolate the first character.
You can use <> as the NOT EQUALS operator.
*/

SELECT world.name,
  world.capital
FROM world
WHERE LEFT(world.name, 1) = LEFT(world.capital, 1) AND
  world.capital != world.name;

/**
All the vowels
13.
Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

Find the country that has all the vowels and no spaces in its name.

You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'
*/

SELECT world.name
FROM world
WHERE world.name LIKE '%a%' AND
  world.name LIKE '%e%' AND
  world.name LIKE '%i%' AND
  world.name LIKE '%o%' AND
  world.name LIKE '%u%' AND
  world.name NOT LIKE '% %';