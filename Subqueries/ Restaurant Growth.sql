/* Table: Customer

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+
In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.
 

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order. */

Code 

SELECT x.visited_on AS visited_on, SUM(y.day_sum) AS amount,
       ROUND(AVG(y.day_sum), 2) AS average_amount
FROM
  (SELECT visited_on, SUM(amount) AS day_sum FROM Customer GROUP BY visited_on ) x,
  (SELECT visited_on, SUM(amount) AS day_sum FROM Customer GROUP BY visited_on ) y
WHERE DATEDIFF(x.visited_on, y.visited_on) BETWEEN 0 AND 6
GROUP BY x.visited_on
HAVING COUNT(y.visited_on) = 7
order by x.visited_on;