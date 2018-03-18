-- Create Data for Departments

INSERT INTO Departments (name)
VALUES ('Account Management');

INSERT INTO Departments (name)
VALUES ('Broadcast Production');

INSERT INTO Departments (name)
VALUES ('Client Finance');

INSERT INTO Departments (name)
VALUES ('Creative');

INSERT INTO Departments (name)
VALUES ('Digital Production');

INSERT INTO Departments (name)
VALUES ('Editorial');

INSERT INTO Departments (name)
VALUES ('Strategic Planning');

INSERT INTO Departments (name)
VALUES ('User Experience');

-- Create Employee Data

INSERT INTO Employees (first_name, last_name, title, dept_id_fk, salary, hourly_rate)
VALUES ('Daniel', 'Rothman', 'Client Business Manager', 3, 200000, 150);

INSERT INTO Employees (first_name, last_name, title, dept_id_fk, salary, hourly_rate)
VALUES ('Clara', 'Caliente', 'Account Supervisor', 1, 150000, 125);

INSERT INTO Employees (first_name, last_name, title, dept_id_fk, salary, hourly_rate)
VALUES ('John', 'Rossi', 'Strategic Planner', 7, 75000, 90);

INSERT INTO Employees (first_name, last_name, title, dept_id_fk, salary, hourly_rate)
VALUES ('Christine', 'Arcano', 'SVP Creative Director', 4, 300000, 350);

INSERT INTO Employees (first_name, last_name, title, dept_id_fk, salary, hourly_rate)
VALUES ('Justine', 'Frankel', 'VP Talent Resourcing', 2, 175000, 140);

INSERT INTO Employees (first_name, last_name, title, dept_id_fk, salary, hourly_rate)
VALUES ('Miguel', 'Tang', 'Art Buying Supervisor', 4, 150000, 130);

INSERT INTO Employees (first_name, last_name, title, dept_id_fk, salary, hourly_rate)
VALUES ('Wendy', 'Costello', 'Sr Developer', 5, 160000, 200);

INSERT INTO Employees (first_name, last_name, title, dept_id_fk, salary, hourly_rate)
VALUES ('Jen', 'Stickler', 'UX Designer', 8, 80000, 100);

-- Create Job Data
INSERT INTO Jobs (name, oop)
VALUES ('Asthma Brochure', 1500);

INSERT INTO Jobs (name, oop)
VALUES ('Print Ad', 5000);

INSERT INTO Jobs (name, oop)
VALUES ('Web Banner', 3000);

INSERT INTO Jobs (name, oop)
VALUES ('30 Second TV Spot', 150000);

INSERT INTO Jobs (name, oop)
VALUES ('Brand Development', 10000);

INSERT INTO Jobs (name, oop)
VALUES ('Important Safety Information', 500);

INSERT INTO Jobs (name, oop)
VALUES ('Sales Scripts', 0);


-- Create SOW Data
-- For the fee, insert hours to be worked * hourly rate from emp table

-- SOW # 1, Job # 1

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,1,2,
    100*(SELECT hourly_rate FROM Employees WHERE id = 2));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,1,3,
    20*(SELECT hourly_rate FROM Employees WHERE id = 3));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,1,4,
    50*(SELECT hourly_rate FROM Employees WHERE id = 4));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,1,5,
    70*(SELECT hourly_rate FROM Employees WHERE id = 5));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,1,6,
    100*(SELECT hourly_rate FROM Employees WHERE id = 6));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,1,7,
    20*(SELECT hourly_rate FROM Employees WHERE id = 7));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,1,8,
    50*(SELECT hourly_rate FROM Employees WHERE id = 8));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,1,1,
    70*(SELECT hourly_rate FROM Employees WHERE id = 1));
  
-- SOW # 1, Job # 2

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,2,6,
    100*(SELECT hourly_rate FROM Employees WHERE id = 6));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,2,7,
    20*(SELECT hourly_rate FROM Employees WHERE id = 7));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,2,8,
    50*(SELECT hourly_rate FROM Employees WHERE id = 8));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,2,1,
    70*(SELECT hourly_rate FROM Employees WHERE id = 1));  

-- SOW # 1, Job # 5

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,5,5,
    70*(SELECT hourly_rate FROM Employees WHERE id = 5));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,5,6,
    100*(SELECT hourly_rate FROM Employees WHERE id = 6));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (1,5,7,
    20*(SELECT hourly_rate FROM Employees WHERE id = 7));

-- SOW # 2, Job # 4

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (2,4,4,
    70*(SELECT hourly_rate FROM Employees WHERE id = 4));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (2,4,6,
    100*(SELECT hourly_rate FROM Employees WHERE id = 6));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (2,4,3,
    20*(SELECT hourly_rate FROM Employees WHERE id = 3));

-- SOW # 2, Job # 3

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (2,3,7,
    70*(SELECT hourly_rate FROM Employees WHERE id = 7));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (2,3,6,
    100*(SELECT hourly_rate FROM Employees WHERE id = 6));

INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee)
  VALUES (2,3,2,
    20*(SELECT hourly_rate FROM Employees WHERE id = 2));




