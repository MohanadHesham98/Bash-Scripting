# 🐚 Bash Shell Script Database Management System (Mini DBMS)

## 📌 Project Overview

This project is a simplified yet functional **Database Management System (DBMS)** built entirely using **Bash Shell Scripting**. It allows users to manage databases and perform operations like creating tables, inserting, updating, and viewing records — all from the terminal.

Databases are stored as **directories**, and tables are stored as **text files**, making this an excellent educational tool to understand how databases function behind the scenes using just shell scripting.

---

## ⚡ Features

### 📂 Main Menu (Database Management)

- 📦 **Create Database** – Create a new database as a directory.
- 📃 **List Databases** – View all available databases.
- ❌ **Drop Database** – Permanently delete a database.
- 🔌 **Connect to Database** – Access a selected database to manage its tables.

### 📋 Table Operations (After Connecting to a Database)

- 🆕 **Create Table** – Define a new table and its columns.
- 📄 **List Tables** – Show all tables in the current database.
- 🗑️ **Drop Table** – Delete a table from the database.
- ➕ **Insert into Table** – Add new records to a table.
- 👁️ **View Table** – Display full table contents or specific columns.
- ✏️ **Update Record** – Modify existing data in a specific row and column.
- ❌ **Delete Record** – Remove a row using a value from a chosen column.

---

## 🛠 Implementation Details

### 📁 Database Structure

- **Databases** = directories
- **Tables** = space-separated text files inside the DB folder
- First line of each table = header (column names)

---

## ✅ Requirements

- **Operating System:** Linux-based (Tested on CentOS 9)
- **Shell:** Bash
- **Utilities Used:**
  - `awk`, `sed`, `grep` – for text processing
  - `dialog` *(optional)* – for an enhanced CLI menu interface

---

## 🚀 Installation and Setup

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/MohanadHesham98/Bash-Scripting.git
cd "Bash-Scripting/Based Database Management System"
```
---

### 2️⃣ Make the Scripts Executable
```bash
chmod +x *.sh
```
---

### 3️⃣ Run the Main Script
```bash
./main.sh
```
📌 The script will launch a CLI menu where you can manage databases, create tables, insert and query data, and more.

---

### 🔥 Usage Example
### 📌 Creating a Database
```bash
Main Menu:
1) create DB
2) list DB
3) drop DB
4) connect DB
5) exit
Enter your choice: 1
Your DB will be created in /mnt/d/courses/5-Bash Scripting/demo/Based Database Management System
--------------------------------
Enter a new DB name: DB
--------------------------------
Your DB is created. Its name is: DB
--------------------------------
do you want to create more [y/n]: y
Enter a new DB name: DB$2
--------------------------------
Invalid name. Database name should only contain alphanumeric characters and underscores.
Cleaned DB name: DB_2
suggest name 'DB_2', do you want this suggested name [y/n]: y
Your DB is created. Its name is: DB_2
--------------------------------
do you want to create more [y/n]: n
```
Note: 
Database names cannot contain special characters. If you enter one, the system will auto-correct it by replacing special characters with underscores (_) and ask if you want to use the suggested name.
 
 --- 
 
 ### 📃 List Database
 ```bash
Enter your choice:
1) create DB
2) list DB
3) drop DB
4) connect DB
5) exit
Enter your choice: 2
DB/
DB_2/
```

---

### ❌ Drop Database
```bash
1) create DB
2) list DB
3) drop DB
4) connect DB
5) exit
Enter your choice: 3
Enter DB you want to delete: DB
DB is deleted
--------------------------------
Do you want to delete more? [y/n]: y
Enter DB you want to delete: DB
It doesn't exist
Do you want to exit? [y/n]: y
```
Note: 
ask if you want to delete more if yes ask to enter database name if no then exit 
if enter database doesn't exsist ask if you want to exit or not

 ---

 ###🔌 Connect to Database
 ```bash
1) create DB
2) list DB
3) drop DB
4) connect DB
5) exit
Enter your choice: 4
enter DB you want to connect : DB_2
you now in DB_2
1) create table       3) print table        5) insert table       7) delete from table  9) exit
2) list tables        4) drop table         6) select from table  8) update table
Enter your choice:
```

---

### Create Table
```bash
you now in DB_2
1) create table       3) print table        5) insert table       7) delete from table  9) exit
2) list tables        4) drop table         6) select from table  8) update table
Enter your choice: 1
Enter table name: student&1  
Invalid name. Table name should only contain alphanumeric characters and underscores.
Cleaned table name: student_1
Suggested name 'student_1'. Do you want to use it? [y/n]: n
Enter table name: student
Your table is created. Its name is: student
--------------------------------
Add column names (space-separated): id name age
--------------------------------
Current columns: id name age
--------------------------------
Do you want to add more columns? [Y/N] y
--------------------------------
Add column names (space-separated): address id
--------------------------------
Column 'id' is duplicated. Skipping.
--------------------------------
Current columns: id name age address
--------------------------------
Do you want to add more columns? [Y/N] y
--------------------------------
Add column names (space-separated): grade&1  
--------------------------------
Invalid name. Table name should only contain alphanumeric characters and underscores.
Suggested  column name: grade_1
Do you want to use the suggested name? [y/n]: n
Please enter a valid column name: grade%1
Still invalid. Skipping this column.
--------------------------------
Current columns: id name age address
--------------------------------
Do you want to add more columns? [Y/N] y
--------------------------------
Add column names (space-separated): grade
--------------------------------
Current columns: id name age address grade
--------------------------------
Do you want to add more columns? [Y/N] n
--------------------------------
Column headers added to table 'student'.
--------------------------------
```
Note:
Note:
Table Name Validation: The table name cannot contain special characters like &, and it should only consist of alphanumeric characters and underscores. If the entered table name is invalid (e.g., student&1), the system cleans it and suggests a valid name (e.g., student_1).

If you choose no to the suggestion, you can enter your preferred table name.

If you choose yes to the suggestion, table will be created.

Column Name Validation: Similar to table names, column names must only include alphanumeric characters and underscores. Invalid column names (e.g., grade&1) are rejected, and a suggestion (e.g., grade_1) is provided.

If you reject the suggestion, you will be prompted to enter a valid name.

Handling Duplicates: If you try to add a column with a name that already exists (e.g., adding id again), the system will skip it and show the current columns.

After adding all the desired columns, they are saved as the table headers..
---

### List Table
```bash
1) create table       3) print table        5) insert table       7) delete from table  9) exit
2) list tables        4) drop table         6) select from table  8) update table
Enter your choice: 2
student*  student_2*
Enter your choice:
```
---
### 🟩 Insert into Table

```bash
Enter your choice:
1) create table       3) print table        5) insert table       7) delete from table  9) exit
2) list tables        4) drop table         6) select from table  8) update table
Enter your choice: 5
Enter table name to insert data : stu
--------------------------------
Table 'stu' does not exist.
--------------------------------
Enter table name to insert data : student
--------------------------------
Now you are in 'student'
--------------------------------
Please enter data for each column:
--------------------------------
id: 1
name: ali
age: 20
address: cairo   
Row inserted successfully!
--------------------------------

id | name | age | address |

1  | ali  | 20  | cairo   |

--------------------------------
Do you want to add other data [y/n]: y
Enter table name to insert data : student
--------------------------------
Now you are in 'student'
--------------------------------
Please enter data for each column:
--------------------------------
id: 1
name: hany
age: 22
address: alex
Error: Primary key '1' already exists in the table.
--------------------------------
Enter table name to insert data : student
--------------------------------
Now you are in 'student'
--------------------------------
Please enter data for each column:
--------------------------------
id: 2
name: hany
age: 22
address: alex
Row inserted successfully!
--------------------------------

id | name | age | address |

1  | ali  | 20  | cairo   |
2  | hany | 22  | alex    |

--------------------------------
Do you want to add other data [y/n]: n

```
Notes:
Primary Key Enforcement: The first column (usually id) is treated as a primary key. If a duplicate value is entered (e.g., id: 1 again), insertion fails with an appropriate error.

Live Feedback: After each successful insert, the updated table content is displayed.

Table Check: If the entered table name does not exist, the system will notify the user.

Multiple Entries: You can continuously insert rows until you choose to stop by entering n.

---

### print table
```bash
1) create table       3) print table        5) insert table       7) delete from table  9) exit
2) list tables        4) drop table         6) select from table  8) update table
Enter your choice: 3
enter table you want to see: student

id | name | age | address |

1  | ali  | 20  | cairo   |
2  | hany | 22  | alex    |
```

---

### select from table
```bash
1) create table       3) print table        5) insert table       7) delete from table  9) exit
2) list tables        4) drop table         6) select from table  8) update table
Enter your choice: 6
Enter table name: stu
Table 'stu' does not exist.
--------------------------------
Enter table name: student
Now you are in 'student'
--------------------------------

Select a column to view:
(1) id
(2) name
(3) age
(4) address
Select one: 2
You selected column: name

Values under column 'name':
name

ali
hany
do you want to select more [y/n]: y
Enter table name: student
Now you are in 'student'
--------------------------------

Select a column to view:
(1) id
(2) name
(3) age
(4) address
Select one: 3
You selected column: age

Values under column 'age':
age

20
22
do you want to select more [y/n]: n
```

---

### 🗑️ Delete from Table

```bash
1) create table       3) print table        5) insert table       7) delete from table  9) exit
2) list tables        4) drop table         6) select from table  8) update table
Enter your choice: 7
Enter table name: stu
Table 'stu' does not exist.
--------------------------------
Enter table name: student
Now you are in 'student'
--------------------------------

Select a column to view:
--------------------------------
1) id
2) name
3) age
4) address
Select one: 2
You selected column: name

Values under column 'name':

ali
hany
Enter value you want to delete: ali
Clearing value 'ali' from row: 1 ali 20 cairo
Value 'ali' has been deleted from the column 'name'.
--------------------------------

id | name          | age | address |

1  | deleted_value | 20  | cairo   |
2  | hany          | 22  | alex    |

Do you want to delete more [y/n]: n
```
📝 Notes:
If the entered table name doesn't exist, the script notifies the user and prompts again.

User selects which column to target.

All rows where the value matches will have that specific column value replaced with deleted_value.

After deletion, the table is displayed showing changes.

If user selects y when asked to "delete more", the same process repeats from asking for the table name and value to delete.

---

### ✏️ Update Table

```bash
1) create table       3) print table        5) insert table       7) delete from table  9) exit
2) list tables        4) drop table         6) select from table  8) update table
Enter your choice: 8
Enter table name: stu
Table 'stu' does not exist.
--------------------------------
Enter table name: student
Now you are in 'student'
--------------------------------

Select a column to view:
(1) id
(2) name
(3) age
(4) address
Select one: 2
You selected column: name

Values under column 'name':

deleted_value  
hany  
Enter value you want to update: deleted_value  
Enter new value: ahmed  
Updating row: 1 deleted_value 20 cairo  
--------------------------------

id | name  | age | address |

1  | ahmed | 20  | cairo   |
2  | hany  | 22  | alex    |

Do you want to update more [y/n]: y  
Enter table name: student  
Now you are in 'student'  
--------------------------------

Select a column to view:
(1) id
(2) name
(3) age
(4) address
Select one: 4
You selected column: address

Values under column 'address':

cairo  
alex  
Enter value you want to update: cairo  
Enter new value: alex  
Updating row: 1 ahmed 20 cairo  
--------------------------------

id | name  | age | address |

1  | ahmed | 20  | alex    |
2  | hany  | 22  | alex    |

Do you want to update more [y/n]: n
```
📝 Notes:
If the table name doesn't exist, the system prompts again.

After selecting a column, all existing values are shown.

The user specifies the value to update and its replacement.

Only the first matching occurrence is updated in the selected column.

Updated table view is printed after each change.

The loop continues until the user answers n to "Do you want to update more?".

---

### 🗑️ Drop Table

```bash
1) create table       3) print table        5) insert table       7) delete from table  9) exit
2) list tables        4) drop table         6) select from table  8) update table
Enter your choice: 4
Enter table you want to delete: stu
--------------------------------
It doesn't exist
--------------------------------
Enter your choice:
1) create table       3) print table        5) insert table       7) delete from table  9) exit
2) list tables        4) drop table         6) select from table  8) update table
Enter your choice: 4
Enter table you want to delete: student
--------------------------------
Table 'student' has been deleted successfully.
```
If the entered table name does not exist, it will notify the user.

No deletion happens unless the table name matches an existing file.

After successful deletion, a confirmation message appears.

User returns to the table operations menu after each action.
