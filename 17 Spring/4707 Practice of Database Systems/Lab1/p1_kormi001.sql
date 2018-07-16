CREATE TABLE University (
	UnivId numeric PRIMARY KEY,
	UnivName varchar(40)
);

CREATE TABLE Department (
	DeptId numeric PRIMARY KEY,
	DeptName varchar(40)
);

CREATE TABLE Employee (
	EmpId numeric PRIMARY KEY,
	EmpName varchar(40),
	DeptId numeric REFERENCES Department (DeptId),
	HomeZipCode numeric
);

CREATE TABLE Project (
	ProjId numeric PRIMARY KEY,
	ProjName varchar(40)
);

CREATE TABLE Graduate (
	EmpId numeric PRIMARY KEY REFERENCES Employee(EmpId),
	UnivId numeric REFERENCES University(UnivId),
	GradYear numeric
);

CREATE TABLE EmpProject (
	EmpId numeric REFERENCES Employee(EmpId),
	ProjId numeric REFERENCES Project(ProjId) ON DELETE CASCADE,
	PRIMARY KEY (EmpId, ProjId)
);

CREATE TABLE ProjectManager (
	ProjId numeric REFERENCES Project(ProjId) ON DELETE CASCADE,
	MgrId numeric REFERENCES Employee(EmpId),
	PRIMARY KEY (ProjId, MgrId)
);
