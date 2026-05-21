<%@page import="java.sql.*"%>

<%
int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.jdbc.Driver");

Connection connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/student_manager",
    "root",
    ""
);

PreparedStatement ps =
    connection.prepareStatement(
        "DELETE FROM students WHERE id=?"
    );

ps.setInt(1, id);

ps.executeUpdate();

connection.close();

response.sendRedirect("index.jsp?msg=deleted");
%>