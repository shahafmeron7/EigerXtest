CREATE TABLE DEPARTMENT (
    ID INT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    LOCATION VARCHAR(255) NOT NULL
);
CREATE TABLE EMPLOYEE (
    ID INT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    SALARY INT NOT NULL,
    DEPT_ID INT,
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(ID)
);
INSERT INTO DEPARTMENT (ID, NAME, LOCATION)
VALUES (1, 'Executive', 'Sydney'),
    (2, 'Production', 'Sydney'),
    (3, 'Resources', 'Cape Town'),
    (4, 'Technical', 'Texas'),
    (5, 'Management', 'Paris');
INSERT INTO EMPLOYEE (ID, NAME, SALARY, DEPT_ID)
VALUES (1, 'Candice', 4685, 1),
    (2, 'Julia', 2559, 2),
    (3, 'Bob', 4405, 4),
    (4, 'Scarlet', 2350, 1),
    (5, 'Ileana', 1151, 4);
--This query uses a LEFT JOIN to join the DEPARTMENT table with the EMPLOYEE table on the ID column of the DEPARTMENT table and the DEPT_ID column of the EMPLOYEE table. 
--This will ensure that all departments are listed, even if they have no employees.
-- Then the query uses the GROUP BY clause on the DEPARTMENT.ID column and COUNT function on the EMPLOYEE.ID column to count the number of employees in each department. 
--Then it uses the ORDER BY clause to sort the results from high to low by the number of employees, and then alphabetically by the department if departments have the same number of employees.
SELECT DEPARTMENT.NAME,
    COUNT(EMPLOYEE.ID) AS employee_count
FROM DEPARTMENT
    LEFT JOIN EMPLOYEE ON DEPARTMENT.ID = EMPLOYEE.DEPT_ID
GROUP BY DEPARTMENT.ID
ORDER BY employee_count DESC,
    DEPARTMENT.NAME ASC;