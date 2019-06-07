/*ANSWERS FROM https://sqlzoo.net/wiki/SELECT_basics*/
/*1. */
SELECT population FROM world
  WHERE name = 'Germany';

/*2. */
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

/*3. */
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

/*4. */
SELECT name, population/1000000 FROM world
WHERE continent = 'South America';

/*5. */
SELECT name, population FROM world
WHERE name IN ('France', 'Germany','Italy');