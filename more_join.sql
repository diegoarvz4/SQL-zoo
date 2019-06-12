
/*1. */
SELECT id, title
    FROM movie
    WHERE yr=1962

/*2. */
SELECT yr FROM movie WHERE title = 'Citizen Kane'

/*3. */
SELECT id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr

/*4. */
SELECT id FROM actor WHERE name = 'Glenn Close'

/*5. */
SELECT id FROM movie WHERE title = 'Casablanca'

/*6. */
SELECT name FROM actor JOIN casting ON actor.id = casting.actorid 
    WHERE casting.movieid = 11768

/*7. */
SELECT name FROM actor JOIN casting ON actor.id = casting.actorid 
    WHERE casting.movieid = (SELECT id FROM movie WHERE title = 'Alien')

/*8. */
SELECT title 
    FROM movie 
    JOIN casting ON movie.id = movieid 
    JOIN actor ON actorid = actor.id 
    WHERE actor.name = 'Harrison Ford'

/*9. */
SELECT title 
    FROM movie 
    JOIN casting ON movie.id = movieid 
    JOIN actor ON actorid = actor.id 
    WHERE actor.name = 'Harrison Ford' AND ord != 1

/*10. */
SELECT title, name 
    FROM movie 
    JOIN casting ON movie.id = movieid
    JOIN actor ON casting.actorid = actor.id 
    WHERE ord = 1 AND yr = 1962

/*11. */
SELECT yr,COUNT(title) 
    FROM movie 
    JOIN casting ON movie.id=movieid
    JOIN actor   ON actorid=actor.id
    WHERE name='John Travolta'
    GROUP BY yr
    HAVING COUNT(title)=(SELECT MAX(c) 
        FROM (SELECT yr,COUNT(title) AS c 
            FROM movie 
            JOIN casting ON movie.id=movieid
            JOIN actor   ON actorid=actor.id
            WHERE name='John Travolta'
            GROUP BY yr) AS t
)

/*12. */
SELECT title, name FROM movie 
    JOIN casting ON (movie.id = movieid AND ord = 1)
    JOIN actor ON actorid = actor.id
        WHERE movie.id IN (SELECT movieid FROM casting 
            WHERE actorid IN (SELECT id FROM actor WHERE name = 'Julie Andrews'))

/*13. */
SELECT DISTINCT name FROM casting 
    JOIN actor ON actorid = actor.id 
    WHERE  (SELECT COUNT(ord) FROM casting WHERE  actor.id = actorid AND ord = 1 ) >= 30

/*14. */
SELECT title, COUNT(actorid) as actors FROM movie
    JOIN casting ON movie.id = movieid
    WHERE yr = 1978
    GROUP BY title 
    ORDER BY actors DESC, title

/*15. */
SELECT actor.name FROM casting  
    JOIN actor ON casting.actorid = actor.id
    WHERE casting.movieid IN (SELECT movieid FROM casting
    WHERE actorid IN (
    SELECT id FROM actor
    WHERE name='Art Garfunkel')) AND actor.name != 'Art Garfunkel'