
-- Delete the tables if they already exist before creating the new ones

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Employees`;
DROP TABLE IF EXISTS `Departments`;
DROP TABLE IF EXISTS `Jobs`;
DROP TABLE IF EXISTS `Scope_of_Works`;
SET FOREIGN_KEY_CHECKS = 1;

-- Creates the Departments Table
-- dept_id is an Auto Incrementing INT which is also the primary key
-- name is a varchar with max length of 255, this represents the name of each department for the agency

CREATE TABLE Departments (
  dept_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  name VARCHAR(255)
) ENGINE = InnoDB;

-- Create the Employee Table
-- id is Auto Incrementing Primary Key, can not be NULL
-- first_name, last_name, title, department are all varchar with a max length of 255. Can not be null
-- salary is an INT and represents that employees yearly income
-- hourly_rate is an INT that represents the cost billed to clients to use that employee
CREATE TABLE Employees (
  id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  dept_id_fk INT NOT NULL,
  salary INT,
  hourly_rate INT,
  FOREIGN KEY (dept_id_fk) REFERENCES Departments (dept_id)
) ENGINE = InnoDB;

-- Create the Jobs Table
-- job_id is the Auto Incrementing Primary Key, can not be NULL
-- oop (Out Of Pocket) is the 3rd party vendor charges that will be needed to complete each job
CREATE TABLE Jobs (
  job_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  oop INT
) ENGINE = InnoDB;

-- This creates the Scope_of_Works Table
-- sow_id is an INT, and can not be null
-- job_id_fk is an INT which represents the many jobs that can be on each SOW. This is the foreign key that links to the Jobs table on Jobs.job_id
-- emp_id is an INT, and also the foreign key that links to the Employees table on Employees.id
-- fee represents total hours*hourly rate for each employee
-- Primary Key is a combination of sowID, jobID, and empID
CREATE TABLE Scope_of_Works (
  sow_id INT NOT NULL,
  job_id_fk INT,
  emp_id_fk INT,
  fee INT,
  FOREIGN KEY (job_id_fk) REFERENCES Jobs (job_id),
  FOREIGN KEY (emp_id_fk) REFERENCES Employees (id),
  CONSTRAINT PK_sowID_JobID_EmpID PRIMARY KEY (sow_id, job_id_fk, emp_id_fk)
) ENGINE = InnoDB;


