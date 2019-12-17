SELECT Person.FirstName, Person.LastName, Address.City, Address.State
FROM Person
    LEFT JOIN Address
    ON Person.PersonId = Address.PersonId


SELECT max(Salary) as SecondHighestSalary
FROM
    (SELECT Salary
    FROM Employee
    ORDER BY Salary
    LIMIT 2)a;



-- 取出
SELECT
    (SELECT DISTINCT
        Salary
    FROM
        Employee
    ORDER BY Salary DESC
        LIMIT 1 OFFSET
1
) AS SecondHighestSalary
;

SELECT
    (SELECT DISTINCT
        Salary
    FROM
        Employee
    ORDER BY Salary
        LIMIT 1 OFFSET
1
) AS SecondHighestSalary
;


SELECT (ISNULL(
SELECT
    (SELECT DISTINCT
        Salary
    FROM
        Employee
    ORDER BY Salary DESC
        LIMIT 1 OFFSET
1
),NULL
)) AS SecondHighestSalary;

SELECT IFNULL(
    (SELECT DISTINCT
        Salary
    FROM
        Employee
    ORDER BY Salary DESC
        LIMIT 1 OFFSET
1
),NULL) AS SecondHighestSalary;



CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET ss = N - 1;
    RETURN (
      SELECT IFNULL(
    (SELECT DISTINCT
            Salary
        FROM
            Employee
        ORDER BY Salary DESC
        LIMIT 1 OFFSET ss
),NULL) AS SecondHighestSalary;

);
END


SELECT MAX(Salary)
FROM Employee
WHERE Salary <> (SELECT MAX(Salary)
FROM Employee)

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary <> (SELECT MAX(Salary)
FROM Employee)

