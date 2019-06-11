/*ANSWERS FROM https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial*/
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

/*8. */
SELECT DISTINCT continent,(SELECT name FROM world a WHERE a.continent = b.continent ORDER BY name LIMIT 1) 
FROM world b;

/*9. */
SELECT name, continent, population FROM world x 
WHERE 25000000 >= ALL (SELECT population FROM world y WHERE x.continent = y.continent)

/*10. */
SELECT name, continent FROM world x 
WHERE population > ALL(SELECT population*3 FROM world y WHERE x.continent = y.continent AND x.name != y.name)
