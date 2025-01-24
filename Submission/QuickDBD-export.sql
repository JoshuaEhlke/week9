-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [titles] (
    [title_id] varchar(10)  NOT NULL ,
    [title] varchar(50)  NOT NULL ,
    [last_updated] timestamp  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

CREATE TABLE [department] (
    [dept_no] varchar(10)  NOT NULL ,
    [dept_name] varchar(50)  NOT NULL ,
    [last_updated] timestamp  NOT NULL ,
    CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [employees] (
    [emp_no] int  NOT NULL ,
    [emp_title_id] varchar(10)  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] varchar(50)  NOT NULL ,
    [last_name] varchar(50)  NOT NULL ,
    [sex] varchar(5)  NOT NULL ,
    [hire_date] date  NOT NULL ,
    [last_update] timestamp  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [salaries] (
    [salary_id] serial  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [salary] int  NOT NULL ,
    [last_update] timestamp  NOT NULL 
)

CREATE TABLE [dept_emp] (
    [dept_emp_id] serial  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [dept_no] varchar(10)  NOT NULL ,
    [last_update] timestamp  NOT NULL ,
    CONSTRAINT [PK_dept_emp] PRIMARY KEY CLUSTERED (
        [dept_emp_id] ASC
    )
)

CREATE TABLE [dept_manager] (
    [dept_manager_id] serial  NOT NULL ,
    [dept_no] varchar(10)  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [last_update] timestamp  NOT NULL ,
    CONSTRAINT [PK_dept_manager] PRIMARY KEY CLUSTERED (
        [dept_manager_id] ASC
    )
)

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_title_id] FOREIGN KEY([emp_title_id])
REFERENCES [titles] ([title_id])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_title_id]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [department] ([dept_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [department] ([dept_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

COMMIT TRANSACTION QUICKDBD