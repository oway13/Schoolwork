DROP TABLE University;
CREATE TABLE University (
	UnivId numeric PRIMARY KEY,
	UnivName varchar(40)
);

INSERT INTO University VALUES (1, 'University of Minnesota');
INSERT INTO University VALUES (2, 'University of Wisconsin');
INSERT INTO University VALUES (3, 'University of Washington');
INSERT INTO University VALUES (4, 'University of Washing4');
INSERT INTO University VALUES (5, 'University of Washing5');
INSERT INTO University VALUES (6, 'University of Washing6');
INSERT INTO University VALUES (7, 'University of Washing7');
INSERT INTO University VALUES (8, 'University of 8');
INSERT INTO University VALUES (9, 'University of 9');
INSERT INTO University VALUES (10, 'University of Washingten');
INSERT INTO University VALUES (11, 'University of 11');

CREATE TABLE Grads (
  GradName varchar(40) PRIMARY KEY,
  UnivId numeric REFERENCES University(UnivId)
);

INSERT INTO Grads VALUES ('Mario', 3);
INSERT INTO Grads VALUES ('Wyatt', 1);
INSERT INTO Grads VALUES ('Luigi', 3);
INSERT INTO Grads VALUES ('Eleven', 11);
INSERT INTO Grads VALUES ('Peach', 9);

SELECT G.GradName, U.UnivName
FROM University U, Grads G
WHERE G.UnivId = U.UnivId;

EXPLAIN SELECT G.GradName, U.UnivName
FROM University U, Grads G
WHERE G.UnivId = U.UnivId;
