/*
1.
You can use WHERE name LIKE 'B%' to find the countries that start with "B".

The % is a wild-card it can match any characters
Find the country that start with Y
*/

SELECT world.name 
  FROM world
 WHERE world.name LIKE 'Y%'

/*
2.
Find the countries that end with y
*/

SELECT world.name 
  FROM world
 WHERE world.name LIKE '%y'

/*
3.
Luxembourg has an x - so does one other country. List them both.

Find the countries that contain the letter x
*/

SELECT world.name 
  FROM world
 WHERE world.name LIKE '%x%'

/*
4.
Iceland, Switzerland end with land - but are there others?

Find the countries that end with land
*/

SELECT world.name 
  FROM world
 WHERE world.name LIKE '%land'

/*
5.
Columbia starts with a C and ends with ia - there are two more like this.

Find the countries that start with C and end with ia
*/
SELECT world.name 
  FROM world
 WHERE world.name LIKE 'C%' AND
  world.name LIKE '%ia'


/*
6.
Greece has a double e - who has a double o?

Find the country that has oo in the name
*/

SELECT world.name 
  FROM world
 WHERE world.name LIKE '%oo%'

/*
7.
Bahamas has three a - who else?

Find the countries that have three or more a in the name
*/

SELECT world.name 
  FROM world
 WHERE world.name LIKE '%a%%a%%a%'

/*
8.
India and Angola have an n as the second character. You can use the underscore as a single character wildcard.

SELECT name FROM world
 WHERE name LIKE '_n%'
ORDER BY name
Find the countries that have "t" as the second character.
*/

SELECT world.name 
  FROM world
 WHERE world.name LIKE '_t%'
  ORDER BY world.name

/*
9.
Lesotho and Moldova both have two o characters separated by two other characters.

Find the countries that have two "o" characters separated by two others.
*/

SELECT world.name 
  FROM world
 WHERE world.name LIKE '%_o__o%'

/*
10.
Cuba and Togo have four characters names.

Find the countries that have exactly four characters.
*/

SELECT world.name 
  FROM world
 WHERE world.name LIKE '____'

/*
 Harder Questions
Well done for getting this far.

The next questions are optional and only for students who are finding the basic questions too easy.

11.
The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country

Find the country where the name is the capital city.
*/

SELECT worldname
  FROM world
 WHERE world.name LIKE capital

/*
12.
The capital of Mexico is Mexico City. Show all the countries where the capital has the country together with the word "City".

Find the country where the capital is the country plus "City".
*/

SELECT world.name
  FROM world
 WHERE CONCAT(world.name, ' city') LIKE world.capital

/*
13.
Find the capital and the name where the capital includes the name of the country.
*/
SELECT world.capital,
  world.name
 FROM world
  WHERE world.capital LIKE CONCAT(world.name, '%')

/*
14.
Find the capital and the name where the capital is an extension of name of the country.

You should include Mexico City as it is longer than Mexico. You should not include Luxembourg as the capital is the same as the country.
*/

SELECT world.capital,
  world.name
 FROM world
  WHERE world.capital LIKE CONCAT(world.name, '%') AND 
    LENGTH(world.capital) > LENGTH(world.name)

/*
15.
The capital of Monaco is Monaco-Ville: this is the name Monaco and the extension is -Ville.

Show the name and the extension where the capital is a proper (non-empty) extension of name of the country.
*/

SELECT world.name,
  REPLACE(world.capital, world.name, '') AS capital_extension
 FROM world
  WHERE world.capital LIKE CONCAT(world.name, '%') AND 
    LENGTH(world.capital) > LENGTH(world.name)