<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@ page import="utility.SqlLoader" %>
<%@ page import="utility.DBconnector" %>

<%
if(request.getParameter("submit") != null){

	Connection connection = DBconnector.getConnection();

    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    int age = Integer.parseInt(request.getParameter("age"));

	String sql = SqlLoader.getQuery("insert_student");

    PreparedStatement ps = connection.prepareStatement(sql);

    ps.setString(1, firstname);
    ps.setString(2, lastname);
    ps.setInt(3, age);

    ps.executeUpdate();

    connection.close();
	
	response.sendRedirect("index.jsp?msg=added");

}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add Student</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:#f4f6f9;
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
}

.container{
    width:100%;
    max-width:500px;
    background:white;
    padding:35px;
    border-radius:12px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

.title{
    text-align:center;
    margin-bottom:30px;
    color:#324960;
}

.form-group{
    margin-bottom:18px;
}

label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
}

input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
}

.submit-btn{
    width:100%;
    padding:12px;
    background:#4FC3A1;
    border:none;
    color:white;
    font-size:16px;
    border-radius:8px;
    cursor:pointer;
}

.submit-btn:hover{
    background:#3ca789;
}

</style>

</head>

<body>

<div class="container">

<h1 class="title">Add Student</h1>

<form method="POST">

    <div class="form-group">
        <label>First Name</label>
        <input type="text" name="firstname" required>
    </div>

    <div class="form-group">
        <label>Last Name</label>
        <input type="text" name="lastname" required>
    </div>

    <div class="form-group">
        <label>Age</label>
        <input type="number" name="age" required>
    </div>

    <input type="submit"
           name="submit"
           value="Add Student"
           class="submit-btn">

</form>

</div>

</body>
</html>