UPDATE Employee
SET HomeZipCode = 55414
WHERE EmpId = 2;
SELECT EmpId, HomeZipCode
FROM Employee
WHERE EmpId = 2;

UPDATE Graduate
SET GradYear = GradYear + 3
WHERE GradYear < 2002;

UPDATE Graduate
SET GradYear = G.GradYear - 2
FROM Graduate G
WHERE G.EmpId IN (SELECT E.EmpId
		FROM Employee E
		WHERE E.HomeZipCode = 55414);


DELETE FROM Project
WHERE ProjId = 2;



