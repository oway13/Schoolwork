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

SELECT *
FROM University;

SELECT *
FROM University
LIMIT 5;

SELECT *
FROM University
OFFSET 3;

SELECT *
FROM University
LIMIT 5
OFFSET 3;
