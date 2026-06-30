-- HR Attrition Analytics - SQL Queries

-- Q1: Which job roles have the highest employee attrition?
SELECT JobRole, COUNT(*) AS TotalExits
FROM employees
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY TotalExits DESC;

-- Q2: Do employees with lower monthly income tend to leave the company more often?
SELECT Attrition, AVG(MonthlyIncome) AS AVG_Income
FROM Employees
GROUP BY Attrition;

-- Q3: Does the frequency of business travel impact employee attrition?
SELECT BusinessTravel, COUNT(*) AS Exits
FROM employees
WHERE Attrition = 'Yes'
GROUP BY BusinessTravel;

-- Q4: Which marital status category (Single, Married, or Divorced) experiences the highest attrition?
SELECT MaritalStatus, COUNT(*) AS Exits
FROM employees
WHERE Attrition = 'Yes'
GROUP BY MaritalStatus;

-- Q5: What is the average age of employees who are leaving the company compared to those who stay?
SELECT Attrition, AVG(Age) AS Avg_Age
FROM employees
GROUP BY Attrition;

-- Q6: Does the distance from home to the office influence an employee's decision to resign?
SELECT Attrition, AVG(DistanceFromHome) AS AVG_Distance
FROM employees
GROUP BY Attrition;

-- Q7: How many employees are leaving the company due to poor work-life balance ratings?
SELECT WorkLifeBalance, COUNT(*) AS Exits
FROM employees
WHERE Attrition = 'Yes'
GROUP BY WorkLifeBalance;

-- Q8: Are job hoppers (employees who have worked in a higher number of past companies) less likely to stay?
SELECT Attrition, AVG(NumCompaniesWorked) AS Avg_Past_Companies
FROM employees
GROUP BY Attrition;

-- Q9: Does a delay in promotion (years since last promotion) contribute to employee attrition?
SELECT Attrition, AVG(YearsSinceLastPromotion) AS Avg_Years_No_Promotion
FROM employees
GROUP BY Attrition;

-- Q10: How many employees left the company due to low environment satisfaction levels?
SELECT EnvironmentSatisfaction, COUNT(*) AS Exits
FROM employees
WHERE Attrition = 'Yes'
GROUP BY EnvironmentSatisfaction;