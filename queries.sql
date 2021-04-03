-- write your queries here

SELECT * FROM owners FULL JOIN vehicles ON owners.id = vehicles.owner_id;

joins_exercise=# SELECT * FROM owners
joins_exercise-# ;
 id | first_name | last_name
----+------------+-----------
  1 | Bob        | Hope
  2 | Jane       | Smith
  3 | Melody     | Jones
  4 | Sarah      | Palmer
  5 | Alex       | Miller
  6 | Shana      | Smith
  7 | Maya       | Malarkin
(7 rows)


joins_exercise=# SELECT * FROM vehicles;
 id |  make  |  model  | year |  price  | owner_id
----+--------+---------+------+---------+----------
  1 | Toyota | Corolla | 2002 | 2999.99 |        1
  2 | Honda  | Civic   | 2012 |   13000 |        1
  3 | Nissan | Altima  | 2016 |   24000 |        2
  4 | Subaru | Legacy  | 2006 | 5999.99 |        2
  5 | Ford   | F150    | 2012 | 2599.99 |        3
  6 | GMC    | Yukon   | 2016 |   13000 |        3
  7 | GMC    | Yukon   | 2014 |   23000 |        4
  8 | Toyota | Avalon  | 2009 |   13000 |        4
  9 | Toyota | Camry   | 2013 |   13000 |        4
 10 | Honda  | Civic   | 2001 | 7999.99 |        5
 11 | Nissan | Altima  | 1999 | 1899.99 |        6
 12 | Lexus  | ES350   | 1998 | 1599.99 |        6
 13 | BMW    | 300     | 2012 |   23000 |        6
 14 | BMW    | 700     | 2015 |   53000 |        6
(14 rows)

SELECT first_name, last_name, COUNT(*) FROM owners 
JOIN vehicles ON owners.id = vehicles.owner_id 
GROUP BY owners.id
ORDER BY first_name ASC;

SELECT first_name, last_name, AVG(price) AS average_price, COUNT(*) FROM owners 
JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY (first_name, last_name)
HAVING AVG(price) > 10000 AND COUNT(*) > 1
ORDER BY first_name DESC;
