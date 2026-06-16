# Introduction to Databases

A database is a structured, organised collection of data or information stored electronically in a computer system.


 ### Why Choose A Database Over A Spreadsheet?

1. **Scalability**: Databases can handle massive amount of data would cause spreadsheets to crash
 or perform poorly.

2. **Data Integrity**: They include built-in rules to ensure data is accurate and consistent.

3. **Concurrency**: Thousands of users can read  and update data at the exact same time without overriding 
each other's changes.

4. **Security**:  Databases offer fine-tuned access controls that allows only autorized users to view or 
edit specific pieces of information.


# Introduction to Database Management Systems

## Introduction

A **Database Management System (DBMS)** is a software that enables users to create, define, maintain, and control 
access to a database. It acts as the interface between the end of user and the database, ensuring that data is consistently 
organised and remains  easily accessible.


## Categories of Database Management Systems (DBMS)

There are two major categories of **Database Management Systems (DBMS)**,  

- Relational Databases (SQL): Data is organised into structured tables made up of rows and columns, similar to a spreadsheet appliction.  
Example: **[PostreSQL](https://www.postgresql.org/), [MySQL](https://www.mysql.com/), [Oracle](https://www.oracle.com/), etc.**

- Non-Relational Database(NoSQL): Designed for unstructured or widely varied data.
They do not user tabular models, instead storing information via formats like documents(files),
key-value pairs(JSON),  or graphs.  
Example: **[MongoDB](https://www.mongodb.com/), [Redis](https://redis.io/) , [Firebase](https://firebase.google.com/) , [Superbase](https://supabase.com/), etc.**


This project focuses on **Relational Database** and the language use to interact with them, **SQL**.  

### Introduction to SQL

**SQL (Structured Query Language)** is the standard language used to communicate with relational databases. It allows 
you to `creat`, `read`, `update`  and `delete` data. These operations are often referred to as **CRUD**.

The **CRUD** actions are the core actions performed on database. Example, 

```{SQL}
CREATE DATABASE school;
``` 
creates a database named school. To insert data into this database, you would have to create table object to organise and store your data in a structured format.  
For an example Assuming I want to create a table object to store information about students in the schools database created earlier, I'd have to first connnect to that database (which would be explained very shortly),

```{SQL}

CREATE TABLE students(
    ID SERIAL PRIMARY KEY,
    fullname VARCHAR(50) NOT NULL, 
    age INTEGER,
    stage INTEGER
);

```
The query above creates a table object `students` with attributes/fields/Colums(represent the specific characteristics, properties or qualities of the entity your are storing) `ID`, 
`fullname`, `age`, and `stage`.  
The **Data Types** of each attribute must also be stated. Example of these data types include  
`SERIAL` - whatever 
`VARCHAR` - A string character  
`INTEGER` - An integer data type  
There are other data types as well and you can explore them later on your own. 
Aside the data types, some of attributes where also given a **Constraint**, a rule enforced on the data columns to limit the type of data that can be stored in each column in the table.  
Some of these **constraints** include `NOT NULL`, which makes that particular attribute to be a required field to be entered when inserting a record(row),  
`PRIMARY KEY` which uniquely identifies each row or record in a SQL table.  
There are other interesting *constraints* you can explore later on.


### More SQL Commands
There two main important SQL command languages,  
- **Data Definition Language (DDL)**
- **Data Manipulation Language (DML)**

A **Data Definition Language (DDL)** command is used to build, alter or destroy the framework of your database (tables, indexes, and schemas).  
These changes are permenant and happen automatically.  
Example of these commands are  

`CREATE;`   Used to create a new database or database object.  
`ALTER;`    Used to change the structure of a database object (table, indexes, schema, etc).  
`DROP;`     Used to delete delete a database or a database object (table, indexes, schemas, etc).  
`TRUNCATE;` Used to delete all the rows or records of a database table object.


A **Data Manipulation Language (DML)** Command on the other hand is used to manage and modify the actual data or information stored within 
the database object or structure. **DML** commands are often used daily to handle records.  
Example of **DML** Commands include  

`INSERT;`  Used to add new row or record of data into a table.  
`UPDATE;`  Used to modify and existing data values in a record or rows.   
`DELETE;`  Used to remove a specific rows of data based on a condition.  
`SELECT;`  Used to retrieve and view data from one or more tablesi in database;  

You can explore more on DML commands later on your own. 

**Tip: All database statements must be terminated with semi-colon "`;`"**

# Introduction to PostgreSQL

## Installing PostgreSQL

### Windows

**Step 1: Download**  
1. Open a browser on your computer
2. Go to the official [PostgreSQL](postgresql.org/download/windows) website and locate the installer
3. Click on **Download the installer ** and select the latest version for **Windows x86-64**


**Step 2: Run the Installer**  
1. Double-click on the downloaded `.exe` file file start the installation.
2. Grant administrative permissions if prompted.
3. Click **Next**  and choose your installation directory.

**Step 3: Configure**  
1. Set Password for the default superuser (`postgres`).
2. Leave the default port as `5432` unless it conflicts with another service.
3. Select your preferred locale and click **Next to complete the installation**

**Step 4: Verfy Installation**

Open the windows command prompt or powershell and run:  
```{bash}
psql --version 
```
If successful, you will see the installed version number.


**Step 5: Connect to PostgresSQL**

```{bash}

psql -U postgres
```
Enter the password you set during installation. You now connectd to the PostreSQL interactive terminal `psql`



### Linux

To install the PostgreSQL server on your Linux Computer, run the commands below: 

```{bash}
sudo apt update && sudo apt full upgrade -y
sudo apt install postgresql postgresql-contrib -y
```
Start the PostreSQL Service:  

```{bash}
sudo systemctl start postgresql
sudo systemctl enable postgresql
```
To check the status of the PostgreSQL service, run  

```{bash}
sudo systemctl status postgreslq
```

Run `psql --version` to confirm the installation. Then switch to the default PostgreSQL user to connect.

```{bash}

psql -i -u postgres
```

### Creating a Database in PostgreSQL
**SQL** is the standard language for relational database management systems, as such all SQL commands work effectively with PostreSQL as well.  
For an example, to create a database in PostgreSQL, run:  
#### Creating a Database 
```{SQL}
CREATE DATABASE my_database;
```

To select/switch to a database in PostgreSQL, use  
```{SQL}
\c my_database;
```

After connecting to your database, we can use some **DDL** commands to define the structure of our database objects.  
Let's create a new table object called students.  

#### Creating a Table Object
```{SQL}
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    age INT,
    enrolled BOOLEAN DEFAULT TRUE
);
```
#### Changing the Structure of a Table Object
Assuming we forgot to add the class attribute of the student after creating our table student, we can alter our table students and include the new attribute  

```{SQL}
ALTER TABLE students ADD COLUMN class VARCHAR(15);
```
Or meant to name this new attribute level instead, we can alter the table again as  

```{SQL}
ALTER TABLE students RENAME COLUMN class TO level;
```
We can also delete or drop a particular column or attribute say level if it's no longer needed.  

```{SQL}
ALTER TABLE students DROP COLUMN level;
```

We can also delete the students table compelete.  
```{SQL}
DROP TABLE students;
```

Now that we've created the structure or framework of our database, lets populate our table with some data and play with a few **DML** commands.  

#### Populating A Table Object With Data

```{SQL}
INSERT INTO students(name, email, age, enrolled)
VALUES ('James Nkrumah', 'jamasnkrumah@gmail.com', 21, TRUE);

INSERT INTO students(name, email, age, enrolled)
VALUES ('Yaw Boadi', 'yawb@gmail.com', 24, False);
```
Lets insert a couple of records in one query  

```{SQL}
INSERT INTO students(name, email, age, enrolled)
VALUES
    ('Prince Adomakoe', 'princeadadomako123@gmail.com', 19),
    ('Lawrencia Nyarko', 'lawrencia201@gmail.com', 20),
    ('Alice Mensah', 'mensahaalic@gmail.com', 21, False),
    ('Edith Agyapong', 'agyapong.edith@gmail.com', 22, TRUE),
    ('Kofi Asante', 'asanteyoyo@gmail.com', 19);

```
**Tip: ** Recorgnize how the first two records do not include the enrolled status? Yes that is because the enrolled attribute has a 
defualt value which is set to true whenever that option is not provided.


#### Reading Data From a Database Table
Let's read some records from our students table.  

```{SQL}

-- To Select all columns and rows of the student table
SELECT * FROM STUDENTS; -- PostgreSQL is case-insensitive, hence students == STUDENTS

-- To select specific columns
SELECT name, email FROM students;

-- To filter with a condition
SELECT name, email FROM students
WHERE enrolled = TRUE;

-- To sort query results
SELECT * FROM students ORDER BY name ASC;

-- Limit the number of records returned in a query
SELECT * FROM students LIMIT 5;

```
#### Update Data
Let's update some records in our students table  

```{SQL}
UPDATE students
SET age = 22
WHERE name = 'Kofi Asante';
```

#### Deleting a Record
To delete a record (row) in our students database, run  

```{SQL}
DELETE FROM students WHERE name = 'Alice Mensah';
```

You can find A **PostreSQL** Cheat Sheet here: [psql cheatsheet](./docs/psql-cheatsheet.html)  



Author: **Obed Adu-Gyamfi**  
Email: [adugyamfiobed.tpp3@gmail.com](adugyamfiobed.tpp3@gmail.com)
