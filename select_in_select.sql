/*1. */
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

/*2. */
SELECT name FROM world
  WHERE gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom') AND continent = 'Europe'

/*3. */
SELECT name, continent FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Australia' )
OR continent = (SELECT continent FROM world WHERE name = 'Argentina') 
ORDER BY name

/*4. */ 
SELECT name, population FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'Canada') 
AND population < (SELECT population FROM world WHERE name = 'Poland')

/*5. */
SELECT name, CONCAT(ROUND((100*population/(SELECT population FROM world WHERE name = 'Germany'))),'%') 
FROM world 
WHERE continent = 'Europe'

/*6. */
SELECT name FROM world
WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe')

/*7. */
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)