/* Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].
 

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order. */

Code

SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month 
        , country
        , COUNT(trans_date) AS trans_count 
        , SUM(case when state ='approved' THEN 1 ELSE 0 END)  
         AS approved_count
        , SUM(amount) AS trans_total_amount
        , SUM(case when state ='approved' then amount ELSE 0 END) 
        AS approved_total_amount       
FROM Transactions 
GROUP BY month,country

