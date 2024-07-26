CREATE DATABASE FINANCIAL_RISK; -- Create a new database named FINANCIAL_RISK
USE FINANCIAL_RISK;  -- Switch to the FINANCIAL_RISK database

-- Overview of Data Cleaning
-- Removed duplicate columns
-- Checked remaining data
-- Cleaned empty values
-- Adjusted data type
-- Verified trimmed data
-- Removed unecessary records with NULL values


CREATE TABLE FINANCE_RISK( -- Created a table for backup, this is not the main table
`AGE` VARCHAR(70),
`GENDER` VARCHAR(70),
`EDUCATION LEVEL` VARCHAR(70),
`MARITAL STATUS` VARCHAR(70),
`INCOME` VARCHAR(70),
`CREDIT SCORE` VARCHAR(70),
`LOAN AMOUNT` VARCHAR(70),
`LOAN PURPOSE` VARCHAR(70),
`EMPLOYMENT STATUS` VARCHAR(70),
`YEARS AT CURRENT JOB` VARCHAR(70),
`PAYMENT HISTORY` VARCHAR(70),
`DEBT-TO-INCOME RATIO` VARCHAR(70),
`ASSETS VALUE` VARCHAR(70),
`NUMBER OF DEPENDENTS` VARCHAR(70),
`CITY` VARCHAR(70),
`STATE` VARCHAR(70),
`COUNTRY` VARCHAR(70),
`PREVIOUS DEFAULTS` VARCHAR(70),
`MARITAL STATUS CHANGE` VARCHAR(70),
`RISK RATING` VARCHAR(70)
);
SELECT COUNT(*) FROM FINANCE_RISK;  -- Count the total number of records in the FINANCE_RISK table

WITH FINANCE_CTE AS(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY `AGE`, `GENDER`, `EDUCATION LEVEL`, `MARITAL STATUS`, `INCOME`, `CREDIT SCORE`, 
`LOAN AMOUNT`, `LOAN PURPOSE`, `EMPLOYMENT STATUS`, `YEARS AT CURRENT JOB`, `PAYMENT HISTORY`, 
`DEBT-TO-INCOME RATIO`, `ASSETS VALUE`, `NUMBER OF DEPENDENTS`, `CITY`,
 `STATE`, `COUNTRY`, `PREVIOUS DEFAULTS`, `MARITAL STATUS CHANGE`, `RISK RATING`
 ) as ROW_NUM FROM FINANCE_RISK)  -- Assign a row number to each record partitioned by all columns to identify duplicates
 SELECT * FROM FINANCE_CTE
 WHERE ROW_NUM > 1;  -- Select records where the row number is greater than 1, effectively retrieving duplicate records
 
CREATE TABLE finance_risk2 (  -- Created a new table, this is our main table. This table has all the contents of previous table.
  `AGE` varchar(70) DEFAULT NULL,
  `GENDER` varchar(70) DEFAULT NULL,
  `EDUCATION LEVEL` varchar(70) DEFAULT NULL,
  `MARITAL STATUS` varchar(70) DEFAULT NULL,
  `INCOME` varchar(70) DEFAULT NULL,
  `CREDIT SCORE` varchar(70) DEFAULT NULL,
  `LOAN AMOUNT` varchar(70) DEFAULT NULL,
  `LOAN PURPOSE` varchar(70) DEFAULT NULL,
  `EMPLOYMENT STATUS` varchar(70) DEFAULT NULL,
  `YEARS AT CURRENT JOB` varchar(70) DEFAULT NULL,
  `PAYMENT HISTORY` varchar(70) DEFAULT NULL,
  `DEBT-TO-INCOME RATIO` varchar(70) DEFAULT NULL,
  `ASSETS VALUE` varchar(70) DEFAULT NULL,
  `NUMBER OF DEPENDENTS` varchar(70) DEFAULT NULL,
  `CITY` varchar(70) DEFAULT NULL,
  `STATE` varchar(70) DEFAULT NULL,
  `COUNTRY` varchar(70) DEFAULT NULL,
  `PREVIOUS DEFAULTS` varchar(70) DEFAULT NULL,
  `MARITAL STATUS CHANGE` varchar(70) DEFAULT NULL,
  `RISK RATING` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from finance_risk2;  -- Select all records from the finance_risk2 table

insert into finance_risk2
select * from finance_risk;  -- Insert all records from the finance_risk table into the finance_risk2 table

SELECT * FROM finance_risk2
WHERE `CREDIT SCORE` = '';  -- Select records from finance_risk2 where the CREDIT SCORE field is empty

ALTER TABLE finance_risk2
MODIFY COLUMN `CREDIT SCORE` INT;  -- Modify the data type of the CREDIT SCORE column to INT

SELECT TRIM(`CREDIT SCORE`) FROM finance_risk2;  -- Select the CREDIT SCORE column with leading and trailing spaces removed

UPDATE finance_risk2
SET `CREDIT SCORE` = '0'
WHERE `credit score` = '';  -- Update the CREDIT SCORE column to 0 where it is currently empty

select `CREDIT SCORE` from finance_risk2;   -- Select the CREDIT SCORE column from the finance_risk2 table

ALTER TABLE finance_risk2
MODIFY COLUMN `LOAN AMOUNT` INT;  -- Modify the data type of the LOAN AMOUNT column to INT

select * from finance_risk2;   -- Select all records from the finance_risk2 table

UPDATE FINANCE_RISK2
SET `LOAN AMOUNT` = 0
WHERE `LOAN AMOUNT` = '';   -- Update the LOAN AMOUNT column to 0 where it is currently empty

ALTER TABLE finance_risk2
MODIFY COLUMN `YEARS AT CURRENT JOB` INT;  -- Modify the data type of the YEARS AT CURRENT JOB column to INT 

INSERT INTO FINANCE_RISK2 (`DEBT-TO-INCOME RATIO`) SELECT `DEBT-TO-INCOME RATIO` FROM FINANCE_RISK;
-- Insert DEBT-TO-INCOME RATIO values from the finance_risk table into the finance_risk2 table

ALTER TABLE finance_risk2
MODIFY COLUMN `DEBT-TO-INCOME RATIO` float;  -- Modify the data type of the DEBT-TO-INCOME RATIO column to FLOAT

ALTER TABLE finance_risk2
drop COLUMN `DEBT-TO-INCOME RATIO`;  -- Remove the DEBT-TO-INCOME RATIO column from the finance_risk2 table

select * from finance_risk2;  -- Select all records from the finance_risk2 table

UPDATE FINANCE_RISK2
SET `ASSETS VALUE` = 0
WHERE `ASSETS VALUE` = '';  -- Update the ASSETS VALUE column to 0 where it is currently empty

ALTER TABLE finance_risk2
MODIFY COLUMN `ASSETS VALUE` INT;  -- Modify the data type of the ASSETS VALUE column to INT

UPDATE FINANCE_RISK2
SET `NUMBER OF DEPENDENTS` = 0
WHERE `NUMBER OF DEPENDENTS` = '';  -- Update the NUMBER OF DEPENDENTS column to 0 where it is currently empty

ALTER TABLE finance_risk2
MODIFY COLUMN `NUMBER OF DEPENDENTS` INT;  -- Modify the data type of the NUMBER OF DEPENDENTS column to INT

UPDATE FINANCE_RISK2
SET `PREVIOUS DEFAULTS` = 0
WHERE `PREVIOUS DEFAULTS` = '';  -- Update the PREVIOUS DEFAULTS column to 0 where it is currently empty

ALTER TABLE finance_risk2
MODIFY COLUMN `PREVIOUS DEFAULTS` INT;  -- Modify the data type of the PREVIOUS DEFAULTS column to INT

ALTER TABLE finance_risk2
MODIFY COLUMN `MARITAL STATUS CHANGE` INT;  -- Modify the data type of the MARITAL STATUS CHANGE column to INT


select * from finance_risk2
WHERE `AGE` AND `GENDER` AND `EDUCATION LEVEL` AND `MARITAL STATUS` AND `INCOME` AND `CREDIT SCORE` AND `LOAN AMOUNT` AND `LOAN PURPOSE` AND `EMPLOYMENT STATUS` AND `YEARS AT CURRENT JOB` AND `PAYMENT HISTORY` AND 
`ASSETS VALUE` AND `NUMBER OF DEPENDENTS` AND `CITY` AND `STATE` AND `COUNTRY` 
AND `PREVIOUS DEFAULTS` AND `MARITAL STATUS CHANGE` AND `RISK RATING`
 ; -- It is used to check whether all columns have a null value together or not.

SELECT * FROM FINANCE_RISK2;  -- Select all records from the FINANCE_RISK2 table
UPDATE FINANCE_RISK2
SET `YEARS AT CURRENT JOB` = TRIM(`YEARS AT CURRENT JOB`);  -- Update the YEARS AT CURRENT JOB column by trimming any leading or trailing spaces

SELECT `YEARS AT CURRENT JOB`, TRIM(`YEARS AT CURRENT JOB`) FROM FINANCE_RISK2;  
-- Select the YEARS AT CURRENT JOB column and its trimmed version from the FINANCE_RISK2 table

SELECT * FROM FINANCE_RISK2
WHERE COUNTRY IS NULL;   -- Select all records from FINANCE_RISK2 where the COUNTRY column is NULL

DELETE FROM FINANCE_RISK2
WHERE COUNTRY IS NULL;  -- Delete all records from FINANCE_RISK2 where the COUNTRY column is NULL
 
SELECT * FROM FINANCE_RISK2
WHERE `NUMBER OF DEPENDENTS` IS NULL;  -- Select all records from FINANCE_RISK2 where the NUMBER OF DEPENDENTS column is NULL


 
