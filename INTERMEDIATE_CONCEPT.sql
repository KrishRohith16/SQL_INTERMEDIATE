CREATE DATABASE INTERMEDIATE_CONCEPT;
USE INTERMEDIATE_CONCEPT;
-- CREATED AND USING DATABASE - " INTERMEDIATE_CONCEPT "


-- MASTER TABLES : CITY AND DEPT --
-- CREATING CITY TABLE (MASTER TABLE):
CREATE TABLE CITY(
CITY_ID INT PRIMARY KEY,
CITY_NAME VARCHAR(20)
);
-- CREATING DEPT TABLE (MASTER TABLE):
CREATE TABLE DEPT(
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(20)
);

-- TRANSACTION TABLE : EMP_INFO --
-- CREATING EMP_INFO TABLE (TRANSACTION TABLE):
CREATE TABLE EMP_INFO(
SNO INT UNIQUE AUTO_INCREMENT,
EMP_ID VARCHAR(20)  PRIMARY KEY,
EMP_NAME VARCHAR(20) NOT NULL,
AGE INT CHECK(AGE >=15),
NATIONALITY VARCHAR(20) DEFAULT('INDIAN'),
EMP_CITY_ID INT,
EMP_DEPT_ID INT,
FOREIGN KEY(EMP_CITY_ID) REFERENCES CITY(CITY_ID),
FOREIGN KEY(EMP_DEPT_ID) REFERENCES DEPT(DEPT_ID)
);


-- INSERTING DATA TO MASTER TABLES :
-- INSERTING DATA TO CITY TABLE (MASTER)
INSERT INTO CITY(CITY_ID,CITY_NAME) VALUES
(1,'CHENNAI'),(2,'BANGALORE'),(3,'HYDERBAD'),(4,'PUNE'),(5,'MUMBAI'),(6,'KOLKATA'),(7,'DELHI');

-- INSERTING DATA TO DEPT TABLE (MASTER)
INSERT INTO DEPT(DEPT_ID , DEPT_NAME) VALUES
(1,'WEB_DESIGNER'),(2,'FRONT-END_DEVELOPER'),(3,'BACK-END_DEVELOPER'),(4,'SQL_DEVELOPER'),(5,'DEVOPS_DEVELOPER'),(6,'FULL-STACK_DEVELOPER');

-- INSERTING DATA TO EMP_INFO TABLE (TRANSACTION)
INSERT INTO EMP_INFO(EMP_ID,EMP_NAME,AGE,EMP_CITY_ID,EMP_DEPT_ID) VALUES
('E0000001','ASHURA',20,1,6),
('E0000002','INDRA',22,1,5),
('E0000003','MADARA',30,3,4),
('E0000004','HASURAMA SENJU',28,3,2),
('E0000005','KAKASHI',25,7,4),
('E0000006','OBITO',24,7,5),
('E0000007','ITACHI',22,6,6),
('E0000008','MIGHT GUY',25,6,2),
('E0000009','GARA',19,3,2),
('E0000010','KONOHAMARU',15,3,1),
('E0000011','NEJI',18,3,3),
('E0000012','ROCK LEE',18,3,4),
('E0000013','NARUTO',18,3,5),
('E0000014','HINATA',18,3,6),
('E0000015','RIN',24,7,6),
('E0000016','SASUKE',18,4,5),
('E0000017','SAKURA',18,4,6),
('E0000018','JIRAIYA',38,2,6),
('E0000019','ORACHIMARU',37,2,5),
('E0000020','TSUNADE',37,2,4),
('E0000021','YAHIKO',27,5,6),
('E0000022','NAGATO',26,5,5),
('E0000023','KONAN',26,5,4);
-- _____________________________________________________

-- FETCHING TABLES BY " SELECT " COMMAND :
SELECT * FROM EMP_INFO;
SELECT * FROM CITY;
SELECT * FROM DEPT;

-- _____________________________________________________
-- ^^^^^^^^^^^^^^^^^^ TABLES CREATED ^^^^^^^^^^^^^^^^ --

-- 1) GROUP BY AND HAVING CLAUSE :
SELECT B.CITY_NAME, COUNT(*) AS 'TOTAL_EMP'
FROM EMP_INFO A
INNER JOIN CITY B ON A.EMP_CITY_ID = B.CITY_ID
INNER JOIN DEPT C ON A.EMP_DEPT_ID = C.DEPT_ID 
GROUP BY B.CITY_NAME
HAVING TOTAL_EMP =  (SELECT MAX(TOTAL_EMP) FROM 
(SELECT B.CITY_NAME, COUNT(*) AS 'TOTAL_EMP'
FROM EMP_INFO A
INNER JOIN CITY B ON A.EMP_CITY_ID = B.CITY_ID
INNER JOIN DEPT C ON A.EMP_DEPT_ID = C.DEPT_ID 
GROUP BY B.CITY_NAME)A)


