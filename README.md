# 📘 Student Management System using JSP, JDBC & MySQL

![Java](https://img.shields.io/badge/Java-8-orange)
![JSP](https://img.shields.io/badge/JSP-JavaEE-blue)
![JDBC](https://img.shields.io/badge/JDBC-Database-green)
![Database](https://img.shields.io/badge/Database-MySQL-blue)
![Server](https://img.shields.io/badge/Server-Apache%20Tomcat-yellow)

A CRUD-based Student Management System developed using JSP, JDBC and MySQL.  
The project demonstrates server-side rendering, database connectivity using JDBC, reusable database utilities, and externalized SQL query management for improved maintainability.

---

# ✨ Features

- ➕ Add new student records
- 📋 View all students in table format
- ✏️ Update existing student details
- ❌ Delete student records
- ⚠️ Delete confirmation popup
- ✅ Success messages after CRUD operations
- 🎨 Responsive and modern UI design
- 🔐 Uses `PreparedStatement` for database operations
- 📄 SQL queries externalized in `queries.sql`
- ⚙️ Externalized database configuration using `database.properties`
- ♻️ Reusable `DBconnector` and `SqlLoader` utility classes

---

# 🛠️ Technologies Used

- Java 8
- Java Collections Framework
- Java Properties API
- JSP (Java Server Pages)
- JDBC
- MySQL
- Apache Tomcat
- HTML5
- CSS3

---

# 📂 Project Structure

```bash
StudentManagementSystem/
└── src/
    └── main/
        ├── java/
        │   └── utility/
        │       ├── ConfigUtil.java
        │       ├── DBconnector.java
        │       └── SqlLoader.java
        │
        ├── resources/
        │   ├── config.properties
        │   └── sql/
        │       └── queries.sql
        │
        └── webapp/
            ├── add.jsp
            ├── edit.jsp
            ├── delete.jsp
            ├── index.jsp
            │
            └── WEB-INF/
                ├── lib/
                |    └── mysql-connector-java-8.x.x.jar
                |
                └── web.xml
```

---

# 🗄️ Database Setup

Execute the SQL script located at:

```text
src/main/resources/sql/queries.sql
```

The script contains:

- Database creation
- Table creation
- CRUD SQL queries used by the application

---

# ⚙️ Configuration

Update the configurations in `src/main/resources/config.properties` if required:

```properties
# Database configuration
driver=com.mysql.jdbc.Driver
connectionUrl=jdbc:mysql://localhost:3306/
database=student_manager
username=root
password=

# SQL file
sql.file=sql/queries.sql
```

---

# 🏗️ Architecture

```text
  JSP Pages
     │
     ▼
  Utility
     │
     ▼
   JDBC
     │
     ▼
MySQL Database
```

- **ConfigUtil** – Loads application configuration from `config.properties`.
- **DBconnector** – Creates reusable JDBC database connections.
- **SqlLoader** – Loads named SQL queries from `queries.sql`.
- **JSP pages** - Handles user interaction and renders responses.

---

# 🚀 How to Run

1. Install Java 8 or later
2. Install Apache Tomcat
3. Install MySQL or Laragon
4. Create the database and table
5. Import the project into Eclipse/STS
6. Add MySQL Connector JAR to project libraries
7. Run the project on Tomcat server

Open in browser:

```bash
http://localhost:8080/StudentManagementSystem/
```

---

# 📸 Screenshots

## Home Page

![Home](screenshots/view.png)

## Add Student Page

![Add](screenshots/add.png)

## Edit Student Page

![Edit](screenshots/edit.png)

## Delete Student Page

![Delete](screenshots/delete.png)

---

# 📚 CRUD Operations Implemented

| Operation | Description |
|---|---|
| Create | Add new student |
| Read | View all students |
| Update | Edit student details |
| Delete | Remove student record |

---

## 📌 Note

This project is intentionally implemented using **JSP, JDBC and MySQL** without frameworks to demonstrate server-side scripting, CRUD operations, reusable utility classes, externalized configuration, named SQL query management, and database connectivity fundamentals.
