-- -----------------------------------------------------------------------------------------------
-- SQL Homework - Employee Database    : A Mystery in Two Parts
-- GitHub repository for this project  : sql-challenge
-- Local git repository                : EmployeeSQL 
-- -----------------------------------------------------------------------------------------------

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- -----------------------------------------------------------------------------------------------

-- For loading CSV file: titles.csv


CREATE TABLE Titles (
    Title_Id varchar(5)   NOT NULL,
    Title varchar(25)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        Title_Id
     )
);

-- -----------------------------------------------------------------------------------------------

-- For loading CSV file: departments.csv


CREATE TABLE Departments (
    Dept_No varchar(4)   NOT NULL,
    Dept_Name varchar(25)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_No
     )
);

-- -----------------------------------------------------------------------------------------------

-- For loading CSV file: employees.csv


CREATE TABLE Employees (
    Emp_No Integer   NOT NULL,
    emp_Title_Id varchar(5)   NOT NULL,
    Birth_Date date   NOT NULL,
    First_Name varchar   NOT NULL,
    Last_Name varchar   NOT NULL,
    Sex varchar(1)   NOT NULL,
    Hire_Date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_No
     )
);


ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_Title_Id FOREIGN KEY(emp_Title_Id)
REFERENCES Titles (Title_Id);

-- -----------------------------------------------------------------------------------------------

-- For loading CSV file: dept_emp.csv


CREATE TABLE Dept_Employee (
    Emp_No Integer   NOT NULL,
    Dept_No varchar(5)   NOT NULL
);


ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_Dept_No FOREIGN KEY(Dept_No)
REFERENCES Departments (Dept_No);

-- -----------------------------------------------------------------------------------------------

-- For loading CSV file: dept_manager.csv


CREATE TABLE Dept_Manager (
    Dept_No varchar(5)   NOT NULL,
    Emp_No Integer   NOT NULL
);


ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Dept_No FOREIGN KEY(Dept_No)
REFERENCES Departments (Dept_No);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

-- -----------------------------------------------------------------------------------------------

-- For loading CSV file: salaries.csv


CREATE TABLE Salaries (
    Emp_No Integer   NOT NULL,
    Salary Integer   NOT NULL
);


ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

-- -----------------------------------------------------------------------------------------------
