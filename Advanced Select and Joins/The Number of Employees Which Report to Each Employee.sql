/* Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+
employee_id is the column with unique values for this table.
This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 
 

For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id. */

Code


SELECT
    m.employee_id,
    m.name,
    COUNT(e.reports_to) as reports_count,
    ROUND(AVG(e.age * 1.0), 0) as average_age
FROM Employees e JOIN Employees m ON e.reports_to = m.employee_id
GROUP BY
    m.employee_id,
    m.name
ORDER BY m.employee_id