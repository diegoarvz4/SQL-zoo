/*1. */
SELECT name, continent, population FROM world

/*2. */
SELECT name FROM world
WHERE population >= 200000000

/*3. */
SELECT name, gdp/population FROM world
WHERE population >= 200000000

/*4. */
SELECT name, population/1000000 FROM world
WHERE continent = 'South America'

