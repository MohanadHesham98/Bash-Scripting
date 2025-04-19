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
- 🔁 **Rename Database** – Change the name of an existing database.
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
Note: Database names cannot contain special characters. If you enter one, the system will auto-correct it by replacing special characters with underscores (_) and ask if you want to use the suggested name.
 
 --- 
 
 ### List Database
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

### Drop Database
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
Note: ask if you want to delete more if yes ask to enter database name if no then exit 
if enter database doesn't exsist ask if you want to exit or not

 ---

 ### Connect to Database
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
