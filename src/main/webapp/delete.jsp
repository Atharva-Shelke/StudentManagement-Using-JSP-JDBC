<%@page import="java.sql.*"%>
<%@ page import="utility.SqlLoader" %>
<%@ page import="utility.DBconnector" %>

<%
Connection connection = DBconnector.getConnection();

int id = Integer.parseInt(request.getParameter("id"));


String sql = SqlLoader.getQuery("delete_student");

PreparedStatement ps = connection.prepareStatement(sql);

ps.setInt(1, id);

ps.executeUpdate();

connection.close();

response.sendRedirect("index.jsp?msg=deleted");
%>