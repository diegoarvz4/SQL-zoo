/*ANSWERS FROM https://sqlzoo.net/wiki/Self_join*/

/*1. */
SELECT COUNT(*) FROM stops

/*2. */
SELECT id FROM stops WHERE name = 'Craiglockhart'

/*3. */
SELECT id, name FROM stops JOIN route ON id = stop
WHERE company = 'LRT' AND num = 4 

/*4. */
SELECT company, num, COUNT(*) as count
    FROM route WHERE stop=149 OR stop=53
    GROUP BY company, num
    HAVING count = 2 LIMIT 2

/*5. */
SELECT a.company, a.num, a.stop, b.stop
    FROM route a JOIN route b 
    ON(a.company=b.company AND a.num=b.num)
    WHERE b.stop= (SELECT id FROM stops WHERE name = 'London Road') AND a.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart')

/*6. */
SELECT a.company, a.num, stopa.name, stopb.name
    FROM route a JOIN route b 
    ON (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
    WHERE stopa.name='Craiglockhart'AND stopb.name = 'London Road'

/*7. */
SELECT DISTINCT a.company, a.num
    FROM route a JOIN route b 
    ON (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
    WHERE stopa.name='Haymarket'AND stopb.name = 'Leith'

/*8. */
SELECT a.company, a.num
    FROM route a JOIN route b 
    ON (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
    WHERE stopa.name='Tollcross'AND stopb.name = 'Craiglockhart'

/*9. */
SELECT stop.name, routea.company, routea.num
    FROM route routea
    JOIN route routeb ON routea.num = routeb.num   
    JOIN stops stop ON stop.id = routeb.stop
    WHERE routeb.company = 'LRT' AND routea.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart')

/*10. */
SELECT DISTINCT table1.num, table1.company, stops.name, table2.num, table2.company
    FROM
    (SELECT rb.company, rb.num, rb.stop
        FROM route ra JOIN route rb ON (ra.company=rb.company AND ra.num=rb.num)
        WHERE ra.stop=(SELECT id FROM stops WHERE name= 'Craiglockhart')) AS table1
    JOIN 
    (SELECT ra.company, rb.num, rb.stop
        FROM route ra JOIN route rb ON (ra.company=rb.company AND ra.num=rb.num)
        WHERE ra.stop=(SELECT id FROM stops WHERE name= 'Lochend')) AS table2
    ON (table1.stop = table2.stop)
    JOIN stops 
    ON(stops.id = table1.stop)