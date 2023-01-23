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
-- This query first count the number of employees in each department using a GROUP BY clause on the DEPT_ID column of the EMPLOYEE table.
-- The  `employee_count` is then used to join the DEPARTMENT table on the ID column. 
--The query uses a LEFT JOIN to ensure that all departments are listed, even if they have no employees.
-- The COALESCE function is used to replace any NULL values in the `employee`
WITH employee_count AS (
    SELECT DEPT_ID,
        COUNT(*) AS employee_count
    FROM EMPLOYEE
    GROUP BY DEPT_ID
)
SELECT DEPARTMENT.NAME,
    COALESCE(employee_count, 0) AS employee_count
FROM DEPARTMENT
    LEFT JOIN employee_count ON DEPARTMENT.ID = employee_count.DEPT_ID
ORDER BY employee_count DESC,
    DEPARTMENT.NAME ASC;