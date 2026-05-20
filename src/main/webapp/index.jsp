<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>

<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "student_manager";
String userid = "root";
String password = "";

Class.forName(driver);

Connection connection = DriverManager.getConnection(
    connectionUrl + database,
    userid,
    password
);

Statement statement = connection.createStatement();

ResultSet resultSet = statement.executeQuery("SELECT * FROM students");
%>

<%
String msg = request.getParameter("msg");

if(msg != null){
%>

<div class="success-message">

<%
    if(msg.equals("added")){
        out.println("Student added successfully!");
    }
    else if(msg.equals("updated")){
        out.println("Student updated successfully!");
    }
    else if(msg.equals("deleted")){
        out.println("Student deleted successfully!");
    }
%>

</div>

<%
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Management System</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:#f4f6f9;
    padding:40px;
}

.container{
    width:100%;
    max-width:1100px;
    margin:auto;
}

.title{
    text-align:center;
    color:#324960;
    margin-bottom:10px;
    font-size:34px;
}

.subtitle{
    text-align:center;
    margin-bottom:30px;
    color:#666;
    font-size:16px;
}

.top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.add-btn{
    text-decoration:none;
    background:#4FC3A1;
    color:white;
    padding:12px 20px;
    border-radius:8px;
    font-weight:bold;
}

.add-btn:hover{
    background:#3ca789;
}

.table-container{
    background:white;
    padding:25px;
    border-radius:12px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
    overflow-x:auto;
}

.fl-table{
    width:100%;
    border-collapse:collapse;
}

.fl-table th,
.fl-table td{
    padding:14px;
    text-align:center;
}

.fl-table th{
    background:#324960;
    color:white;
}

.fl-table tr:nth-child(even){
    background:#f8f8f8;
}

.fl-table tr:hover{
    background:#eef7f4;
}

.edit-btn{
    text-decoration:none;
    background:#3498db;
    color:white;
    padding:8px 12px;
    border-radius:6px;
    margin-right:5px;
}

.delete-btn{
    text-decoration:none;
    background:#e74c3c;
    color:white;
    padding:8px 12px;
    border-radius:6px;
}

.empty-message{
    padding:20px;
    color:#777;
}

.success-message{
    background:#d4edda;
    color:#155724;
    padding:14px;
    border-radius:8px;
    margin-bottom:20px;
    text-align:center;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

    <h1 class="title">Students Management System</h1>
    <p class="subtitle">Using JSP, JDBC and MySQL</p>

    <div class="top-bar">
        <a href="add.jsp" class="add-btn">Add Student</a>
    </div>

    <div class="table-container">

        <table class="fl-table">

            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Age</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>

<%
boolean hasData = false;

while(resultSet.next()){

    hasData = true;
%>

<tr>
    <td><%=resultSet.getInt("id")%></td>
    <td><%=resultSet.getString("firstname")%></td>
    <td><%=resultSet.getString("lastname")%></td>
    <td><%=resultSet.getInt("age")%></td>

    <td>
        <a class="edit-btn"
           href="edit.jsp?id=<%=resultSet.getInt("id")%>">
           Edit
        </a>
		
		<a class="delete-btn"
		   href="delete.jsp?id=<%=resultSet.getInt("id")%>"
		   onclick="return confirm('Are you sure you want to delete this student?')">
		   Delete
		</a>
    </td>
</tr>

<%
}

if(!hasData){
%>

<tr>
    <td colspan="5" class="empty-message">
        No student records found.
    </td>
</tr>

<%
}

connection.close();
%>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>