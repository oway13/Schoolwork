SELECT EmpName
FROM Employee
WHERE HomeZipCode = 55414 OR HomeZipCode = 55455;


SELECT DISTINCT P.ProjName
FROM Project P, ProjectManager M
WHERE P.ProjId = M.ProjId AND M.MgrId IS NOT NULL;

SELECT P.ProjName, COUNT(EP.EmpId)
FROM Project P, EmpProject EP
WHERE P.ProjId = EP.ProjId
GROUP BY P.ProjName
HAVING COUNT(EP.EmpId) > 0;


with temp as (
	SELECT U.Univname, COUNT(DISTINCT M.MgrId) AS Gradcount
        FROM University U, Graduate G, ProjectManager M
        WHERE M.MgrId = G.EmpId AND G.UnivId = U.UnivId
        GROUP BY U.Univname)
SELECT Univname
FROM temp
WHERE Gradcount = (SELECT MAX(Gradcount)
		   FROM temp);

SELECT E.EmpName, D.DeptName, G.GradYear
FROM Employee E, Department D, Graduate G
WHERE E.EmpId = G.EmpId AND E.DeptId = D.DeptId;

with Temp AS (
	SELECT P.ProjName, COUNT(EP.EmpId) AS Empcount
	FROM Project P, EmpProject EP
	WHERE P.ProjId = EP.ProjId
	GROUP BY P.ProjName)
SELECT ProjName
FROM Temp
WHERE Empcount = (SELECT MAX(Empcount)
		  FROM Temp);
