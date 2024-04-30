insert into employee2 
        values(1,"Joe",70000,1),
        (2,"Jim",90000,1),
        (3,"Henry",80000,2),
        (4,"Sam",60000,2),
        (5,"Max",90000,1);

SELECT dept.Name AS Department, Employee2.Name AS Employee, Salary
FROM Employee2
JOIN dept
ON Employee2.DepartmentId = dept.Id
WHERE (DepartmentId, Salary) IN(SELECT DepartmentId, MAX(Salary) AS Salary
        FROM Employee
        GROUP BY DepartmentId
       );

