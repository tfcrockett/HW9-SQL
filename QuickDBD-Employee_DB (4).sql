-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/amWXcb
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Departments" (
    "dept_no" varchar(20)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Managers" (
    "dept_no" varchar(20)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" varchar(30)   NOT NULL,
    "to_date" varchar(30)   NOT NULL
);

CREATE TABLE "Dept_Employees" (
    "emp_no" int   NOT NULL,
    "dep_no" varchar(30)   NOT NULL,
    "from_date" varchar(30)   NOT NULL,
    "to_date" varchar(30)   NOT NULL
);

CREATE TABLE "Emloyees" (
    "emp_no" int   NOT NULL,
    "birth_date" varchar(20)   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "Gender" varchar(5)   NOT NULL,
    "hire_date" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Emloyees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" varchar(20)   NOT NULL,
    "to_date" varchar(20)   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_no" int   NOT NULL,
    "title" varchar(50)   NOT NULL,
    "from_date" varchar(20)   NOT NULL,
    "to_date" varchar(20)   NOT NULL
);

ALTER TABLE "Dept_Managers" ADD CONSTRAINT "fk_Dept_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Managers" ADD CONSTRAINT "fk_Dept_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Emloyees" ("emp_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Emloyees" ("emp_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_dep_no" FOREIGN KEY("dep_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Emloyees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Emloyees" ("emp_no");

