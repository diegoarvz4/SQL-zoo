/*ANSWERS FROM https://sqlzoo.net/wiki/The_JOIN_operation*/

/*1. */
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

/*2. */
SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012

/*3. */
SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER'

/*4. */
SELECT team1, team2, player
    FROM game 
    JOIN goal
    ON game.id = goal.matchid
        WHERE player LIKE 'Mario%'

/*5. */
SELECT player, teamid, coach, gtime
  FROM goal
  JOIN eteam
  ON id = teamid
    WHERE gtime<=10

/*6. */
SELECT mdate, teamname 
    FROM game
    JOIN eteam
    ON eteam.id = game.team1 
        WHERE coach = 'Fernando Santos'

/*7. */
SELECT player 
    FROM game 
    JOIN goal
    ON goal.matchid = game.id
        WHERE stadium  = 'National Stadium, Warsaw'

/*8. */
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE ( ((team1 != 'GER' AND team2 ='GER') OR (team1='GER' AND team2!='GER')) AND teamid != 'GER') 

/*9. */
SELECT teamname, COUNT(teamname)
  FROM eteam JOIN goal ON id=teamid
    GROUP BY teamname

/*10. */
SELECT stadium, COUNT(stadium) 
    FROM game
    JOIN goal
    ON id = matchid
        GROUP BY stadium

/*11. */
SELECT matchid, mdate, COUNT(matchid) as goals
    FROM goal 
    JOIN game ON matchid = id 
    WHERE (team1 = 'POL' OR team2 = 'POL') 
        GROUP BY matchid, mdate

/*12. */
SELECT matchid, mdate, COUNT(teamid) 
    FROM game
    JOIN goal
    ON id = matchid 
    WHERE teamid = 'GER'
        GROUP BY matchid, mdate

/*13. */
SELECT mdate,
  team1, 
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
    GROUP BY mdate, matchid, team1, team2