<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="pack1.Photo"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My photo library</title>
</head>
<body>


	<%
	
	
	
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "PhotoLib";
		String userId = "root";
		String password = "root";

		

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	%>
	<h2 align="center">
		<font color="#4d4dff"><strong>Photo details in my library printed directly from the db</strong></font>
	</h2>
	<table align="center" cellpadding="4" cellspacing="4">
		<tr>


		</tr>
		<tr bgcolor="#008000">
			<td><b>Style</b></td>
			<td><b>Dimension</b></td>
			<td><b>Color</b></td>
			<td><b>Date</b></td>
		</tr>
		<%
			try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();
				String sql = "SELECT * FROM PhotoLib.info;";

				resultSet = statement.executeQuery(sql);
				
				
				while (resultSet.next()) {
							%>
							<tr bgcolor="#8FBC8F">
					
								<td><%=resultSet.getString("Style")%></td>
								<td><%=resultSet.getString("Dimension")%></td>
								<td><%=resultSet.getString("Color")%></td>
								<td><%=resultSet.getDate("Date")%></td>

							</tr>

							<%
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
	
	
</body>
</html>